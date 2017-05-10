//
//  MyUnionCircleCell.swift
//  allies
//
//  Created by 刘璐璐 on 2017/4/11.
//  Copyright © 2017年 温星. All rights reserved.
//

import UIKit

class MyUnionCircleCell: UITableViewCell {
   
    static let Identifier = "MyUnionCircleCell"
    
    @IBOutlet weak var activeLabel: UILabel!
    @IBOutlet weak var circleMember: UILabel!
    @IBOutlet weak var circleName: UILabel!
    @IBOutlet weak var circleImg: UIImageView!
    
    func configureWithMyCircle(mycircle:MyCircle) {
       circleImg.image = UIImage(named: mycircle.circleImg)
        circleName.text = mycircle.circleName
        circleMember.text = "成员:\(mycircle.circleMe) 活动:\(mycircle.activeCount)"
        if mycircle.isActiveOrN {
            activeLabel.text = "活动中"
        }
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
