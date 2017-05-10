//
//  ActivityCenterTableV.swift
//  allies
//
//  Created by 刘璐璐 on 2017/4/14.
//  Copyright © 2017年 温星. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources



class ActivityCenterTableV: UITableView {
    // MARK: - configTabView
    let dataAry = RxTableViewSectionedReloadDataSource<SectionModel<String, ActivityCenter>>()
    let viewModel = ActivityCenterViewM()
    let disposeBag = DisposeBag()
}

extension ActivityCenterTableV {
    func tableViewConfig() {
        dataAry.configureCell = {
            _, tableview, indexPath, data  in
            let cell = self.dequeueReusableCell(withIdentifier: ActivityCenterCell.Identifier, for: indexPath)
                as! ActivityCenterCell
            cell.configureWithMyActivity(activity: data)
            return cell
        }
        viewModel.getMydata()
            .bindTo(self.rx.items(dataSource: dataAry))
            .addDisposableTo(disposeBag)
        
        self.rx
            .setDelegate(self as! UIScrollViewDelegate)
            .addDisposableTo(disposeBag)
        
    }
    
    

}
