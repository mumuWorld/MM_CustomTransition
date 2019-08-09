//
//  MMNaviFirstVC.swift
//  MM_TransitionDemo
//
//  Created by yangjie on 2019/8/8.
//  Copyright © 2019 yangjie. All rights reserved.
//

import UIKit

class MMNaviFirstVC: UIViewController {
    var presentBtn: UIButton?

    lazy var transitionMangager: MMNaviTransitionManager = MMNaviTransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        presentBtn = UIButton.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        presentBtn?.setTitle("Push", for: .normal)
        presentBtn?.setTitleColor(.red, for: .normal)
        presentBtn!.center = CGPoint(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height * 0.5)
        presentBtn?.addTarget(self, action: #selector(handleBtnClick(sender:)), for: .touchUpInside)
        view.addSubview(presentBtn!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.delegate = nil
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        let animate = CABasicAnimation(keyPath: "positon.y")
//        animate.fromValue = 0
//        animate.toValue = -64
//        self.navigationController?.navigationBar.layer.add(animate, forKey: nil)
    }
    @objc func handleBtnClick(sender: UIButton) -> Void {
        let secondVC = MMNaviSecondVC()
        self.navigationController?.delegate = transitionMangager
//        secondVC.transitioningDelegate = self
        
//        interactiveTransition.wireToViewController(vc: secondVC)
        self.navigationController?.pushViewController(secondVC, animated: true)
    }

}

