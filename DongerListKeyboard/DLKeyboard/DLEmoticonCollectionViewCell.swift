//
//  DLEmoticonCollectionViewCell.swift
//  DongerListKeyboard
//
//  Created by Zhixuan Lai on 11/12/14.
//  Copyright (c) 2014 Zhixuan Lai. All rights reserved.
//

import UIKit

class DLEmoticonCollectionViewCell: DLTextCollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        var backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.lightGrayColor()
        self.selectedBackgroundView = backgroundView
        
//        contentView.layer.borderColor = UIColor.darkGrayColor().CGColor;
//        contentView.layer.borderWidth = 1;

    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.selectedBackgroundView.frame = self.contentView.frame
    }
    
}
