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
        var finalResultFromSDK: [String] = []

        let timedataextractor = FirstTimeManagement(extracttext: extracttext, xcordinated: xcordinated)
        let finaltimelist = timedataextractor.processTime()
        print("finaltimelist \(finaltimelist)")
        print("finaldatelist \(finaltimelist.count)")
       
    
           let dataextractor = SecondDateManagement(extracttext: extracttext, xcordinated: xcordinated)
           let finaldatelist = dataextractor.processDate()
         print("finaldatelist \(finaldatelist)")
        print("finaldatelist \(finaldatelist.count)")
         
          
        if finaltimelist.count == finaldatelist.count
        {
            
            let mergedResult = finalTask.mergeMaps(finaltimelist: finaltimelist, datelist:finaldatelist )
            let stringArray = finalTask.convertToStringArray(from: mergedResult)
            let finalResultList = finalTask.determinePercentages(finalResultWithPercentages: stringArray)
            print("finalResultList   \(finalResultList)")
            
        }
        else{
            finalResultFromSDK.removeAll()
            finalResultFromSDK.append("Please take image again")
        }
    }
    
    func cannotgetdata() {
        print("VVVVVVV")
    }
    let finalTask = FinalTask()
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
        if let image = UIImage(named: "5"),
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
