//
//  ViewController.swift
//  Auto Layout Programmatically
//
//  Created by Olexsii Levchenko on 12/28/21.
//

import UIKit
import Foundation

extension UIColor {
    static var mainPink = UIColor(red: 77/255, green: 94/255, blue: 172/255, alpha: 1)
}

class ViewController: UIViewController {

    
    
    //make sure you correct encapsulation practicals in your classes
    private let privButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = .gray
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hear's our entry point into our app
        //view.addSubview(descriptionTextView)
        
        //setupLayout()
        setupBottomControls()
    }
    
    
    
    fileprivate func setupBottomControls() {
        
        let buttomControlsStackView = UIStackView(arrangedSubviews: [privButton, pageControl, nextButton])
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

    
    
}

