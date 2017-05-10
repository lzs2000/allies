//
//  ActivityCenterData.swift
//  allies
//
//  Created by 刘璐璐 on 2017/4/14.
//  Copyright © 2017年 温星. All rights reserved.
//

import Foundation


//MARK: - Equtable Protocol implementation
func ==(lhs: ActivityCenter, rhs: ActivityCenter) -> Bool {
    return (lhs.activityName == rhs.activityName
        && lhs.activityTime == rhs.activityTime && lhs.browseCount == rhs.browseCount && lhs.signUpCount == rhs.signUpCount && lhs.activityImg == rhs.activityImg)
}


struct ActivityCenter:Equatable {
    let  activityName: String
    let activityTime: String
    let  browseCount: NSNumber
    let signUpCount: NSNumber
    let activityImg: String
    
    
    
}
