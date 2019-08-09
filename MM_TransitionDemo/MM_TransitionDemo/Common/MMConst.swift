//
//  MMConst.swift
//  MM_TransitionDemo
//
//  Created by yangjie on 2019/8/8.
//  Copyright © 2019 yangjie. All rights reserved.
//

import UIKit

let MMScreenWidth = UIScreen.main.bounds.size.width;

let MMScreenHeight = UIScreen.main.bounds.size.height;


/// view 转换方式
enum ViewTransitionStyle {
    case present,dismiss,push,pop
    case right_bottom,left_top
}
