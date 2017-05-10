//
//  LoginModel.swift
//  allies
//
//  Created by 温星 on 17/3/31.
//  Copyright © 2017年 温星. All rights reserved.
//

import Foundation
import HandyJSON

struct UserData:HandyJSON{
    var user_info: UserInfo?
}


struct UserInfo:HandyJSON{
    var login_name: String?
    var user_uid: Int?
}


struct LoginModel: HandyJSON {
    var code: Int?
    var error_msg: String?
    var data: UserData?
    var request_id: String?
    
}

struct VerifyCode: HandyJSON {
    var code: String?
    var error_msg: String?
    var data: Dictionary<String, String>?
    var request_id: String?
}







