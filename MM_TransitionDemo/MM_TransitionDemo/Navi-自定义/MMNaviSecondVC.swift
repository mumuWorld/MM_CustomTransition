//
//  MMPresentSecondInteractiveVC.swift
//  MM_TransitionDemo
//
//  Created by yangjie on 2019/8/8.
//  Copyright © 2019 yangjie. All rights reserved.
//

import UIKit

class MMNaviSecondVC: UIViewController {
    var presentBtn: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        
        presentBtn = UIButton.init(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        presentBtn?.setTitle("Pop", for: .normal)
        presentBtn!.center = CGPoint(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height * 0.5)
        presentBtn?.addTarget(self, action: #selector(handleBtnClick(sender:)), for: .touchUpInside)
        view.addSubview(presentBtn!)
    }
    
    @objc func handleBtnClick(sender: UIButton) -> Void {
//        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }

}
