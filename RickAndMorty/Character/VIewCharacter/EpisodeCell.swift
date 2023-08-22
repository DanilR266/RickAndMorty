//
//  EpisodeCell.swift
//  RickAndMorty
//
//  Created by Данила on 22.08.2023.
//

import Foundation

import UIKit

class EpisodeCell: UICollectionViewCell {
    
    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Load"
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var episode: UILabel = {
        let label = UILabel()
        label.text = "Load"
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .greenText
        label.textAlignment = .left
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var date: UILabel = {
        let label = UILabel()
        label.text = "Load"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .rectangleText
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setUpUI() {
        self.addSubview(label)
        self.addSubview(episode)
        self.addSubview(date)
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        label.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        episode.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14).isActive = true
        episode.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        
        date.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        date.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .cellColor
        self.layer.cornerRadius = 16
        self.layer.masksToBounds = true
        setUpUI()
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
