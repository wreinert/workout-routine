//
//  SetsModel.swift
//  workout-routine
//
//  Created by William Reinert on 27/10/22.
//

import Foundation
import RealmSwift

class Exercise: Object {
    
    var exercises = List<String?>()
    @Persisted var bodyPart: String?
    @Persisted var exerciseList: List<String?>
    var name: [String]?
    var target: String?
     
    override init() {
        super.init()
    }
    
    init(name: [String]) {
        self.name = name
        self.exercises.append(objectsIn: name)
    }
    
    init(bodyPart: String, name: [String]) {
        self.bodyPart = bodyPart
        self.name = name
        super.init()
        self.exerciseList.append(objectsIn: name)
    }
}
