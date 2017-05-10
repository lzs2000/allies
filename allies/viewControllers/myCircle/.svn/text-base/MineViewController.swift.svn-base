//
//  MineViewController.swift
//  allies
//
//  Created by 刘璐璐 on 2017/4/6.
//  Copyright © 2017年 温星. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class MineViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, Mydata>>()
    let viewModel = MyViewModel()
    let disposeBag = DisposeBag()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.tableFooterView = UIView()
        tableview.backgroundColor = backGroundColor
        tableview.separatorStyle = UITableViewCellSeparatorStyle(rawValue: 0)!
        self.automaticallyAdjustsScrollViewInsets = false
        tableViewConfig()
    }
    
}



// MARK: - tableViewDelegate
extension MineViewController {
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 2 ? 0 : 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 190 : 44
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 1 && indexPath.row == 0) {
            let storyBoard = UIStoryboard(name: "mine", bundle: nil)
            let nextPage = storyBoard.instantiateViewController(withIdentifier: "MyUnionCircleVC")
            self.navigationController?.pushViewController(nextPage, animated: true)
            
            
      }
    }
    
    
    
  
}


// MARK: - configTabView
extension MineViewController {
    func tableViewConfig() {
        dataSource.configureCell = {
            _, tableview, indexPath, mydata in
            if indexPath.section == 0 {
                let cell = tableview.dequeueReusableCell(withIdentifier: MineSecOneCell.Identifier, for: indexPath)
                    as! MineSecOneCell
                cell.configureWithMydata(mydata: mydata)
                return cell
            } else {
                let cell = tableview.dequeueReusableCell(withIdentifier: MineCell.Identifier, for: indexPath)
                    as! MineCell
                cell.configureWithMydata(mydata: mydata)
                return cell
            }
        }
        
        
        viewModel.getMydata()
            .bindTo(tableview.rx.items(dataSource: dataSource))
            .addDisposableTo(disposeBag)
        
        tableview.rx
            .setDelegate(self)
            .addDisposableTo(disposeBag)
        tableview.tableFooterView = UIView()

    }
}
