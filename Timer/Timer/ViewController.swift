//
//  ViewController.swift
//  Timer
//
//  Created by CAUADC on 2017. 2. 13..
//  Copyright © 2017년 CAUADC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer: Timer?
    var seconds: Double = 0
    
    var repeatSecond: Double = 0
    var untilSecond: Double = 0
    
    @IBOutlet weak var txtToRepeat: UITextField!
    @IBOutlet weak var txtUntilRepeat: UITextField!
    
    @IBOutlet weak var lbl: UILabel!
    
    @IBAction func clickButton(_ sender: Any) {
        // 시간 초기화
        self.seconds = 0
        
        guard let repeatSec = Double(txtToRepeat.text!) else { return }
        guard let untilSec = Double(txtUntilRepeat.text!) else { return }
        
        self.repeatSecond = repeatSec
        self.untilSecond = untilSec
        
        // 이전 타이머를 초기화합니다
        self.timer?.invalidate()
        self.timer = nil
        
        // 타이머를 생성해줍니다.
        // 반복하는 타이머이며 반복주기는 1초입니다.
        self.timer = Timer.scheduledTimer(timeInterval: self.repeatSecond, target: self, selector: #selector(ticTock(timer:)), userInfo: nil, repeats: true)
        
        // 타이머의 트리거를 당깁니다.
        self.timer?.fire()
    }
    
    func ticTock(timer: Timer) {
        if self.seconds < self.untilSecond {
            self.seconds = self.seconds + timer.timeInterval
            self.lbl.text = "\(self.seconds)"
            print("tic tock")
        } else {
            // 타이머 종료
            timer.invalidate()
            self.timer = nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

