//
//  ViewController.swift
//  QuantumSitTask
//
//  Created by Yousef on 12/9/20.
//

import UIKit
import RxSwift
import MapKit

class MainViewController: BaseViewController, MKMapViewDelegate {

    //MARK: - Variables
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var bottomView: UIView!
    @IBOutlet private weak var bottomViewCloseBtn: UIButton!
    @IBOutlet private weak var bottomViewLbl: UILabel!
    @IBOutlet private weak var bottomViewHeightConstraint: NSLayoutConstraint!
    var viewModel: MainViewModel?
    private let bottomViewMinHeight: CGFloat = 50
    private let bottomViewMaxHeight: CGFloat = UIScreen.main.bounds.height - 200
    private let disposeBag = DisposeBag()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        if let viewModel = viewModel {
            configureViewModel(viewModel: viewModel)
            bind()
            viewModel.fetchStopPoints()
            viewModel.fethBottomViewText()
        }
        
    }
    
    //MARK: - Action Handlers
    @IBAction private func bottomViewCloseBtnTapped(_ sender: UIButton) {
        animateBottomViewDown()
    }
    
    @objc private func bottomViewDidTapped(_ sender: UIGestureRecognizer) {
        guard bottomViewHeightConstraint.constant == bottomViewMinHeight else { return }
        animateBottomViewUp()
    }
    
    //MARK: - Private Methods
    private func setupViews() {
        bottomViewCloseBtn.alpha = 0
        mapView.delegate = self
        bottomView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(bottomViewDidTapped)))
    }
    
    private func bind() {
        viewModel?.bottomViewTextObservable.asDriver().skip(1).drive(bottomViewLbl.rx.attributedText).disposed(by: disposeBag)
        viewModel?.stopPointsObservable.skip(1).subscribe(onNext: { [weak self] points in
            guard let self = self else {return}
            let annotations = points.map { (point: CLLocationCoordinate2D) -> MKPointAnnotation in
                let annotation = MKPointAnnotation()
                annotation.coordinate = point
                return annotation
            }
            
            DispatchQueue.main.async {
                
                if points.first != nil {
                    let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 6000)
                    self.mapView.setCameraZoomRange(zoomRange, animated: true)
                    self.mapView.setCenter(points.first!, animated: true)
                }
                
                self.mapView.removeAnnotations(self.mapView.annotations)
                self.mapView.removeOverlays(self.mapView.overlays)
                
                self.mapView.addOverlay(MKPolyline(coordinates: points, count: points.count))
                
                self.mapView.addAnnotations(annotations)
            }
        }).disposed(by: disposeBag)
    }
    
    private func animateBottomViewDown() {
        UIView.animate(withDuration: 0.7) {
            self.bottomViewCloseBtn.alpha = 0
            self.bottomViewHeightConstraint.constant = self.bottomViewMinHeight
            self.view.layoutIfNeeded()
        }
    }
    
    private func animateBottomViewUp() {
        UIView.animate(withDuration: 0.7) {
            self.bottomViewCloseBtn.alpha = 1
            self.bottomViewHeightConstraint.constant = self.bottomViewMaxHeight
            self.view.layoutIfNeeded()
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let polylineRenderer = MKPolylineRenderer(overlay: overlay)
        polylineRenderer.strokeColor = UIColor.systemBlue
        polylineRenderer.lineWidth = 5
        return polylineRenderer
    }

}
