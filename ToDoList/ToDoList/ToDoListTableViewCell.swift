//
//  ToDoListTableViewCell.swift
//  ToDoList
//
//  Created by Kohei Asai on 9/13/19.
//  Copyright © 2019 Kohei Asai. All rights reserved.
//

import UIKit

class ToDoListTableViewCell: UITableViewCell {
    @IBOutlet weak var completeSwitch: UISwitch!
    @IBOutlet weak var titleLabel: UILabel!

    weak var delegate: ToDoCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onCompleteSwitchChanged(_ sender: UISwitch) {
        delegate?.onCompleteStateChangeRequested(sender: self, isOn: sender.isOn)
    }
}

protocol ToDoCellDelegate: class {
    func onCompleteStateChangeRequested(sender: ToDoListTableViewCell, isOn: Bool)
}
