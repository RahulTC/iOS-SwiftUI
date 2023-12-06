//
//  ViewController.swift
//  FirebaseUIKit
//
//  Created by Rahul Adepu on 12/4/23.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseAuthUI
import FirebaseEmailAuthUI
import FirebaseGoogleAuthUI

class ViewController: UIViewController, FUIAuthDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SignUpWithEmail(_ sender: Any) {
        let actionCodeSettings = ActionCodeSettings()
        actionCodeSettings.url = URL(string: "https://example.appspot.com")
        actionCodeSettings.handleCodeInApp = true
        actionCodeSettings.setAndroidPackageName("com.firebase.example", installIfNotAvailable: false, minimumVersion: "12")

        let authUI = FUIAuth.defaultAuthUI()!
        // You need to adopt a FUIAuthDelegate protocol to receive callback
        authUI.delegate = self
        
        let emailAuthProvider = FUIEmailAuth(authAuthUI: authUI,
                                    signInMethod: EmailLinkAuthSignInMethod,
                                    forceSameDevice: false,
                                    allowNewEmailAccounts: true,
                                    actionCodeSetting: actionCodeSettings)
        authUI.providers = [emailAuthProvider]
        
        let authViewController = authUI.authViewController()
        self.present(authViewController, animated: true)
    }
    
    @IBAction func SignInWithGoogle(_ sender: Any) {
        let authUI = FUIAuth.defaultAuthUI()!
        authUI.delegate = self
        
        let googleAuthProvider = FUIGoogleAuth(authUI: authUI)
        authUI.providers = [
            googleAuthProvider
        ]
        
        let authViewController = authUI.authViewController()
        self.present(authViewController, animated: true)
    
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        print(user ?? "No User Found")
        
        if error == nil {
            //Handle Login
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let crashVC = storyboard.instantiateViewController(withIdentifier: "CrashViewControllerID") as! CrashViewController
            self.navigationController?.pushViewController(crashVC, animated: true)
        }else {
            print(error?.localizedDescription ?? "Unknown Error occurred")
        }
    }
    
}

