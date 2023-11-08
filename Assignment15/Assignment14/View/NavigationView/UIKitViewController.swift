//
//  UIKitViewController.swift
//  Assignment15
//
//  Created by Rahul Adepu on 11/7/23.
//

import UIKit
import SwiftUI

class UIKitViewController: UIViewController {

    @IBOutlet weak var UIKitViewLabel: UILabel!
    @IBOutlet weak var dataFromSwiftUILabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func UIKitToSecondViewButton(_ sender: Any) {
            let viewController = UIHostingController(rootView: SecondSwiftUIView())
            self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func backButton(_ sender: Any) {
        
    }

}
