//
//  ExerciseDBService.swift
//  workout-routine
//
//  Created by William Reinert on 06/11/22.
//

//import Foundation
//import Alamofire
//
//class ExerciseDBService {
//    
////    let apiKey = "6b12917c79msh64e1f447f81cb94p1c65cfjsned9248f499a9"
////    func fetchData() {
////        // 1
////        let request = AF.request("https://exercisedb.p.rapidapi.com/exercises/bodyPartList?rapidapi-key=\(apiKey)")
////        // 2
////        request.validate()
////            .responseDecodable(of: [Workout].self) { (response) in
////                guard let exercise = response.value else { return }
////                print(exercise.first)
////            }
////    }
//    
//    func fetchData() {
//        let headers = [
//            "X-RapidAPI-Key": "6b12917c79msh64e1f447f81cb94p1c65cfjsned9248f499a9",
//            "X-RapidAPI-Host": "exercisedb.p.rapidapi.com"
//        ]
//
//        let request = NSMutableURLRequest(url: NSURL(string: "https://exercisedb.p.rapidapi.com/exercises/bodyPartList")! as URL,
//                                                cachePolicy: .useProtocolCachePolicy,
//                                            timeoutInterval: 10.0)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//            if (error != nil) {
//                print(error)
//            } else {
//                let httpResponse = response as? HTTPURLResponse
////                print(httpResponse)
//                print(data![0])
//            }
//        })
//
//        dataTask.resume()
//    }
//}
