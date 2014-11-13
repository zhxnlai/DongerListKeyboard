//
//  DLEmoticonCollectionViewCell.swift
//  DongerListKeyboard
//
//  Created by Zhixuan Lai on 11/12/14.
//  Copyright (c) 2014 Zhixuan Lai. All rights reserved.
//

import UIKit

class DLEmoticonCollectionViewCell: UICollectionViewCell {
    var textLabel:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textLabel = UILabel()
        self.contentView.addSubview(textLabel)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textLabel.frame = self.contentView.frame
        
    }
    
}
