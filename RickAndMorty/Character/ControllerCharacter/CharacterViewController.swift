//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by Данила on 21.08.2023.
//

import Foundation
import UIKit


class CharacterViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    var characterName: String?
    var image: String?
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
    var episode: [String] = []
    var urlOrigin: String?
    var episodeCount: Int?
    var origin: WelcomeOrigin?
    
    var episodes: [WelcomeN?] = []
    
//    var myCollectionView: UICollectionView!
    var characterView = CharacterView()
    var request = RequestOrigin()
    var navigationControllerReference: UINavigationController?
    let scrollView = UIScrollView()
    
    override func viewWillAppear(_ animated: Bool) {
        print(episodes.count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        episodes = []
        request.episodeCount { [weak self] value in
            DispatchQueue.main.async {
//                self?.episode = value
                self?.loadViewIfNeeded()
                self?.characterView.myCollectionView.reloadData()
                self?.characterView.heightAnchor.constraint(equalToConstant: 700 + 100*Double(self?.episodeCount ?? 0)).isActive = true
            }
        }
        for i in episode {
            request.episode(url: i) { [weak self] values in
                DispatchQueue.main.async {
                    self?.episodes.append(values)
                    self?.characterView.myCollectionView.reloadData()
                }
            }
        }
        backgroundView()
        view.backgroundColor = .backgroundColor
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = .white
        navigationItem.leftBarButtonItem = backButton
            
        characterView.myCollectionView.dataSource = self
        characterView.myCollectionView.delegate = self
        setUpUI()

    }
    override func viewDidAppear(_ animated: Bool) {
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 700 + 100*Double(episodeCount ?? 0))
    }
    func setUpUI() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.contentSize = CGSize(width: view.bounds.width, height: 2300)
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        scrollView.heightAnchor.constraint(equalToConstant: 9000).isActive = true
        scrollView.backgroundColor = .backgroundColor
        scrollView.addSubview(characterView)
        
        characterView.translatesAutoresizingMaskIntoConstraints = false
        characterView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        characterView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        characterView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        characterView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
//        characterView.heightAnchor.constraint(equalToConstant: 540+300*Double(episode ?? 0)).isActive = true
        
        
        
        updateView()
    }
    
    func updateView() {
        if let characterName = characterName {
            characterView.nameLabel.text = characterName
        }
        if let image = image {
            characterView.avatar.load(url: URL(string: image)!)
        }
        if let status = status {
            characterView.status.text = status
        }
        if let species = species {
            characterView.dataSpecies.text = species
        } else { characterView.dataSpecies.text = "None" }
        if type != "" {
            characterView.dataType.text = type
        } else { characterView.dataType.text = "None" }
        if let gender = gender {
            characterView.dataGender.text = gender
        } else { characterView.dataGender.text = "None" }
        if urlOrigin != "" {
            request.request(url: urlOrigin!) { [weak self] value in
                DispatchQueue.main.async {
                    self?.origin = value
                    self?.characterView.planetName.text = value?.name
                    self?.characterView.planetType.text = value?.type
                }
            }
        } else { characterView.planetName.text = "None"
            characterView.planetType.text = "None" }
    }
    
    @objc private func backButtonTapped() {
        navigationControllerReference?.popViewController(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.episode ?? 0
        return episodeCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EpisodeCell", for: indexPath) as! EpisodeCell
        cell.label.text = episodes[indexPath.item]?.name
        let inputString = episodes[indexPath.item]?.episode ?? ""

        let startIndex = inputString.index(inputString.startIndex, offsetBy: 1)
        let endIndex = inputString.index(inputString.startIndex, offsetBy: 3)
        let episodeSubstring1 = inputString[startIndex..<endIndex]

        let startIndex2 = inputString.index(inputString.endIndex, offsetBy: -2)
        let endIndex2 = inputString.endIndex
        let episodeSubstring2 = inputString[startIndex2..<endIndex2]
        cell.episode.text = "Episode: \(episodeSubstring2), Season: \(episodeSubstring1)"
        cell.date.text = episodes[indexPath.item]?.airDate
        return cell
    }
}

extension UIViewController
{
  func backgroundView()
  {
     let colouredTopBlack = UIView()
     view.addSubview(colouredTopBlack)
     colouredTopBlack.translatesAutoresizingMaskIntoConstraints = false
     colouredTopBlack.backgroundColor = .backgroundColor

     NSLayoutConstraint.activate([
        colouredTopBlack.topAnchor.constraint(equalTo: view.topAnchor),
        colouredTopBlack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        colouredTopBlack.widthAnchor.constraint(equalTo: view.widthAnchor),
    ])
  }
}
//259322833


//https://rickandmortyapi.com/api/episode
