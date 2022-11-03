//
//  SetsViewController.swift
//  workout-routine
//
//  Created by William Reinert on 23/10/22.
//

import UIKit

class SetsViewController: TEBaseViewController {
    
    let sets: [String] = ["Arms", "Chest", "Back", "Abs", "Legs"]
    let exercises: [String] = []
    let exercise: String
    var coordinator: RoutineCoordinator?
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    
    init(exercise: String) {
        self.exercise = exercise
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exerciseLabel.text = exercise
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        sender.minimumValue = 0
        sender.maximumValue = 400
        weightLabel.text = "\(String(Int(sender.value))) kg"
    }
    
    @IBAction func repsStepper(_ sender: UIStepper) {
        sender.minimumValue = 0
        sender.maximumValue = 30
        repsLabel.text = "\(String(Int(sender.value)))"
    }
}
