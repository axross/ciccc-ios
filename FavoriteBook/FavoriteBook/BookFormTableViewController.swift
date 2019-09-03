//
//  BookFormTableViewController.swift
//  FavoriteBooks
//
//  Created by Kohei Asai on 9/2/19.
//

import UIKit

class BookFormTableViewController: UITableViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var lengthTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var book: Book?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
    }
    
    func updateView() {
        guard let book = book
            else { return }
        
        titleTextField.text = book.title
        authorTextField.text = book.author
        genreTextField.text = book.genre
        lengthTextField.text = book.length
    }
    
    @IBAction func onSaveButtonTapped(_ sender: UIButton) {
        guard let title = titleTextField.text,
            let author = authorTextField.text,
            let genre = genreTextField.text,
            let length = lengthTextField.text
            else { return }
        
        book = Book(title: title, author: author, genre: genre, length: length)
        
        performSegue(withIdentifier: "UnwindToBookList", sender: self)
    }
}
