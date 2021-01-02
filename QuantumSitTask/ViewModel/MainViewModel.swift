//
//  MainViewModel.swift
//  QuantumSitTask
//
//  Created by Yousef on 12/9/20.
//

import RxCocoa
import RxSwift
import CoreLocation

class MainViewModel: ViewModel {
    
    private let interator: DataInteractor
    private let disposeBag: DisposeBag
    let nameObservable = BehaviorRelay<String>(value: "bola_d")
    let passwordObservable = BehaviorRelay<String>(value: "1234")
    let stopPointsObservable = BehaviorRelay<[CLLocationCoordinate2D]>(value: [])
    let bottomViewTextObservable = BehaviorRelay<NSAttributedString?>(value: nil)
    
    init(interactor: DataInteractor) {
        self.interator = interactor
        self.disposeBag = DisposeBag()
    }
    
    func fetchStopPoints() {
        self.isLoadingObservable.onNext(true)
        let name = nameObservable.value
        let password = passwordObservable.value
        guard !name.isEmpty, !password.isEmpty else { return }
        interator.fetchStopPoints(forUserNamed: name, password: password)
                 .catchError({ (err) -> Observable<[CLLocationCoordinate2D]> in
                    self.isLoadingObservable.onNext(false)
                    self.apiErrorObservable.onNext(err)
                    return .empty()
                 }).do(onNext: {_ in
                    self.isLoadingObservable.onNext(false)
                 }).bind(to:stopPointsObservable).disposed(by: disposeBag)
    }
    
    func fethBottomViewText() {
        self.isLoadingObservable.onNext(true)
        interator.fetchAboutUsText().catchError({ (err) -> Observable<String?> in
            self.isLoadingObservable.onNext(false)
            self.apiErrorObservable.onNext(err)
            return .empty()
        }).map{ $0?.attributedHtmlString }.do(onNext: {_ in
            self.isLoadingObservable.onNext(false)
        }).bind(to: bottomViewTextObservable).disposed(by: disposeBag)
    }
    
}
