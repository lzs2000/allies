//
//  MyUnionCircleModel.swift
//  allies
//
//  Created by 刘璐璐 on 2017/4/11.
//  Copyright © 2017年 温星. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

class MyUnionCircleModel: NSObject {
    func getMydata() -> Observable<[SectionModel<String, MyCircle>]> {
        return Observable.create({ (observer) -> Disposable in
            let mydata = [ MyCircle(circleImg: "myCircle", circleName:"小武d3圈子", circleMe:2, activeCount:2, isActiveOrN:false)
            ]
            let mydata1 = [MyCircle(circleImg: "myCircle", circleName:"小武d3圈子", circleMe:2, activeCount:2, isActiveOrN:false)
            ]
           
            
            let section = [SectionModel(model:"我创建的圈子(1)", items: mydata), SectionModel(model:"我加入的圈子(1)", items:mydata1)]
            observer.onNext(section)
            observer.onCompleted()
            return Disposables.create()
        })
    }
}
