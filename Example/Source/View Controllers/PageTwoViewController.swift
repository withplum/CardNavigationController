//
//  PageTwoViewController.swift
//  Example
//
//  Created by Red Davis on 18/06/2019.
//  Copyright © 2019 Plum Fintech Limited. All rights reserved.
//

import CardNavigationController
import UIKit


internal final class PageTwoViewController: IntroductionViewController
{
    // Private
    private let closeButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = UIColor(red: 0, green: 44.0/255.0, blue: 204.0/255.0, alpha: 1.0)
        view.setTitle("Close", for: .normal)
        view.setTitleColor(.white, for: .normal)
        
        view.snp.makeConstraints { (make) in
            make.height.equalTo(48.0)
        }
        
        return view
    }()
    
    private let joinButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = UIColor(red: 95.0/255.0, green: 10.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        view.setTitle("Join Plum!", for: .normal)
        view.setTitleColor(.white, for: .normal)
        
        view.snp.makeConstraints { (make) in
            make.height.equalTo(48.0)
        }
        
        return view
    }()
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.icon.image = UIImage(named: "Plum")
        self.titleLabel.text = "👫"
        self.detailLabel.text = """
        At Plum, we're on a mission to help everyone be financially better off.
        
        People all over the world are making bad financial decisions every day, due to lack of financial education, antiquated financial systems and temptation.
        
        In the UK alone, 50% of people have less than £100 in savings. We believe we can change that with great technology, data science and behavioural theory.
"""
        
        // Close button
        self.closeButton.addTarget(self, action: #selector(self.closeButtonTapped(_:)), for: .touchUpInside)
        
        // Join button
        self.joinButton.addTarget(self, action: #selector(self.joinButtonTapped(_:)), for: .touchUpInside)
    }
    
    // MARK: Actions
    
    @objc private func joinButtonTapped(_ sender: Any)
    {
        let url = URL(string: "https://withplum.workable.com")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @objc private func closeButtonTapped(_ sender: Any)
    {
        self.cardNavigationController?.dismiss(animated: true)
    }
}

extension PageTwoViewController:  CardNavigationControllerAppearance
{
    var actionButtons: [UIButton] {
        return [self.joinButton, self.closeButton]
    }
}
