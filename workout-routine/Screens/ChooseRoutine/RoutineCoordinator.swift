//
//  FirstCoordinator.swift
//  workout-routine
//
//  Created by William Reinert on 22/10/22.
//

import Foundation
import UIKit

final class RoutineCoordinator: Coordinator {
    var currentViewController: UIViewController?
    var navigationViewController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationViewController = navigationController
    }
    
    func start() {
        let viewController = MenuViewController()
        viewController.coordinator = self

        navigationViewController?.pushViewController(viewController, animated: true)
    }
    
    func showWorkoutsScreen() {
        let service = RoutineService()
        let presenter = RoutinePresenter(service: service)
        let viewController = RoutineViewController(presenter: presenter)
        viewController.coordinator = self
//        presenter.coordinator = self
        navigationViewController?.pushViewController(viewController, animated: true)
    }
    
    func showAddWorkoutScreen() {
        let viewController = AddWorkoutViewController()
        
        DispatchQueue.main.async {
            self.navigationViewController?.pushViewController(viewController, animated: true)
        }
    }
    
    func showSetsScreen(exercise: String) {
        let viewController = SetsViewController(exercise: exercise)
        
        DispatchQueue.main.async {
            self.navigationViewController?.pushViewController(viewController, animated: true)
        }
    }
}
