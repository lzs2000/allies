//
//  ActivityCenterViewM.swift
//  allies
//
//  Created by 刘璐璐 on 2017/4/14.
//  Copyright © 2017年 温星. All rights reserved.
//

import UIKit
import RxDataSources
import RxCocoa
import RxSwift

class ActivityCenterViewM: NSObject {
    func getMydata() -> Observable<[SectionModel<String, ActivityCenter>]> {
        return Observable.create({ (observer) -> Disposable in
            let mydata  = [ActivityCenter(activityName:"小武d3圈子", activityTime:"2017-8-9", browseCount:2, signUpCount:2, activityImg: "lufei")
            ]
            

            let section = [SectionModel(model:"", items: mydata), SectionModel(model:"我加入的圈子(1)", items:mydata)]
            observer.onNext(section)
            observer.onCompleted()
            return Disposables.create()
        })
    }

}
