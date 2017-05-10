
//
//  MyViewModel.swift
//  allies
//
//  Created by 刘璐璐 on 2017/4/7.
//  Copyright © 2017年 温星. All rights reserved.
//

import Foundation
import RxDataSources
import RxSwift

class MyViewModel: NSObject {
    func getMydata() -> Observable<[SectionModel<String, Mydata>]> {
        return Observable.create({ (observer) -> Disposable in
            let mydata = [  Mydata(imageurl: "profile_default", titleContent: "没想法的岁月")
            ]
            let mydata1 = [Mydata(imageurl: "myCircle", titleContent: "我的联盟圈"),
                           Mydata(imageurl: "myPromotion", titleContent: "我的推广")
            ]
            let mydata2 = [Mydata(imageurl: "myPromotion", titleContent: "报名凭证")]
            
            let section = [SectionModel(model:"", items: mydata), SectionModel(model:"", items:mydata1), SectionModel(model:"", items: mydata2)]
            observer.onNext(section)
            observer.onCompleted()
            return Disposables.create()
        })
    }
}
