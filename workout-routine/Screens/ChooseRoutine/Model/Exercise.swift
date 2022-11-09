//
//  ExerciseDB.swift
//  workout-routine
//
//  Created by William Reinert on 08/11/22.
//

import Foundation

struct Exercise: Decodable {
    var bodyPart: String
    var equipment: String
    var gifUrl: String
    var id: String
    var name: String
    var target: String
}

struct ExerciseList: Decodable {
    var exercises: [Exercise]
}


