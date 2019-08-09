//
//  MMNaviPercentInteractiveTransition.swift
//  MM_TransitionDemo
//
//  Created by yangjie on 2019/8/8.
//  Copyright © 2019 yangjie. All rights reserved.
//

import UIKit

class MMNaviPercentInteractiveTransition: UIPercentDrivenInteractiveTransition {
    var interacting: Bool = false
    
    var shouldComplete: Bool = false
    
    var presentingVC: UIViewController?
    
    var transitionStyle: ViewTransitionStyle = ViewTransitionStyle.left_top

    ///开始转场
    ///
    /// - Parameter transitionContext:transitionContext
    override func startInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        super.startInteractiveTransition(transitionContext)
    }
    
    public func setPopVC(popVC: UIViewController) -> Void {
        presentingVC = popVC
        let edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleInteractionGesture(sender:)))
        edgeGesture.edges = .left
        presentingVC?.view.addGestureRecognizer(edgeGesture)
    }
    
    @objc func handleInteractionGesture(sender: UIScreenEdgePanGestureRecognizer) {
        //手势偏移
        let translation: CGPoint = sender.translation(in: sender.view!)
//        let translation2: CGPoint = sender.translation(in: sender.view?.superview)
//        print("point1=\(translation),point2=\(translation2)")
        
        switch sender.state {
        case .began:
//            print("point1=\(translation),point2=\(translation2)")
            
            interacting = true
            presentingVC?.navigationController?.popViewController(animated: true)
            break
        case .changed:
            let percent = getPercent(offsetX: translation.x)
            if transitionStyle == .left_top {
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
    
    func getPercent(offsetX: CGFloat) -> CGFloat {
        let percent = MMScreenWidth
        return min(1, offsetX / percent)
    }
}
