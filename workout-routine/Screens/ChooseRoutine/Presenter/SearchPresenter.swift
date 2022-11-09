//
//  AddWorkoutPresenter.swift
//  workout-routine
//
//  Created by William Reinert on 03/11/22.
//

import Foundation
import UIKit

protocol SearchPresenterProtocol {
    var exercises: [Exercise] {get set}
    var filteredData: [Exercise] {get set}
    func updateExercisesList()
    func fetchTableViewLength() -> Int
    func searchStatus(index: Int) -> String
    func filterContentForSearchText(_ searchText: String, completion: () -> Void)
}

class SearchPresenter: SearchPresenterProtocol {
    var exercises: [Exercise] = []
    var filteredData: [Exercise] = []
    var searchController: UISearchController?
    var isSearchBarEmpty: Bool {
        return searchController?.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
        return searchController!.isActive && !isSearchBarEmpty
    }
    
    func updateExercisesList() {
        let jsonData = readLocalJson(forName: "exerciseDB")
        
        if let data = jsonData {
            if let exerciseData = parse(jsonData: data) {
                self.exercises = exerciseData.exercises
            }
        }
    }
    
    func searchStatus(index: Int) -> String {
        let exercise: Exercise
        
        if isFiltering {
            exercise = filteredData[index]
        } else {
            exercise = exercises[index]
        }
        
        return exercise.name
    }
    
    func filterContentForSearchText(_ searchText: String, completion: () -> Void) {
        filteredData = exercises.filter { (name: Exercise) -> Bool in
            return name.name.lowercased().contains(searchText.lowercased())
        }
        completion()
    }
    
    func fetchTableViewLength() -> Int {
        if isFiltering {
            return filteredData.count
        }
        return exercises.count
    }
    
    func readLocalJson(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileURL = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileURL)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    func parse(jsonData: Data) -> ExerciseList? {
        do {
            let decodedData = try JSONDecoder().decode(ExerciseList.self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
