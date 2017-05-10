//
//  MyCricleData.swift
//  allies
//
//  Created by 刘璐璐 on 2017/4/11.
//  Copyright © 2017年 温星. All rights reserved.
//

import Foundation

//MARK: - Equtable Protocol implementation
func ==(lhs: MyCircle, rhs: MyCircle) -> Bool {
    return (lhs.circleImg == rhs.circleImg
        && lhs.circleMe == rhs.circleMe && lhs.circleName == rhs.circleName && lhs.activeCount == rhs.activeCount && lhs.isActiveOrN == rhs.isActiveOrN)
}


struct MyCircle:Equatable {
    let  circleImg: String
    let circleName: String
    let  circleMe: NSNumber
    let activeCount: NSNumber
    let isActiveOrN: Bool
    
    
    
}
