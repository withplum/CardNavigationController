//
//  ViewController.swift
//  Example
//
//  Created by Red Davis on 11/06/2019.
//  Copyright © 2019 Plum Fintech Limited. All rights reserved.
//

import CardNavigationController
import SnapKit
import UIKit


internal final class RootViewController: UIViewController
{
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Present card button
        let presentCardButton = UIButton(type: .system)
        presentCardButton.setTitle("Present", for: .normal)
        presentCardButton.addTarget(self, action: #selector(self.presentCardButtonTapped(_:)), for: .touchUpInside)
        self.view.addSubview(presentCardButton)
        
        presentCardButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    // MARK: Actions
    
    @objc private func presentCardButtonTapped(_ sender: Any)
    {
        let viewController = PageOneViewController()
        
        let cardNavigationController = CardNavigationController(rootViewController: viewController)
        self.present(cardNavigationController, animated: false, completion: nil)
    }
}
