//
//  WorkViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 19.11.2021.
//

import UIKit

class WorkViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delay(3){
            self.alertController()
        }
        loadingView()
        
    }
    private func loadingView() {
        title = "WorkViewController"
        view.backgroundColor = .red
    }
    
    private func delay(_ delay: Int, closure: @escaping () -> () ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            closure()
        }
    }
    
    private func alertController() {
        let alert = UIAlertController(title: "This is ALERT", message: "Enter a password", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        alert.addTextField { (login) in
            login.placeholder = "Enter a login"
        }
        
        alert.addTextField { (userPassword) in
            userPassword.placeholder = "Enter a password"
            userPassword.isSecureTextEntry = true
        }
        present(alert, animated: true, completion: nil)
    }
    
}

































