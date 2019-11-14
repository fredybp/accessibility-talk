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
    @IBOutlet weak var stack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        let text = (dateLabel.text ?? "") + (numbersLabel.text ?? "")
//        bornDateView.isAccessibilityElement = true
//        bornDateView.shouldGroupAccessibilityChildren = true
//        bornDateView.accessibilityLabel = text
        
//        UIAccessibility.post(notification: .announcement,
//                             argument: "Algo a ser avisado ao usuário")

        
        
//        let label = UILabel()
//        label.text = "Data de nascimento"
//        label.textColor = .black
//        
//        let button = UIButton()
//        button.setTitle("Alterar", for: .normal)
//        
//        let stack = UIStackView()
//        stack.axis = .horizontal
//        
//        stack.addArrangedSubview(label)
//        stack.addArrangedSubview(button)
        
        stack.isAccessibilityElement = true
        stack.shouldGroupAccessibilityChildren = true
        stack.accessibilityLabel = "Alterar data de nascimento"
        
        if UIAccessibility.isVoiceOverRunning {
            stack.accessibilityTraits = .button
            stack.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(action)))
        }
        
//        self.view.addSubview(stack)
    }
    

    @objc func action() {
        print("hiiii")
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
