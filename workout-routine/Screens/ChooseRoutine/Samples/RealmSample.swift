//
//  RealmSample.swift
//  workout-routine
//
//  Created by William Reinert on 06/11/22.
//

//import UIKit
//import RealmSwift
//
//class Cat: Object {
//    
//    @objc dynamic var name: String?
//    @objc dynamic var color: String?
//    @objc dynamic var gender: String?
//}
//
////realmURL = ///Users/williamreinert/Library/Developer/CoreSimulator/Devices/1BE0482C-2D4C-4600-BB77-1576BFB58E99/data/Containers/Data/Application/B06A8FEA-402A-49A8-854C-A8CBAC2F872A/Documents/default.realm
//class RealmViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let realm = try! Realm()
//        
////        print(Realm.Configuration.defaultConfiguration)
//        
//        let myCat = Cat()
//        myCat.name = "Joe"
//        myCat.color = "Brown"
//        myCat.gender = "Male"
//        
//        //add new row
////        try! realm.write {
////            realm.add(myCat)
////        }
//        
////        //retrieve all objects of a type
////        let results = realm.objects(Cat.self)
////        print(results)
////        print(results[0].name)
////
//        //filter data before retrieving
//        let filteredResults = realm.objects(Cat.self).filter("name = 'Moe'")
//        print(filteredResults)
//    }
//
//
//}
