//
//  ActivityCenterCell.swift
//  allies
//
//  Created by 刘璐璐 on 2017/4/14.
//  Copyright © 2017年 温星. All rights reserved.
//

import UIKit

class ActivityCenterCell: UITableViewCell {
static let Identifier = "ActivityCenterCell"
    
    
    @IBOutlet weak var signUpCountL: UILabel!
    @IBOutlet weak var browseCountL: UILabel!
    @IBOutlet weak var activityImg: UIImageView!
    @IBOutlet weak var activityTimeL: UILabel!
    @IBOutlet weak var activityNameL: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
    }
    
    
    func configureWithMyActivity(activity:ActivityCenter) {
       signUpCountL.text = " 报名数: " + "\(activity.signUpCount) "
        browseCountL.text = " 浏览量: " + "\(activity.browseCount) "
        activityImg.image = UIImage(named: activity.activityImg)
        activityNameL.text = activity.activityName
        activityTimeL.text = "活动时间: " + "\(activity.activityTime)"
        
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
