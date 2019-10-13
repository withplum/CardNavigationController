//
//  PageOneViewController.swift
//  Example
//
//  Created by Red Davis on 17/06/2019.
//  Copyright © 2019 Plum Fintech Limited. All rights reserved.
//

import CardNavigationController
import UIKit


internal final class PageOneViewController: IntroductionViewController
{
    // Private
    private let nextButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = UIColor(red: 0, green: 44.0/255.0, blue: 204.0/255.0, alpha: 1.0)
        view.setTitle("Next", for: .normal)
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
        self.titleLabel.text = "Plum"
        self.detailLabel.text = "The AI assistant that grows your money. Save more, invest in things that matter and reduce those pesky bills."
        
        // Next button
        self.nextButton.addTarget(self, action: #selector(self.nextButtonTapped(_:)), for: .touchUpInside)
    }
    
    // MARK: Actions
    
    @objc private func nextButtonTapped(_ sender: Any)
    {
        let controller = PageTwoViewController()
        self.cardNavigationController?.pushViewController(controller, animated: true)
    }
}

extension PageOneViewController:  CardNavigationControllerAppearance
{
    var actionButtons: [UIButton] {
        return [self.nextButton]
    }
    
    var closeButtonHidden: Bool { return false }
}
