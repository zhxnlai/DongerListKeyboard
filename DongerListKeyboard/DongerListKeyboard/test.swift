//
//  test.swift
//  DongerListKeyboard
//
//  Created by Zhixuan Lai on 11/12/14.
//  Copyright (c) 2014 Zhixuan Lai. All rights reserved.
//

import Foundation

/*
// Perform custom UI setup here
self.nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton
self.nextKeyboardButton.setTitle(NSLocalizedString(nextKeyboardButtonTitle, comment: "Title for 'Next Keyboard' button"), forState: .Normal)
self.nextKeyboardButton.sizeToFit()
self.nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
self.view.addSubview(self.nextKeyboardButton)

// Perform custom UI setup here
self.deleteKeyboardButton = UIButton.buttonWithType(.System) as UIButton
self.deleteKeyboardButton.setTitle(NSLocalizedString(deleteKeyboardButtonTitle, comment: "Title for 'Next Keyboard' button"), forState: .Normal)
self.deleteKeyboardButton.sizeToFit()
self.deleteKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
self.deleteKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
self.view.addSubview(self.deleteKeyboardButton)


self.categoryCollectionView = UIView()
self.categoryCollectionView.backgroundColor = UIColor.blueColor()
self.categoryCollectionView.setTranslatesAutoresizingMaskIntoConstraints(false)

//        self.categoryCollectionView.delegate = self;
//        self.categoryCollectionView.dataSource = self;
self.view.addSubview(self.categoryCollectionView)

self.emoticonsCollectionView = UIView()
self.emoticonsCollectionView.backgroundColor = UIColor.redColor()
self.emoticonsCollectionView.setTranslatesAutoresizingMaskIntoConstraints(false)

//        self.emoticonsCollectionView.delegate = self;
//        self.emoticonsCollectionView.dataSource = self;
self.view.addSubview(self.emoticonsCollectionView)


var emoticonsCollectionViewTopConstraint = NSLayoutConstraint(item: self.emoticonsCollectionView, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 0.0)
var emoticonsCollectionViewLeftConstraint = NSLayoutConstraint(item: self.emoticonsCollectionView, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
var emoticonsCollectionViewRightConstraint = NSLayoutConstraint(item: self.emoticonsCollectionView, attribute: .Trailing, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: 0.0)
var emoticonsCollectionViewButtomConstraint = NSLayoutConstraint(item: self.emoticonsCollectionView, attribute: .Bottom, relatedBy: .Equal, toItem: self.categoryCollectionView, attribute: .Top, multiplier: 1.0, constant: 0.0)


var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)




var deleteKeyboardButtonRightSideConstraint = NSLayoutConstraint(item: self.deleteKeyboardButton, attribute: .Trailing, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: 0.0)



var categoryCollectionViewTopConstraint = NSLayoutConstraint(item: self.categoryCollectionView, attribute: .Top, relatedBy: .Equal, toItem: self.nextKeyboardButton, attribute: .Top, multiplier: 1.0, constant: 0.0)

var categoryCollectionViewTopConstraint2 = NSLayoutConstraint(item: self.categoryCollectionView, attribute: .Top, relatedBy: .Equal, toItem: self.emoticonsCollectionView, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
//
var categoryCollectionViewLeftConstraint = NSLayoutConstraint(item: self.categoryCollectionView, attribute: .Leading, relatedBy: .Equal, toItem: self.nextKeyboardButton, attribute: .Trailing, multiplier: 1.0, constant: 0.0)
var categoryCollectionViewRightConstraint = NSLayoutConstraint(item: self.categoryCollectionView, attribute: .Trailing, relatedBy: .Equal, toItem: self.deleteKeyboardButton, attribute: .Leading, multiplier: 1.0, constant: 0.0)

var categoryCollectionViewButtomConstraint = NSLayoutConstraint(item: self.categoryCollectionView, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)


//        self.view.addConstraints([ categoryCollectionViewTopConstraint, categoryCollectionViewLeftConstraint, categoryCollectionViewRightConstraint, categoryCollectionViewButtomConstraint])



var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
var deleteKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.deleteKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)

//        self.view.addConstraints([ nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint, deleteKeyboardButtonRightSideConstraint, deleteKeyboardButtonBottomConstraint])
self.view.addConstraints([emoticonsCollectionViewTopConstraint, emoticonsCollectionViewButtomConstraint, emoticonsCollectionViewLeftConstraint, emoticonsCollectionViewRightConstraint, nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint, deleteKeyboardButtonRightSideConstraint, deleteKeyboardButtonBottomConstraint, categoryCollectionViewTopConstraint, categoryCollectionViewTopConstraint2, categoryCollectionViewButtomConstraint, categoryCollectionViewLeftConstraint, categoryCollectionViewRightConstraint])
*/