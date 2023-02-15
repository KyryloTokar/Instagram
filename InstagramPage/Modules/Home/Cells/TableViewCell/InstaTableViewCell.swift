//
//  InstaTableViewCell.swift
//  InstagramPage
//
//  Created by Kyrylo Tokar on 2023-02-13.
//

import UIKit

class InstaTableViewCell: UITableViewCell {    
    
    @IBOutlet private weak var userName: UILabel!
    @IBOutlet private weak var userImage: UIImageView!
    @IBOutlet private weak var instaImage: UIImageView!
    
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var shareButton: UIButton!
    @IBOutlet private weak var messageButton: UIButton!
    @IBOutlet private weak var bookmarkButton: UIButton!
    
    func configure(with name: String) {
        instaImage.image = UIImage(named: name)
        
        userImage.image = UIImage(named: name)
        userImage.roundImage(userImage)
        
        userName.text = name
    }
    
    @IBAction func likePressButton(_ sender: UIButton) {
        sender.changeColor(sender, systemName: "heart", color: .systemRed)
    }
    
    @IBAction func sharePressButton(_ sender: UIButton) {
        sender.changeColor(sender, systemName: "paperplane", color: .systemBlue)
    }
    
    @IBAction func messagePressButton(_ sender: UIButton) {
        sender.changeColor(sender, systemName: "message", color: .systemYellow)
    }
    
    @IBAction func bookmarkPressButton(_ sender: UIButton) {
        sender.changeColor(sender, systemName: "bookmark", color: .systemOrange)
    }
}
