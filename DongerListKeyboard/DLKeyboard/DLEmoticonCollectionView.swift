//
//  DLEmoticonCollectionView.swift
//  DongerListKeyboard
//
//  Created by Zhixuan Lai on 11/12/14.
//  Copyright (c) 2014 Zhixuan Lai. All rights reserved.
//

import UIKit

class DLEmoticonCollectionView: UICollectionView {
    override init() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 30)
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical
//        layout.minimumLineSpacing = 0;

        super.init(frame:CGRectZero, collectionViewLayout:layout)
        self.registerClass(DLEmoticonCollectionViewCell.self, forCellWithReuseIdentifier: collectionViewIdentifier)
        //        self.categories = categories
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
