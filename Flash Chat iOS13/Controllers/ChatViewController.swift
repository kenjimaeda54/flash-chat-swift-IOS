//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var messageTextfield: UITextField!
	
	let db = Firestore.firestore()
	
	var message: [Message] = []
	
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
		loadMessage()
		
	}
	
	func loadMessage() {
		
		db.collection(K.FStore.collectionName).order(by: K.FStore.dateField)
			.addSnapshotListener{ (querySnapshot, error) in
				if let e = error {
					print("There was an issue retrieving data from Firestore. \(e)")
				}else {
					if let querySnapshotDocument = querySnapshot?.documents {
						self.message = []
						querySnapshotDocument.forEach({
							let data = $0.data()
							//acesso pelo campo que key declarei body e sender
							//mesmo foi declarado para envio no banco
							
							if let message = data[K.FStore.bodyField] as? String, let sender = data[K.FStore.senderField] as? String {
								let newMessage = Message(email: sender, body: message)
								self.message.append(newMessage)
							}
							
							//e assincrono as mensagens por isso esse metodo
							DispatchQueue.main.async {
								self.tableView.reloadData()
								//section ,sao as tabelas que sao dividos
								//por exemplo calendario da apple
								let indexPath = IndexPath(row: self.message.count - 1 , section: 0)
								self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
							}
						})
					}
				}
				
			}
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
	
	@IBAction func sendMessage(_ sender: UIButton) {
		if let messageBody = messageTextfield.text,
			 let emailSender = Auth.auth().currentUser?.email{
			db.collection(K.FStore.collectionName).addDocument(data:[
				K.FStore.bodyField:  messageBody,
				K.FStore.senderField: emailSender,
				K.FStore.dateField: Date().timeIntervalSince1970
			]){(err) in
				if let err = err {
					print(err)
					DispatchQueue.main.async {
						self.messageTextfield.text = ""
					}
					print("Something dont work very well")
				}else {
					DispatchQueue.main.async {
						self.messageTextfield.text = ""
					}
					print("Data save with sucess")
				}
				
			}
			
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
		let message = message[indexPath.row]
		cell.labelCell.text = message.body
		
		//ele encontra o email porque na func tableView estou
		//retorno o lenght de Message
		if message.email == Auth.auth().currentUser?.email {
			cell.LeftImage.isHidden = true
			cell.RightImage.isHidden = false
			cell.messageBubble.backgroundColor  = UIColor(named: K.BrandColors.lightPurple)
			cell.labelCell.textColor = UIColor(named: K.BrandColors.purple)
		}else {
			cell.LeftImage.isHidden = false
			cell.RightImage.isHidden = true
			cell.messageBubble.backgroundColor  = UIColor(named: K.BrandColors.lighBlue)
			cell.labelCell.textColor = UIColor(named: K.BrandColors.blue)
		}
		
		//      //indentficador precisa ser o nome que esta  storyboard
		//      // no tableView
		//    maneira de criar sem celulas customizdas pelo .xib
		//        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
		//        cell.textLabel?.text = message[indexPath.row].body
		return cell
	}
}
