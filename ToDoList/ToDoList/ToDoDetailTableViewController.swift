//
//  NewToDoTableViewController.swift
//  ToDoList
//
//  Created by Kohei Asai on 9/13/19.
//  Copyright © 2019 Kohei Asai. All rights reserved.
//

import UIKit

class ToDoDetailTableViewController: UITableViewController, UITextViewDelegate {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var doneSwitch: UISwitch!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    var isDueDatePickerShown = false
    var todo = ToDo(title: "", isComplete: false, dueBy: Date().addingTimeInterval(60 * 5), note: "")
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        noteTextView.delegate = self

        titleTextField.text = todo.title
        doneSwitch.isOn = todo.isComplete
        dueDatePicker.date = todo.dueBy
        noteTextView.text = todo.note

        updateSaveButton()
        updateDueDateLabel()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func onTitleTextChanged(_ sender: UITextField) {
        todo.title = sender.text!

        updateSaveButton()
    }

    @IBAction func onDoneSwitchChanged(_ sender: UISwitch) {
        todo.isComplete = sender.isOn
    }

    @IBAction func onTitleTextReturnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    }

    @IBAction func onDueDatePickerChanged(_ sender: UIDatePicker) {
        todo.dueBy = sender.date

        updateDueDateLabel()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 3 {
            return isDueDatePickerShown ? dueDatePicker.frame.height : 0
        }

        if indexPath.section == 1 && indexPath.row == 0 {
            return 200
        }

        return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 2 {
            print("tapped")

            isDueDatePickerShown = !isDueDatePickerShown
            dueDateLabel.textColor = isDueDatePickerShown ? tableView.tintColor : .darkText
            tableView.beginUpdates()
            tableView.endUpdates()
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }

    func textViewDidChange(_ textView: UITextView) {
        todo.note = textView.text!
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

    */

    func updateSaveButton() {
        saveButton.isEnabled = !titleTextField.text!.isEmpty
    }

    func updateDueDateLabel() {
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = .short

        dueDateLabel.text = dateFormatter.string(from: dueDatePicker.date)
    }
}
