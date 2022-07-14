# Flash chat
App de conversa com recursos simples

## Motivacao
Praticar novos conceitos em  swift e reforcar os anteriores.


## Feature
- Aprendi o uso do .xib
- Este recurso e útil para criar views customizadas, apliquei no table view
- Para conectar o table view com o .xib utiliza o método register com objeto UINib
- nibName e o mesmo que foi colocado do arquivo .xib.  ForceCellReuseIdentifier e nome do componente 

```swift

tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)

```

## 
- Aprendi o uso de gerenciamento de pacotes com [Cocoapods](https://cocoapods.org/)
- Apos iniciar o cocoapods no projeto precisa desenvolver a partir do arquivo com extensão   ...x worskpace, normalmente e branco
- O gerenciamento do pacote fica por conta do arquivo PodFile
- Integração do [Firebase](https://firebase.google.com/docs/ios/setup) foi neste arquivo


```swift
platform :ios, '10.0'

target 'Flash Chat iOS13' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Flash Chat iOS13
  pod 'FirebaseAuth'
  pod 'FirebaseFirestore'
  pod 'IQKeyboardManagerSwift', '6.3.0'


end

```
##
- Usei performSegue para navegação, identificador da segue  nome que interliga as telas
- Utilizei stack navigation no projeto
- Para integrar essa navegação precisa Navigation Controller
- Para esconder o botão back que vem integrado precisa do método hidesBackButton
- Esse método fica disponível ao  integrar navigation stack
- Precisa lembrar sempre está usando requisições background precisa  do método DispatchQueue
- Para atualizar o tableView apos um dado for inserido precisa fazer um reloadData no table view
- Para retornar de uma tela para principal usa o método popToRootViewController

```swift
//background
DispatchQueue.main.async {
    self.tableView.reloadData()					
    let indexPath = IndexPath(row: self.message.count - 1 , section: 0)
    self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
}

//esconder back
navigationItem.hidesBackButton = true

//retornar ao root
navigationController?.popToRootViewController(animated: true)

```


