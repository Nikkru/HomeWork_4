//
//  ViewController.swift
//  HomeWork_4
//
//  Created by Nikolai Krusser on 29.05.2020.
//  Copyright © 2020 Nikolai Krusser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var login: String?
    let conerRadiusButton: CGFloat = 5
    
    @IBOutlet weak var logOutButtonStyle: UIButton!
    @IBOutlet weak var userNameTextField: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        logOutButtonStyle.layer.cornerRadius = conerRadiusButton
        userNameTextField.layer.cornerRadius = conerRadiusButton
        
        guard let userName = login else { return }
        userNameTextField.text = "Hello, \(userName) !"
    }
    override func viewWillAppear(_ animated: Bool) {
        guard let userName = login else { return }
        userNameTextField.text = "Hello, \(userName) !"
    }
    
    @IBAction func logOutButton() {
    }
    
}

