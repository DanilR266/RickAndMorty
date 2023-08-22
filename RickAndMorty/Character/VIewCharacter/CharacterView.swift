//
//  CharacterView.swift
//  RickAndMorty
//
//  Created by Данила on 21.08.2023.
//

import Foundation
import UIKit


class CharacterView: UIView {
    
    
    lazy var avatar: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        return image
    }()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    lazy var status: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .greenText
        label.textAlignment = .center
        return label
    }()
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.text = "Info"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    lazy var episodesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.text = "Episodes"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    lazy var originLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.text = "Origin"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    lazy var rectangleView: UIView = {
        let view = UIView()
        view.backgroundColor = .rectangleView
        view.layer.cornerRadius = 16
        return view
    }()
    lazy var rectanglePlanetView: UIView = {
        let view = UIView()
        view.backgroundColor = .rectangleView
        view.layer.cornerRadius = 16
        return view
    }()
    
    lazy var labelSpecies: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "Species:"
        label.textAlignment = .center
        label.textColor = .rectangleText
        return label
    }()
    lazy var labelType: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "Type:"
        label.textAlignment = .center
        label.textColor = .rectangleText
        return label
    }()
    lazy var labelGender: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "Gender:"
        label.textAlignment = .center
        label.textColor = .rectangleText
        return label
    }()
    
    lazy var dataSpecies: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "None"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    lazy var dataType: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .right
        label.text = "None"
        label.textColor = .white
        return label
    }()
    lazy var dataGender: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .center
        label.text = "None"
        label.textColor = .white
        return label
    }()
    
    lazy var rectangleOriginView: UIView = {
        let view = UIView()
        view.backgroundColor = .planetView
        view.layer.cornerRadius = 10
        return view
    }()
    lazy var planet: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "planet")
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var planetName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    lazy var planetType: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .greenText
        return label
    }()
    
    
    private func configureUI() {
        addSubview(avatar)
        addSubview(nameLabel)
        addSubview(status)
        addSubview(infoLabel)
        addSubview(rectangleView)
        addSubview(originLabel)
        addSubview(rectanglePlanetView)
        addSubview(episodesLabel)
        
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.widthAnchor.constraint(equalToConstant: 148).isActive = true
        avatar.heightAnchor.constraint(equalToConstant: 148).isActive = true
        avatar.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        avatar.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 24).isActive = true
        
        status.translatesAutoresizingMaskIntoConstraints = false
        status.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        status.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        
        rectangleView.translatesAutoresizingMaskIntoConstraints = false
        rectangleView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        rectangleView.widthAnchor.constraint(equalToConstant: 327).isActive = true
        rectangleView.heightAnchor.constraint(equalToConstant: 124).isActive = true
        rectangleView.topAnchor.constraint(equalTo: status.bottomAnchor, constant: 62).isActive = true
        setUpRectangleView()
        
        rectanglePlanetView.translatesAutoresizingMaskIntoConstraints = false
        rectanglePlanetView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        rectanglePlanetView.widthAnchor.constraint(equalToConstant: 327).isActive = true
        rectanglePlanetView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        rectanglePlanetView.topAnchor.constraint(equalTo: rectangleView.bottomAnchor, constant: 62).isActive = true
        
        originLabel.translatesAutoresizingMaskIntoConstraints = false
        originLabel.topAnchor.constraint(equalTo: rectangleView.bottomAnchor, constant: 24).isActive = true
        originLabel.leadingAnchor.constraint(equalTo: rectanglePlanetView.leadingAnchor).isActive = true
        originLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.topAnchor.constraint(equalTo: status.bottomAnchor, constant: 24).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor).isActive = true
        infoLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        rectanglePlanetView.addSubview(rectangleOriginView)
        rectangleOriginView.translatesAutoresizingMaskIntoConstraints = false
        rectangleOriginView.topAnchor.constraint(equalTo: rectanglePlanetView.topAnchor, constant: 8).isActive = true
        rectangleOriginView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        rectangleOriginView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        rectangleOriginView.leadingAnchor.constraint(equalTo: rectanglePlanetView.leadingAnchor, constant: 8).isActive = true
        
        rectangleOriginView.addSubview(planet)
        rectangleOriginView.addSubview(planetName)
        rectangleOriginView.addSubview(planetType)
        
        planet.translatesAutoresizingMaskIntoConstraints = false
        planet.widthAnchor.constraint(equalToConstant: 22).isActive = true
        planet.heightAnchor.constraint(equalToConstant: 17.5).isActive = true
        planet.centerYAnchor.constraint(equalTo: rectangleOriginView.centerYAnchor).isActive = true
        planet.centerXAnchor.constraint(equalTo: rectangleOriginView.centerXAnchor).isActive = true
        
        planetName.translatesAutoresizingMaskIntoConstraints = false
        planetType.translatesAutoresizingMaskIntoConstraints = false
        
        planetName.widthAnchor.constraint(equalToConstant: 230).isActive = true
        planetName.topAnchor.constraint(equalTo: rectanglePlanetView.topAnchor, constant: 16).isActive = true
        planetName.leadingAnchor.constraint(equalTo: rectangleOriginView.trailingAnchor, constant: 16).isActive = true
        planetType.bottomAnchor.constraint(equalTo: rectanglePlanetView.bottomAnchor, constant: -16).isActive = true
        planetType.leadingAnchor.constraint(equalTo: rectangleOriginView.trailingAnchor, constant: 16).isActive = true
        
        episodesLabel.translatesAutoresizingMaskIntoConstraints = false
        episodesLabel.leadingAnchor.constraint(equalTo: originLabel.leadingAnchor).isActive = true
        episodesLabel.topAnchor.constraint(equalTo: rectangleOriginView.bottomAnchor, constant: 30).isActive = true
        addSubview(myCollectionView)
        
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.topAnchor.constraint(equalTo: episodesLabel.bottomAnchor, constant: 10).isActive = true
        myCollectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        myCollectionView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    
    private func setUpRectangleView() {
        rectangleView.addSubview(labelSpecies)
        rectangleView.addSubview(labelType)
        rectangleView.addSubview(labelGender)
        
        rectangleView.addSubview(dataSpecies)
        rectangleView.addSubview(dataType)
        rectangleView.addSubview(dataGender)
        
        labelSpecies.translatesAutoresizingMaskIntoConstraints = false
        labelType.translatesAutoresizingMaskIntoConstraints = false
        labelGender.translatesAutoresizingMaskIntoConstraints = false
        
        dataSpecies.translatesAutoresizingMaskIntoConstraints = false
        dataType.translatesAutoresizingMaskIntoConstraints = false
        dataGender.translatesAutoresizingMaskIntoConstraints = false
        
        labelSpecies.topAnchor.constraint(equalTo: rectangleView.topAnchor, constant: 16).isActive = true
        labelSpecies.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor, constant: 16).isActive = true
        labelType.topAnchor.constraint(equalTo: labelSpecies.bottomAnchor, constant: 16).isActive = true
        labelType.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor, constant: 16).isActive = true
        labelGender.topAnchor.constraint(equalTo: labelType.bottomAnchor, constant: 16).isActive = true
        labelGender.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor, constant: 16).isActive = true
        
        dataSpecies.centerYAnchor.constraint(equalTo: labelSpecies.centerYAnchor).isActive = true
        dataSpecies.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor, constant: -16).isActive = true
        dataType.centerYAnchor.constraint(equalTo: labelType.centerYAnchor).isActive = true
        dataType.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor, constant: -16).isActive = true
        dataType.widthAnchor.constraint(equalToConstant: 228).isActive = true
        dataGender.centerYAnchor.constraint(equalTo: labelGender.centerYAnchor).isActive = true
        dataGender.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor, constant: -16).isActive = true
        
        
    }
    var myCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .backgroundColor
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 20)
        layout.minimumInteritemSpacing = 16 // Минимальное расстояние между ячейками по горизонтали
        layout.minimumLineSpacing = 16 // Минимальное расстояние между ячейками по вертикали
        layout.itemSize = CGSize(width: 327, height: 86)
                
        myCollectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        myCollectionView.register(EpisodeCell.self, forCellWithReuseIdentifier: "EpisodeCell")
        myCollectionView.backgroundColor = .backgroundColor
        myCollectionView.isScrollEnabled = false
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



