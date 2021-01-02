//
//  DataInteractor.swift
//  QuantumSitTask
//
//  Created by Yousef on 12/9/20.
//

import RxSwift
import CoreLocation

class DataInteractor {
    
    let service: MainService
    private var data: LoginResponse?
    
    init(service: MainService) {
        self.service = service
    }
    
    func fetchStopPoints(forUserNamed name: String, password: String)-> Observable<[CLLocationCoordinate2D]> {
        service.login(name: name, password: password).map({ res in
            self.data = res
            guard let points = res?.innerData?.user?.bus?.route?.stopPoints else { return [] }
            return points.map({ point-> CLLocationCoordinate2D  in
                let lat = point.lat ?? 0
                let lng = point.lng ?? 0
                return CLLocationCoordinate2D(latitude: lat, longitude: lng)
            })
        })
    }
    
    func fetchAboutUsText()-> Observable<String?> {
        service.getText().map{ dict in
            guard let innerdata = dict?["InnerData"] as? [[String: Any?]] else { return nil }
            guard let content = innerdata.first?["content"] as? String else { return nil }
            return content
        }
    }
    
}
