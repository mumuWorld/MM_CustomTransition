//
//  MMNaviTransitionManager.swift
//  MM_TransitionDemo
//
//  Created by yangjie on 2019/8/8.
//  Copyright © 2019 yangjie. All rights reserved.
//

import UIKit

class MMNaviTransitionManager: NSObject {
    
    lazy var transitonAnimator: MMNaviTransitionAnimator = {
       let animator = MMNaviTransitionAnimator()
        animator.transitionType = ViewTransitionStyle.right_bottom
        return animator
    }()
    
    var needInteractor: Bool = false
    
    lazy var percentInteraction: MMNaviPercentInteractiveTransition = MMNaviPercentInteractiveTransition()
    
    
    var interactionEffectVC: UIViewController? {
        set {
            self.percentInteraction.setPopVC(popVC: newValue!)
        }
        get {
            return nil
        }
    }
    
}

extension MMNaviTransitionManager: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            transitonAnimator.transitionType = .right_bottom
            return transitonAnimator
        } else if operation == .pop {
            transitonAnimator.transitionType = .left_top
            return transitonAnimator
        }
        return nil
    }
    
    /// 返回百分比手势识别转换对象
    ///
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if needInteractor {
            return percentInteraction.interacting ? percentInteraction : nil
        }
        return nil
    }
}
