//
//  File.swift
//  allies
//
//  Created by 温星 on 17/3/31.
//  Copyright © 2017年 温星. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

import Moya

enum ApiManager{
    case login(String, String)
    case getVerifiCode(String)
    case searchActiveList(Int, String)
    case getOneUserMember(Int)
    case obtainCommunityDetail(Int,String)
    case obtainPromotionsByCommunity(String)
    case obtainCommunityGuideByUserUidAndCommunityUid(Int,String)

}

extension DefaultsKeys {
    static let user_uid = DefaultsKey<Int?>("user_uid")
}


extension ApiManager: TargetType {
    /// The target's base `URL`.
    var baseURL: URL {
        return URL.init(string: "http://114.55.41.67:8888/")!
    }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {
        switch self {
        case .login:
            return "user/authenticate.json"
        case .getVerifiCode:
            return "user/sendCode.json"
        case .searchActiveList:
            return "community/obtainMyCommunityList"
        case .getOneUserMember: //获取一个用户的联盟成员
            return "community/getOneUserMember"
        case .obtainCommunityDetail://查询圈的详细信息
            return "community/obtainCommunityDetail"
        case .obtainPromotionsByCommunity:  //获取圈活动列表
            return "community/promotion/obtainPromotionsByCommunity"
        case .obtainCommunityGuideByUserUidAndCommunityUid://获取导购信息
            return "community/obtainCommunityGuideByUserUidAndCommunityUid"
        }

    }
    
    /// The HTTP method used in the request.
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case  .getVerifiCode:
            return .post
        case .searchActiveList:
            return .post
        case .getOneUserMember:
            return .post
        case .obtainCommunityDetail:
            return .post
        case .obtainPromotionsByCommunity:
            return .post
        case .obtainCommunityGuideByUserUidAndCommunityUid:
            return .post
        }
        return .get
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .login(let name, let pwd):
            return ["phone": name, "code": pwd]
        case .getVerifiCode(let code):
            return ["phone": code]
        case .searchActiveList(let user_uid, let alias):
            return ["user_uid" : user_uid, "alias" :  alias]
        case .getOneUserMember(let user_uid):
            return ["user_uid" : user_uid]
        case .obtainCommunityDetail(let user_uid,let community_uid):
            return ["user_uid" : user_uid,"community_uid" : community_uid]
        case .obtainPromotionsByCommunity(let community_uid):  //获取圈活动列表
            return ["alias" : "yxmf","community_uid" : community_uid,"page_no": 1,
                    "page_size": 10,
                    "sort_by": "created_at",
                    "sort_order": "desc"]
        case .obtainCommunityGuideByUserUidAndCommunityUid(let user_uid, let community_uid):
            return ["user_uid":user_uid, "community_uid": community_uid]
            
        default:
            ()
        }
    }
    
    /// The method used for parameter encoding.
    var parameterEncoding: ParameterEncoding {
       // return URLEncoding.default
        return JSONEncoding.default
    }
    
    
    
    
    /// Provides stub data for use in testing.
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    /// The type of HTTP task to be performed.
    var task: Task {
        return .request
    }
    
    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    var validate: Bool {
        return false
    }
}
