//
//  AddWorkoutViewController.swift
//  workout-routine
//
//  Created by William Reinert on 30/10/22.
//

import UIKit

class AddWorkoutViewController: TEBaseViewController {

    var coordinator: RoutineCoordinator?
    var presenter: AddWorkoutPresenterProtocol
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var exerciseLabel: UILabel!
    
    init(presenter: AddWorkoutPresenterProtocol) {
        self.presenter = presenter
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
             
        searchBar.delegate = self
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        presenter.addExercise()
    }
}

extension AddWorkoutViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        coordinator?.showSearchScreen()
    }
}
