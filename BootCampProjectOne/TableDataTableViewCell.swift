//
//  TableDataTableViewCell.swift
//  BootCampProjectOne
//
//  Created by Apple System 21 on 08/07/26.
//

import UIKit

class TableDataTableViewCell: UITableViewCell {

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var dataImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
