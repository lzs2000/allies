//
//  MyUnionCircleVM.swift
//  allies
//
//  Created by 刘璐璐 on 2017/4/25.
//  Copyright © 2017年 温星. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import Moya
import SwiftyUserDefaults

let dispose = DisposeBag()
let provider = RxMoyaProvider<ApiManager>()


struct MyUnionSection {
    var items : [Item]
}

extension MyUnionSection : SectionModelType {
    typealias Item = MyCircle
    
    init(original: MyUnionSection, items: [MyUnionSection.Item]) {
        self = original
        self.items = items
    }
}

final class MyUnionCircleVM: NSObject, ViewModelType {
    
    typealias Output = MyUnionCircleOutput
    

    struct MyUnionCircleOutput {
       let section: Driver<[MyUnionSection]>
        let refreshCommand = PublishSubject<Int>()
        let refreshTrigger = PublishSubject<Void>()
        let dataSource = RxTableViewSectionedReloadDataSource<MyUnionSection>()
        
        
    }
    
    fileprivate let _circles = Variable<ActivityList>(ActivityList())
    func transform( ) -> MyUnionCircleVM.MyUnionCircleOutput {

        let section = _circles.asObservable().map({ (circles) -> [MyUnionSection] in
            return [MyUnionSection(items: circles.data.my_created_community), MyUnionSection(items: circles.data.my_participated_community)]
        })
            .asDriver(onErrorJustReturn: [])
        
        let output = Output(section: section)
        
        output.refreshCommand
            .flatMapLatest { event in  provider.request(.searchActiveList( Defaults[.user_uid]!,  "yxmf"))}
            .subscribe({ [weak self] (event) in
                output.refreshTrigger.onNext()
                switch event {
                case let .next(response):
                    do {
                        let data = try response.mapModel(ActivityList.self)
                        self?._circles.value = data
                    }catch {
                        self?._circles.value = ActivityList()
                    }
                    break
                case let .error(error):
                    print(error)
                    output.refreshTrigger.onError(error);
                    break
                default:
                    break
                }
            })

                
            
                        
            
        .addDisposableTo(dispose)
        return output
   }
    
   

}
