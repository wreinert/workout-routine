//
//  RoutinePresenter.swift
//  workout-routine
//
//  Created by William Reinert on 23/10/22.
//

import Foundation

protocol RoutinePresenterCoordinator {
    func showSetsScreen()
}

protocol RoutinePresenterProtocol {
    
}

class RoutinePresenter: RoutinePresenterProtocol {
    var coordinator: RoutinePresenterCoordinator?
    let service: RealmServiceProtocol
    
    init(service: RealmServiceProtocol) {
        self.service = service
    }
    
    
    
    
    
}
