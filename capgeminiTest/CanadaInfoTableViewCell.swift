//
//  canadaInfoTableViewCell.swift
//  capgeminiTest
//
//  Created by Jigar Thakkar on 27/2/18.
//  Copyright © 2018 Jigar Thakkar. All rights reserved.
//

import UIKit

class CanadaInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var imagefromHref: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
