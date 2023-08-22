//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Данила on 18.08.2023.
//

import UIKit
import SwiftUI

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    var myCollectionView: UICollectionView?
    var mainView = MainView()
    var request = RequestCahracters()
    var arrayNames: [Result?] = []
    
    override func viewDidLoad() {
        backgroundView()
        print("dc")
        super.viewDidLoad()
        request.request { [weak self] values in
            DispatchQueue.main.async {
                self!.arrayNames = values
                self?.myCollectionView?.reloadData()
            }
        }
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 20)
        layout.minimumInteritemSpacing = 16 // Минимальное расстояние между ячейками по горизонтали
        layout.minimumLineSpacing = 16 // Минимальное расстояние между ячейками по вертикали
        layout.itemSize = CGSize(width: 156, height: 202)
                
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView?.register(CharacterCell.self, forCellWithReuseIdentifier: "CharacterCell")
        myCollectionView?.backgroundColor = .backgroundColor
               
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
    
        view.addSubview(myCollectionView ?? UICollectionView())
        view.backgroundColor = .backgroundColor
        view.addSubview(mainView)
        setUpConstraits()
        let yourBackImage = UIImage(named: "back_button_image")
        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
        self.navigationController?.navigationBar.backItem?.title = "Custom"
    }
    
    private func setUpConstraits() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView!.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: view.topAnchor, constant: 56).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: 67).isActive = true
        mainView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        myCollectionView!.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 10).isActive = true
        myCollectionView?.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 10).isActive = true
        myCollectionView?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myCollectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        cell.label.text = arrayNames[indexPath.item]?.name
        cell.image.load(url: URL(string: arrayNames[indexPath.item]!.image)!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        let characterViewController = CharacterViewController()
        characterViewController.characterName = arrayNames[indexPath.item]?.name
        characterViewController.image = arrayNames[indexPath.item]?.image
        characterViewController.navigationControllerReference = navigationController
        characterViewController.status = arrayNames[indexPath.item]?.status.rawValue
        characterViewController.species = arrayNames[indexPath.item]?.species.rawValue
        characterViewController.type = arrayNames[indexPath.item]?.type
        characterViewController.gender = arrayNames[indexPath.item]?.gender.rawValue
        characterViewController.urlOrigin = arrayNames[indexPath.item]?.origin.url
        characterViewController.episodeCount = arrayNames[indexPath.item]?.episode.count
        characterViewController.episode = arrayNames[indexPath.item]?.episode ?? []
        navigationController?.pushViewController(characterViewController, animated: true)

    }

}

