//
//  UnionCenterDetailVC.swift
//  allies
//
//  Created by 刘璐璐 on 2017/4/14.
//  Copyright © 2017年 温星. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class UnionCenterDetailVC: UIViewController {

    @IBOutlet weak var unionMemberBtn: UIButton!
    @IBOutlet weak var activityBtn: UIButton!
    @IBOutlet weak var unionMemberV: UnionMemberTabV!
    @IBOutlet weak var activityV: ActivityCenterTableV!
    
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
       
        
        // Do any additional setup after loading the view.
    }

}
extension UnionCenterDetailVC {
    func setupUI() {
        self.title = "我的联盟活动圈"
        
        activityV.tableViewConfig()
        unionMemberV.tableViewConfig()
        activityV.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: screenW, height: 1))
        activityV.tableFooterView?.backgroundColor = seperatorColor
        unionMemberV.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: screenW, height: 1))
        unionMemberV.tableFooterView?.backgroundColor = seperatorColor
        
        activityBtn.setTitleColor(buttonColor, for: .selected)
        activityBtn.setTitleColor(UIColor.black, for: .normal)
        unionMemberBtn.setTitleColor(buttonColor, for: .selected)
        unionMemberBtn.setTitleColor(UIColor.black, for: .normal)
        activityBtn.isSelected = true
        self.unionMemberV.isHidden = true
        
        activityBtn.rx.tap
            .subscribe(onNext: {
                if self.unionMemberBtn.isSelected {
                    self.unionMemberBtn.isSelected = !self.unionMemberBtn.isSelected
                }
                self.activityBtn.isSelected = !self.unionMemberBtn.isSelected
                self.unionMemberV.isHidden = true
                self.activityV.isHidden = false
            })
        .addDisposableTo(disposeBag)
        
        unionMemberBtn.rx.tap
            .subscribe(onNext: {
                if self.activityBtn.isSelected {
                    self.activityBtn.isSelected = !self.activityBtn.isSelected
                }
                self.unionMemberBtn.isSelected = !self.unionMemberBtn.isSelected
                self.activityV.isHidden = true
                self.unionMemberV.isHidden = false
            })
            .addDisposableTo(disposeBag)
        
        
        
        
    }
}

