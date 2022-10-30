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
    let service: RoutineServiceProtocol
    
    init(service: RoutineServiceProtocol) {
        self.service = service
    }
}
