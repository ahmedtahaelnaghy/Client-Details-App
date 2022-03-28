//
//  ViewController.swift
//  Client Details App
//
//  Created by Ahmed Taha on 23/03/2022.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var userIdLbl: UILabel!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var bodyLbl: UILabel!
    
    @IBOutlet weak var activityIndecator: UIActivityIndicatorView!
    
    var counter = 0
    
    var userArray: [Details] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndecator.startAnimating()
        
        ApiServiceManager().fetchDataFromApiByAlamofire { (detailsArray, error) in
            
            self.activityIndecator.stopAnimating()
            
            if let unwrappedDetailsArray = detailsArray {
                   
                self.userArray = unwrappedDetailsArray
                
                DispatchQueue.main.async {
                    
                    self.userIdLbl.text = "\(unwrappedDetailsArray[self.counter].userID)"
                    self.titleLbl.text = "\(unwrappedDetailsArray[self.counter].title)"
                    self.bodyLbl.text = "\(unwrappedDetailsArray[self.counter].body)"
                    
                }
                
            }
            
            if let unwrappedError = error {
                
                self.userIdLbl.text = "\(unwrappedError)"
                self.titleLbl.text = ""
                self.bodyLbl.text = ""
                
            }
            
        }
        
    }
    
    
    @IBAction func nextBtn(_ sender: Any) {
         
        counter += 1
        
        if (counter > userArray.count - 1) {

            counter = 0

        }

        userIdLbl.text = "\(userArray[counter].userID)"
        titleLbl.text = "\(userArray[counter].title)"
        bodyLbl.text = "\(userArray[counter].body)"
        
    }
    
    
    @IBAction func prevBtn(_ sender: Any) {
        
       counter -= 1
        
        if (counter < 0) {
            
            counter = userArray.count - 1
        }
        
        userIdLbl.text = "\(userArray[counter].userID)"
        titleLbl.text = "\(userArray[counter].title)"
        bodyLbl.text = "\(userArray[counter].body)"
        
    }
    
}
