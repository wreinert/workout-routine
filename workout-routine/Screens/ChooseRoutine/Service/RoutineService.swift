//
//  RoutineService.swift
//  workout-routine
//
//  Created by William Reinert on 27/10/22.
//

import Foundation
import RealmSwift

let app = App(id: Constants.appID)

protocol RoutineServiceProtocol {
    func login()
}

class RoutineService: RoutineServiceProtocol {
   
    func login() {
        let anonymousCredentials = Credentials.anonymous
        app.login(credentials: anonymousCredentials) { (result) in
            switch result {
            case .failure(let error):
                print("Login failed: \(error.localizedDescription)")
            case .success(let user):
                print("Successfully logged in as user \(user)")
                // Now logged in, do something with user
                // Remember to dispatch to main if you are doing anything on the UI thread
            }
        }
    }
}
