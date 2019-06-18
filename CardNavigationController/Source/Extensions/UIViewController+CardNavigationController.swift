//
//  UIViewController+CardNavigationController.swift
//  CardNavigationController
//
//  Created by Red Davis on 14/01/2019.
//  Copyright © 2019 Red Davis. All rights reserved.
//

import UIKit


public extension UIViewController
{
    // Public
    var cardNavigationController: CardNavigationController? {
        guard let parent = self.parent else
        {
            return nil
        }
        
        switch parent
        {
        case is UINavigationController:
            return parent.parent as? CardNavigationController
        default:
            return parent as? CardNavigationController
        }
    }
}
