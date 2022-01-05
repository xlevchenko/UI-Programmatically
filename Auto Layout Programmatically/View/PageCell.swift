//
//  PageCell.swift
//  UI Programmatically
//
//  Created by Olexsii Levchenko on 1/5/22.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let unwrrapedPage = page else { return }
            
            let atributedText = NSMutableAttributedString(string: unwrrapedPage.headerText, attributes: [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
            atributedText.append(NSAttributedString(string: "\n\n\n\"\(unwrrapedPage.bodyText)", attributes: [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
                    NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            topImage.image = UIImage(named: unwrrapedPage.imageName)
            descriptionTextView.attributedText = atributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //enable auto layout
        setupLayout()
        
    }
    
    
    private let topImage: UIImageView = {
        let imageView = UIImageView()
        
        //this enables autolayout for our bearimageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    private func setupLayout() {
        
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.addSubview(topImage)
        topImage.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        topImage.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive  = true
        topImage.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6).isActive = true
        
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
