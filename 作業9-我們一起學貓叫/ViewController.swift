//
//  ViewController.swift
//  作業9-我們一起學貓叫
//
//  Created by apple on 2019/4/14.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import AVFoundation
//在UIViewController的後方多加了一個UITextFieldDelegate，為了要進行接下來的收鍵盤設定
class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBAction func changeSlider(_ sender: Any) {
    speedRateText.text = String(format: "%.2f", speedRate.value)
    voiceTypeText.text = String(format: "%.2f", VoiceType.value)
    }
    

        
//outlet
    
    @IBOutlet weak var loveTextField: UISlider!
    @IBOutlet weak var speedRateText: UILabel!
    @IBOutlet weak var VoiceType: UISlider!
    @IBOutlet weak var voiceTypeText: UILabel!
    @IBOutlet weak var speedRate: UISlider!

    //說話時可選擇改變速度,音調
  
 
    @IBAction func speakSlider(_ sender: Any) {

    let speechUtterance = AVSpeechUtterance(string: "哈哈哈沒中")
    let synthesizer = AVSpeechSynthesizer()
    speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
    speechUtterance.pitchMultiplier = VoiceType.value //.pitchMutiplier控制音調
    speechUtterance.rate = speedRate.value  //.rate則是語速，和speedRate做連結
    synthesizer.speak(speechUtterance)
        }
    
    
    //按下鍵盤上的「return」後隱藏虛擬鍵盤
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //當點擊鍵盤以外的畫面後收起鍵盤
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
