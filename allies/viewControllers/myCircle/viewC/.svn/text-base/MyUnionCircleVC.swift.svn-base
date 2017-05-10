//
//  MyUnionCircleVC.swift
//  allies
//
//  Created by 刘璐璐 on 2017/4/6.
//  Copyright © 2017年 温星. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift
import Then

class MyUnionCircleVC: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
  let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, MyCircle>>()
    let viewModel = MyUnionCircleModel()
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的联盟活动圈"
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = backGroundColor
        tableView.separatorStyle = UITableViewCellSeparatorStyle(rawValue: 0)!
        tableViewConfig()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
}
// MARK: - configTabView
extension MyUnionCircleVC {
    func tableViewConfig() {
        dataSource.configureCell = {
            _, tableview, indexPath, data  in
                let cell = tableview.dequeueReusableCell(withIdentifier: MyUnionCircleCell.Identifier, for: indexPath)
                    as! MyUnionCircleCell
                cell.configureWithMyCircle(mycircle: data)
                return cell
                }
        viewModel.getMydata()
            .bindTo(tableView.rx.items(dataSource: dataSource))
            .addDisposableTo(disposeBag)
        
        tableView.rx
            .setDelegate(self)
            .addDisposableTo(disposeBag)
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.getSectionView(section)
    }
    
    func getSectionView(_ section : Int) -> UIView {
        let sectionView = UIView().then { (view) in
            view.frame = CGRect.init(x: 0, y: 0, width: screenW, height: screenH)
            view.backgroundColor = backGroundColor
        }
        
        let _ = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 15)
            $0.textColor = UIColor.lightGray
            $0.frame = CGRect.init(x: 20, y: 5, width: screenW, height: 40)
            $0.backgroundColor = UIColor.clear
            $0.text = dataSource[section].model
            sectionView.addSubview($0)
    }
         return sectionView
    }
    
}

//MARK - tableviewDelegate

