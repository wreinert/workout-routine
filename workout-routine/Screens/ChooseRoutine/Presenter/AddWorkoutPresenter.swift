//
//  AddWorkoutPresenter.swift
//  workout-routine
//
//  Created by William Reinert on 03/11/22.
//

import Foundation

protocol AddWorkoutPresenterProtocol {
    func addExercise()
}

class AddWorkoutPresenter: AddWorkoutPresenterProtocol {
    
    let service: RealmServiceProtocol
    
    init(service: RealmServiceProtocol) {
        self.service = service
    }
    
    func addExercise() {
        service.login()
    }
    
}
