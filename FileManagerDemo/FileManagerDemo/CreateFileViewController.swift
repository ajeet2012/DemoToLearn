//
//  CreateFileViewController.swift
//  FileManagerDemo
//
//  Created by Ajeet Sharma on 01/10/21.
//

import UIKit

class CreateFileViewController: UIViewController {

    //MARK:- UI object declarations ----
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var textViewFileData: UITextView!
    @IBOutlet weak var fileTitleLabel: UILabel!
    
    //MARK:- Data and flag declarations ---
    
    var isNewFileCreate:Bool = false
    var fileNameStr:String = ""
    
    //MARK:- UIViewcontroller lifecycle methods ----
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textViewFileData.layer.cornerRadius = 5.0
        textViewFileData.layer.borderWidth = 1.0
        
        textViewFileData.layer.borderColor = UIColor.black.cgColor

        if self.isNewFileCreate{
        
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
                self.showAlertPopupFileName()
            }
            
            
        }
        else{
            
            self.infoLabel.text = "Edit text in file"
            self.fileTitleLabel.text = "\(fileNameStr).txt"
            self.textViewFileData.text = MyFileManager.readFile(name: fileNameStr)
            
        }
        
    }
    
    //MARK:- Button action methods -----
    
    
    @IBAction func saveButtonAction(_ sender: Any) {
        
        self.createFile()
    }
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    //MARK:- UIAlertController -------
    
    func showAlertPopupFileName(){
        
        
        let alert = UIAlertController(title: "File Name?", message: "Enter file name", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            
            textField.placeholder = "Enter file name"
        }
        
        let alertActionDone = UIAlertAction(title: "Done", style: .default) { (action) in
            
            let textField = alert.textFields![0] as UITextField

            self.checkFileExist(fileName: textField.text!)
            
        }
        
        let alertActionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
            
            self.dismiss(animated: true, completion: nil)
            
        }
        
        
        
        
        alert.addAction(alertActionDone)
        alert.addAction(alertActionCancel)
        
        self.present(alert, animated: true, completion: nil)
        
        

        
    }
    
    //MARK:- File manager operations ----
    
    
    
    func checkFileExist(fileName:String){
        
        if MyFileManager.isFileExist(name: fileName){
            
            self.showAlertWithMessageWithHandler(msg: "This file name file is already used") {
                
            
                self.showAlertPopupFileName()
                
            }

            
        }
        else{
            
            self.fileNameStr = fileName
            
            self.fileTitleLabel.text = "\(fileName).txt"
           
        }
        
    }
    
    func createFile(){
        
        
        if MyFileManager.createFile(name: fileNameStr, data: textViewFileData.text.data(using: .utf8)!){
            
         
            self.showAlertWithMessageWithHandler(msg: "File created Successfully") {
                
                self.dismiss(animated: true, completion: nil)
                
            }
            
        }
        else{
            
            self.showAlertWithMessage(msg: "Error - File is not created")
            
        }
        
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
