//
//  CrashViewController.swift
//  FirebaseUIKit
//
//  Created by Rahul Adepu on 12/5/23.
//

import UIKit

class CrashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}
