//
//  MMPresentHomeVC.swift
//  MM_TransitionDemo
//
//  Created by yangjie on 2019/8/8.
//  Copyright © 2019 yangjie. All rights reserved.
//

import UIKit

class MMPresentHomeVC: UIViewController {
    
    var presentBtn: UIButton?
    
    lazy var presentAnimator: MMModalBaseAnimator = MMModalBaseAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        presentBtn = UIButton.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        presentBtn?.setTitle("Present", for: .normal)
        presentBtn?.setTitleColor(.red, for: .normal)
        presentBtn!.center = CGPoint(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height * 0.5)
        presentBtn?.addTarget(self, action: #selector(handleBtnClick(sender:)), for: .touchUpInside)
        view.addSubview(presentBtn!)
    }
    

    @objc func handleBtnClick(sender: UIButton) -> Void {
        let secondVC = MMPresentSecondVC()
        
        secondVC.transitioningDelegate = self
        
        self.navigationController?.present(secondVC, animated: true, completion: nil)
    }
}
extension MMPresentHomeVC: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presentAnimator.transitionStyle = .pop
        return presentAnimator
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presentAnimator.transitionStyle = .present
        return presentAnimator
    }
}
