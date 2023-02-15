//
//  UsersCollectionViewCell.swift
//  InstagramPage
//
//  Created by Kyrylo Tokar on 2023-02-13.
//

import UIKit

class UsersCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var userImage: UIImageView!
    @IBOutlet private weak var userName: UILabel!

    func configure(with name: String) {
        userImage.image = UIImage(named: name)
        userImage.roundImage(userImage)
        
        userName.text = name
    }    
}
