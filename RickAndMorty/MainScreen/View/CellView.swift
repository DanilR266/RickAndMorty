//
//  CellView.swift
//  RickAndMorty
//
//  Created by Данила on 19.08.2023.
//

import Foundation
import UIKit

class CharacterCell: UICollectionViewCell {
    
    lazy var image: UIImageView = {
        let imageView = UIImageView()
//        imageView.load(url: URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")!)
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
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setUpUI() {
        self.addSubview(label)
        self.addSubview(image)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: 140).isActive = true
        image.heightAnchor.constraint(equalToConstant: 140).isActive = true
        image.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        image.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16).isActive = true
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


extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
