//
//  InstructtionsView.swift
//  Jogo da Velha
//
//  Created by Fred on 10/17/19.
//  Copyright © 2019 Frederico Bechara De Paola. All rights reserved.
//

import UIKit

class InstructionsView: UIView {

    @IBOutlet var contentView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("InstructionsView", owner: self, options: nil)
        contentView.fixInView(self)
//        if !UIAccessibility.isVoiceOverRunning {
//            gameStatusButton.isHidden = true
//        }
    }
}
