//
//  ArtistCell.swift
//  MusicApp
//
//  Created by MacBook on 9/7/20.
//  Copyright © 2020 Apptive. All rights reserved.
//

import UIKit

class GenreCell: UITableViewCell, IdentifiableCell {
    
    static var identifier: String = "ArtistCell"
    
    private let coverImage:UIImageView = {
        let image = UIImageView()
        image.configure()
        return image
    }()
    
    private let label:UILabel = {
        let label = UILabel()
        label.textColor = .fgColor
        label.configure()
        return label
    }()
    
    var genre:Genre? {
        didSet {
            guard let genre = genre else { return }
            coverImage.load(image: genre.logo, radius: 0)
        
            NetworkManager.loadArtist(for: genre) { artist in
                self.label.configure(name: "\(genre.name) \n", song: "\(artist.count) artist")
            }
        }
    }
    
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        configueUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - View
    
    private func configueUI() {
        let screen = UIScreen.main.bounds
        backgroundColor = .bgColor
        
        let stackView = UIStackView(arrangedSubviews: [coverImage,label])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        
        
        addSubview(stackView)
        stackView.widthAnchor.constraint(equalToConstant: screen.width - 32).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        coverImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        coverImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
    
    
    
}
