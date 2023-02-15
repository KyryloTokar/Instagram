//
//  UIViewController+Extension.swift
//  InstagramPage
//
//  Created by Kyrylo Tokar on 2023-02-14.
//

import UIKit

extension UIViewController {
    
    class func loadFromStoryboard<T: UIViewController>(type: T.Type) -> T {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let identifier = String(describing: T.self)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}
