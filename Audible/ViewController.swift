//
//  ViewController.swift
//  Audible
//
//  Created by Omar Alqabbani on 6/16/19.
//  Copyright © 2019 OmarALqabbani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    lazy var collectionView: UICollectionView = {
        let cvLayout = UICollectionViewFlowLayout()
        cvLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        cvLayout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: cvLayout)
        cv.backgroundColor = UIColor.white
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        return cv
    }()
    
    let cellID = "CellID"
    
    let pages: [Page] = {
        let page1 = Page(imageName: "page1", title: "Share a great listen", message: "It's free to send your books to the people in your life. Every recipient's first book is no us.")
        let page2 = Page(imageName: "page2", title: "Send from your library", message: "Tap the More menu next to any book. Choose \"Send this book\"")
        let page3 = Page(imageName: "page3", title: "Send from the player", message: "Tap the More menu in the upper corner. Choose \"Send this Book\"")
         return [page1, page2, page3]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
//        collectionView.frame = self.view.frame
//        set constraints instead
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        // Do any additional setup after loading the view.
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellID)
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? PageCell
     
        cell!.page = pages[indexPath.item]
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
}

