//
//  ParseUniversitiesViewController.swift
//  RestApiDemo
//
//  Created by Ajeet Sharma on 02/10/21.
//

import UIKit

class UniversitiesCell:UITableViewCell{
    
    
    @IBOutlet weak var universityNameLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var urlButton: UIButton!
    
}

class ParseUniversitiesViewController: UIViewController {

    
    @IBOutlet weak var tableviewUniversitesList: UITableView!
    
    var responseJsonStr:String?
    var responseData:Data?
    
    
    var universityList:Welcome = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableviewUniversitesList.isHidden = true

        self.parseUsingDecoder()
        
    }
    func parseUsingDecoder(){
        
        let decoder = JSONDecoder()
        
        if let data = responseData{
            
            do {
                
                
                let list = try decoder.decode(Welcome.self, from: data)
                
                self.universityList = list
                
                print("response json - \(self.universityList)")
                
                
                if self.universityList.count == 0 {
                    
                    self.tableviewUniversitesList.isHidden = true
                    
                    self.showAlertWithMessageWithHandler(msg: "Data is not available") {
                        
                        self.navigationController?.popViewController(animated: true)
                        
                    }
                    
                }
                else{
                
                    self.tableviewUniversitesList.isHidden = false
                    self.tableviewUniversitesList.reloadData()
                    
                }
                
                
                
            }
            catch{
                
                self.showAlertWithMessageWithHandler(msg: error.localizedDescription) {
                    
                    self.navigationController?.popViewController(animated: true)
                    
                }
            }
        }
        else{
            
            
            self.showAlertWithMessageWithHandler(msg: "Data is not available") {
                
                self.navigationController?.popViewController(animated: true)
                
            }
            
            
        }
        
        
        
    }
    
    @IBAction func backButtonAction(_ sender: Any) {

        self.navigationController?.popViewController(animated: true)

        
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

extension ParseUniversitiesViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        self.universityList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UniversitiesCell = (tableView.dequeueReusableCell(withIdentifier:"UniversitiesCell") as! UniversitiesCell?)!
        
       
        let obj = self.universityList[indexPath.row]
        
        cell.universityNameLabel.text = obj.name
        cell.countryLabel.text = "Country: \(obj.country)".capitalized
        cell.stateLabel.text = "State: \(obj.stateProvince?.capitalized ?? "-")"
        
        if let webPage = obj.webPages?[0]{
        
            print("Web page - \(webPage)")
            cell.urlButton.setTitle(webPage, for: .normal)
            
        }
        
        
        
        return cell
        
    }
    
    
    
}
