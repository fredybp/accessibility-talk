//
//  GameViewController.swift
//  Jogo da Velha
//
//  Created by Frederico Bechara De Paola on 19/02/19.
//  Copyright © 2019 Frederico Bechara De Paola. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var mainView: BoardGameView!
    
    let numberOfCells = 9
    let reuseIdentifier = "boardCell"
    var playerTurn: CellStatus = .playerX
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(UINib(nibName: "BoardGameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        mainView.player = playerTurn
    }
    
}

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? BoardGameCollectionViewCell else { return UICollectionViewCell() }
        
        
        cell.backgroundColor = UIColor.white
        cell.isAccessibilityElement = true
        cell.acessibilityLabelWithIndex = "Célula \(indexPath.row + 1) de \(numberOfCells)."
        cell.accessibilityLabel = "Célula \(indexPath.row + 1) de \(numberOfCells), livre."
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (collectionView.frame.width-20)/3
        return CGSize(width: size, height: size-5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? BoardGameCollectionViewCell else { return }
        cell.setup(player: playerTurn)
        checkIfWon(collectionView: collectionView)
        switch playerTurn {
        case .playerX:
            playerTurn = .playerO
        case .playerO:
            playerTurn = .playerX
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func checkIfWon(collectionView: UICollectionView) {
        
        
        if let cell1 = collectionView.cellForItem(at: IndexPath(row: 0, section: 0)) as? BoardGameCollectionViewCell,
            let cell2 = collectionView.cellForItem(at: IndexPath(row: 1, section: 0)) as? BoardGameCollectionViewCell,
            let cell3 = collectionView.cellForItem(at: IndexPath(row: 2, section: 0)) as? BoardGameCollectionViewCell,
            let cell4 = collectionView.cellForItem(at: IndexPath(row: 3, section: 0)) as? BoardGameCollectionViewCell,
            let cell5 = collectionView.cellForItem(at: IndexPath(row: 4, section: 0)) as? BoardGameCollectionViewCell,
            let cell6 = collectionView.cellForItem(at: IndexPath(row: 5, section: 0)) as? BoardGameCollectionViewCell,
            let cell7 = collectionView.cellForItem(at: IndexPath(row: 6, section: 0)) as? BoardGameCollectionViewCell,
            let cell8 = collectionView.cellForItem(at: IndexPath(row: 7, section: 0)) as? BoardGameCollectionViewCell,
            let cell9 = collectionView.cellForItem(at: IndexPath(row: 8, section: 0)) as? BoardGameCollectionViewCell {
                if cell1.playerSet != nil, cell2.playerSet != nil, cell3.playerSet != nil, cell1.playerSet == cell2.playerSet && cell2.playerSet == cell3.playerSet {
                    playerWon()
                }
            
                if cell4.playerSet != nil, cell5.playerSet != nil, cell6.playerSet != nil, cell4.playerSet == cell5.playerSet && cell5.playerSet == cell6.playerSet {
                    playerWon()
                }
            
                if cell7.playerSet != nil, cell8.playerSet != nil, cell9.playerSet != nil, cell7.playerSet == cell8.playerSet && cell8.playerSet == cell9.playerSet {
                    playerWon()
                }
            
                if cell1.playerSet != nil, cell4.playerSet != nil, cell7.playerSet != nil, cell1.playerSet == cell4.playerSet && cell4.playerSet == cell7.playerSet {
                    playerWon()
                }
            
                if cell2.playerSet != nil, cell5.playerSet != nil, cell8.playerSet != nil, cell2.playerSet == cell5.playerSet && cell5.playerSet == cell8.playerSet {
                    playerWon()
                }
            
                if cell3.playerSet != nil, cell6.playerSet != nil, cell9.playerSet != nil, cell3.playerSet == cell6.playerSet && cell6.playerSet == cell9.playerSet {
                    playerWon()
                }
            
                if cell1.playerSet != nil, cell5.playerSet != nil, cell9.playerSet != nil, cell1.playerSet == cell5.playerSet && cell5.playerSet == cell9.playerSet {
                    playerWon()
                }
            
                if cell3.playerSet != nil, cell5.playerSet != nil, cell7.playerSet != nil, cell3.playerSet == cell5.playerSet && cell5.playerSet == cell7.playerSet {
                    playerWon()
                }
        }
    }
    
    func playerWon() {
        
        let alert = UIAlertController(title: "\(playerTurn.getString()) ganhou!", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Voltar para menu", style: .default, handler: { [weak self] (_) in
            self?.navigationController?.popToRootViewController(animated: true)
        }))
        self.present(alert, animated: true)
    }
    
}
