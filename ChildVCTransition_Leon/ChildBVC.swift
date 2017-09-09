//
//  ChildAVC.swift
//  ChildVCTransition_Leon
//
//  Created by lai leon on 2017/9/9.
//  Copyright © 2017 clem. All rights reserved.
//

import UIKit

class ChildBVC: UIViewController {

    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 60, width: YHWidth - 20, height: 20))
        label.text = "Controller B"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue

        //添加一个点击手势
        let tap = UITapGestureRecognizer(target: self, action: #selector(jump))
        view.addGestureRecognizer(tap)

        view.addSubview(label)

        // Do any additional setup after loading the view.
    }

    func jump() {
        //发送跳转通知
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: JumpNotification), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
