//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Данила on 18.08.2023.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var myCollectionView: UICollectionView?
    var mainView = MainView()
    var request = RequestCahracters()
    var arrayNames: [Result?] = []
    
    override func viewDidLoad() {
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
    }
    
    private func setUpConstraits() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView!.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: view.topAnchor, constant: 56).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: 67).isActive = true
        mainView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        myCollectionView!.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 10).isActive = true
        myCollectionView?.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
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

}

