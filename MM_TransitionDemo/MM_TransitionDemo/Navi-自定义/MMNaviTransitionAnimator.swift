//
//  MMNaviTransitionAnimator.swift
//  MM_TransitionDemo
//
//  Created by yangjie on 2019/8/8.
//  Copyright © 2019 yangjie. All rights reserved.
//

import UIKit

class MMNaviTransitionAnimator: NSObject,UIViewControllerAnimatedTransitioning {
    var transitionType: ViewTransitionStyle = .right_bottom
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        let fromVC = transitionContext.viewController(forKey: .from)
        let fromView = fromVC?.view
        fromView?.frame = CGRect(x: 0, y: 0, width: MMScreenWidth, height: MMScreenHeight)
        //toVC
        let toVC = transitionContext.viewController(forKey: .to)
        let toView = toVC?.view

        if  transitionType == .right_bottom {
            toView?.frame = CGRect(x: MMScreenWidth, y: MMScreenHeight, width: MMScreenWidth, height: MMScreenHeight)
            containerView.addSubview(fromView!)
            containerView.addSubview(toView!)
//        } else if  transitionType == .left_top {
        } else {
            toView?.frame = CGRect(x: 0, y: 0, width: MMScreenWidth, height: MMScreenHeight)
            containerView.addSubview(toView!)
            containerView.addSubview(fromView!)
        }
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 3, options: .curveEaseIn, animations: {
            if  self.transitionType == .right_bottom {
                toView?.mm_x = 0
                toView?.mm_y = 0
            } else if  self.transitionType == .left_top {
                fromView?.mm_x = MMScreenWidth
                fromView?.mm_y = MMScreenHeight
            }
        }) { (_) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }

    }
}
