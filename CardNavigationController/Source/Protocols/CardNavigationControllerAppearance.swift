//
//  CardNavigationControllerAppearance.swift
//  CardNavigationController
//
//  Created by Red Davis on 16/06/2019.
//  Copyright © 2019 Plum Fintech Limited. All rights reserved.
//

import UIKit


public protocol CardNavigationControllerAppearance
{
    var actionButtons: [UIButton] { get }
    var closeButtonHidden: Bool { get }
}


// MARK: Defaults

public extension CardNavigationControllerAppearance
{
    var actionButtons: [UIButton] { return [] }
    var closeButtonHidden: Bool { return true }
}
