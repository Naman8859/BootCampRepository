//
//  SelectionViewController.swift
//  BootCampProjectOne
//
//  Created by Arpit 24 on 01/07/26.
//

import UIKit

class SelectionViewController: UIViewController {

    @IBOutlet weak var individualView: UIView!
    @IBOutlet weak var businessView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var backToLabel: UILabel!
    @IBOutlet weak var proceedButton: UIButton!
    @IBOutlet weak var individualLabel: UILabel!
    @IBOutlet weak var businessLabel: UILabel!
    @IBOutlet weak var indImgView: UIImageView!
    @IBOutlet weak var busImgView: UIImageView!
    @IBOutlet weak var individualButton: UIButton!
    @IBOutlet weak var businessButton: UIButton!
    @IBOutlet weak var selectServiceLabel: UILabel!
    @IBOutlet weak var excitedLabel: UILabel!
    @IBOutlet weak var createAccLabel: UILabel!
    @IBOutlet weak var topView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        TOP VIEW
        topView.layer.backgroundColor = UIColor(hexString: "#E4EFFE")?.cgColor
        
//        CREATE ACCOUNT LABEL
        createAccLabel.text = "Create your account"
        createAccLabel.textColor = UIColor(hexString: "#000D1E")
        createAccLabel.font = UIFont.systemFont(ofSize: 23, weight: .semibold)
//        WE ARE EXCITED LABEL
        excitedLabel.text = "We are excited to have you join our community \nof trendsetters, beauty enthusiasts, and professionals"
        excitedLabel.numberOfLines = 2
        excitedLabel.textColor = UIColor(hexString: "#4D5561")
        excitedLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
//        SELECT SERVICE LABEL
        selectServiceLabel.text = "Select your service type"
        selectServiceLabel.textColor = UIColor(hexString: "#000D1E")
        selectServiceLabel.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        
//        BUSINESS VIEW
        businessView.layer.cornerRadius = 10
        businessView.layer.borderWidth = 1
        businessView.layer.borderColor = UIColor(hexString: "#A3CAFF")?.cgColor
        businessLabel.text = "Business"
        businessLabel.textColor = UIColor(hexString: "#000D1E")
        businessLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
//        INDIVIDUAL VIEW
        individualView.layer.cornerRadius = 10
        individualView.layer.borderWidth = 1
        individualView.layer.borderColor = UIColor(hexString: "#E5E6E8")?.cgColor
        individualLabel.text = "Individual"
        individualLabel.textColor = UIColor(hexString: "#B1B5BB")
        individualLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
//        PROCEED BUTTON
        proceedButton.setImage(UIImage(named: "proceed"), for: .normal)
        
//        BACK TO LOGIN
        backToLabel.text = "Back to"
        backToLabel.textColor = UIColor(hexString: "#4D5561")
        backToLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor(hexString: "004096"), for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
    }

    @IBAction func businessButton(_ sender: Any) {
        businessView.layer.cornerRadius = 20
        businessView.layer.borderWidth = 1
//        BLUE BORDER
        businessView.layer.borderColor = UIColor(hexString: "#A3CAFF")?.cgColor
//        BLUE TEXT
        businessLabel.textColor = UIColor(hexString: "#000D1E")
//        BLUE IMAGE
        busImgView.image = UIImage(named: "BusinessSelected")
        
        individualView.layer.cornerRadius = 20
        individualView.layer.borderWidth = 1
//        GRAY BORDER
        individualView.layer.borderColor = UIColor(hexString: "#E5E6E8")?.cgColor
//        GRAY TEXT
        individualLabel.textColor = UIColor(hexString: "#B1B5BB")
//        GRAY IMAGE
        indImgView.image = UIImage(named: "IndividualUnselected")
    }
    @IBAction func individualButton(_ sender: Any) {
        businessView.layer.cornerRadius = 20
        businessView.layer.borderWidth = 1
//        GRAY BORDER
        businessView.layer.borderColor = UIColor(hexString: "#E5E6E8")?.cgColor
//        GRAY TEXT
        businessLabel.textColor = UIColor(hexString: "#B1B5BB")
//        GRAY IMAGE
        busImgView.image = UIImage(named: "BussinessUnselected")
        
        individualView.layer.cornerRadius = 20
        individualView.layer.borderWidth = 1
//        BLUE BORDER
        individualView.layer.borderColor = UIColor(hexString: "#A3CAFF")?.cgColor
//        BLUE TEXT
        individualLabel.textColor = UIColor(hexString: "#000D1E")
//        BLUE IMAGE
        indImgView.image = UIImage(named: "IndividualSelected")
    }
    
    @IBAction func loginButton(_ sender: Any) {

        let  vc =  self.navigationController?.viewControllers.filter({$0 is LogInViewController}).first

        self.navigationController?.popToViewController(vc!, animated: true)

    }
}
