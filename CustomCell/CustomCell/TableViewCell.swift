//
//  TableViewCell.swift
//  CustomCell
//
//  Created by 이상협 on 2018. 3. 13..
//  Copyright © 2018년 이상협. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var AmountLabel: UILabel!
    @IBOutlet weak var ValueLabel: UILabel!
    @IBOutlet weak var ImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ImgView.contentMode = UIViewContentMode.scaleToFill
        ImgView.layer.cornerRadius = 50.0
        ImgView.layer.masksToBounds = true
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
