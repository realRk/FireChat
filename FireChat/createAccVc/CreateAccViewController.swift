//
//  CreateAccViewController.swift
//  FireChat
//
//  Created by Rk on 14/05/18.
//  Copyright © 2018 Rk. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class CreateAccViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var passwordOne: UITextField!
    @IBOutlet weak var passwordTwo: UITextField!
    @IBOutlet weak var Email: UITextField!
    var refdb:DatabaseReference!

    override func viewDidLoad() {
        
        
    
        
        
        super.viewDidLoad()
        self.refdb = Database.database().reference(fromURL: "https://firechat-755da.firebaseio.com/")
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onRegister(_ sender: UIButton) {
        print(12345678)
        Auth.auth().createUser(withEmail: Email.text!, password: passwordTwo.text!) { ( User, error) in
            let ref:DatabaseReference = Database.database().reference(fromURL: "https://firechat-755da.firebaseio.com/")
            let childNode = ref.child("Users").child((User?.uid)!)
            let values = ["Username":self.username.text!,"Password":self.passwordTwo.text!,"Email":self.Email.text!]
            childNode.updateChildValues(values, withCompletionBlock: { (err, ref) in
                if err != nil{
                    print("error occured")
                }
                print("successful")
            })
            }
        performSegue(withIdentifier: "fromCrAccToLogPg", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
