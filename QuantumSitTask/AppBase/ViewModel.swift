//
//  ViewModel.swift
//  iContacts
//
//  Created by Yousef on 12/4/20.
//  Copyright © 2020 Yousef. All rights reserved.
//

import RxSwift

class ViewModel {
    
    let isLoadingObservable = PublishSubject<Bool>()
    let msgsObservable = PublishSubject<String>()
    let apiErrorObservable = PublishSubject<Error>()
    
}
