//
//  Details.swift
//  Client Details App
//
//  Created by Ahmed Taha on 23/03/2022.
//

import Foundation

struct Details: Codable {
    
        let userID, id: Int
        let title, body: String
    
        enum CodingKeys: String, CodingKey {
            
            case userID = "userId"
            case id, title, body
            
        }
    
    
}


