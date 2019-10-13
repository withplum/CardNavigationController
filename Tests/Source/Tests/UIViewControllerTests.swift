//
//  UIViewControllerTests.swift
//  CardNavigationControllerTests
//
//  Created by Red Davis on 19/06/2019.
//  Copyright © 2019 Plum Fintech Limited. All rights reserved.
//

import XCTest
@testable import CardNavigationController


internal final class UIViewControllerTests: XCTestCase
{
    // MARK: Setup
    
    override func setUp()
    {
        
    }
    
    override func tearDown()
    {
        
    }
    
    // MARK: Tests
    
    internal func testCardNavigationControllerAccessor()
    {
        let viewController = UIViewController()
        XCTAssertNil(viewController.cardNavigationController)
        
        let cardNavigationController = CardNavigationController(rootViewController: viewController)
        XCTAssertEqual(viewController.cardNavigationController, cardNavigationController)
    }
}
