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
        let service = RealmService()
        let presenter = RoutinePresenter(service: service)
        let viewController = RoutineViewController(presenter: presenter)
        viewController.coordinator = self
//        presenter.coordinator = self
        navigationViewController?.pushViewController(viewController, animated: true)
    }
    
    func showAddWorkoutScreen() {
        let service = RealmService()
        let presenter = AddWorkoutPresenter(service: service)
        let viewController = AddWorkoutViewController(presenter: presenter)
        viewController.coordinator = self
        
        DispatchQueue.main.async {
            self.navigationViewController?.pushViewController(viewController, animated: true)
        }
    }
    
    func showSearchScreen() {
        let presenter = SearchPresenter()
        let viewController = SearchViewController(presenter: presenter)
        
        presenter.searchController = viewController.searchController
        
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
