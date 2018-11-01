//
//  ViewController.swift
//  STEM_Society_App
//
//  Created by Zach Boyle on 10/31/18.
//  Copyright © 2018 Zach Boyle. All rights reserved.
//

import LocalAuthentication
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        authenticateUser()
    }


    func authenticateUser() {
        //Get the local authentication context
        //this is creating a constant of the type LAContext
        let context : LAContext = LAContext()
        
        //Declare a NSError variable
        var error: NSError?
        
        //Set the reason string that will appear on the authentication alert
        let reasonString = "Authentication needed to unlock the secret..."
        
        if(context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error)) {
            
            [context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: reasonString, reply: { (success: Bool, evalPolicyError: Error?) -> Void in
                
                if success {
                    self.label.textColor = UIColor.blue
                }
                else {
                    print("Authentication Failed")
                }
                
                
            })]
            
        }
        else {
            print("TouchId is not available")
        }
        
    }
}

