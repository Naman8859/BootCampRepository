//
//  ForgotViewController.swift
//  BootCampProjectOne
//
//  Created by Apple System 21 on 06/07/26.
//

import UIKit

class ForgotViewController: UIViewController {

    @IBOutlet weak var topViewImage: UIImageView!
    @IBOutlet weak var forgotLabel: UILabel!
    @IBOutlet weak var sendLinkLabel: UILabel!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var sendLink: UIButton!
    @IBOutlet weak var backToLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        topViewImage.image = UIImage(named: "HeaderViewBlue")
        forgotLabel.text = "Fogot password"
        forgotLabel.font = UIFont.systemFont(ofSize: 23, weight: .semibold)
        forgotLabel.textColor = UIColor(hexString: "#FFFFFF")
        
        sendLinkLabel.text = "We will send a link on your e-mail to \nreset the password."
        sendLinkLabel.numberOfLines = 2
        sendLink.setTitle("Send link", for: .normal)
        sendLinkLabel.textColor = UIColor(hexString: "#FFFFFF")
        sendLinkLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        emailText.placeholder = "Enter your e-mail address"
        emailText.layer.cornerRadius = 10
        emailText.layer.borderWidth = 1
        emailText.layer.borderColor = UIColor(hexString: "#E5E6E8")?.cgColor
        emailText.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        emailText.setLeftPaddingPoints(10)
        
        sendLink.layer.cornerRadius = 10
        sendLink.layer.backgroundColor = UIColor(hexString: "#006AF9")?.cgColor
        sendLink.setTitleColor(UIColor(hexString: "#FFFFFF"), for: .normal)
        sendLink.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        backToLabel.text = "Back to"
        backToLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
    }

    @IBAction func sendLinkButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                if let tabVC = storyBoard.instantiateViewController(withIdentifier: "SelectionViewController") as? SelectionViewController {
                    self.navigationController?.pushViewController(tabVC, animated: true)
                   
                }
    }
    @IBAction func loginButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
