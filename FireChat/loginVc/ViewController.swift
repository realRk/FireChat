//
//  ViewController.swift
//  FireChat
//
//  Created by Rk on 14/05/18.
//  Copyright © 2018 Rk. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var onLogInClick: UIButton!
    @IBAction func onLOginBtnClicked(_ sender: UIButton) {
        
        
        Auth.auth().signIn(withEmail: username.text!, password: password.text!) { (User, errLogIn) in
            
            
//            guard errLogIn != nil else {
//
//                let sccsAlert = UIAlertController(title: "Failed", message: "check username or password", preferredStyle: .alert)
//                let actnAlert = UIAlertAction(title: "Okay", style: .default, handler: { (alertaction) in
//                    self.performSegue(withIdentifier: "toDetails", sender: nil)})
//                sccsAlert.addAction(actnAlert)
//                self.present(sccsAlert, animated: true, completion: nil)
//                return
//            }
            
            if errLogIn != nil{
                print("failed")
                let sccsAlert = UIAlertController(title: "Failed", message: "check username or password", preferredStyle: .alert)
                let actnAlert = UIAlertAction(title: "Okay", style: .default, handler: { (alertaction) in
                print("Failed")
                })
                sccsAlert.addAction(actnAlert)
                self.present(sccsAlert, animated: true, completion: nil)

                return
            }
            
            print("Success")
            
            let sccsAlert = UIAlertController(title: "Success", message: "Account Found", preferredStyle: .alert)
            let actnAlert = UIAlertAction(title: "Okay", style: .default, handler: { (alertaction) in
                self.performSegue(withIdentifier: "toDetails", sender: nil)
                
            })
            sccsAlert.addAction(actnAlert)
            self.present(sccsAlert, animated: true, completion: nil)
        }
        
    }
    
}

