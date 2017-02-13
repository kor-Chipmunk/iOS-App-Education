//
//  ViewController.swift
//  NotificationCenter
//
//  Created by CAUADC on 2017. 2. 13..
//  Copyright © 2017년 CAUADC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txt: UITextField!
    
    // 키보드의 return 키를 눌렀을 때 키보드를 내려줄 수 있도록 작성
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    // 키보드가 올라왔다는 노티피케이션을 받으면 실행될 함수
    func keyboardWillShow(_ noti: Notification) {
        print("키보드가 올라갑니다")
        print("전달된 정보: \(noti.userInfo)")
    }
    
    // 키보드가 내려간다는 노티피케이션을 받으면 실행될 함수
    func keyboardWillHide(_ noti: Notification) {
        print("키보드가 내려갑니다")
        print("전달된 정보: \(noti.userInfo)")
    }
    
    func didUserInputName(_ noti: Notification) {
        print("DidUserInputName 노티피케이션을 받았습니다!")
        print("전달된 정보: \(noti.userInfo?[UserInfoKeyName])")
        
        if let userName = noti.userInfo?[UserInfoKeyName] as? String {
            self.txt.text = userName
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 노티피케이션 센터에 자신이 키보드가 보여진다는 노티피케이션을 수신할 것임을 등록
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        // 노티피케이션 센터에 자신이 키보드가 사라진다는 노티피케이션을 수신할 것임을 등록
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(didUserInputName(_:)), name: DidUserInputName, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

