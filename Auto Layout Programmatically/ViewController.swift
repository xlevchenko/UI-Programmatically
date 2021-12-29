//
//  ViewController.swift
//  Auto Layout Programmatically
//
//  Created by Olexsii Levchenko on 12/28/21.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    let bearimageView: UIImageView = {
        let image = UIImage(named: "bear")
        let imageView = UIImageView(image: image)
        //this enables autolayout for our bearimageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Join us today in our fun and games!"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // hear's our entry point into our app
        
        view.addSubview(bearimageView)
        view.addSubview(descriptionTextView)
        
        setupLayout()
    }

    private func setupLayout() {
        bearimageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bearimageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        bearimageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        bearimageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: bearimageView.bottomAnchor, constant: 80).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
}

