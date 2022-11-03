//
//  AddWorkoutViewController.swift
//  workout-routine
//
//  Created by William Reinert on 30/10/22.
//

import UIKit

class AddWorkoutViewController: TEBaseViewController {

    var exercises = [Exercise]()
    let sets: [String] = ["Arms", "Chest", "Back", "Abs", "Legs"]
    var coordinator: RoutineCoordinator?
    var filteredData: [String] = []
    
    let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var exerciseLabel: UILabel!
    
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        exercises.append(Exercise.init(exerciseName: ["Bicep Curl", "Tricep Dip", "Hammer Curl", "Overhead Tricep Extension"]))
        
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableCell")
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Exercises"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
 
    func filterContentForSearchText(_ searchText: String) {
        filteredData = exercises[0].exerciseName!.filter { (exercise: String) -> Bool in
            return exercise.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
}

extension AddWorkoutViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}

extension AddWorkoutViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as UITableViewCell
        let exercise: String
        
        if isFiltering {
            exercise = filteredData[indexPath.row]
        } else {
//            exercise = exercises[0].exerciseName![indexPath.row]
            exercise = ""
        }
        cell.textLabel?.text = exercise
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredData.count
        }
//        return exercises[0].exerciseName?.count ?? 0
        return 0
    }
}
