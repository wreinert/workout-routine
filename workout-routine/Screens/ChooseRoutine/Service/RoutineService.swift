//
//  RealmService.swift
//  workout-routine
//
//  Created by William Reinert on 27/10/22.
//

import Foundation
import RealmSwift

let app = App(id: Constants.appID)

protocol RealmServiceProtocol {
    func login()
//    func addWorkout(exercise: Workout)
}

class RealmService: RealmServiceProtocol {
    
    
    
    func setupRealm() {
        let configuration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        let realm = try! Realm(configuration: configuration)
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }
    
//    func addWorkout(exercise: Workout) {
//        try! realm.write({
//            realm.add(exercise)
//        })
//    }
    
    func login() {
        setupRealm()
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
