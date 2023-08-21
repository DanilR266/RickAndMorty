////  MainVIew.swift
//  RickAndMorty
//
//  Created by Данила on 19.08.2023.
//

import Foundation
import UIKit


class MainView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height: 50) // Размер ячейки
        layout.minimumInteritemSpacing = 10 // Минимальное расстояние между ячейками по горизонтали
        layout.minimumLineSpacing = 10 // Минимальное расстояние между ячейками по вертикали
        let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Characters"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func configureUI() {
        addSubview(label)
        addSubview(collectionView)
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .backgroundColor
        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
