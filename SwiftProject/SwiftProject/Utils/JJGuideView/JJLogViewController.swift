//
//  JJLogViewController.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/10/9.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit

class JJLogViewController: UIViewController {

    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func loginClickAction(_ sender: Any) {
        
        SMSSDK.commitVerificationCode(self.passwordTF.text, phoneNumber: self.phoneTextField.text, zone: "+86") { (error) in
            if !(error != nil){
                //验证码正确
                self.successNotice("验证码验证成功", autoClear: true)
                self.dismiss(animated: true, completion: nil)
                UserDefaults.standard.setValue(true, forKey: isLogin)
            }else{
                //验证码错误
                self.errorNotice("验证码验证失败", autoClear: true)
            }
        }
    }
    
    @IBAction func getCodeAction(_ sender: Any) {
        SMSSDK.getVerificationCode(by: SMSGetCodeMethodSMS, phoneNumber: phoneTextField.text, zone: "+86") { (error) in
            if !(error != nil){
                //请求成功
                self.successNotice("验证码获取成功", autoClear: true)
            }else{
                //请求失败
                self.errorNotice("验证码请求失败", autoClear: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
