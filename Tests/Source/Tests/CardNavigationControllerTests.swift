//
//  CardNavigationControllerTests.swift
//  CardNavigationControllerTests
//
//  Created by Red Davis on 11/06/2019.
//  Copyright © 2019 Plum Fintech Limited. All rights reserved.
//

import XCTest
@testable import CardNavigationController


internal final class CardNavigationControllerTests: XCTestCase
{
    // Private
    private var cardNavigationController: CardNavigationController!
    private var rootViewController: UIViewController!
    
    // MARK: Setup
    
    override func setUp()
    {
        self.rootViewController = UIViewController()
        self.cardNavigationController = CardNavigationController(rootViewController: self.rootViewController)
    }

    override func tearDown()
    {
        
    }

    // MARK: Tests
    
    internal func testTopViewController()
    {
        // Root view controller
        XCTAssertEqual(self.cardNavigationController.topViewController, self.rootViewController)
        
        // Pushed view controller
        let viewController = UIViewController()
        self.cardNavigationController.pushViewController(viewController, animated: false)
        XCTAssertEqual(self.cardNavigationController.topViewController, viewController)
    }
    
    internal func testPushingViewController()
    {
        let viewController = UIViewController()
        
        XCTAssertEqual(self.cardNavigationController.viewControllers.count, 1)
        self.cardNavigationController.pushViewController(viewController, animated: false)
        XCTAssertEqual(self.cardNavigationController.viewControllers.count, 2)
    }
    
    internal func testPoppingViewController()
    {
        let viewController = UIViewController()
        self.cardNavigationController.pushViewController(viewController, animated: false)
        XCTAssertEqual(self.cardNavigationController.viewControllers.count, 2)
        
        self.cardNavigationController.popViewController(animated: false)
        XCTAssertEqual(self.cardNavigationController.viewControllers.count, 1)
        XCTAssertEqual(self.cardNavigationController.topViewController, self.rootViewController)
    }
}
