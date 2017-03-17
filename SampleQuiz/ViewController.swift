//
//  ViewController.swift
//  SampleQuiz
//
//  Created by Kei on 2017/03/17.
//  Copyright © 2017年 Kei. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapSystemSound(_ sender: Any) {
        // システムサウンド1000番を鳴らしつつバイブレーションを振動させる
        // マナーモードのときはバイブレーションのみとなる
        // サウンドID参考サイト：http://iphonedevwiki.net/index.php/AudioServices
        AudioServicesPlaySystemSoundWithCompletion(1000) {
            // ここはサウンドがなり終わった後に呼ばれる処理を記述する
        }
    }
    @IBAction func tapCostomSound(_ sender: Any) {
        // 指定するサウンドファイルは再生時間が30秒以下であること
        let soundUrl = Bundle.main.url(forResource: "train01", withExtension: "mp3")
        // サウンドIDを登録するための変数を用意
        var soundId: SystemSoundID = 0
        // サウンドファイルを登録してサウンドIDを取得
        AudioServicesCreateSystemSoundID(soundUrl as! CFURL, &soundId)
        // 取得したサウンドIDを使用してサウンドを鳴らす
        AudioServicesPlaySystemSoundWithCompletion(soundId) {
        }
    }

    @IBAction func tapVibration(_ sender: Any) {
        // バイブレーションのみを発生させる
        AudioServicesPlaySystemSoundWithCompletion(kSystemSoundID_Vibrate) {
            // ここはバイブレーションが終わった後に呼ばれる処理
        }
        
    }

}

