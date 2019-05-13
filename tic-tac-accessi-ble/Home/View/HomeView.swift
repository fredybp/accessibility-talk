//
//  HomeView.swift
//  tic-tac-accessi-ble
//
//  Created by Frederico Bechara De Paola on 19/02/19.
//  Copyright © 2019 Frederico Bechara De Paola. All rights reserved.
//

import UIKit

class HomeView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var instructionsButton: UIButton!
    @IBOutlet weak var tictacImageView: UIImageView!
    
    override func awakeFromNib() {
        setupAcessibility()
    }
    
    
    func setupAcessibility() {
        
        titleLabel.accessibilityLabel = "Jogo da Velha"
        titleLabel.accessibilityTraits = UIAccessibilityTraits.header
        titleLabel.adjustsFontForContentSizeCategory = true
        playButton.titleLabel?.adjustsFontForContentSizeCategory = true
        instructionsButton.titleLabel?.adjustsFontForContentSizeCategory = true
        
        
        let firstLabel = UILabel()
        firstLabel.isAccessibilityElement = true
        firstLabel.accessibilityLabel = "Texto."
        firstLabel.accessibilityTraits = UIAccessibilityTraits.staticText
        
        let secondLabel = UILabel()
        secondLabel.isAccessibilityElement = true
        secondLabel.accessibilityLabel = "Texto."
        secondLabel.accessibilityTraits = UIAccessibilityTraits.staticText
        
        let view = UIView()
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        view.isAccessibilityElement = true
        view.shouldGroupAccessibilityChildren = true
        view.accessibilityLabel = "Texto que engloba tudo que está aqui dentro"
        view.accessibilityTraits = UIAccessibilityTraits.button
        
        self.addSubview(view)
        
    }

}
