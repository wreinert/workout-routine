//
//  FirstCoordinator.swift
//  workout-routine
//
//  Created by William Reinert on 22/10/22.
//

import Foundation
import UIKit

public final class RoutineCoordinator: Coordinator {
    public var currentViewController: UIViewController?
    public var navigationViewController: UINavigationController?
    
    public init(navigationController: UINavigationController?) {
        self.navigationViewController = navigationController
    }
    
    public func start() {
        let viewController = RoutineViewController()
        navigationViewController?.pushViewController(viewController, animated: true)
    }
    
    
}
