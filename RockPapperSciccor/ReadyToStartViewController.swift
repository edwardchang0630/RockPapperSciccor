//
//  ReadyToStartVC.swift
//  RockPApperSciccor
//
//  Created by Yuan-Che Chang on 2020/8/23.
//  Copyright © 2020 Yuan-Che Chang. All rights reserved.
//

import UIKit

class ReadyToStartViewController: UIViewController {
    
    
    
    @IBOutlet weak var player1TextField: UITextField!
    
    @IBOutlet weak var player2TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyboardObserver()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchdown(_ sender: Any) {
        player1TextField.resignFirstResponder()
        player2TextField.resignFirstResponder()
    }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_home_to_rps" {    //確認我們的動作頁面是切到rps View Controller
            //其中我們宣告了一個rps_VC向下轉型成(rps)View Controller，以便我們調用該檔案裡面的name1 & name2變數
            let rps_VC = segue.destination as? ResultVC//向下轉型
            if player1TextField.text == "" {
                rps_VC!.name1 = "player1"
            }else {
                rps_VC!.name1 = player1TextField.text
            }
            if player2TextField.text == "" {
                rps_VC!.name2 = "player2"
            }else {
                rps_VC!.name2 = player2TextField.text
            }
        }
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
    
}

extension ReadyToStartViewController {
func addKeyboardObserver() {
//    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
}

    @objc func keyboardWillShow(notification: Notification) {
        // 能取得鍵盤高度就讓view上移鍵盤高度，否則上移view的1/3高度
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRect = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRect.height
            view.frame.origin.y = -keyboardHeight
        } else {
            view.frame.origin.y = -view.frame.height / 3
        }
    }

    @objc func keyboardWillHide(notification: Notification) {
        view.endEditing(true)
//
//        view.frame.origin.y = 0
    }
}


