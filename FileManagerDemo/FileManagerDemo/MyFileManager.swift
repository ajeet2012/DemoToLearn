//
//  FileManager.swift
//  MyFileManager
//
//  Created by Ajeet Sharma on 01/10/21.
//

import Foundation

class MyFileManager{
    
    //MARK:- List of file in root folder ------
    
    
    class func fileListInFolder() -> [String]{
        
        
        let manager = FileManager.default
        
        
        let baseURL = MyFileManager.fetchBaseURL()

        do {
            
            let fileList = try manager.contentsOfDirectory(atPath: (baseURL?.appendingPathComponent("Demo").path)!)
            
            return fileList
            
        }
        catch{
            
            print(error)
            
        }
        
        return []
        
        
        
        
        
    }
    //MARK:- Fetch Base URL ------
    
    
    class func fetchBaseURL() -> URL?{
        
        let manager = FileManager.default
        
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            
            return nil
        }
        
        return url
        
    }
    
    //MARK:- Check file exist or not ------
    
    class func checkDiectoryExist() -> Bool{
        
        let manager = FileManager.default
        
        
        let baseURL = MyFileManager.fetchBaseURL()
        
        if  let path = baseURL?.appendingPathComponent("Demo"){
            
            if manager.fileExists(atPath: path.path){
                
                return true
            }
            
            return false
            
        }
        
        return false
    }
    
    
    class func isFileExist(name:String)->Bool{
        
        let manager = FileManager.default
        
        
        let baseURL = MyFileManager.fetchBaseURL()
        
        if  let path = baseURL?.appendingPathComponent("Demo").appendingPathComponent("\(name.lowercased()).txt"){
            
            if manager.fileExists(atPath: path.path){
                
                return true
            }
            
            return false
            
        }
        
        
        
        return false
    }
    
    //MARK:- Read file -----
    
    class func readFile(name:String) -> String{
        
        
       
        
        let url = MyFileManager.fetchBaseURL()
        
        if   let filePath = url?.appendingPathComponent("Demo").appendingPathComponent("\(name.lowercased()).txt"){
            
            print("Base url path - \(String(describing: filePath))")
            do {
                
                let dataInFile =   try String.init(contentsOfFile: filePath.path)
                
                return dataInFile
                
            }
            catch{
                
                print(error)
                
                return ""
            }
            
           
        }
        
        
        return ""
        
    }
    
    
   
    
    //MARK:- Create Directory ------
    
    class func createDirectory(){
        
        if !MyFileManager.checkDiectoryExist(){
            
            
            let manager = FileManager.default
            
            let url = MyFileManager.fetchBaseURL()
            
            if   let folderPath = url?.appendingPathComponent("Demo"){
                
                print("Base url path - \(String(describing: url))")
                do {
                    
                    try manager.createDirectory(at: folderPath, withIntermediateDirectories: true, attributes: [:])
                    
                    print("Folder created")

                }
                catch{
                    
                    print(error)
                    
                }
                
            }
            
            
            
        }
        
        
    }
    
    //MARK:- Create File ------
    
    class func createFile(name:String, data:Data) -> Bool{
        
        
        let manager = FileManager.default
        
        let url = MyFileManager.fetchBaseURL()
        
        if   let filePath = url?.appendingPathComponent("Demo").appendingPathComponent("\(name.lowercased()).txt"){
            
            print("Base url path - \(String(describing: filePath))")
            do {
                
                try manager.createFile(atPath: filePath.path, contents: data, attributes: [FileAttributeKey.creationDate:Date()])
                return true
            }
            catch{
                
                print(error)
                return false
            }
            
        }
        
        
        return false
        
    }
    
    //MARK:- Delete file ------
    
    class func deleteFile(name:String) -> Bool{
        
        
        let manager = FileManager.default
        
        let url = MyFileManager.fetchBaseURL()
        
        if   let filePath = url?.appendingPathComponent(name).appendingPathComponent(name){
            
            print("Base url path - \(String(describing: url))")
            do {
                
                try manager.removeItem(atPath: filePath.path)
                return true
            }
            catch{
                
                print(error)
                return false
            }
            
        }
        
        
        return false
        
    }
    
}
