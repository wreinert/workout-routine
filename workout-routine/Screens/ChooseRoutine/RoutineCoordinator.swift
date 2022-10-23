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
        let viewController = RoutineViewController()
        viewController.coordinator = self
        navigationViewController?.pushViewController(viewController, animated: true)
    }
    
    func showSetsScreen() {
        let viewController = SetsViewController()
        
        DispatchQueue.main.async {
            self.navigationViewController?.pushViewController(viewController, animated: true)
        }
    }
}
