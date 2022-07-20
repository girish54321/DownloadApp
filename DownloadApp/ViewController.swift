//
//  ViewController.swift
//  DownloadApp
//
//  Created by Girish Parate on 10/06/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func startDownload(_ sender: Any) {
        
        let fileURL : String = "https://www.clickdimensions.com/links/TestPDFfile.pdf";
        
        DispatchQueue.main.async {
            let url = URL(string: fileURL)
            let pdfData = try? Data.init(contentsOf: url!)
            let resDocPath = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!) as URL
            let pdfFileName = "\(UUID().uuidString).pdf"
            let filePath = resDocPath.appendingPathComponent(pdfFileName)
            
            // Save to File
            
            do {
                try pdfData?.write(to: filePath,options: .atomic)
                print("File Saved")
            } catch {
                print("Some Error in code")
            }
            
        }
        
    }
}

