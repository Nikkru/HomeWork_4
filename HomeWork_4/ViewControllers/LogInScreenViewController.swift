//
//  LogInScreenViewController.swift
//  HomeWork_4
//
//  Created by Nikolai Krusser on 29.05.2020.
//  Copyright © 2020 Nikolai Krusser. All rights reserved.
//

import UIKit

class LogInScreenViewController: UIViewController {
    
    var user: UserNameLogIn!
 
    //  Не смог достучаться до файла с моделью :( не умею
    let logInDictionary: [ String : String ] = [
        "Alexey" : "1234",
        "User" : "User",
        "Alex" : "123",
        "123" : "123"
    ]
    
    private let missedLogiN = "So sorry! This login is out. Please, check it"
 
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logInTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? ViewController else { return }
        dvc.login = logInTextField.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 5
    }
    
    @IBAction func logInButton(_ sender: UIButton) {
        
        let logins = [String](logInDictionary.keys)
        
        guard let login = logInTextField.text else { return }
        
        if login.isEmpty {
            showAlertLogin(with: "Login place is empty",
                           and: "Please, enter your login")
            return
    }
        
        if logins.contains(login) == false {
            showAlertLogin(with: "This login is out",
                           and: missedLogiN)
            return
        }
        
        guard let password = passwordTextField.text else { return }
        if password.isEmpty {
            showAlertPassword(with: "Password place is empty",
                              and: "Please, enter your password")
            return
        }
        
        for (key, value) in logInDictionary {
            if (login == key) && (password == value) {
                performSegue(withIdentifier: "logInSegue", sender: self)
            }  else if (login == key) && (password != value) {
                showAlertPassword(with: "Sorry, wrong password!",
                                  and: "Please, try one more")
                return
            }
        }
    }
    
    @IBAction func forgotNameButton(_ sender: UIButton) {
        showAlertLogin(with: "Your login is - Alexey",
            and: "Good luck!")
        return
    }
    @IBAction func forgotPasswordButton(_ sender: UIButton) {
        guard let login = logInTextField.text else { return }
        guard let password = logInDictionary[login] else {
            return showAlertLogin(with: "This login is out!",
        and: missedLogiN)}
        showAlertPassword(with: "Your password is \(password)",
            and: "Good luck!")
        return
    }
//MARK: UnwindSegue
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
        guard segue.source is ViewController else { return }
        self.logInTextField.text = ""
        self.passwordTextField.text = ""
    }
}

//MARK: UIAlertController
extension LogInScreenViewController {

    private func showAlertPassword(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func showAlertLogin(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.logInTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
