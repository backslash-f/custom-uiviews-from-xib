//
//  Pokemon.swift
//  CustomUIViewFromXib
//
//  Created by Fernando Fernandes on 7/21/16.
//  Copyright © 2016 singledev. All rights reserved.
//

import UIKit

@IBDesignable class Pokemon: UIView {
    
    // MARK: - Properties
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBInspectable var image: UIImage? {
        get {
            return imageView.image
        }
        set(image) {
            imageView.image = image
        }
    }
    
    // MARK: - Actions
    
    @IBAction func switchTapped(sender: UISwitch) {
        imageView.alpha = sender.on ? 1.0 : 0.2
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Private Helper Methods
    
    // Performs the initial setup.
    private func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds
        view.autoresizingMask = [
            UIViewAutoresizing.FlexibleWidth,
            UIViewAutoresizing.FlexibleHeight
        ]
        addSubview(view)
    }
    
    // Loads a XIB file into a view and returns this view.
    private func viewFromNibForClass() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: String(self.dynamicType), bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
}
