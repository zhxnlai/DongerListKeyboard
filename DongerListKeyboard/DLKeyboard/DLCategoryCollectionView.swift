//
//  DLCategoryCollectionView.swift
//  DongerListKeyboard
//
//  Created by Zhixuan Lai on 11/12/14.
//  Copyright (c) 2014 Zhixuan Lai. All rights reserved.
//

import UIKit

let collectionViewIdentifier = "CollectionViewCell"

// list the categories horizontally
class DLCategoryCollectionView: UICollectionView {
//    var categories:Array<String> = Array<String>()
    
    override init() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 80, height: 30)
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
//        layout.scrollDirection = UICollectionViewScrollDirection.Vertical
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        
        super.init(frame:CGRectZero, collectionViewLayout:layout)
        self.registerClass(DLTextCollectionViewCell.self, forCellWithReuseIdentifier: collectionViewIdentifier)
//        self.categories = categories
//        self.pagingEnabled = true
//        self.showsVerticalScrollIndicator = false
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
