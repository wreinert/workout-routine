//
//  RoutineTableViewCell.swift
//  workout-routine
//
//  Created by William Reinert on 23/10/22.
//

import UIKit

protocol RoutineCellDelegate: AnyObject {
    func didPressButton(_ tag: Int, _ exercise: String?)
}

class RoutineTableViewCell: UITableViewCell {

    @IBOutlet weak var routineCell: UIView!
    @IBOutlet weak var routineLabel: UIButton!
    
    weak var delegate: RoutineCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    @IBAction func routineButton(_ sender: UIButton) {
        delegate?.didPressButton(sender.tag, sender.currentTitle)
    }
}
