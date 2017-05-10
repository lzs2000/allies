//
//  MyCircle.swift
//  allies
//
//  Created by 刘璐璐 on 2017/4/25.
//  Copyright © 2017年 温星. All rights reserved.
//

import UIKit
//import ObjectMapper
import HandyJSON


struct MyCircle: HandyJSON {
    
    var community_avator_url: String  = ""
    var  community_name:String  = ""
    var promotion_count: Int = 0
    var member_count: Int = 0
    var status: String = ""
    var community_uid:String  = ""
    
}


struct MyCircleData: HandyJSON {
    
    var my_created_community: [MyCircle]  = []
    var  my_participated_community:[MyCircle]  = []
    
   }

struct ActivityList: HandyJSON {
    
    var code: Int = 0
    var data: MyCircleData = MyCircleData()
    
    
}
