//
//  Extension.swift
//  MusicApp
//
//  Created by MacBook on 9/7/20.
//  Copyright © 2020 Apptive. All rights reserved.
//

import UIKit

extension UIView {
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
    }
    
}


extension UIImageView {
    
    func load(image:String,radius:CGFloat) {
        self.image = UIImage(named: image)
        contentMode = .scaleAspectFill
        clipsToBounds = true
        layer.cornerRadius = radius
    }
}


extension UILabel {
    
    
    func configure(name:String,song:String) {
        let attribute = NSMutableAttributedString(string: name, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18, weight: .regular)])
        
        let songs = NSAttributedString(string: song, attributes: [NSAttributedString.Key.font:UIFont.monospacedSystemFont(ofSize: 12, weight: .regular)])
        
        attribute.append(songs)
        
        attributedText = attribute
        
        translatesAutoresizingMaskIntoConstraints  = false
        numberOfLines = 0
    }
    
}


extension UIButton {
    
    func configure(icon:String) {
        tintColor = .black
        translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: icon)
        setImage(image, for: .normal)
    }
}


extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}


// MARK: - COLORS

extension UIColor {
    
    static let bgColor = #colorLiteral(red: 0.1247409234, green: 0.1248249862, blue: 0.1444095689, alpha: 1)
    static let fgColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
}


// MARK: - Nav Bar

extension UINavigationController {
    
    func configureNavigationBar() {
        navigationBar.prefersLargeTitles = true
        navigationBar.barStyle = .black
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    }
    
}
