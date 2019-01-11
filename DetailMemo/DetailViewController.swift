//
//  DetailViewController.swift
//  DetailMemo
//
//  Created by 大江祥太郎 on 2018/12/13.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var memoTextView: UITextView!
    
    var selectedRow:Int!
    var selectedMemo : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       memoTextView.text = selectedMemo
    }
    
    @IBAction func deleteMemo(_ sender: Any) {
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil{
            var saveMemoArray = ud.array(forKey: "memoArray") as![String]
            saveMemoArray.remove(at: selectedRow)
            ud.set(saveMemoArray, forKey: "memoArray" )
            ud.synchronize()
            //画面遷移
            
            self.navigationController?.popViewController(animated: true)
            
        }
        

    }
    
    
}
