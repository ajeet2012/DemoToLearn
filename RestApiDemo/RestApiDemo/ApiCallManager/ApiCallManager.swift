//
//  ApiCallManager.swift
//  RestApiDemo
//
//  Created by Ajeet Sharma on 02/10/21.
//

import Foundation


// MARK: - WelcomeElement

// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    
    
    let domains: [String]
    let name: String
    let country: Country
    let alphaTwoCode: AlphaTwoCode
    let stateProvince: String?
    let webPages: [String]?
    let rawebPages: [String]?

    enum CodingKeys: String, CodingKey {
        case domains, name, country
        case alphaTwoCode
        case stateProvince
        case webPages
        case rawebPages
    }
}

enum AlphaTwoCode: String, Codable {
    case alphaTwoCodeIN = "IN"
}

enum Country: String, Codable {
    case india = "India"
}

typealias Welcome = [WelcomeElement]

class ApiCallManager{
    
    
    class func fetchUniversityListOfIndia(successHandler:@escaping(String, Data)->Void, failureHandler:@escaping(Error)->Void, somethingWentWrong:@escaping()->Void){
        
        
        let urlStr = "http://universities.hipolabs.com/search?country=India"
        
        let url = URL(string: urlStr)
        
        let session = URLSession.shared
        
        guard url != nil else{
            
            
            return
        }
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            guard  error == nil else{
                
                
                failureHandler(error!)
                return
                
            }
            
            if data != nil {
                
                successHandler(String(data: data!, encoding: .utf8)!, data!)
                
                
//                let decoder = JSONDecoder()
//
//                do {
//
//
//                    if let json = try? JSONSerialization.jsonObject(with: data!, options: []) {
//
//                        print(json)
//
//                        let jsonObject:[String:String] = json as! [String : String]
//                        print(jsonObject)
//
//
//                    }
//
//
//                    let univerSityList = try decoder.decode(Welcome.self, from: data!)
//
//                    print("response - \(univerSityList)")
//
//                }
//                catch{
//
//                    failureHandler(error)
//                }
            }
            else{
                
                
                
            }
            
        }
        
        dataTask.resume()
        
        
        
    }
    
    
    
    
}
