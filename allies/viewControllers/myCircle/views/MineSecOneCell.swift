//
//  MineSecOneCell.swift
//  allies
//
//  Created by 刘璐璐 on 2017/4/6.
//  Copyright © 2017年 温星. All rights reserved.
//

import UIKit

class MineSecOneCell: UITableViewCell {
   static let Identifier = "MineSecOneCell"
   static let cellHeight = 200
    
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var portraitImg: UIImageView!
    
    
    func configureWithMydata(mydata:Mydata) {
        if mydata.imageurl.isEmpty {
            return
        }
        if (nicknameLabel != nil) {
            portraitImg.image = UIImage(named: mydata.imageurl)
            nicknameLabel.text = mydata.titleContent
                    }
        print(mydata.imageurl, mydata.titleContent)
        
    }
    
    
}
