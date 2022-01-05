//
//  SwipingController.swift
//  UI Programmatically
//
//  Created by Olexsii Levchenko on 1/4/22.
//

import UIKit


class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        //cell.backgroundColor = indexPath.item % 2 == 0 ? .white : .yellow
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
