//
//  CardNavigationController.swift
//  CardNavigationController
//
//  Created by Red Davis on 14/01/2019.
//  Copyright © 2019 Red Davis. All rights reserved.
//

import SnapKit
import UIKit


public final class CardNavigationController: UIViewController
{
    // Private
    private let rootViewController: UIViewController
    private var viewControllers = [UIViewController]()
    
    private let cardView: CardView
    private let maximumMaskBackgroundAlpha: CGFloat = 0.75
    
    private let maskView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.alpha = 0.0
        
        return view
    }()
    
    // MARK: Initialization
    
    /// Initializes and returns a newly created navigation controller.
    ///
    /// - Parameter rootViewController: The view controller that is at the start of the navigation stack.
    ///
    /// - Returns: A newly initialized `CardNavigationController` object.
    public required init(rootViewController: UIViewController)
    {
        self.rootViewController = rootViewController
        self.viewControllers = [rootViewController]
        self.cardView = CardView(view: rootViewController.view)
        
        super.init(nibName: nil, bundle: nil)
        
        self.addChild(self.rootViewController)
        self.modalPresentationStyle = .overCurrentContext
    }
    
    /// Unused
    public required init?(coder aDecoder: NSCoder)
    {
        abort()
    }
    
    // MARK: View lifecycle
    
    public override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Mask view
        self.view.addSubview(self.maskView)
        
        self.maskView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        // Mask tap gesture
        let maskViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.maskViewTapGestureEngaged(_:)))
        self.maskView.addGestureRecognizer(maskViewTapGesture)
        
        // Card view
        self.cardView.closeButton.addTarget(self, action: #selector(self.closeButtonTapped(_:)), for: .touchUpInside)
        self.view.addSubview(self.cardView)
        
        self.cardView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.bottom)
            make.left.equalToSuperview().inset(8.0)
            make.right.equalToSuperview().inset(8.0)
        }
        
        // Set initial appearance
        self.updateAppearance()
    }
    
    public override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        self.startPresentationAnimation()
    }
    
    // MARK: Appearance
    
    /// Updates the controllers UI
    private func updateAppearance()
    {
        guard let appearance = self.viewControllers.last as? CardNavigationControllerAppearance else
        {
            // Set default appearance
            self.cardView.closeButton.isHidden = true
            self.cardView.buttons = []
            
            return
        }
        
        self.cardView.closeButton.isHidden = appearance.closeButtonHidden
        self.cardView.buttons = appearance.actionButtons
    }
    
    // MARK: Animation
    
    private func startPresentationAnimation()
    {
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: [.curveEaseInOut], animations: {
            self.cardView.snp.remakeConstraints({ (make) in
                let bottomInset = self.view.safeAreaInsets.bottom > 0.0 ? 0.0 : 8.0
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(bottomInset)
                make.left.equalToSuperview().inset(8.0)
                make.right.equalToSuperview().inset(8.0)
            })
            
            self.view.layoutIfNeeded()
        }) { (_) in
            
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseInOut], animations: {
            self.maskView.alpha = self.maximumMaskBackgroundAlpha
        }, completion: nil)
    }
    
    private func startDismissAnimation(_ completionHandler: (() -> Void)? = nil)
    {
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: [.curveEaseInOut], animations: {
            self.cardView.snp.remakeConstraints({ (make) in
                make.top.equalTo(self.view.snp.bottom)
                make.left.equalToSuperview().inset(8.0)
                make.right.equalToSuperview().inset(8.0)
            })
            
            self.maskView.alpha = 0.0
            
            self.view.layoutIfNeeded()
        }) { (_) in
            super.dismiss(animated: false, completion: completionHandler)
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseInOut], animations: {
            self.maskView.alpha = 0.0
        }, completion: nil)
    }
    
    // MARK: API
    
    /// Pushes a view controller onto the stack.
    ///
    /// - Parameters:
    ///   - viewController: The view controller to push onto the stack
    ///   - animated: Set `true` to animate transition or false to not animate.
    public func pushViewController(_ viewController: UIViewController, animated: Bool)
    {
        self.viewControllers.append(viewController)
        self.addChild(viewController)
        
        let animation: CardView.AnimationStyle = animated ? .push : .none
        self.cardView.present(view: viewController.view, animation: animation)
        self.updateAppearance()
    }
    
    /// Pops the top view controller from the stack.
    ///
    /// - Parameter animated: Set `true` to animate transition or false to not animate.
    public func popViewController(animated: Bool)
    {
        guard self.viewControllers.count >= 2,
              let currentViewController = self.viewControllers.popLast(),
              let nextViewController = self.viewControllers.last else
        {
            return
        }
        
        currentViewController.removeFromParent()
        
        let animation: CardView.AnimationStyle = animated ? .dismiss : .none
        self.cardView.present(view: nextViewController.view, animation: animation)
        self.updateAppearance()
    }
    
    public override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil)
    {
        if !flag
        {
            super.dismiss(animated: false, completion: completion)
            return
        }
        
        self.startDismissAnimation(completion)
    }
    
    // MARK: Actions
    
    @objc private func closeButtonTapped(_ sender: Any)
    {
        self.startDismissAnimation()
    }
    
    // MARK: Gestures
    
    @objc private func maskViewTapGestureEngaged(_ gesture: UITapGestureRecognizer)
    {
        guard gesture.state == .ended else { return }
        self.startDismissAnimation()
    }
}
