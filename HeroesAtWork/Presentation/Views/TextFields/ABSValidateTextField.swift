//
//  ValidateTextField.swift
//  Nuevo Mundo
//
//  Created by Arturo Gamarra on 6/24/15.
//  Copyright (c) 2015 Nuevo Mundo. All rights reserved.
//

import UIKit

@IBDesignable class ABSValidateTextField: UITextField {
    
    // MARK: - Properties
    fileprivate var enableBorderStyle:UITextBorderStyle!
    fileprivate var enableColor:UIColor!
    
    @IBInspectable var disableTrimText:Bool = false
    @IBInspectable var maxNumberOfCharacters:Int = Int.max
    @IBInspectable var iconLocationRight:Bool = false {
        didSet {
            self.setupIcon(withImage: self.icon)
        }
    }
    @IBInspectable var iconTopPadding:CGFloat = 0 {
        didSet {
            self.setupIcon(withImage: self.icon)
        }
    }
    @IBInspectable var iconRightPadding:CGFloat = 0 {
        didSet {
            self.setupIcon(withImage: self.icon)
        }
    }
    @IBInspectable var iconBottomPadding:CGFloat = 0 {
        didSet {
            self.setupIcon(withImage: self.icon)
        }
    }
    @IBInspectable var iconLeftPadding:CGFloat = 0 {
        didSet {
            self.setupIcon(withImage: self.icon)
        }
    }
    @IBInspectable var icon:UIImage? {
        didSet {
            self.setupIcon(withImage: self.icon)
        }
    }
    @IBInspectable var placeHolderColor: UIColor = UIColor.darkGray {
        didSet {
            self.setupPlaceHolder(withColor: self.placeHolderColor)
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            self.borderStyle = isEnabled ? self.enableBorderStyle : .none
            self.backgroundColor = isEnabled ? self.enableColor : UIColor.clear
        }
    }
    override var text: String? {
        get {
            if (!self.disableTrimText && !self.isSecureTextEntry) {
                return super.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            }
            return super.text
        }
        set {
            super.text = newValue
        }
    }
    var valid:Bool = true {
        didSet {
            if (!self.valid) {
                self.layoutIfNeeded()
                self.layer.borderWidth = 1.0
                self.layer.cornerRadius = 5.0
                self.layer.borderColor = UIColor.red.cgColor
            } else {
                self.layoutIfNeeded()
                self.layer.borderWidth = 0
                self.layer.cornerRadius = 0
                self.layer.borderColor = UIColor.clear.cgColor
            }
        }
    }
    
    // MARK: - Lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupValidateTextField()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupValidateTextField()
    }
    
    // MARK: - Private 
    fileprivate func setupValidateTextField() {
        self.clipsToBounds = true
        self.enableColor = self.backgroundColor
        self.enableBorderStyle = self.borderStyle
        self.setupPlaceHolder(withColor: self.placeHolderColor)
        self.addTarget(self, action:#selector(self.textFieldEditingChanged(_:)), for:.editingChanged)
    }
    
    fileprivate func setupIcon(withImage icon:UIImage?) {
        guard let image = icon else {
            self.setIconView(nil)
            return
        }
        let leftPadding = self.iconLeftPadding + (!self.iconLocationRight ? 4: 0)
        let height = self.bounds.height - 6
        let width = image.size.width * height / image.size.height
        let view = UIView(frame: CGRect(x: 0, y: 0, width: width+4, height: self.bounds.height))
        let imageView = UIImageView(frame: CGRect(x: leftPadding, y: self.iconTopPadding+3, width: width-leftPadding-self.iconRightPadding, height: height-self.iconTopPadding-self.iconBottomPadding))
        imageView.image = image
        view.addSubview(imageView)
        
        self.setIconView(view)
    }
    
    fileprivate func setupPlaceHolder(withColor color: UIColor) {
        if let text = self.placeholder {
            self.attributedPlaceholder = NSAttributedString(string: text, attributes:[NSAttributedStringKey.foregroundColor: color])
        }
    }
    
    fileprivate func setIconView(_ view:UIView?) {
        if (self.iconLocationRight) {
            self.leftView = nil
            self.rightView = view
            self.rightViewMode = view != nil ? .always : .never
        } else {
            self.leftView = view
            self.rightView = nil
            self.leftViewMode = view != nil ? .always : .never
        }
    }
    
    // MARK: - Public
    func replaceRegex() -> NSRegularExpression? {
        return nil
    }
    
    // MARK: - Actions
    @IBAction func textFieldEditingChanged(_ sender:UITextField) {
        self.undoManager?.removeAllActions()
        self.valid = true
        if let regex = self.replaceRegex() {
            var cursorPosition = self.offset(from: self.beginningOfDocument, to: self.selectedTextRange!.start)
            let length = super.text!.count
            super.text = regex.stringByReplacingMatches(in: super.text!, options:.reportProgress, range:NSMakeRange(0, length), withTemplate: "")
            let countCursorMove = super.text!.count - length
            
            //Set cursor position
            cursorPosition = cursorPosition + countCursorMove
            if let targetPosition = self.position(from: self.beginningOfDocument, offset: cursorPosition) {
                self.selectedTextRange = self.textRange(from: targetPosition, to: targetPosition)
            }
        }
        
        if (self.maxNumberOfCharacters < super.text!.count && self.maxNumberOfCharacters != 0) {
            let index = super.text!.index(super.text!.startIndex, offsetBy: self.maxNumberOfCharacters)
            super.text = String(super.text![index...])
        }
    }
}
