//
//  MenuViewController.swift
//  workout-routine
//
//  Created by William Reinert on 29/10/22.
//

import UIKit

class MenuViewController: TEBaseViewController {

    var coordinator: RoutineCoordinator?
    
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ExerciseDBService().fetchData()
    }
    
    @IBAction func goToWorkoutButtonPressed(_ sender: UIButton) {
        coordinator?.showWorkoutsScreen()
    }
    
    @IBAction func addWorkoutButtonPressed(_ sender: UIButton) {
        coordinator?.showAddWorkoutScreen()
    }
}
