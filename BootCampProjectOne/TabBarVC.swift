//
//  TabBarVC.swift
//  BootCampProjectOne
//
//  Created by Arpit 24 on 01/07/26.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        if let createAcc = storyBoard.instantiateViewController(withIdentifier: "HomeModalViewController") as? HomeModalViewController{
            createAcc.modalPresentationStyle = .custom
            self.present(createAcc, animated: true)
        }
    }


}
