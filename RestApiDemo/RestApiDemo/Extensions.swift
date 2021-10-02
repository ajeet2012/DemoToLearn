//
//  Extensions.swift
//  FileManagerDemo
//
//  Created by Ajeet Sharma on 01/10/21.
//

import Foundation

import UIKit


extension UIViewController{
    
    func showAlertWithMessage(msg:String)->Void{
        
        
        let alert = UIAlertController(title: "Message", message: msg, preferredStyle: .alert)
        
        let alertDefaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(alertDefaultAction)
        
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    func showAlertWithMessageWithHandler(msg:String, handler:@escaping()->Void)->Void{
        
        
        let alert = UIAlertController(title: "Message", message: msg, preferredStyle: .alert)
        
        let alertDefaultAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            
            handler()
            
        }
        
        alert.addAction(alertDefaultAction)
        
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    
}
