//
//  CollectionController.swift
//  CNN_RSS
//
//  Created by Neria Jerafi on 30/10/2020.
//

import Foundation
import UIKit


  // This class responsible for Collection View configuration and the delegates methods
class CollectionController: NSObject {
    var collectionView:UICollectionView
    
    init(collectionView:UICollectionView) {
        self.collectionView = collectionView
        super.init()
        collectionViewConfig()
    }
    
    func collectionViewConfig() {
        collectionView.dataSource = self
        let travelRSSNib = UINib(nibName: "TravelRSSCell", bundle: nil)
        collectionView.register(travelRSSNib, forCellWithReuseIdentifier: "travelRSSCell")
        if let flowLayout = collectionView.collectionViewLayout as?
            UICollectionViewFlowLayout{
            flowLayout.estimatedItemSize = CGSize(width: (UIScreen.main.bounds.size.width * 0.45) - 5, height: 0)
        }
    }
    
    // Not allows to scroll up after the Collection view has been update
    func reloadCollectionData() {
        let contentOffset = collectionView.contentOffset
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
        collectionView.setContentOffset(contentOffset, animated: false)
    }
}

// MARK: - CollectionView delegate
extension CollectionController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataManger.shared.RSSDictionary[.travel]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "travelRSSCell", for: indexPath) as! TravelRSSCell
        
        if let unwrappedRSSItem = DataManger.shared.RSSDictionary[.travel]?[indexPath.row] {
            cell.cellConfig(rssItem:unwrappedRSSItem )
        }
        return cell
    }
    
    
}
