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

    fileprivate func setupBottomControls() {
        
        let buttomControlsStackView = UIStackView(arrangedSubviews: [prevButton, pageControl, nextButton])
        buttomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttomControlsStackView.distribution = .fillEqually
        view.addSubview(buttomControlsStackView)
        
        NSLayoutConstraint.activate([
            buttomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    //make sure you correct encapsulation practicals in your classes
    private let prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrev() {
        let nextIndex = max(pageControl.currentPage - 1, pages.count + 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = .gray
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()
        
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

extension UIColor {
    static var mainPink = UIColor(red: 77/255, green: 94/255, blue: 172/255, alpha: 1)
}
