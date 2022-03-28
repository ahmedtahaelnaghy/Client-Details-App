//
//  ApiServiceManager.swift
//  Client Details App
//
//  Created by Ahmed Taha on 23/03/2022.
//

import Foundation
import UIKit

class ApiServiceManager {
    
    var detailsArray: [Details] = []
    
    func fetchDataFromApi(completion: @escaping([Details]?, String?) -> (Void)) {
        
        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts") {
            
            var request = URLRequest(url: url)
            
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let unwrappedData = data {
                    
                    let jsonDecoder = JSONDecoder()
                    
                    if let decodedObject = try? jsonDecoder.decode([Details].self, from: unwrappedData) {
                        
                        self.detailsArray = decodedObject
                        
                        completion(self.detailsArray, nil)
                    }
                      
                }
                
                if let unwrappedError = error {
                    
                    self.detailsArray = []
                    
                    completion(nil, unwrappedError.localizedDescription)
                       
                }
                
            }
            
            task.resume()
              
        }
         
    }
    
}







