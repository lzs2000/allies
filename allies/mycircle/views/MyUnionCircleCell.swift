//
//  MyUnionCircleCell.swift
//  allies
//
//  Created by 刘璐璐 on 2017/4/11.
//  Copyright © 2017年 温星. All rights reserved.
//

import UIKit
import Kingfisher

class MyUnionCircleCell: UITableViewCell {
   
    static let Identifier = "MyUnionCircleCell"
    
    @IBOutlet weak var activeLabel: UILabel!
    @IBOutlet weak var circleMember: UILabel!
    @IBOutlet weak var circleName: UILabel!
    @IBOutlet weak var circleImg: UIImageView!
    
    func configureWithMyCircle(mycircle:MyCircle) {
//       circleImg.image = UIImage(named: mycircle.circleImg)
        let url = URL(string: (mycircle.community_avator_url ))
//        下载过程中在图片里转菊花
        circleImg.kf.indicatorType = .activity
//        options 里设置下载完成后图片渐显效果
        circleImg.kf.setImage(with: url, placeholder: UIImage(named: "myCircle"), options: [.transition(.fade(0.2))])
        circleName.text = mycircle.community_name
        circleMember.text = "成员:\(String(describing: mycircle.member_count )) 活动:\(String(describing: mycircle.promotion_count ))"
//        if mycircle.isActiveOrN {
//            activeLabel.text = "活动中"
//        }
        
        
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
