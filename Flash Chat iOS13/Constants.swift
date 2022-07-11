//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by kenjimaeda on 11/07/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
struct K {
    //static permite eu acimar meotods,variaveis sem precisar
    //instanciar objeto let object = k()
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterChat"
    static let loginSegue = "LoginChat"
    static let appName =  "⚡️FlashChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
