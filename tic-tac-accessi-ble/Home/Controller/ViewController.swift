//
//  ViewController.swift
//  Jogo da Velha
//
//  Created by Frederico Bechara De Paola on 26/02/19.
//  Copyright © 2019 Frederico Bechara De Paola. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bornDateView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var numbersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let text = (dateLabel.text ?? "") + (numbersLabel.text ?? "")
        bornDateView.isAccessibilityElement = true
        bornDateView.shouldGroupAccessibilityChildren = true
        bornDateView.accessibilityLabel = text
        
        UIAccessibility.post(notification: .announcement,
                             argument: "Algo a ser avisado ao usuário")

        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
