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
import RxCocoa
import PullToRefresh

extension Notification.Name {
    /// Gank post when home category change
    static let category = Notification.Name(rawValue: "homeCategory")
}


class MyUnionCircleVC: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
  var dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, MyCircle>>()
    
    let viewmodel = MyUnionCircleVM()
    let disposeBag = DisposeBag()
    let refreshControl = PullToRefresh()
    let sectionAry = ["我的联盟圈", "我加入的圈子"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的联盟活动圈"
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = backGroundColor
        tableView.refreshControl = UIRefreshControl()

        tableView.separatorStyle = UITableViewCellSeparatorStyle(rawValue: 0)!
        
       //config tableview
        setup()
        
        //下拉显示进度条
        self.tableView.refreshControl?.beginRefreshing()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
}
// MARK: - configTabView
extension MyUnionCircleVC {
   
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
           
            let count = self.tableView.numberOfRows(inSection: section)
            if count != 0 {
                $0.text = sectionAry[section] + "(\(count))"
            }
            sectionView.addSubview($0)
    }
         return sectionView
    }
    
}

extension MyUnionCircleVC {
    fileprivate func setup() {
        do {
            tableView.rx.setDelegate(self)
                .addDisposableTo(disposeBag)
            
            // Output
            let outputStuff = viewmodel.transform()
            
            //下拉刷新
            tableView.refreshControl?.rx.controlEvent(.allEvents)
                .subscribe(onNext: {_ in
                    outputStuff.refreshCommand.onNext(1)//进入页面进行下拉刷新
                })
                .addDisposableTo(disposeBag)

            
            outputStuff.section
                .drive(tableView.rx.items(dataSource: outputStuff.dataSource))
                .addDisposableTo(disposeBag)

            outputStuff.refreshTrigger
                .observeOn(MainScheduler.instance)
                .subscribe { [unowned self] (event) in
                    self.tableView.refreshControl?.endRefreshing()
                    switch event {
                    case .error(_):
                       // NoticeBar(title: "Network Disconnect!", defaultType: .error).show(duration: 2.0, completed: nil)
                        break
                    case .next(_):
                        self.tableView.reloadData()
                        break
                    default:
                        break
                    }
                }
                .addDisposableTo(disposeBag)
            
           
            outputStuff.dataSource.configureCell = {
                _, tableview, indexPath, data  in
                let cell = tableview.dequeueReusableCell(withIdentifier: MyUnionCircleCell.Identifier, for: indexPath)
                    as! MyUnionCircleCell
                cell.configureWithMyCircle(mycircle: data)
                return cell
            }
            
            outputStuff.refreshCommand.onNext(1)//进入页面进行下拉刷新
        }
        
        do /** cell Selected */ {
            tableView.rx
            .modelSelected(MyCircle.self)
            .subscribe(onNext: { (model) in
                self.tableView.deselectRow(at: self.tableView.indexPathForSelectedRow!, animated: true)
               
            })
            .addDisposableTo(disposeBag)
        }
       
       
    }
}
