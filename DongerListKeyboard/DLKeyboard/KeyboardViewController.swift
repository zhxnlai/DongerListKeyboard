//
//  KeyboardViewController.swift
//  DLKeyboard
//
//  Created by Zhixuan Lai on 11/12/14.
//  Copyright (c) 2014 Zhixuan Lai. All rights reserved.
//

import UIKit

let appGroupId = "group.dongerListKeyboard"

class KeyboardViewController: UIInputViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // sharing through NSUserDefaults
    
    var emoticons:Dictionary<String,Array<String>>?
    var textView:UITextView?
    
    var currentCategory:String = ""
    
    
    var categoryCollectionView:DLCategoryCollectionView!
    var emoticonsCollectionView:DLEmoticonCollectionView!
    
    
    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var deleteKeyboardButton: UIButton!
    let nextKeyboardButtonTitle = "☝️"
    let deleteKeyboardButtonTitle = "⬅︎"

    var reloadButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
 
        println("view did load")
    
        
//        if var textView = self.textView {
//            textView.text = "keyboard emoticons: \(emoticons)"
//        } else {
//            var textView = UITextView(frame: CGRect(x: 0, y: 0, width: 320, height: 100))
//            textView.text = "keyboard emoticons: \(emoticons)"
//            self.view.addSubview(textView)
//            self.textView = textView
//        }
        
        self.loadEmoticons()

        
//        println("keyboard emoticons: \(emoticons)")

    }
    
    func setupUI() {
        let buttonFontSize = CGFloat(30)
        

        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        self.nextKeyboardButton.setTitle(NSLocalizedString(nextKeyboardButtonTitle, comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.titleLabel!.font = UIFont.systemFontOfSize(buttonFontSize)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.nextKeyboardButton)
        
        // Perform custom UI setup here
        self.deleteKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        self.deleteKeyboardButton.setTitle(NSLocalizedString(deleteKeyboardButtonTitle, comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.deleteKeyboardButton.titleLabel!.font = UIFont.systemFontOfSize(buttonFontSize)
        self.deleteKeyboardButton.sizeToFit()
        self.deleteKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.deleteKeyboardButton.addTarget(self, action: "deleteButtonAction:", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.deleteKeyboardButton)
        
        
        self.categoryCollectionView = DLCategoryCollectionView()
        self.categoryCollectionView.backgroundColor = UIColor(red: 203/255.0, green: 204/255.0, blue: 198/255.0, alpha: 1)
        self.categoryCollectionView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.categoryCollectionView.delegate = self;
        self.categoryCollectionView.dataSource = self;
        self.view.addSubview(self.categoryCollectionView)
        
        self.emoticonsCollectionView = DLEmoticonCollectionView()
        self.emoticonsCollectionView.backgroundColor = UIColor(red: 254/255.0, green: 255/255.0, blue: 247/255.0, alpha: 1)
        self.emoticonsCollectionView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.emoticonsCollectionView.delegate = self;
        self.emoticonsCollectionView.dataSource = self;
        self.view.addSubview(self.emoticonsCollectionView)
        
        
        var emoticonsCollectionViewTopConstraint = NSLayoutConstraint(item: self.emoticonsCollectionView, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 0.0)
        var emoticonsCollectionViewLeftConstraint = NSLayoutConstraint(item: self.emoticonsCollectionView, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        var emoticonsCollectionViewRightConstraint = NSLayoutConstraint(item: self.emoticonsCollectionView, attribute: .Trailing, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: 0.0)
        var emoticonsCollectionViewButtomConstraint = NSLayoutConstraint(item: self.emoticonsCollectionView, attribute: .Bottom, relatedBy: .Equal, toItem: self.categoryCollectionView, attribute: .Top, multiplier: 1.0, constant: 0.0)
        var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        var deleteKeyboardButtonRightSideConstraint = NSLayoutConstraint(item: self.deleteKeyboardButton, attribute: .Trailing, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: 0.0)
        var categoryCollectionViewTopConstraint = NSLayoutConstraint(item: self.categoryCollectionView, attribute: .Top, relatedBy: .Equal, toItem: self.nextKeyboardButton, attribute: .Top, multiplier: 1.0, constant: 0.0)
        var categoryCollectionViewTopConstraint2 = NSLayoutConstraint(item: self.categoryCollectionView, attribute: .Top, relatedBy: .Equal, toItem: self.emoticonsCollectionView, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        var categoryCollectionViewLeftConstraint = NSLayoutConstraint(item: self.categoryCollectionView, attribute: .Leading, relatedBy: .Equal, toItem: self.nextKeyboardButton, attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        var categoryCollectionViewRightConstraint = NSLayoutConstraint(item: self.categoryCollectionView, attribute: .Trailing, relatedBy: .Equal, toItem: self.deleteKeyboardButton, attribute: .Leading, multiplier: 1.0, constant: 0.0)
        var categoryCollectionViewButtomConstraint = NSLayoutConstraint(item: self.categoryCollectionView, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        var deleteKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.deleteKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([emoticonsCollectionViewTopConstraint, emoticonsCollectionViewButtomConstraint, emoticonsCollectionViewLeftConstraint, emoticonsCollectionViewRightConstraint, nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint, deleteKeyboardButtonRightSideConstraint, deleteKeyboardButtonBottomConstraint, categoryCollectionViewTopConstraint, categoryCollectionViewTopConstraint2, categoryCollectionViewButtomConstraint, categoryCollectionViewLeftConstraint, categoryCollectionViewRightConstraint])
        
        self.reloadButton = UIButton.buttonWithType(.System) as UIButton
        self.reloadButton.frame = CGRect(x: 0, y: 0, width: 300, height: 150)
//        self.reloadButton.center = self.view.center
        self.reloadButton .setTitle("Reload", forState: .Normal)
        self.reloadButton.addTarget(self, action: "loadEmoticons", forControlEvents: .TouchUpInside)
        self.reloadButton.hidden = true
        self.view.addSubview(self.reloadButton)
    }
    
    func deleteButtonAction(sender: UIButton) {
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.deleteBackward()
    }
    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }

    // CollectionViewDelegate
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.isEqual(self.categoryCollectionView) {
            if var emoticons = self.emoticons {
                return emoticons.count
            }

        }
        if let emoticonsForCurrentCategory = emoticonsForCurrentCategory() {
            return emoticonsForCurrentCategory.count
        }
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var collectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(collectionViewIdentifier, forIndexPath: indexPath) as DLEmoticonCollectionViewCell
        
//        println("indexpath: row \(indexPath.row)")
        
        collectionViewCell.textLabel.text = "null"

        if collectionView.isEqual(self.categoryCollectionView) {
            let text = Array(self.emoticons!.keys)[indexPath.item]
            collectionViewCell.textLabel.text = text
            if text == self.currentCategory {
                collectionViewCell.textLabel.backgroundColor = UIColor.lightGrayColor()
            } else {
                collectionViewCell.textLabel.backgroundColor = UIColor.clearColor()
            }
            return collectionViewCell
        } else {
            if let emoticons = emoticonsForCurrentCategory() {
                collectionViewCell.textLabel.text = emoticons[indexPath.item]
            }
            
            return collectionViewCell
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if collectionView.isEqual(self.categoryCollectionView) {
            var text = Array(self.emoticons!.keys)[indexPath.item]
            return self.sizeForString(text)
        } else {
            if let emoticons = emoticonsForCurrentCategory() {
                var text = emoticons[indexPath.item]
                return self.sizeForString(text)
            }
            
            return self.sizeForString("")
        }

    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        if collectionView.isEqual(self.categoryCollectionView) {
            self.currentCategory = Array(self.emoticons!.keys)[indexPath.item]
            self.categoryCollectionView.reloadData()
            self.emoticonsCollectionView.reloadData()
        } else {
            if let emoticons = emoticonsForCurrentCategory() {
                var selectedText = emoticons[indexPath.item]
                var proxy = self.textDocumentProxy as UITextDocumentProxy
                proxy.insertText(selectedText)

            }
            
        }
    }
    
    // - ()
    var testLabel = UILabel()
    func sizeForString(text: String) -> CGSize {
        testLabel.text = text
        return testLabel.intrinsicContentSize()
    }
//    func formatCategory(name:String) -> String {
//        let nameArray = name.componentsSeparatedByString(" ")
//        return nameArray[1]
//    }
    func emoticonsForCurrentCategory() -> Array<String>? {
        if let emoticons = self.emoticons {
            if let array = emoticons[self.currentCategory] {
                return array
            }
        }
        return nil
    }
    func loadEmoticons() {
        let sharedDefaults = NSUserDefaults(suiteName: appGroupId)!
        if sharedDefaults.synchronize() {
            println("synchronized keyboard")
        }
        
        println("share defaults: \(sharedDefaults.dictionaryRepresentation())")

        if var data = sharedDefaults.objectForKey("emoticons") as? NSData {
            self.emoticons = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [String: [String]]
            if (self.emoticons == nil) {
                println(data)
            }
            
            if var emoticons = self.emoticons {
                
                self.currentCategory = Array(emoticons.keys)[0]
            }
//            println("categories: \(Array(self.emoticons.keys))")

        } else {
            println("cannot find key in userdefaults")
        }
        displayReloadButtonIfNeeded()
    }
    
    func displayReloadButtonIfNeeded() {
        self.reloadButton.hidden = self.emoticons != nil

    }
    
}
