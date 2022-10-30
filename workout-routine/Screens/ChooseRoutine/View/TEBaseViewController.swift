//
//  TEBaseViewController.swift
//  workout-routine
//
//  Created by William Reinert on 28/10/22.
//

import UIKit

open class TEBaseViewController: UIViewController {
    
    public init() {
        super.init(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
