//
//  Keys.swift
//  ApiMarvelMoya
//
//  Created by Jose Manuel Ortiz Sanchez on 24/2/21.
//

import Foundation

struct Keys {
    let apikey: String
    let privatekey: String
    let timestamp: String
    let hash: String
    
    init() {
        self.apikey = "insert_here_your_public_key"
        self.privatekey = "insert_here_your_private_key"
        self.timestamp = Date().stringValue()
        self.hash = generateHash(timestamp: timestamp, apikey: apikey, privatekey: privatekey)
    }
}
