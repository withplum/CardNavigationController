//
//  IntroductionViewController.swift
//  Example
//
//  Created by Red Davis on 17/06/2019.
//  Copyright © 2019 Plum Fintech Limited. All rights reserved.
//

import UIKit


internal class IntroductionViewController: UIViewController
{
    // Internal
    internal let icon = UIImageView()
    
    internal let titleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 20.0, weight: .semibold)
        view.textAlignment = .center
        
        return view
    }()
    
    internal let detailLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18.0, weight: .regular)
        view.textAlignment = .center
        view.numberOfLines = 0
        
        return view
    }()
    
    // Private
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 16.0
        
        return view
    }()
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Container
        let container = UIView()
        self.view.addSubview(container)
        
        container.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        // Stack view
        container.addSubview(self.stackView)
        
        self.stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        // Icon
        self.stackView.addArrangedSubview(self.icon)
        
        // Title label
        self.stackView.addArrangedSubview(self.titleLabel)
        self.stackView.setCustomSpacing(8.0, after: self.titleLabel)
        
        // Detail label
        self.stackView.addArrangedSubview(self.detailLabel)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    }
}
