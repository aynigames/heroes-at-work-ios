//
//  TagsCollectionViewCell.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/27/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

protocol TagItemCellDelegate:NSObjectProtocol {
    
    func tagItemCell(_ sender:TagItemCell, didRemoveTag tag:CustomStringConvertible)
    
}

@IBDesignable class TagItemCell: UICollectionViewCell {
    
    // MARK: - Properties
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var removeButton: UIButton!
    
    var cornerRadius:CGFloat = 5.0 {
        didSet {
            if oldValue != cornerRadius {
                layer.cornerRadius = cornerRadius
            }
        }
    }

    var borderWidth:CGFloat = 1.0 {
        didSet {
            if oldValue != borderWidth {
                layer.borderWidth = borderWidth
            }
        }
    }
    
    var borderColor:UIColor = .lightGray {
        didSet {
            if oldValue != borderColor {
                layer.borderColor = borderColor.cgColor
            }
        }
    }
    
    var textColor:UIColor = .darkGray {
        didSet {
            if oldValue != textColor {
                titleLabel.textColor = textColor
            }
        }
    }
    
    var textFont:UIFont = UIFont.systemFont(ofSize: 16) {
        didSet {
            if oldValue != textFont {
                titleLabel.font = textFont
            }
        }
    }
    
    var removeBackgroundColor:UIColor = .red {
        didSet {
            if oldValue != removeBackgroundColor && removeButton != nil {
                removeButton.backgroundColor = removeBackgroundColor
            }
        }
    }
    
    var removeTextColor:UIColor = .white {
        didSet {
            if oldValue != removeTextColor && removeButton != nil {
                removeButton.setTitleColor(removeTextColor, for: .normal)
            }
        }
    }
    
    var showRemoveButton:Bool = true {
        didSet {
            let valueChange = oldValue != showRemoveButton
            if valueChange {
                // Perform changes only if value changes
                self.removeConstraints(constraints)
                setTitleLabelConstraints()
                
                if (showRemoveButton) {
                    addRemoveButton()
                } else {
                    removeButton.removeFromSuperview()
                    removeButton = nil
                }
            }
        }
    }
    
    var tagElement:CustomStringConvertible! {
        didSet {
            titleLabel.text = tagElement.description
        }
    }
    weak var delegate:TagItemCellDelegate?
    
    // MARK: - Lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTagItemCell()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTagItemCell()
    }
    
    // MARK: - Private
    func setupTagItemCell() {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        
        // Add Title Label
        titleLabel = UILabel()
        titleLabel.textColor = textColor
        titleLabel.font = textFont
        addSubview(titleLabel)
        setTitleLabelConstraints()
        
        // Add Remove Button
        if (showRemoveButton) {
            addRemoveButton()
        }
    }
    
    func setTitleLabelConstraints() {
        titleLabel.clipsToBounds = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 4).isActive = true
        if (!showRemoveButton) {
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -4).isActive = true
        }
    }
    
    func addRemoveButton() {
        removeButton = UIButton()
        removeButton.setTitle("X", for: .normal)
        removeButton.setTitleColor(removeTextColor, for: .normal)
        removeButton.backgroundColor = removeBackgroundColor
        removeButton.addTarget(self, action: #selector(removeButtonTapped(_:)), for: .touchUpInside)
        addSubview(removeButton)
        setRemoveButtonConstraints()
    }
    
    func setRemoveButtonConstraints() {
        removeButton.clipsToBounds = true
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        removeButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        removeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        removeButton.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 4).isActive = true
        removeButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        removeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    // MARK: - Actions
    @IBAction func removeButtonTapped(_ sender: UIButton) {
        delegate?.tagItemCell(self, didRemoveTag: tagElement)
    }
    
}
