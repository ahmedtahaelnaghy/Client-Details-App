//
//  ExtensionApiServiceManager.swift
//  Client Details App
//
//  Created by Ahmed Taha on 24/03/2022.
//

import Foundation
import Alamofire

extension ApiServiceManager {
    
    func fetchDataFromApiByAlamofire(completion: @escaping ([Details]?, String?) -> (Void)) {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        
//        var request = AF.request(url as! URLConvertible, method: .get, encoding: JSONEncoding.default)
        
        let request = AF.request(url!, method: .get, encoding: JSONEncoding.default)
        
        request.responseJSON { (dataResponse) in
            
            if let data = dataResponse.data {
                
                let jsonDecoder = JSONDecoder()
                
                if let decodedObject = try? jsonDecoder.decode([Details].self, from: data) {
                    
                    completion(decodedObject, nil)
                    
                }
                
            }
            
            if let error = dataResponse.error {
                
                completion(nil, error.localizedDescription)
                
            }
            
        }
        
    }
    
}






