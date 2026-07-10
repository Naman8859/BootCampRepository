//
//  HomeModalViewController.swift
//  BootCampProjectOne
//
//  Created by Arpit 24 on 01/07/26.
//

import UIKit

class HomeModalViewController: UIViewController {

    @IBOutlet weak var okTap: UIButton!
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var congratulationsLabel: UILabel!
    @IBOutlet weak var congratsImg: UIImageView!
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet var superView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        superView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        congratsImg.image = UIImage(named: "HomeModalImage")
        whiteView.layer.cornerRadius = 20
        whiteView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        whiteView.layer.masksToBounds = true
        congratulationsLabel.text = "Congratulations"
        creditLabel.text = "You have credit $100 pints in your wallet"
        creditLabel.textAlignment = .center
        okTap.setTitle("OK", for: .normal)
        okTap.setTitleColor(UIColor.white, for: .normal)
        okTap.layer.backgroundColor = UIColor.systemBlue.cgColor
        
        
    }
    
    @IBAction func okTap(_ sender: Any) {
        self.dismiss(animated: false)
    }


}
