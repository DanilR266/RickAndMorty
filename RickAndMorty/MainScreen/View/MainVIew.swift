////  MainVIew.swift
//  RickAndMorty
//
//  Created by Данила on 19.08.2023.
//

import Foundation
import UIKit


class MainView: UIView {

    
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
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
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
