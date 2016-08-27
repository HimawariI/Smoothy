//
//  ViewController.swift
//  Smoothy
//
//  Created by MIKI on 2016/08/27.
//  Copyright © 2016年 HackUmeko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var xConstraint: NSLayoutConstraint!
    @IBOutlet weak var yConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func panLabel(sender: UIPanGestureRecognizer) {
        
        //移動量を取得する。
        let move:CGPoint = sender.translationInView(view)
        //ラベルの位置の制約に移動量を加算する。
        xConstraint.constant += move.x
        yConstraint.constant += move.y
        
        //画面表示を更新する。
        view.layoutIfNeeded()
        
        //ラベルに現在座標を表示する。
        testLabel.text = "\(sender.view!.frame.origin.x), \(sender.view!.frame.origin.y)"
        
        //移動量を0にする。
        sender.setTranslation(CGPointZero, inView:view)
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

