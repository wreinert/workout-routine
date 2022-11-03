//
//  SetsModel.swift
//  workout-routine
//
//  Created by William Reinert on 27/10/22.
//

import Foundation

class Exercise: Decodable {
    var setName: String?
    var exerciseName: [String]?
    
    init(exerciseName: [String]) {
        self.exerciseName = exerciseName
    }
    
    init(setName: String, exerciseName: [String]) {
        self.setName = setName
        self.exerciseName = exerciseName
    }
}
