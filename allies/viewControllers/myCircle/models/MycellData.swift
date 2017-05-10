//
//  MycellData.swift
//  allies
//
//  Created by 刘璐璐 on 2017/4/6.
//  Copyright © 2017年 温星. All rights reserved.
//

import Foundation

//MARK: - Equtable Protocol implementation
func ==(lhs: Mydata, rhs: Mydata) -> Bool {
    return (lhs.imageurl == rhs.imageurl
    && lhs.titleContent == rhs.titleContent)
}


struct Mydata:Equatable {
    let  imageurl: String
    let titleContent: String
    
}


