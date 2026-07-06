//
//  ViewController.swift
//  BootCampProjectOne
//
//  Created by Arpit 24 on 01/07/26.
//

import UIKit

class LogInViewController: UIViewController {
    
    
    @IBOutlet weak var lineTwo: UILabel!
    @IBOutlet weak var lineOne: UILabel!
    @IBOutlet weak var dontHaveAcc: UILabel!
    @IBOutlet weak var orContinue: UILabel!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var loginWithMobNum: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var eyeButton: UIButton!
    @IBOutlet weak var forgotPassword: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        TOP IMAGE VIEW
        topImageView.image = UIImage(named: "HeaderViewBlue")
        signInLabel.text = "Sign in to your \naccount"
        signInLabel.numberOfLines = 2
        signInLabel.textColor = UIColor(hexString: "#ffffff")
        signInLabel.font = UIFont.systemFont(ofSize: 23, weight: .semibold)
        
//        EMAIL TEXT FIELD
        emailField.layer.borderWidth = 1
        emailField.layer.borderColor = UIColor(hexString: "#E5E6E8")?.cgColor
        emailField.layer.cornerRadius = 10
        emailField.placeholder = "Email address"
        emailField.setLeftPaddingPoints(15)
        
//        PASSWORD TEXT FIELD
        passwordField.layer.borderWidth = 1
        passwordField.layer.borderColor = UIColor(hexString: "#E5E6E8")?.cgColor
        passwordField.layer.borderWidth = 1
        passwordField.layer.cornerRadius = 10
        passwordField.placeholder = "Password"
        passwordField.setLeftPaddingPoints(15)
        passwordField.isSecureTextEntry = true
        
//        FORGOT PASSWORD BUTTON
        forgotPassword.setTitle("Forgot password?", for: .normal)
        forgotPassword.setTitleColor(UIColor(hexString: "#4896FF"), for: .normal)
        
//        LOGIN BUTTON
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = UIColor(hexString: "#006AF9")
        loginButton.setTitleColor(UIColor(hexString: "#FFFFFF"), for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        loginButton.layer.cornerRadius = 10
        
//        LOGIN WITH MOBILE NUMBER BUTTON
        loginWithMobNum.setTitle("Login with mobile number", for: .normal)
        loginWithMobNum.setTitleColor(UIColor(hexString: "#4896FF"), for: .normal)
        
//        CONTINUE TEXT
        orContinue.text = "Or\n \ncontinue with"
        orContinue.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        orContinue.textColor = UIColor(hexString: "#4D5561")
        
//        LINE ONE
        lineOne.layer.backgroundColor = UIColor(hexString: "#E5E6E8")?.cgColor
        
//        LINE TWO
        lineTwo.layer.backgroundColor = UIColor(hexString: "#E5E6E8")?.cgColor
        
        
//        GOOGLE BUTTON
        googleButton.setImage(UIImage(named: "googleIcon"), for: .normal)
        
//        FACEBOOK BUTTON
        facebookButton.setImage(UIImage(named: "fbIcon"), for: .normal)
        
//        APPLE BUTTON
        appleButton.setImage(UIImage(named: "appleIcon"), for: .normal)
//        
//        DONT HAVE AN ACCOUNT TEXT
        dontHaveAcc.text = "Dont have an account?"
        dontHaveAcc.textColor = UIColor(hexString: "#4D5561")
//
//        SIGNUP BUTTON
        signUpButton.setTitle("Signup", for: .normal)
        signUpButton.setTitleColor(UIColor(hexString: "#4896FF"), for: .normal)
       
        // Do any additional setup after loading the view.
    }
    var isPassword:Bool = true
    @IBAction func loginWithMobNum(_ sender: Any) {
    }
    @IBAction func loginButton(_ sender: Any) {
    }
    @IBAction func forgotPassword(_ sender: Any) {
    }
    @IBAction func eyeButton(_ sender: Any) {
        
        if(isPassword){
            isPassword = false
            eyeButton.setImage(UIImage(named: "eyeIcon"), for: .normal)
            passwordField.isSecureTextEntry = false
           
            
        }else{
            isPassword = true
            passwordField.isSecureTextEntry = true
            eyeButton.setImage(UIImage(named: "eyeCrossIcon"), for: .normal)
        }
       
        
    }
    @IBAction func forgotButton(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let createAccVC = storyBoard.instantiateViewController(withIdentifier: "ForgotViewController") as? ForgotViewController {
            navigationController?.pushViewController(createAccVC, animated: true)
        }
    }
    @IBAction func googleButton(_ sender: Any) {
    }
    @IBAction func facebookButton(_ sender: Any) {
    }
    @IBAction func appleButton(_ sender: Any) {
    }
    @IBAction func signUpButton(_ sender: Any) {
    }
}
