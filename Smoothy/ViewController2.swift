//
//  ViewController2.swift
//  Smoothy
//
//  Created by MIKI on 2016/08/27.
//  Copyright © 2016年 HackUmeko. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var apple: UIImageView!
    
    @IBOutlet weak var banana: UIImageView!

    @IBOutlet weak var tomato: UIImageView!
    
    @IBOutlet weak var orange: UIImageView!
    
    
    @IBOutlet var checkLabel: UILabel!
    
    @IBOutlet weak var appleY: NSLayoutConstraint!
    
    @IBOutlet weak var appleX: NSLayoutConstraint!
    @IBOutlet weak var bananaX: NSLayoutConstraint!
    @IBOutlet weak var bananaY: NSLayoutConstraint!
    @IBOutlet weak var tomatoY: NSLayoutConstraint!
    @IBOutlet weak var tomatoX: NSLayoutConstraint!
    @IBOutlet weak var orangeY: NSLayoutConstraint!
    @IBOutlet weak var orangeX: NSLayoutConstraint!
    
    
    @IBOutlet var shakeLabel: UILabel!


    
    
    //ミキサーに入ったかどうかを確認する配列
    var fruit:[Bool]=[false,false,false,false]
    
    //checkメソッドで使った変数
    var isIn = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func panApple(sender: UIPanGestureRecognizer) {
        
        
        var x1: CGFloat
        var y1: CGFloat
        
        //移動量を取得する。
        let move:CGPoint = sender.translationInView(view)
        
        //ドラッグした部品の座標に移動量を加算する。
        //sender.view!.center.x += move.x
        //sender.view!.center.y += move.y
        
        //ラベルの位置の制約に移動量を加算する。
        appleX.constant += move.x
        appleY.constant += move.y
        
        //画面表示を更新する。
        view.layoutIfNeeded()

        
        x1 =  (sender.view!.center.x)
        y1 =  (sender.view!.center.y)
    
        
        if(check(x1,y:y1) == true){
            print("りんごIn")
             fruit[0] = true
        }else{
            print("りんごOut")
            fruit[0] = false
        }
       

        //現在位置を表示
        //print("りんご")
        //print("\(sender.view!.frame.origin.x), \(sender.view!.frame.origin.y)")
        
        //移動量を0にする。
        sender.setTranslation(CGPointZero, inView:view)
        
        checkArray(fruit)
    }
    
    
    @IBAction func panBanana(sender: UIPanGestureRecognizer) {
        
        var x2: CGFloat
        var y2: CGFloat
        
        //移動量を取得する。
        let move:CGPoint = sender.translationInView(view)
        
        //ドラッグした部品の座標に移動量を加算する。
      //  sender.view!.center.x += move.x
      //  sender.view!.center.y += move.y
        
        //ラベルの位置の制約に移動量を加算する。
        bananaX.constant += move.x
        bananaY.constant += move.y
        
        //画面表示を更新する。
        view.layoutIfNeeded()
        
        x2 =  (sender.view!.center.x)
        y2 =  (sender.view!.center.y)
        
        
        
        if(check(x2,y:y2) == true){
            print("バナナIn")
            fruit[1] = true
        }else{
            print("バナナOut")
            fruit[1] = false
        }
        
        
       // print("バナナ")
        //print("\(sender.view!.frame.origin.x), \(sender.view!.frame.origin.y)")
        
        
        //移動量を0にする。
        sender.setTranslation(CGPointZero, inView:view)
        
        checkArray(fruit)

    }

    
    @IBAction func panTomato(sender: UIPanGestureRecognizer) {
        
        var x3: CGFloat
        var y3: CGFloat
        
        //移動量を取得する。
        let move:CGPoint = sender.translationInView(view)
        
        //ドラッグした部品の座標に移動量を加算する。
       // sender.view!.center.x += move.x
       // sender.view!.center.y += move.y
        
        //ラベルの位置の制約に移動量を加算する。
        tomatoX.constant += move.x
        tomatoY.constant += move.y
        
        //画面表示を更新する。
        view.layoutIfNeeded()
        
        x3 =  (sender.view!.center.x)
        y3 =  (sender.view!.center.y)
        
        
        if(check(x3,y:y3) == true){
            print("トマトIn")
            fruit[2] = true
        }else{
            print("トマトOut")
            fruit[2] = false
        }
        
        //現在位置を表示
        //print("トマト")
        //print("\(sender.view!.frame.origin.x), \(sender.view!.frame.origin.y)")
        
        //移動量を0にする。
        sender.setTranslation(CGPointZero, inView:view)
        
        checkArray(fruit)

    }
 
    
    @IBAction func panOrange(sender: UIPanGestureRecognizer) {
        
        var x4: CGFloat
        var y4: CGFloat
        
        //移動量を取得する。
        let move:CGPoint = sender.translationInView(view)
        
        //ドラッグした部品の座標に移動量を加算する。
       // sender.view!.center.x += move.x
       // sender.view!.center.y += move.y
        
        //ラベルの位置の制約に移動量を加算する。
        orangeX.constant += move.x
        orangeY.constant += move.y
        
        //画面表示を更新する。
        view.layoutIfNeeded()
        
        x4 =  (sender.view!.center.x)
        y4 =  (sender.view!.center.y)
        
        if(check(x4,y:y4) == true){
            print("オレンジIn")
            fruit[3] = true
        }else{
            print("オレンジOut")
            fruit[3] = false
        }
        
        //現在位置を表示
        //print("オレンジ")
        //print("\(sender.view!.frame.origin.x), \(sender.view!.frame.origin.y)")
        
        //移動量を0にする。
        sender.setTranslation(CGPointZero, inView:view)
        
        checkArray(fruit)

    }
    

    
    //ミキサーに物が入ったか判別するメソッド
    func check(x:CGFloat,y:CGFloat) -> Bool{
        if((x >= 130 && x <= 230) && (y >= 270 && y <= 410)){
         isIn = true
        }else{
        isIn = false
        }
        return isIn
    }
    
    
    
    //配列の要素が4つtrueだったら
    func checkArray(fruit:[Bool]){
        
        var flag = true
        for i in 0 ..< 4 {
            if(fruit[i] == false){
               flag = false
            }
        }
        
        if(flag == true){
            NSLog("全部入ったんよ")
            checkLabel.text = "蓋を閉めてください！"
            print(fruit)
        }else{
            checkLabel.text = "まだ全部入っていない"
            print(fruit)
        }
        
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        shakeLabel.text = "shake shake!!"
        
      
        self.performSegueWithIdentifier("next", sender: self)
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
