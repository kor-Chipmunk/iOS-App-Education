//
//  SecondViewController.swift
//  NotificationCenter
//
//  Created by CAUADC on 2017. 2. 13..
//  Copyright © 2017년 CAUADC. All rights reserved.
//

import UIKit

let DidUserInputName = Notification.Name("UserDidInputName")
let UserInfoKeyName: String = "userName"

class SecondViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    // 버튼을 눌렀을 때 호출될 액션 함수
    @IBAction func clickDoneButton(_ sender: Any) {
        let userInfoDic = [UserInfoKeyName:self.nameField.text]
        NotificationCenter.default.post(name: DidUserInputName, object: nil, userInfo: userInfoDic)
        self.navigationController?.popViewController(animated: true)
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
