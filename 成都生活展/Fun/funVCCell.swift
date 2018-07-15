//
//  funVCCell.swift
//  成都生活展
//
//  Created by pu on 09/12/2017.
//  Copyright © 2017 pu. All rights reserved.
//

import UIKit

class funVCCell: UITableViewCell {

    @IBOutlet weak var spotImage: UIImageView!
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var phoneL: UILabel!
    @IBOutlet weak var addressL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
