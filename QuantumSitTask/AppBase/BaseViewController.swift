//
//  ViewController.swift
//  iContacts
//
//  Created by Yousef on 12/5/20.
//  Copyright © 2020 Yousef. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import JGProgressHUD

class BaseViewController: UIViewController {
    
    let hud = JGProgressHUD(style: .dark)
//    let isLoadingObservable = BehaviorRelay<Bool>(value: false)
//    let msgsObservable = BehaviorRelay<String>(value: "")
//    let apiErrorObservable = BehaviorRelay<APIError?>(value: nil)
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hud.textLabel.text = "Loading..."
    }
    
    func configureViewModel(viewModel: ViewModel) {

        viewModel.isLoadingObservable.observeOn(MainScheduler.instance).subscribe(onNext: { [unowned self] bool in
            if bool { hud.show(in: self.view) } else { hud.dismiss() }
        }).disposed(by: disposeBag)
        
        viewModel.msgsObservable.observeOn(MainScheduler.instance).subscribe(onNext: { [unowned self] msg in
            self.displayAlert(withMsg: msg)
        }).disposed(by: disposeBag)
        
        viewModel.apiErrorObservable.observeOn(MainScheduler.instance).subscribe(onNext: { [unowned self] err in
            self.handleAPIError(error: err)
        }).disposed(by: disposeBag)
        
    }
    
    func restartApp() {
        guard let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate else {return}
        sceneDelegate.coordinator?.restart()
    }
    
    func handleAPIError(error: Error) {
        guard let apiErr = error as? APIError else {
            let err = error as NSError
            print(err)
            displayAlert(withMsg: "Unexpected error with code: \(err.code)")
            return
        }
        let statusCode: Int = apiErr.statusCode ?? 0
        let apiError = APIErrorType(rawValue: statusCode)
        switch apiError {
        case .unAuthenticated:
            handleUnAuthenticatedAPIError()
        case .unAuthorized:
            handleUnAuthorizedAPIError()
        case .notFound:
            handleNotFoundAPIError()
        case .methodNotAllowed:
            handlemethodNotAllowedAPIError()
        case .internalServerError:
            handleInternalServerAPIError()
        case .other:
            handleOtherAPIError(statusCode: apiErr.statusCode ?? -1)
        case .decodingFailed:
            handleOtherAPIError(statusCode: apiErr.statusCode ?? -1)
        }
    }
    
    func handleUnAuthenticatedAPIError() {
        displayAlert(withMsg: "You need to re-login", title: "Session Issue") { [unowned self] in
//            UserSession.endSession()
            self.restartApp()
        }
    }
    
    func handleUnAuthorizedAPIError() {
        displayAlert(withMsg: "You do not have the permessions to do this operation", title: "UnAuthorized")
    }
    
    func handleNotFoundAPIError() {
        displayAlert(withMsg: "You seem to be offline \n Check your internet connection", title: "Internet Connection")
    }
    
    func handlemethodNotAllowedAPIError() {
        handleOtherAPIError(statusCode: 405)
    }
    
    func handleInternalServerAPIError() {
        displayAlert(withMsg: ".OoPs. Try Again if problem persist contact us")
    }
    
    func handleOtherAPIError(statusCode: Int) {
        displayAlert(withMsg: ".OoPs. Unexpected Error with code: \(statusCode), Try Again if problem persist contact us")
    }
    
}
