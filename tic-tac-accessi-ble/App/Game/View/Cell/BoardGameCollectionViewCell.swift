//
//  BoardGameCollectionViewCell.swift
//  Jogo da Velha
//
//  Created by Frederico Bechara De Paola on 28/02/19.
//  Copyright © 2019 Frederico Bechara De Paola. All rights reserved.
//

import UIKit

enum CellStatus {
    case playerX
    case playerO
    
    func getString() -> String {
        switch self {
        case .playerX:
            return "Jogador Xis"
        case .playerO:
            return "Jogador Círculo"
        }
    }
}

class BoardGameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var playerImageView: UIImageView?
    var acessibilityLabelWithIndex: String?
    var playerSet: CellStatus?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(player: CellStatus) {
        if playerImageView?.image == nil {
            var playerString = String()
            switch player {
            case .playerX:
                playerImageView?.image = UIImage(named: "cross")
                playerString = " jogador xis"
                playerSet = .playerX
            case .playerO:
                playerImageView?.image = UIImage(named: "circle")
                playerString = " jogador círculo"
                playerSet = .playerO
            }
            let newCellText = (acessibilityLabelWithIndex ?? "") + " ocupado por" + playerString
            self.accessibilityLabel = newCellText
        }
    }
    
}
