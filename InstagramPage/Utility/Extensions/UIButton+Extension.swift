//
//  UIButton+Extension.swift
//  InstagramPage
//
//  Created by Kyrylo Tokar on 2023-02-14.
//

import UIKit

extension UIButton {
    
    func changeColor(_ sender: UIButton, systemName: String, color: UIColor) {
        if  sender.tintColor == .label {
            sender.tintColor = color
            sender.setImage(UIImage(systemName: systemName + ".fill"), for: .normal)
        }
        else {
            sender.tintColor = .label
            sender.setImage(UIImage(systemName: systemName), for: .normal)
        }
    }
}
