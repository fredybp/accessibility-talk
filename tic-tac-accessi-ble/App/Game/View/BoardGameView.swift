//
//  BoardGameView.swift
//  Jogo da Velha
//
//  Created by Frederico Bechara De Paola on 19/02/19.
//  Copyright © 2019 Frederico Bechara De Paola. All rights reserved.
//

import UIKit

class BoardGameView: UIView {
    
    @IBOutlet var contentView: BoardGameView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var gameStatusButton: UIButton!
    var player: CellStatus?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("BoardGameView", owner: self, options: nil)
        contentView.fixInView(self)
        collectionView.isAccessibilityElement = false
        if !UIAccessibility.isVoiceOverRunning {
            gameStatusButton.isHidden = true
        }
    }
    
    @IBAction func announceStatus(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
            UIAccessibility.post(notification: .announcement, argument: self.getGameStatusText())
        })
    }
    
    func getGameStatusText() -> String {
        
        var text = String()
        
        switch player {
        case .none:
            return ""
        case .some(let turn):
            switch turn {
            case .playerX:
                text = "Vez do jogador xis. "
            case .playerO:
                text = "Vez do jogador círculo. "
            }
        }
        
        let visibleCells = self.collectionView.indexPathsForVisibleItems
            .sorted { $0.section < $1.section || $0.row < $1.row }
            .compactMap { self.collectionView.cellForItem(at: $0) }
        
        for cell in visibleCells {
            if let cellText = cell.accessibilityLabel {
                text.append(cellText + ". ")
            }
        }
        
        return text
    }
    
}
