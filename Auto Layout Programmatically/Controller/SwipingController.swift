//
//  SwipingController.swift
//  UI Programmatically
//
//  Created by Olexsii Levchenko on 1/4/22.
//

import UIKit


class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    let pages = [
        Page(imageName: "1", headerText: "Join us today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? D'ont wait longer! We hope to see you in our store soon"),
        Page(imageName: "2", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of the savings immediately when we announc them on our website. Make sure to also give us any feadback you have."),
        Page(imageName: "3", headerText: "VIP special member service", bodyText: ""),
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        let pages = pages[indexPath.item]
        cell.page = pages
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
