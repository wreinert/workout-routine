//
//  AppCoordinator.swift
//  workout-routine
//
//  Created by William Reinert on 22/10/22.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    
    var currentViewController: UIViewController?
    var navigationViewController: UINavigationController?
    let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        navigationViewController = UINavigationController()
//        navigationViewController?.setNavigationBarHidden(true, animated: false)
        
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
        
        let coordinator = RoutineCoordinator(navigationController: navigationViewController)
        coordinator.start()
    }
    
}
