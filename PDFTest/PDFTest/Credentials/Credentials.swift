//
//  Credentials.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 2/2/22.
//

import Foundation

final class Credentials {
    
    // Singleton
    static let shared = Credentials()
    
    // Properties
    let apiBaseURL: String
    let publicKey: String
    
    // Token
    private let tokenKey = "token"
    var token: String {
        get { UserDefaults.standard.string(forKey: tokenKey) ?? "" }
        set {
            UserDefaults.standard.set(newValue, forKey: tokenKey)
        }
    }
    
    // Initialization
    private init() {
        let path = Bundle.main.path(forResource: "Credentials", ofType: "plist")!
        let plist = NSDictionary(contentsOfFile: path) as! [AnyHashable: Any]
        apiBaseURL = plist["apiBaseURL"] as! String
        publicKey = plist["public_key"] as! String
    }
        
}
