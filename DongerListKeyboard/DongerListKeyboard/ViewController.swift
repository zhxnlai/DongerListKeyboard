//
//  ViewController.swift
//  DongerListKeyboard
//
//  Created by Zhixuan Lai on 11/11/14.
//  Copyright (c) 2014 Zhixuan Lai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    override func loadView() {
//        self.view = UIView(frame: UIScreen.mainScreen().applicationFrame)
//        self.textView = UITextView(frame: CGRect(x: 0.0, y: 20.0,
//            width: self.view.frame.size.width,
//            height: self.view.frame.size.height))
//        self.view.addSubview(self.textView!)
//    }
    
    
    var categoryCollectionView:UIView!
    var emoticonsCollectionView:UIView!
    
    
    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var deleteKeyboardButton: UIButton!
    let nextKeyboardButtonTitle = "☝️"
    let deleteKeyboardButtonTitle = "⬅︎"

    
    override func viewDidLoad() {
        
        let path = NSBundle.mainBundle().pathForResource("Donger List", ofType: "json")
        let fileData = NSData(contentsOfFile: path!)
        
        DLEmoticonManager.sharedInstance.initialize(fileData!);
      

    }
    

}

