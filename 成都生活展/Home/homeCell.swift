//
//  homeCell.swift
//  自定义cell
//
//  Created by PWB on 2017/12/2.
//  Copyright © 2017年 PWB. All rights reserved.
//

import UIKit

class homeCell: UITableViewCell {

    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var homeIntroL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
