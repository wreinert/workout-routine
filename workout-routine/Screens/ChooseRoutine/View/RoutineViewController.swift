//
//  ViewController.swift
//  workout-routine
//
//  Created by William Reinert on 22/10/22.
//

import UIKit

class RoutineViewController: TEBaseViewController {
    
    var exercises = [Exercise]()
    let sets: [String] = ["Arms", "Chest", "Back", "Abs", "Legs"]
    let cellReuseIdentifier = "cell"
    let routineCell = RoutineTableViewCell()
    var coordinator: RoutineCoordinator?
    let presenter: RoutinePresenterProtocol
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pullDownButton: UIButton!
    
    init(presenter: RoutinePresenterProtocol) {
        self.presenter = presenter
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        exercises.append(Exercise.init(setName: "Arms", exerciseName: ["Bicep Curl","Tricep Dip","Hammer Curl", "Overhead Tricep Extension"]))
        exercises.append(Exercise.init(setName: "Chest", exerciseName: ["Samsung M Series", "Samsung Galaxy Note 9", "Samsung Galaxy Note 9+", "Samsung Galaxy Note 10", "Samsung Galaxy Note 10 +"]))
        exercises.append(Exercise.init(setName: "Back", exerciseName: ["Mi Note 7", "Mi Note 7 Pro", "Mi K20"]))
        exercises.append(Exercise.init(setName: "Abs", exerciseName: ["Huawei Mate 20", "Huawei P30 Pro", "Huawei P10 Plus", "Huawei P20"]))
        exercises.append(Exercise.init(setName: "Legs", exerciseName: ["Huawei Mate 20", "Huawei P30 Pro", "Huawei P10 Plus", "Huawei P20"]))
        
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "RoutineTableViewCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        
        setupDropDown()
    }
    
    func setupDropDown() {
        let menuClosure = {(action: UIAction) in
            self.update(number: action.title)
        }
        pullDownButton.menu = UIMenu(children: [
            UIAction(title: "Select Workout Routine", state: .on, handler: menuClosure),
            UIAction(title: "Oct-22", handler: menuClosure),
            UIAction(title: "Sep-22", handler: menuClosure),
            UIAction(title: "Ago-22", handler: menuClosure),
            UIAction(title: "Jul-22", handler: menuClosure),
            UIAction(title: "Jun-22", handler: menuClosure),
        ])
        pullDownButton.showsMenuAsPrimaryAction = true
        pullDownButton.changesSelectionAsPrimaryAction = true
    }
    
    func update(number:String) {
        //add lookup in database here
        if number == "option 2" {
            print("option 1 selected")
        }
    }
}

extension RoutineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises[section].exerciseName?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! RoutineTableViewCell
        cell.routineLabel.setTitle(exercises[indexPath.section].exerciseName?[indexPath.row], for: .normal)
        cell.delegate = self
        cell.routineLabel.tag = indexPath.row
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return exercises[section].setName
    }
}

extension RoutineViewController: RoutineCellDelegate {
    func didPressButton(_ tag: Int, _ exercise: String?) {
        coordinator?.showSetsScreen(exercise: exercise!)
    }
}


