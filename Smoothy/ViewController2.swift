//
//  ViewController2.swift
//  Smoothy
//
//  Created by MIKI on 2016/08/27.
//  Copyright © 2016年 HackUmeko. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewController2: UIViewController {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    @IBOutlet var iconCollection: [UIImageView]!
    //季節   0-3　spring,summer,fall,winter
    //味　   4-7　sweet,bitter,fresh,mild
    //気分  8-11　happy,unhappy,tired,nervous
    //効能 12-15　diet,beauty,eye,heart
  
    //アイコンのXY
    @IBOutlet var xCollection: [NSLayoutConstraint]!
    @IBOutlet var yCollection: [NSLayoutConstraint]!
    
    
    @IBOutlet var checkLabel: UILabel!
    @IBOutlet var shakeLabel: UILabel!
    @IBOutlet var topLabel: UILabel!
    @IBOutlet var topImage: UIImageView!
    @IBOutlet var pahuImage: UIImageView!
    @IBOutlet var iconLabel: UILabel!
    
    //シェイクした回数を数える変数
    var shake = 0
    var players:[AVAudioPlayer]!
    //音楽が入っている配列
    let audioFiles = ["mix","close","in","out"]
    
    //蓋閉めたか
    var top = true

    //ミキサーに入ったかどうかを確認する配列
    var want:[Bool]=[false,false,false,false, false,false,false,false, false,false,false,false, false,false,false,false]
    
    
    //checkメソッドで使った変数
    var isIn = false
    //iconCheckメソッドで使った変数
    var iconisIn = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //オープニングの曲を止める
        appDelegate.audioPlayer.stop()
        appDelegate.audioPlayer.currentTime = 0.0
        
        
        //初期状態で季節アイコン以外を非表示にする
        for i in 4...15 {
            iconCollection[i].hidden = true
        }
        pahuImage.hidden = true
        
        
        //音楽のセットアップ
        setup()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pan1(sender: UIPanGestureRecognizer) {
    
        //移動量を取得する。
        let move:CGPoint = sender.translationInView(view)
        
        let i = sender.view!.tag
        
        //ラベルの位置の制約に移動量を加算する。
        xCollection[i].constant += move.x
        yCollection[i].constant += move.y
        
        //画面表示を更新する。
        view.layoutIfNeeded()
        
        let x =  (sender.view!.center.x)
        let y =  (sender.view!.center.y)
        
        if(check(x,y:y) == true){
            print("In")
            want[i] = true
            play(2)
        }else{
            print("Out")
            want[i] = false
        }
        
        //移動量を0にする。
        sender.setTranslation(CGPointZero, inView:view)
        
        checkArray(want)

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
    
    
    //配列の要素が16こtrueだったら
    func checkArray(fruit:[Bool]){
        
        var flag = true
        for i in 0 ..< 16 {
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

    //振って次の画面に行く
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if(top == true){
            //蓋が閉まっているとき、振っている回数をカウント
            if (event?.subtype == UIEventSubtype.MotionShake && event?.type == UIEventType.Motion){
                play(0)
                shake = shake + 1
                print(shake)
                shakeLabel.text = "shake shake!!"
                //バイブ
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            }
            if(shake >= 10){
                self.performSegueWithIdentifier("next", sender: self)
                print("次の画面にいきまーす")
                players[0].stop()
                
            }
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       // var finalViewController = segue.destinationViewController as! FinalViewController
        //FinalViewController.nameLabel =
    }
    
    
    
    //音楽を流すメソッド
    func play(n:Int) {
        if n < players.count {
            players[n].play()
        }
    }
    //音楽のセットアップ
    func setup() {
        players = []
        for fname in audioFiles {
            let path = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(fname, ofType: "mp3")!)
            do {
                let player = try AVAudioPlayer(contentsOfURL:path)
                players.append(player)
            } catch let error as NSError {
                print("error has occurred: \(error)")
            }
        }
    }

    
    //アイコンがラベル以外の場所にあるか判別する
    func iconCheck(x:CGFloat,y:CGFloat)-> Bool {
        if((x >= 0 && x <= 375) && (y >= 0 && y <= 85)) {
            iconisIn = true         //ラベルに入っている->非表示にする
        } else {
            iconisIn = false        //ラベルに入っていない->表示する
        }
        return iconisIn
    }
    
 
    
    @IBAction func tabButton(sender: UIButton) {
        
        for i in 0...15 {
            let x =  (iconCollection[i].center.x)
            let y =  (iconCollection[i].center.y)
            iconCheck(x, y: y)
            if iconisIn == true {
                iconCollection[i].hidden = true
            }
            for j in sender.tag...sender.tag+3 {
                iconCollection[j].hidden = false
            }
        }

        if sender.tag == 0 {
            iconLabel.backgroundColor = UIColor(red: 214/255.0, green: 196/255.0, blue: 177/255.0, alpha: 1.0)

        } else if sender.tag == 4 {
            iconLabel.backgroundColor = UIColor(red: 201/255.0, green: 177/255.0, blue: 151/255.0, alpha: 1.0)
        } else if sender.tag == 8 {
            iconLabel.backgroundColor = UIColor(red: 187/255.0, green: 157/255.0, blue: 125/255.0, alpha: 1.0)
        } else if sender.tag == 12 {
            iconLabel.backgroundColor = UIColor(red: 140/255.0, green: 118/255.0, blue: 94/255.0, alpha: 1.0)
        } else {
            
        }

        
    }
    
   //蓋をしめた時のメソッド
    @IBAction func topClose(){
   
        //  image1.center = CGPointMake(50, 300)
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1)
        //UIView.setValue(2.1, animated: true)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
        topImage.center = CGPointMake(120, 253)

        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDelay(3)
        pahuImage.hidden = false
      /*  var topCount:Int = 0
        for i in 0 ..< 16 {
            if(iconArray[i] == true){
                topCount = topCount + 1
            }
        }
        
        top = true
        print("蓋をしめた")
        play(1)*/
        
        //ミキサーの音流す
        //play(0)

        
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
