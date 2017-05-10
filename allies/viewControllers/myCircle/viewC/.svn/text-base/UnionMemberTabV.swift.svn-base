//
//  UnionMemberTabV.swift
//  allies
//
//  Created by 刘璐璐 on 2017/4/14.
//  Copyright © 2017年 温星. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources
import RxCocoa

class UnionMemberTabV: UITableView {
    // MARK: - configTabView
    let dataAry = RxTableViewSectionedReloadDataSource<SectionModel<String, UnionMember>>()
    let viewModel = UnionMemberM()
    let disposeBag = DisposeBag()
}

extension UnionMemberTabV {
    func tableViewConfig() {
        dataAry.configureCell = {
            _, tableview, indexPath, data  in
            let cell = self.dequeueReusableCell(withIdentifier: UnionMemberCell.Identifier, for: indexPath)
                as! UnionMemberCell 
            cell.configureWithUnionMember(member: data)
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
