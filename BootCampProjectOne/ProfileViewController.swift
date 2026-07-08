//
//  ProfileViewController.swift
//  BootCampProjectOne
//
//  Created by Arpit 24 on 01/07/26.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
         profileData.count
        return profileImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableDataTableViewCell")as? TableDataTableViewCell else{
            return UITableViewCell()
        }
        var item = profileData[indexPath.row]
        var image = profileImage[indexPath.row]
        cell.dataLabel.text = item
        cell.dataImg.image = UIImage(named: image)
        return cell
    }
    
    

    @IBOutlet weak var yellowViewBtn: UIButton!
    @IBOutlet weak var headerBtn: UIButton!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var headerImg: UIImageView!
    @IBOutlet weak var validLabel: UILabel!
    @IBOutlet weak var saveLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var barberLabel: UILabel!
    @IBOutlet weak var crownImg: UIImageView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var profileData = ["All Quote",
                           "Education",
                           "My order",
                           "Discount & offer",
                           "Wishlist",
                           "My earnings",
                           "My course",
                           "My Target",
                           "My Wallet",
                           "Manage address",
                           "Manage saved card",
                           "Change password",
                           "FAQ’s",
                           "Help & support",
                           "Refer & earn",
                           "About us",
                           "Terms & condition",
                           "Privacy policy",
                           "Cancellation policy",
                           "Subscription History",
                           "Logout"]
    
        var profileImage = ["AllRFP", "course", "orders", "Discount", "Wishlist", "MyEarning", "course", "target", "wallet", "locationBlue", "locationBlue", "changePassword", "faq", "help", "refer", "about", "term", "privacy", "term", "privacy", "logout"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerBtn.setImage(UIImage(named: "FrwdBtn"), for: .normal)
        
        yellowViewBtn.setImage(UIImage(named: "FrwdBtn"), for: .normal)
        
        
        
        headerImg.image = UIImage(named: "HeaderViewBlue")
        profileImg.image = UIImage(named: "ImageTwoCollectionView")
        profileImg.layer.cornerRadius = profileImg.bounds.height/2
        profileImg.contentMode = .scaleToFill
        barberLabel.text = "The barber shop"
        barberLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        barberLabel.textColor = UIColor(hexString: "#FFFFFF")
        emailLabel.text = "barber_shop@gmail.com"
        emailLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        emailLabel.textColor = UIColor(hexString: "#FFFFFF")
        
        yellowView.layer.backgroundColor = UIColor(hexString: "#FDD018")?.cgColor
        
        crownImg.image = UIImage(named: "Crown")
        crownImg.layer.cornerRadius = crownImg.bounds.height/2
        crownImg.contentMode = .scaleToFill
        saveLabel.text = "Saved $300"
        saveLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        saveLabel.textColor = UIColor(hexString: "#000D1E")
        validLabel.text = "Valid till 1st Apr 2024"
        validLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        validLabel.textColor = UIColor(hexString: "#000D1E")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableDataTableViewCell", bundle: nil), forCellReuseIdentifier: "TableDataTableViewCell")
    }
    

   

}
