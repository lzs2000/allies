//
//  UnionMemberData.swift
//  allies
//
//  Created by 刘璐璐 on 2017/4/14.
//  Copyright © 2017年 温星. All rights reserved.
//

import Foundation


    //MARK: - Equtable Protocol implementation
    func == (lhs: UnionMember, rhs: UnionMember) -> Bool {
        return (lhs.unionImg == rhs.unionImg
            && lhs.brandName == rhs.brandName && lhs.unionMaster == rhs.unionMaster && lhs.promotePerson == rhs.promotePerson)
    }
    
    struct UnionMember:Equatable {
        let  unionImg: String
        let brandName: String
        let  unionMaster: String
        let promotePerson: NSNumber
     
    }


