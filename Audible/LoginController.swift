//
//  ViewController.swift
//  Audible
//
//  Created by Omar Alqabbani on 6/16/19.
//  Copyright © 2019 OmarALqabbani. All rights reserved.
//

import UIKit

class LoginController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, LoginControllerDelegate {

    lazy var collectionView: UICollectionView = {
        let cvLayout = UICollectionViewFlowLayout()
        cvLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        cvLayout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: cvLayout)
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        return cv
    }()
    
    let cellID = "CellID"
    let loginPageCellID = "loginPageCellID"
    
    let pages: [Page] = {
        let page1 = Page(imageName: "page1", title: "Share a great listen", message: "It's free to send your books to the people in your life. Every recipient's first book is no us.")
        let page2 = Page(imageName: "page2", title: "Send from your library", message: "Tap the More menu next to any book. Choose \"Send this book\"")
        let page3 = Page(imageName: "page3", title: "Send from the player", message: "Tap the More menu in the upper corner. Choose \"Send this Book\"")
         return [page1, page2, page3]
    }()
    
    
    
    lazy var pageControl: UIPageControl = {
       let pc = UIPageControl()
        pc.pageIndicatorTintColor = .lightGray
        pc.currentPageIndicatorTintColor = UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1)
        pc.numberOfPages = self.pages.count + 1
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    lazy var skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(skipPages), for: .touchUpInside)
        return button
    }()
    

    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        return button
    }()

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.collectionViewLayout.invalidateLayout()
        DispatchQueue.main.async {
            self.collectionView.scrollToItem(at: IndexPath(row: self.pageControl.currentPage, section: 0), at: .centeredHorizontally, animated: true)
            self.collectionView.reloadData()
        }
    }
    
    @objc func skipPages(){
        pageControl.currentPage = pages.count - 1
        nextPage()
    }
    
    @objc func nextPage(){
        var page: Int = pageControl.currentPage
        if page >= pages.count {
            return
        } else {
            page += 1
            let indexPath = IndexPath(item: page, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = page
            if page == pages.count {
                lastPageView()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        registerCells()
        
        observeKeyboardNotifications()
    }
    
    
    private func observeKeyboardNotifications(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func keyboardShow(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            let viewHeight: CGFloat = UIDevice.current.orientation.isLandscape ? -120 : -50
            
            self.view.frame = CGRect(x: 0, y: viewHeight, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }
    
    @objc func keyboardHide(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }
    
    
    private func registerCells(){
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(LoginCell.self, forCellWithReuseIdentifier: loginPageCellID)
    }

    var pageControlBottomAnchor: NSLayoutConstraint?
    var skipButtonTopAnchor: NSLayoutConstraint?
    var nextButtonTopAnchor: NSLayoutConstraint?
    
    
    func setupComponents() {
        view.addSubview(collectionView)
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        view.addSubview(pageControl)
        pageControl.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        pageControlBottomAnchor = pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        pageControlBottomAnchor?.isActive = true
        pageControl.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(skipButton)
        skipButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        skipButtonTopAnchor = skipButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 32)
        skipButtonTopAnchor?.isActive = true
        skipButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        skipButton.heightAnchor.constraint(equalToConstant: 40).isActive = true


        view.addSubview(nextButton)
        nextButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nextButtonTopAnchor = nextButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 32)
        nextButtonTopAnchor?.isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count + 1
    }
    
    func finshLoggedIn(){
        dismiss(animated: true, completion: nil)
        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        guard let mainNavigaitonController = rootViewController as? MianNavigationController else {return}
        mainNavigaitonController.viewControllers = [MainPageController()]
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
     
        if indexPath.row == self.pages.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: loginPageCellID, for: indexPath) as? LoginCell
            
            cell?.delegate = self
            return cell!
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? PageCell
     
        cell!.page = pages[indexPath.item]
        
        return cell!
    }
    

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        view.endEditing(true)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
        
        if pageNumber == self.pages.count {
            lastPageView()
        } else {
            pageControlBottomAnchor?.constant = -16
            skipButtonTopAnchor?.constant = 32
            nextButtonTopAnchor?.constant = 32
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    func lastPageView(){
        pageControlBottomAnchor?.constant = 40
        skipButtonTopAnchor?.constant = -40
        nextButtonTopAnchor?.constant = -40
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
}

