//
//  FeedTableViewCell.swift
//  NetologiaAssignment
//
//  Created by MacBook on 1/19/21.
//

import UIKit

//На этот раз, сделаем ячейку из нибов
class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!

    //Настраиваем каждую ячейку по посту 
    func configure(with post: Post) {
        self.avatarImageView.load(url: post.avatarURL)
        self.usernameLabel.text = "@\(post.username)"
        self.postTextView.text = post.text
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.avatarImageView.layer.cornerRadius = 44 / 2
        self.avatarImageView.layer.cornerCurve = .continuous
    }
    
}
