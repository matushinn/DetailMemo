//
//  AddMemoViewController.swift
//  DetailMemo
//
//  Created by 大江祥太郎 on 2018/12/13.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit

class AddMemoViewController: UIViewController {

    @IBOutlet weak var memoTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        
        let inputText = memoTextView.text
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil{
            var saveMemoArray = ud.array(forKey: "memoArray") as! [String]
            if inputText != nil{
                saveMemoArray.append(inputText!)
            }else{
                print("何も入力されていません。")
            }
            ud.set(saveMemoArray, forKey: "memoArray")
        }else{
            var newMemoArray = [String]()
            //nilを強制アンラップはエラーが出るから
            if inputText != nil{
                //inputtextはoptional型だから強制アンラップ
                newMemoArray.append(inputText!)
            }else{
                print("何も入っていません。")
            }
            ud.set(newMemoArray, forKey: "memoArray")
        }
        ud.synchronize()
        
        self.dismiss(animated: true, completion: nil)
    }
    
   

}
