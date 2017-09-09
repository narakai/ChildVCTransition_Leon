//
//  ViewController.swift
//  ChildVCTransition_Leon
//
//  Created by lai leon on 2017/9/9.
//  Copyright © 2017 clem. All rights reserved.
//

import UIKit

let YHRect = UIScreen.main.bounds
let YHHeight = YHRect.size.height
let YHWidth = YHRect.size.width

let JumpNotification = "JUMP"

class ViewController: UIViewController {

    var currentChildNumber = 0

    //最简单的转场实现方式，该方式是在rootVC的子VC之间转场

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupChild()
    }


    private func setupChild() {
        addChildViewController(ChildAVC())
        addChildViewController(ChildBVC())
        view.addSubview((childViewControllers.first?.view)!)

        //监听跳转通知，NotificationCenter通知中心
        NotificationCenter.default.addObserver(self, selector: #selector(jump),
                name: NSNotification.Name(rawValue: JumpNotification), object: nil)
    }

    func jump() {
        //options:跳转的方式
        transition(from: currentChildNumber == 0 ? childViewControllers.first! : childViewControllers.last!,
                to: currentChildNumber == 0 ? childViewControllers.last! : childViewControllers.first!,
                duration: 0.5,
                options: currentChildNumber == 0 ? .transitionFlipFromLeft : .transitionFlipFromRight,
                animations: nil,
                completion: nil)
        currentChildNumber = currentChildNumber == 0 ? 1 : 0
    }

    deinit {
        NotificationCenter.default.removeObserver(self,
                name: NSNotification.Name(rawValue: JumpNotification), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
