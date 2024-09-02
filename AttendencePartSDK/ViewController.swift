//
//  ViewController.swift
//  AttendencePartSDK
//
//  Created by sang on 1/9/24.
//

import UIKit

class ViewController: UIViewController, TextClassificationelegate {
    func canextractdata(extracttext: String, xcordinated: String) {
        print(extracttext)
      
        let timedataextractor = FirstTimeManagement(extracttext: extracttext, xcordinated: xcordinated)
        let finaltimelist = timedataextractor.processTime()
        print("finaltimelist \(finaltimelist)")
       
         
          /*
           let dataextractor = SecondDateManagement(extracttext: extracttext, xcordinated: xcordinated)
           let finaldatelist = dataextractor.processDate()
         print("finaldatelist \(finaldatelist)")
           */
          
         
    }
    
    func cannotgetdata() {
        print("VVVVVVV")
    }
    
    var datalist: [String: [String]] = [:]
    let textClassifier = TextClassification()
    let datamanagement = DataManagement()
    let timedatamanagement = TimeDataManagement()
    let timecheUnderContraction = TimecheUnderContraction()
    var maindata: [(key: String, value: [String])] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        textClassifier.delegate = self
    }
    func arif(){
        
    }
    @IBAction func extract(_ sender: UIButton, forEvent event: UIEvent) {
        if let image = UIImage(named: "2"),
           let cgImage = image.cgImage {
           textClassifier.recognizeText(from: cgImage);
        } else {
            print("Image not found")
        }
    }
    
}

/*
 if let image = UIImage(named: "realimage_reed"),
    let cgImage = image.cgImage {
     textClassifier.recognizeText(from: cgImage);
 } else {
     print("Image not found")
 }
 */
