//
//  ViewController.swift
//  allies
//
//  Created by 温星 on 17/3/31.
//  Copyright © 2017年 温星. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import RxCocoa
import JVFloatLabeledTextField
import SwiftyUserDefaults
import HandyJSON
import Toast_Swift

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTF: JVFloatLabeledTextField!
    
    @IBOutlet weak var verificationCodeTF: JVFloatLabeledTextField!
    @IBOutlet weak var verifiBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    let provider = RxMoyaProvider<ApiManager>()
    let dispose = DisposeBag()
    let usernameLength = 11
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFChangeHanding()
        //let user_uid = Defaults[.user_uid]

    }
    
    @IBAction func dismissBtnClick(_ sender: Any) {
        self.dismiss(animated: true) { 
            
        }
    }
    private func setupTextFChangeHanding() {
        let accountValid = userNameTF.rx.text.map {
            $0?.characters.count == self.usernameLength }
            .shareReplay(1)
        
        let verificationCodeTF = self.verificationCodeTF.rx.text.map {
            $0?.characters.count == 4
            }
            .shareReplay(1)
        
        
        
        accountValid
            .subscribe(onNext: { valid in
                if valid {
                    self.verifiBtn.isEnabled = true
                    self.verifiBtn.setTitleColor(UIColor(colorLiteralRed: 85/256, green: 220/256, blue: 81/256, alpha: 1), for: .normal)
                } else {
                    self.verifiBtn.isEnabled = false
                     self.verifiBtn.setTitleColor(UIColor.lightGray, for: .normal)
                }
                
            })
            .addDisposableTo(dispose)
        
        _ = Observable.combineLatest(accountValid,verificationCodeTF) {$0 && $1}.subscribe(onNext: { valid in
            if valid {
                self.loginBtn.isEnabled = true
                self.loginBtn.setTitleColor(UIColor.white, for: .normal)
                }
            else {
                self.loginBtn.isEnabled = false
                self.loginBtn.setTitleColor(UIColor.lightGray, for: .normal)

            }
        })
            .addDisposableTo(dispose)
        
        _ = self.verifiBtn.rx.tap.shareReplay(1).subscribe(onNext: {
            self.getCode()
        })
        
        _ = self.loginBtn.rx.tap.shareReplay(1).subscribe(onNext:{
            self.loginBtnClick()
        })
        
        
    }
    private func getCode() {
        provider.request(.getVerifiCode(userNameTF.text!))
            .mapModel(VerifyCode.self)
            .subscribe(onNext:{ model  in
                print(model.data ?? ["result":"you have made an error"])
                print(model.code ?? 201)
                print(model.error_msg ?? "")
            })
            .addDisposableTo(dispose)
    }
    private func loginBtnClick() {
        provider.request(.login(userNameTF.text!, verificationCodeTF.text!))
            .mapModel(LoginModel.self)
            .subscribe(onNext: { (model) in
                print(model.data ?? ["result":"you have made an error"])
                print(model.code ?? 201)
                print(model.error_msg ?? "")
                
                guard model.code == 200 else {
                    //登录失败
                    self.view.makeToast(model.error_msg!)
                    return
                }
                
                guard let user_uid = model.data?.user_info?.user_uid else {
                    return
                }
                //保存登录信息
                Defaults[.user_uid] = user_uid
                self.dismiss(animated: true, completion: nil)
                
               // self.getActivityList()
                
            })
            .addDisposableTo(dispose)
    }
    
    func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
