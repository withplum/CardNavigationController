//
//  CardView.swift
//  CardNavigationController
//
//  Created by Red Davis on 14/01/2019.
//  Copyright © 2019 Red Davis. All rights reserved.
//

import UIKit


internal final class CardView: UIView
{
    // Internal
    internal var buttons = [UIButton]() {
        didSet
        {
            self.updateButtons()
        }
    }
    
    internal let closeButton: UIButton = {
        let view = UIButton(type: .custom)
        view.setImage(UIImage(named: "CloseButton", in: Bundle(for: CardView.self), compatibleWith: nil), for: .normal)
        
        return view
    }()
    
    // Private
    private let container = UIView()
    private let contentContainer = UIView()
    private var content: UIView
    
    private let buttonStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        
        return view
    }()
    
    // MARK: Initialization
    
    internal required init(view: UIView)
    {
        self.content = view
        
        super.init(frame: .zero)
        
        // Style
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 16.0
        self.layer.masksToBounds = true
        
        // Container
        self.addSubview(self.container)
        
        self.container.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview().inset(28.0)
            make.bottom.equalToSuperview()
        }
        
        // Button stack view
        self.container.addSubview(self.buttonStackView)

        self.buttonStackView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        // Content container
        self.container.addSubview(self.contentContainer)
        
        self.contentContainer.snp.makeConstraints { (make) in
            make.left.equalToSuperview().inset(16.0)
            make.right.equalToSuperview().inset(16.0)
            make.bottom.equalTo(self.buttonStackView.snp.top).offset(-15.0)
            make.top.equalToSuperview()
        }
        
        // Add first view
        self.contentContainer.addSubview(self.content)
        
        self.content.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        // Close button
        self.addSubview(self.closeButton)
        
        self.closeButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(20.0)
            make.right.equalToSuperview().inset(20.0)
        }
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        abort()
    }
    
    // MARK: UI
    
    private func updateButtons()
    {
        // Remove current buttons
        for view in self.buttonStackView.arrangedSubviews
        {
            self.buttonStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        
        for button in self.buttons
        {
            self.buttonStackView.addArrangedSubview(button)
            
            button.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
            }
        }
    }
    
    internal func present(view: UIView, animation: AnimationStyle)
    {
        switch animation
        {
        case .push:
            self.contentContainer.addSubview(view)
            
            view.snp.makeConstraints { (make) in
                make.left.equalTo(self.snp.right)
                make.centerY.equalToSuperview()
            }
            
            self.layoutIfNeeded()
            
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
                self.content.snp.remakeConstraints({ (make) in
                    make.right.equalTo(self.snp.left)
                    make.centerY.equalToSuperview()
                })
                
                view.snp.remakeConstraints { (make) in
                    make.edges.equalToSuperview()
                }
                
                self.layoutIfNeeded()
            }) { (_) in
                self.content.removeFromSuperview()
                self.content = view
            }
        case .dismiss:
            self.contentContainer.addSubview(view)
            
            view.snp.makeConstraints { (make) in
                make.right.equalTo(self.snp.left)
                make.centerY.equalToSuperview()
            }
            
            self.layoutIfNeeded()
            
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
                self.content.snp.remakeConstraints({ (make) in
                    make.left.equalTo(self.snp.right)
                    make.centerY.equalToSuperview()
                })
                
                view.snp.remakeConstraints { (make) in
                    make.edges.equalToSuperview()
                }
                
                self.layoutIfNeeded()
            }) { (_) in
                self.content.removeFromSuperview()
                self.content = view
            }
        case .none:
            self.contentContainer.addSubview(view)
            self.content.removeFromSuperview()
            self.content = view
            
            view.snp.remakeConstraints { (make) in
                make.edges.equalToSuperview()
            }
        }
    }
}


// MARK: Presentation style

internal extension CardView
{
    enum AnimationStyle
    {
        case none
        case push
        case dismiss
    }
}
