//
//  ViewController.swift
//  tic-tac-accessi-ble
//
//  Created by Frederico Bechara De Paola on 16/02/19.
//  Copyright © 2019 Frederico Bechara De Paola. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var homeView: HomeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        UIView.appearance().semanticContentAttribute = .forceRightToLeft
        self.navigationController?.isNavigationBarHidden = true
    }


}

