//
//  ViewController.swift
//  test
//
//  Created by CAUADC on 2017. 2. 2..
//  Copyright © 2017년 CAUADC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var sdR: UISlider!
    @IBOutlet weak var sdG: UISlider!
    @IBOutlet weak var sdB: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var bg: UIView!
    
    override func viewDidLoad() {
        Alamofire.request("http://www.cau.ac.kr/ajax/bbs_list.php?isNoti=N&pageSize=50", encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for item in json["data"] {
                    print("제목 : \(item.1["TITLE"])")
                    print("주소 : http://www.cau.ac.kr/04_ulife/causquare/notice/notice_view.php?primaryNum=\(item.1["PRIMARYNUM"])&bbsId=cau_notice&schKey=title&schVal=&category1=&pageSize=50")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
  
    
    @IBAction func sdRChanged(_ sender: UISlider) {
        bg.backgroundColor = UIColor.init(red: CGFloat(sdR.value), green: CGFloat(sdG.value), blue: CGFloat(sdB.value), alpha: 1)
    }
    
    @IBAction func sdGChanged(_ sender: UISlider) {
        bg.backgroundColor = UIColor.init(red: CGFloat(sdR.value), green: CGFloat(sdG.value), blue: CGFloat(sdB.value), alpha: 1)
    }
    
    @IBAction func sdBChanged(_ sender: UISlider) {
        bg.backgroundColor = UIColor.init(red: CGFloat(sdR.value), green: CGFloat(sdG.value), blue: CGFloat(sdB.value), alpha: 1)
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText: String? = textField.text
        
        if let castedText: NSString = currentText as? NSString {
            print(castedText)
            
            self.label.text = castedText.replacingCharacters(in: range, with: string)
        }
        
        print("Range : \(range.location), \(range.length), string : \(string)")
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("사용자가 텍스트필드 작성을 시작했습니다.")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("텍스트필드가 작성을 끝냈습니다.")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("텍스트필드의 작성을 끝내도 되나요?")
        
        if let text = textField.text {
            
            if text.characters.count < 2 {
                print("안됩니다!")
                return false
            }
            else {
                print("입력한 이름 : \(text)")
                return true
            }
            
        }
        
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("사용자가 return 키를 눌렀습니다.")
        
        // textField.resignFirstResponder()
        textField.endEditing(true)
        
        return true
    }
    
    
}

