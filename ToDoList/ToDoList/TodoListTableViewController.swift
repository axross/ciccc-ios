//
//  TodoListTableViewController.swift
//  ToDoList
//
//  Created by Kohei Asai on 9/13/19.
//  Copyright © 2019 Kohei Asai. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController, ToDoCellDelegate {
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var todos: [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = editButtonItem

        initializeTodos()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListCellIdentifier", for: indexPath) as! ToDoListTableViewCell
        
        let todo = todos[indexPath.row]

        cell.titleLabel.text = todo.title
        cell.completeSwitch.isOn = todo.isComplete
        cell.delegate = self

        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)

            ToDo.saveToDos(todos)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editToDo" {
            let uiNavigationController = segue.destination as! UINavigationController
            let toDoDetailTableViewController = uiNavigationController.topViewController as! ToDoDetailTableViewController

            let indexPath = tableView.indexPathForSelectedRow!
            let todo = todos[indexPath.row]

            toDoDetailTableViewController.todo = todo
            toDoDetailTableViewController.selectedIndexPath = indexPath
        }
    }

    @IBAction func unwindToToDoList(segue: UIStoryboardSegue) {
        if segue.identifier == "saveUnwind" {
            let toDoDetailTableViewController = segue.source as! ToDoDetailTableViewController
            let indexPath = toDoDetailTableViewController.selectedIndexPath ?? IndexPath(row: todos.count, section: 0)

            if toDoDetailTableViewController.selectedIndexPath == nil {
                todos.append(toDoDetailTableViewController.todo)
                tableView.insertRows(at: [indexPath], with: .automatic)
            } else {
                todos[indexPath.row] = toDoDetailTableViewController.todo
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }

            ToDo.saveToDos(todos)
        }
    }

    func onCompleteStateChangeRequested(sender: ToDoListTableViewCell, isOn: Bool) {
        let indexPath = tableView.indexPath(for: sender)!
        var todo = todos[indexPath.row]

        todo.isComplete = isOn
        todos[indexPath.row] = todo

        tableView.reloadRows(at: [indexPath], with: .automatic)

        ToDo.saveToDos(todos)
    }
    
    func initializeTodos() {
        if let savedToDos = ToDo.loadSavedToDos() {
            todos = savedToDos
        } else {
            todos = ToDo.getInitialToDos()
        }
    }
}
