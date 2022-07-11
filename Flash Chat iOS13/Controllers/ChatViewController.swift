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
    
    let message: [Message] = [
        Message(email: "kenji@gmail.com", body: "Ola mundo"),
        Message(email: "Erika@gmail.com", body: "Segunda menssage"),
        Message(email: "Ricardo@gmail.com", body: "Terceira message")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //recurso nativo que permite adicionar um titulo
        //na navegacao
        title = K.appName
        //esconde o botao de back
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
        //nibName o nome do arquivo aonde esta o .xib
        //nesse caso MessgeCell
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
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

extension ChatViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        //ao fazer o casting consigo acessar as propriedades que
        //foram criadas no MessageCell
        cell.labelCell.text = message[indexPath.row].body
        
        //      //indentficador precisa ser o nome que esta  storyboard
        //      // no tableView
        //    maneira de criar sem celulas customizdas pelo .xib
        //        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        //        cell.textLabel?.text = message[indexPath.row].body
        return cell
    }
}
