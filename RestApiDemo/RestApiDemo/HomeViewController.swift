//
//  HomeViewController.swift
//  RestApiDemo
//
//  Created by Ajeet Sharma on 02/10/21.
//

import UIKit

class ApiCallCellList:UITableViewCell{
    
    
    @IBOutlet weak var listTitleLabel: UILabel!
    
}
class HomeViewController: UIViewController {

    //MARK:- UI object declaration ---
    
    @IBOutlet weak var tableViewApiCall: UITableView!
    
    //MARK:- Data object declaration ---
    
    private var apiCallListArray = ["GET Api call","POST Api call","Download audio file"]
    
    
    //MARK:- UIViewcontroller lifecycle ---
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
//MARK:- Tableview delegate and datasource

extension HomeViewController:UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return apiCallListArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ApiCallCellList = tableView.dequeueReusableCell(withIdentifier: "ApiCallCellList") as! ApiCallCellList
        
        cell.listTitleLabel.text = apiCallListArray[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
        
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = mainStoryboard.instantiateViewController(identifier: "UniversitiesViewController")
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        }
        if indexPath.row == 2 {
            
        
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc:DownloadAudioFileViewController = mainStoryboard.instantiateViewController(identifier: "DownloadAudioFileViewController")
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        }
        

    }
    
}
