//
//  UnionMemberCell.swift
//  allies
//
//  Created by 刘璐璐 on 2017/4/14.
//  Copyright © 2017年 温星. All rights reserved.
//

import UIKit

class UnionMemberCell: UITableViewCell {
static let Identifier = "UnionMemberCell"
    
    
    @IBOutlet weak var promotePersonL: UILabel!
    @IBOutlet weak var brandN: UILabel!
    @IBOutlet weak var unionMasterL: UILabel!
    @IBOutlet weak var unionImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    func configureWithUnionMember(member: UnionMember) {
        brandN.text = "品牌: " + "\(member.brandName)"
        unionImg.image = UIImage(named: member.unionImg)
        unionMasterL.text = member.unionMaster
        promotePersonL.text = "推广人员" + "\(member.promotePerson)" + "人"
        
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
