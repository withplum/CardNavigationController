//
//  CardButtonItem.swift
//  CardNavigationController
//
//  Created by Red Davis on 14/01/2019.
//  Copyright © 2019 Red Davis. All rights reserved.
//

import UIKit


public final class CardButtonItem: UIButton
{
    // Public
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 50.0)
    }
    
    // MARK: Initialization
    
    public required init()
    {
        super.init(frame: .zero)
        
        // Style
        self.backgroundColor = UIColor(red: 212.0/255.0, green: 211.0/255.0, blue: 218.0/255.0, alpha: 1.0)
        self.setTitleColor(UIColor.darkText, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
        self.layer.cornerRadius = 8.0
    }
    
    public required init?(coder aDecoder: NSCoder)
    {
        abort()
    }
}
