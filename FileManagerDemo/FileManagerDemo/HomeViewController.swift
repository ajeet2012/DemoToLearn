//
//  HomeViewController.swift
//  FileManagerDemo
//
//  Created by Ajeet Sharma on 01/10/21.
//

import UIKit

class FileListTableViewCell:UITableViewCell{
    
    
    @IBOutlet weak var fileTitleLabel: UILabel!
    
    
    
}

class HomeViewController: UIViewController {

    @IBOutlet weak var tableViewFileList: UITableView!
    
    var fileListArray:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        

       
        
        MyFileManager.createDirectory()
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        self.fileListArray =  MyFileManager.fileListInFolder()
        
        if self.fileListArray.count == 0 {
            
            self.tableViewFileList.isHidden = true
            
        }
        else{
            
            self.tableViewFileList.isHidden = false
            
        }
        self.tableViewFileList.reloadData()
        
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
    
        
       
        
        self.showCreateFilePage(isCreateNew: true, fileName: "")
    }
    
    //MARK:- Navigate new screen ---------
    
    func showCreateFilePage(isCreateNew:Bool = false, fileName:String = ""){
        
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
       
        let vc:CreateFileViewController = mainStoryboard.instantiateViewController(identifier: "CreateFileViewController")
        
        vc.modalPresentationStyle = .fullScreen
        vc.isNewFileCreate = isCreateNew
        vc.fileNameStr = fileName
        self.present(vc, animated: true, completion: nil)
        
        
    }
    
    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
      
    }
    
    */

}

extension HomeViewController:UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    
        return fileListArray.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell:FileListTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "FileListTableViewCell") as! FileListTableViewCell?)!

        cell.fileTitleLabel.text = fileListArray[indexPath.row]

        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let fileName = (self.fileListArray[indexPath.row]).replacingOccurrences(of: ".txt", with: "")
        self.showCreateFilePage(isCreateNew: false, fileName: fileName.lowercased())
        
    }
    
}
