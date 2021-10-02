//
//  DownloadAudioFileViewController.swift
//  RestApiDemo
//
//  Created by Ajeet Sharma on 03/10/21.
//

import UIKit
import AVKit


class DownloadAudioFileViewController: UIViewController {

    let urlString = "https://s3.amazonaws.com/kargopolov/kukushka.mp3"
    
    private var audioPlayer:AVAudioPlayer?
    private var audioSession = AVAudioSession.sharedInstance()

    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var startButton: UIButton!
    
    private var isDownloadComplete:Bool = false
    
    private var dataAudio:Data?
    
    //MARK:- UIViewcontroller delegates ------
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.progressBar.progress = 0.0
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK:- UIButton Action methods -----
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func startDownloadButtonAction(_ sender: Any) {
        
//        if self.isDownloadComplete{
//
//
//            self.playSound()
//
//        }
//        else{
           
            guard let url = URL(string: self.urlString) else{

                print("This is invalid URL")
                return
            }
            
            
            let defaultSession = URLSession(configuration: .default, delegate: self, delegateQueue: .main)

            defaultSession.downloadTask(with: url).resume()
            
            
       // }
        
       
        
    }
    
    
//    func playSound(){
//
//
//
//        do{
//
//          //  print(dataAudio)
//            audioPlayer = try AVAudioPlayer(data: self.dataAudio!)
//            audioPlayer?.prepareToPlay()
//
//            audioPlayer?.numberOfLoops  = 1
//
////            do {
////
////                try audioSession.setCategory(AVAudioSession.Category.playback)
////
////            }
////            catch{
////
////                print("ERRORR =------ 1 ")
////
////            }
//
//
//            audioPlayer?.play()
//
//        }catch{
//
//
//            print("ERRORR =------ 2 \(error.localizedDescription)")
//        }
//
//
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DownloadAudioFileViewController:URLSessionDelegate, URLSessionDownloadDelegate{
    
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        guard let data = try? Data(contentsOf: location) else {
            
            print("The data could not loaded")
            return
            
        }
        print("#######   Result ########")
        
        
        print("Data \(data)")
        print("File location --- \(location)")
       // self.dataAudio = data
      //  self.isDownloadComplete = true
      //  self.startButton.setTitle("Play Audio", for: .normal)
        
        self.startButton.isHidden = true
        
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        
        self.progressBar.progress = progress
        
        let percentage:Int = Int(progress * 100)
        
        self.progressLabel.text = "\(percentage)%"

    }
    
    
   
    func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {
        
        print("Error")
    }
    
    
    
    
}
