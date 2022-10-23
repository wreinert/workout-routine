//
//  Coordinator.swift
//  workout-routine
//
//  Created by William Reinert on 22/10/22.
//

import Foundation
import UIKit

public protocol Coordinator {
    var currentViewController: UIViewController? { get }
    var navigationViewController: UINavigationController? { get }
    
    func start()
}
