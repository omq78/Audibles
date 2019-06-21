//
//  PageCell.swift
//  Audible
//
//  Created by Omar Alqabbani on 6/18/19.
//  Copyright © 2019 OmarALqabbani. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    var page: Page?
    {
        didSet {
            guard let page = page else {
                return
            }
            pageImageView.image = UIImage(named: page.imageName)
//            pageTextView.text = "\(page.title)\n\n\(page.message)"
            let fontColor = UIColor(white: 0.2, alpha: 1)
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium), NSAttributedString.Key.foregroundColor: fontColor])
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.foregroundColor: fontColor]))
            let paragraphStylye = NSMutableParagraphStyle()
            paragraphStylye.alignment = .center
            let len = attributedText.string.count
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStylye, range: NSRange(location: 0, length: len))
            
            pageTextView.attributedText = attributedText
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let pageImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "page1")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let pageTextView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        return tv
    }()
    
    let lineSeperator: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(white: 0.9, alpha: 1)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    func setupLayout(){
        
        addSubview(pageTextView)
        pageTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        pageTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        pageTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        pageTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        addSubview(pageImageView)
        pageImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        pageImageView.bottomAnchor.constraint(equalTo: pageTextView.topAnchor).isActive = true
        pageImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        pageImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(lineSeperator)
        lineSeperator.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        lineSeperator.bottomAnchor.constraint(equalTo: pageTextView.topAnchor).isActive = true
        lineSeperator.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        lineSeperator.heightAnchor.constraint(equalToConstant: 1).isActive = true

    }
}
