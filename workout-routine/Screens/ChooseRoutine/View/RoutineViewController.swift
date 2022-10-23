//
//  ViewController.swift
//  workout-routine
//
//  Created by William Reinert on 22/10/22.
//

import UIKit

class RoutineViewController: UIViewController {
    
    let sets: [String] = ["Arms", "Chest", "Back", "Abs", "Legs"]
    let cellReuseIdentifier = "cell"
    let routineCell = RoutineTableViewCell()
    var coordinator: RoutineCoordinator?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pullDownButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        return self.sets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! RoutineTableViewCell
        cell.routineLabel.setTitle(self.sets[indexPath.row], for: .normal)
        cell.delegate = self
        cell.routineLabel.tag = indexPath.row
        
        return cell
    }
}

extension RoutineViewController: RoutineCellDelegate {
    func didPressButton(_ tag: Int) {
        coordinator?.showSetsScreen()
    }
}
