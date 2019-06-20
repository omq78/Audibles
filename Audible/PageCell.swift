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
    
    func setupLayout(){
        addSubview(pageImageView)
        pageImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        pageImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        pageImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        pageImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
