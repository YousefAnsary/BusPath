//
//  UIViewController+.swift
//  QuantumSitTask
//
//  Created by Yousef on 12/9/20.
//

import UIKit

typealias ParameterlessCompletion = ()-> ()

extension UIViewController {
    
    static func initialize(fromStoryBoardNamed storyboardName: String)-> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! Self
    }
    
    func displayAlert(withMsg msg: String, title: String? = nil, btnHandler: ParameterlessCompletion? = nil) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { ـ in
            btnHandler?()
        }))
        self.present(alert, animated: true)
    }
    
}

