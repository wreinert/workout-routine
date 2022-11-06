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
    var filteredData: [String] {get set}
    func updateExercisesList()
    func fetchTableViewLength() -> Int
    func searchStatus(index: Int) -> String
    func filterContentForSearchText(_ searchText: String, completion: () -> Void)
}

class SearchPresenter: SearchPresenterProtocol {
    var exercises: [Exercise] = []
    var filteredData: [String] = []
    var searchController: UISearchController?
    var isSearchBarEmpty: Bool {
        return searchController?.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
        return searchController!.isActive && !isSearchBarEmpty
    }
    
    func updateExercisesList() {
        exercises.append(Exercise.init(name: ["Bicep Curl", "Tricep Dip", "Hammer Curl", "Overhead Tricep Extension"]))
    }
    
    func searchStatus(index: Int) -> String {
        let exercise: String
        
        if isFiltering {
            exercise = filteredData[index]
        } else {
            exercise = exercises[0].name![index]
        }
        
        return exercise
    }
    
    func filterContentForSearchText(_ searchText: String, completion: () -> Void) {
        filteredData = exercises[0].name!.filter { (exercise: String) -> Bool in
            return exercise.lowercased().contains(searchText.lowercased())
        }
        completion()
    }
    
    func fetchTableViewLength() -> Int {
        if isFiltering {
            return filteredData.count
        }
        return exercises[0].name?.count ?? 0
    }
}
