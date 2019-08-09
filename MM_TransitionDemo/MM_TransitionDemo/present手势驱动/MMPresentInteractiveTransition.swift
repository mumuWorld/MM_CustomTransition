//
//  MMPresentInteractiveAnimator.swift
//  MM_TransitionDemo
//
//  Created by yangjie on 2019/8/8.
//  Copyright © 2019 yangjie. All rights reserved.
//

import UIKit

class MMPresentInteractiveTransition: UIPercentDrivenInteractiveTransition {
    var shouldComplete: Bool = false
    
    var presentingVC: UIViewController?
    
    var interacting: Bool = false
    
    var transitionStyle: ViewTransitionStyle = ViewTransitionStyle.dismiss

    func wireToViewController(vc: UIViewController) -> Void {
        presentingVC = vc
        let edge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handlePanGesture(sender:)))
        edge.edges = .left
        vc.view.addGestureRecognizer(edge)
    }
    
    func getPercent(offsetX: CGFloat) -> CGFloat {
        let percent = MMScreenWidth
        return min(1, offsetX / percent)
    }
    
    @objc func handlePanGesture(sender: UIPanGestureRecognizer) -> Void {
        //手势偏移
        let translation: CGPoint = sender.translation(in: sender.view!)
        let translation2: CGPoint = sender.translation(in: sender.view?.superview)
        print("point1=\(translation),point2=\(translation2)")

        switch sender.state {
        case .began:
            print("point1=\(translation),point2=\(translation2)")
            
            interacting = true
            presentingVC?.dismiss(animated: true, completion: nil)
            break
        case .changed:
            let percent = getPercent(offsetX: translation.x)
            if transitionStyle == .pop {
                shouldComplete = percent > 0.3
            } else { //dismiss
                shouldComplete = percent > 0.4
            }
            update(percent)
            break
        case .cancelled ,.ended:
            interacting = false
            if shouldComplete == false || sender.state == .cancelled {
                cancel()
            } else {
                finish()
            }
            break
        default:
            break;
        }
    }
}
