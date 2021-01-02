//
//  AppCoordinator.swift
//  iContacts
//
//  Created by Yousef on 12/4/20.
//  Copyright © 2020 Yousef. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    private var navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func start() {
        let vc = MainViewController.initialize(fromStoryBoardNamed: "Main")
        vc.viewModel = MainViewModel(interactor: DataInteractor(service: MainService()))
        navigationController.pushViewController(vc, animated: true)
        window.rootViewController = navigationController
    }
    
    func restart() {
        navigationController = UINavigationController()
        start()
    }
    
}
