//
//  MMNaviFirstInteractiveVC.swift
//  MM_TransitionDemo
//
//  Created by yangjie on 2019/8/8.
//  Copyright © 2019 yangjie. All rights reserved.
//

import UIKit

class MMNaviFirstInteractiveVC: UIViewController {
    
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
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.delegate = nil
    }
    
    @objc func handleBtnClick(sender: UIButton) -> Void {
        let secondVC = MMNaviSecondInteractiveVC()
        secondVC.transitonDelegate = transitionMangager
        self.navigationController?.delegate = transitionMangager
        transitionMangager.needInteractor = true
        transitionMangager.interactionEffectVC = secondVC
        self.navigationController?.pushViewController(secondVC, animated: true)
    }


}
