//
//  TagView.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 2/4/18.
//  Copyright © 2018 AyniGames. All rights reserved.
//

import UIKit
import AlignedCollectionViewFlowLayout

@IBDesignable class TagView: ABSRoundedBorderView {
    
    // MARK: - Constants
    private let cellIdentifier = "tagCell"

    // MARK: - Properties Private
    private var collectionView: UICollectionView!
    private var paddingTopCollectionViewConstraint:NSLayoutConstraint?
    private var paddingRightCollectionViewConstraint:NSLayoutConstraint?
    private var paddingLeftCollectionViewConstraint:NSLayoutConstraint?
    private var paddingBottomCollectionViewConstraint:NSLayoutConstraint?
    
    // MARK: - Properties Inspectables
    @IBInspectable var paddingTop:CGFloat = 0.0 {
        didSet {
            paddingTopCollectionViewConstraint?.constant = -paddingTop
        }
    }
    @IBInspectable var paddingRight:CGFloat = 0.0 {
        didSet {
            paddingRightCollectionViewConstraint?.constant = paddingRight
        }
    }
    @IBInspectable var paddingLeft:CGFloat = 0.0 {
        didSet {
            paddingBottomCollectionViewConstraint?.constant = paddingLeft
        }
    }
    @IBInspectable var paddingBotton:CGFloat = 0.0 {
        didSet {
            paddingLeftCollectionViewConstraint?.constant = -paddingBotton
        }
    }
    @IBInspectable var tagSpacing:CGFloat = 10.0 {
        didSet {
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.minimumLineSpacing = tagSpacing
            layout.minimumInteritemSpacing = tagSpacing
        }
    }
    @IBInspectable var tagHasRemoveButton:Bool = true {
        didSet {
            collectionView.reloadData()
        }
    }
    @IBInspectable var tagBackgroundColor:UIColor = .white {
        didSet {
            collectionView.reloadData()
        }
    }
    @IBInspectable var tagCornerRadius:CGFloat = 5.0 {
        didSet {
            collectionView.reloadData()
        }
    }
    @IBInspectable var tagBorderWidth:CGFloat = 1.0 {
        didSet {
            collectionView.reloadData()
        }
    }
    @IBInspectable var tagBorderColor:UIColor = .lightGray {
        didSet {
            collectionView.reloadData()
        }
    }
    @IBInspectable var tagTextColor:UIColor = .darkGray {
        didSet {
            collectionView.reloadData()
        }
    }
    @IBInspectable var tagTextFont:UIFont = UIFont.systemFont(ofSize: 16) {
        didSet {
            collectionView.reloadData()
        }
    }
    @IBInspectable var tagRemoveBackgroundColor:UIColor = .red {
        didSet {
            collectionView.reloadData()
        }
    }
    @IBInspectable var tagRemoveTextColor:UIColor = .white {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var tags:[CustomStringConvertible] = []
    
    // MARK: - Lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
        tags = text.split(separator: " ")
        
        self.setupTagView()
        self.registerTagItemView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
        tags = text.split(separator: " ")
        
        self.setupTagView()
        self.registerTagItemView()
    }
    
    // MARK: - Private
    private func setupTagView() {
        let layout = AlignedCollectionViewFlowLayout(horizontalAlignment: .left, verticalAlignment: .top)
        layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        layout.minimumLineSpacing = tagSpacing
        layout.minimumInteritemSpacing = tagSpacing
            
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.dataSource = self
        collectionView.delegate = self
        addSubview(collectionView)
        
        paddingTopCollectionViewConstraint = self.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: -paddingTop)
        paddingRightCollectionViewConstraint = self.rightAnchor.constraint(equalTo: collectionView.rightAnchor, constant: paddingRight)
        paddingBottomCollectionViewConstraint = self.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: paddingBotton)
        paddingLeftCollectionViewConstraint = self.leftAnchor.constraint(equalTo: collectionView.leftAnchor, constant: -paddingLeft)
        
        paddingTopCollectionViewConstraint?.isActive = true
        paddingRightCollectionViewConstraint?.isActive = true
        paddingBottomCollectionViewConstraint?.isActive = true
        paddingLeftCollectionViewConstraint?.isActive = true
    }
    
    private func registerTagItemView() {
        collectionView.register(TagItemCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
}

extension TagView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! TagItemCell
        cell.showRemoveButton = tagHasRemoveButton
        cell.backgroundColor = tagBackgroundColor
        cell.cornerRadius = tagCornerRadius
        cell.borderWidth = tagBorderWidth
        cell.borderColor = tagBorderColor
        cell.textColor = tagTextColor
        cell.textFont = tagTextFont
        cell.removeBackgroundColor = tagRemoveBackgroundColor
        cell.removeTextColor = tagRemoveTextColor
        cell.tagElement = tags[indexPath.item]
        cell.delegate = self
        return cell
    }
}

extension TagView: UICollectionViewDelegate {
    
}

extension TagView: TagItemCellDelegate {
    
    func tagItemCell(_ sender: TagItemCell, didRemoveTag tag: CustomStringConvertible) {
        if let indexPath = collectionView.indexPath(for: sender) {
            tags.remove(at: indexPath.item)
            collectionView.deleteItems(at: [indexPath])
            // Call another delegate
        }
    }
    
}
