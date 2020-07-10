//
//  ViewController.swift
//  Bin2Dec
//
//  Created by James Tapping on 08/07/2020.
//  Copyright © 2020 James Tapping. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var binaryInput: UITextField!
    @IBOutlet weak var result: UILabel!
    
    @IBAction func press(_ sender: UIButton) {
        
        //Animate the button
        
        UIButton.animate(withDuration: 0.2,
        animations: {
        sender.transform = CGAffineTransform(scaleX: 0.975, y: 0.96)
        },
        completion: { finish in
        UIButton.animate(withDuration: 0.2, animations: {
        sender.transform = CGAffineTransform.identity
        })
        })
        
        let binaryAsString: String = binaryInput.text!
       
        // Check if more than 8 characters or 0 characters and isn't Binary number
        
        if binaryAsString.count > 8 || binaryAsString.count == 0 || !isBinary(binaryNumber: binaryAsString){
            
          // Update the UI
            
            DispatchQueue.main.async {
                self.binaryInput.text = ""
                self.result.text="0"
            }
            
            return
        }
        
        // Update the UI
        
        result.text = bin2dec(binary: binaryAsString)
        binaryInput.text = ""
            
}

func bin2dec(binary: String) -> String {
    
    let decimal = Int(binary, radix: 2)!
    let decimalResultAsString = String(decimal)
    
    return decimalResultAsString
    
    }
    
func isBinary(binaryNumber: String) -> Bool {
        
    let range = NSRange(location: 0, length: binaryNumber.utf16.count)
    let regex = try! NSRegularExpression(pattern: "^[01]+$")
    let isItBinary =  regex.firstMatch(in: binaryNumber, options: [], range: range) != nil
        
    return isItBinary
    }
    
}

