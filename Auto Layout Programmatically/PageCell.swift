//
//  PageCell.swift
//  UI Programmatically
//
//  Created by Olexsii Levchenko on 1/5/22.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    let bearImageView: UIImageView = {
        let image = UIImage(named: "bear")
        let imageView = UIImageView(image: image)
        
        //this enables autolayout for our bearimageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let atributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        atributedText.append(NSAttributedString(
            string: "\n\n\n Are you ready for loads and loads of fun? D'ont wait longer! We hope to see you in our store soon", attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
                NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = atributedText
        

        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    private func setupLayout() {
        
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        //enable auto layout
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.addSubview(bearImageView)
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive  = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6).isActive = true
        
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
