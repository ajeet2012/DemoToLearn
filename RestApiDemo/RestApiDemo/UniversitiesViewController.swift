//
//  UniversitiesViewController.swift
//  RestApiDemo
//
//  Created by Ajeet Sharma on 02/10/21.
//

import UIKit

class UniversitiesViewController: UIViewController {

    
    @IBOutlet weak var responseTextView: UITextView!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.callGetApi()
        

        
    }
    
    
    func callGetApi(){
        
        ApiCallManager.fetchUniversityListOfIndia { (strResponse) in
            
            DispatchQueue.main.async {
                self.responseTextView.text = strResponse

            }
            
            
        } failureHandler: { (error) in
            
            print("Error -\(error)")
            
        } somethingWentWrong: {
            
            print("Something went wrong")
            
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
