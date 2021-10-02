//
//  UniversitiesViewController.swift
//  RestApiDemo
//
//  Created by Ajeet Sharma on 02/10/21.
//

import UIKit

class UniversitiesViewController: UIViewController {

    
    @IBOutlet weak var parseButton: UIButton!
    @IBOutlet weak var responseTextView: UITextView!
    
    var responseData:Data?
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.parseButton.isHidden = true
        self.callGetApi()
        

        
    }
    
    
    func callGetApi(){
        
        ApiCallManager.fetchUniversityListOfIndia { (strResponse, data) in
            
            DispatchQueue.main.async {
                self.parseButton.isHidden = false
                self.responseTextView.text = strResponse

            }

            self.responseData = data
            
            
        } failureHandler: { (error) in
            
            print("Error -\(error)")
            
        } somethingWentWrong: {
            
            print("Something went wrong")
            
        }
        
    }

    @IBAction func backButtonAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func parseAndDisplayAction(_ sender: Any) {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc:ParseUniversitiesViewController = mainStoryboard.instantiateViewController(identifier: "ParseUniversitiesViewController")
        vc.responseData = self.responseData
        
        self.navigationController?.pushViewController(vc, animated: true)
        

        
        
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
