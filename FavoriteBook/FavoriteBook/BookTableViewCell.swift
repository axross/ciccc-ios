//
//  BookTableViewCell.swift
//  FavoriteBooks
//
//  Created by Kohei Asai on 9/3/19.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!

    var book: Book?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with book: Book) {
        titleLabel.text = book.title
        authorLabel.text = book.author
    }
}
