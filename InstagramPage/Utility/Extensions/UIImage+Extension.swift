//
//  UIImage+Extension.swift
//  InstagramPage
//
//  Created by Kyrylo Tokar on 2023-02-14.
//

import UIKit

extension UIImageView {
    
    func roundImage(_ imageView: UIImageView) {
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.label.cgColor
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
    }
}
