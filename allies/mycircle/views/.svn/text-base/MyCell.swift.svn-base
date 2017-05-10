//
//  MineCell.swift
//  allies
//
//  Created by 刘璐璐 on 2017/4/6.
//  Copyright © 2017年 温星. All rights reserved.
//

import UIKit

class MineCell: UITableViewCell {
    
     static let Identifier = "MineCell"
     static let cellHeight = 44
 
    @IBOutlet weak var topLine: UIView!
    @IBOutlet weak var myCirImg: UIImageView!
    @IBOutlet weak var myCirDes: UILabel!
    @IBOutlet weak var bottomLine: UIView!
    
    func configureWithMydata(mydata:Mydata) {
        if mydata.imageurl.isEmpty {
            return
        }
         print(mydata.imageurl, mydata.titleContent)
        if (myCirDes != nil) {
            myCirImg.image = UIImage(named: mydata.imageurl)
            myCirDes.text = mydata.titleContent
        }
     
    }
    
}
