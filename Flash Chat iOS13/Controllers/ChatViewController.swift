//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //recurso nativo que permite adicionar um titulo
        //na navegacao
        title = "⚡️FlashChat"
        //esconde o botao de back
        navigationItem.hidesBackButton = true
    }
    @IBAction func handleLogOut(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            //retorna ao root view controller neste caso a rota home
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    
    
}
