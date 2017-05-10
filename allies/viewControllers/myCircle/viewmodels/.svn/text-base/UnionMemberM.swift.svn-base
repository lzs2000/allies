//
//  UnionMemberM.swift
//  allies
//
//  Created by 刘璐璐 on 2017/4/14.
//  Copyright © 2017年 温星. All rights reserved.
//

import UIKit
import RxDataSources
import RxCocoa
import RxSwift

class UnionMemberM: NSObject {
    func getMydata() -> Observable<[SectionModel<String, UnionMember>]> {
        return Observable.create({ (observer) -> Disposable in
            let mydata  = [UnionMember(unionImg:"myCircle", brandName:" 2平米", unionMaster:"小武: *7187", promotePerson:1)
            ]
            
            
            let section = [SectionModel(model:"", items: mydata), SectionModel(model:"", items:mydata)]
            observer.onNext(section)
            observer.onCompleted()
            return Disposables.create()
        })
    }
    
}
