//
//  ExerciseDBService.swift
//  workout-routine
//
//  Created by William Reinert on 06/11/22.
//

import Foundation
import Alamofire

class ExerciseDBService {
    
    let apiKey = "6b12917c79msh64e1f447f81cb94p1c65cfjsned9248f499a9"
    func fetchData() {
        // 1
        let request = AF.request("https://exercisedb.p.rapidapi.com/exercises/bodyPartList?rapidapi-key=\(apiKey)")
        // 2
        request.responseJSON { (data) in
            print(data)
        }
    }
   
}
