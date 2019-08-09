//
//  MMModalBaseAnimator.swift
//  MM_TransitionDemo
//
//  Created by yangjie on 2019/8/8.
//  Copyright © 2019 yangjie. All rights reserved.
//

import UIKit

class MMModalBaseAnimator: NSObject,UIViewControllerAnimatedTransitioning {
    
    var transitionStyle: ViewTransitionStyle = ViewTransitionStyle.present
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        //fromVC
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let fromView = fromVC?.view
        fromView?.frame = CGRect(x: 0, y: 0, width: MMScreenWidth, height: MMScreenHeight)
        
        //toVC
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let toView = toVC?.view
        toView?.frame = CGRect(x: 0, y: 0, width: MMScreenWidth, height: MMScreenHeight)
        
//        let isPresent: Bool = transitionStyle == .present
        if transitionStyle == .present {
            containerView.addSubview(fromView!)
            containerView.addSubview(toView!)
            toView?.frame = (toView?.frame.offsetBy(dx: MMScreenWidth, dy: 0))!
            
        } else {
            containerView.addSubview(toView!)
            containerView.addSubview(fromView!)
        }
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            if self.transitionStyle == .present {
                toView?.mm_x = 0
            } else if self.transitionStyle == .dismiss {
                fromView?.mm_y = MMScreenHeight
            } else { //pop
                fromView?.frame = (fromView?.frame.offsetBy(dx: MMScreenWidth, dy: 0))!
            }
        }) { (finish) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
