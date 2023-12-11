//
//  CrashViewController.swift
//  FirebaseUIKit
//
//  Created by Rahul Adepu on 12/5/23.
//

import UIKit
import FirebaseCore
import FirebaseDatabase

class CrashViewController: UIViewController {
    
    var refDatabase: DatabaseReference?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        refDatabase = Database.database().reference()
    }
    
    
    @IBAction func crashButton(_ sender: Any) {
        fatalError("Crash Occured")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func saveUser(_ sender: Any) {
        refDatabase?.child("Root").childByAutoId().setValue(["data":"Test Data"])
    }
    
}
