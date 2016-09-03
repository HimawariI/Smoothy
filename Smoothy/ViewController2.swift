//
//  ViewController2.swift
//  Smoothy
//
//  Created by MIKI on 2016/08/27.
//  Copyright © 2016年 HackUmeko. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet var iconCollection: [UIImageView]!
    //季節   0-3　spring,summer,fall,winter
    //味　   4-7　sweet,bitter,fresh,mild
    //気分  8-11　happy,unhappy,tired,nervous
    //効能 12-15　diet,beauty,eye,heart
    
    //16個のアイコン表示のためのUIImageView
    /*
    @IBOutlet weak var apple: UIImageView!
    @IBOutlet weak var banana: UIImageView!
    @IBOutlet weak var tomato: UIImageView!
    @IBOutlet weak var orange: UIImageView!
    */
    /*@IBOutlet var spring: UIImageView!
    @IBOutlet var summer: UIImageView!
    @IBOutlet var fall: UIImageView!
    @IBOutlet var winter: UIImageView!*/
    /*
    @IBOutlet var sweet: UIImageView!
    @IBOutlet var bitter: UIImageView!
    @IBOutlet var fresh: UIImageView!
    @IBOutlet var mild: UIImageView!
    
    @IBOutlet var happy: UIImageView!
    @IBOutlet var unhappy: UIImageView!
    @IBOutlet var tired: UIImageView!
    @IBOutlet var nervous: UIImageView!
    
    @IBOutlet var diet: UIImageView!
    @IBOutlet var beauty: UIImageView!
    @IBOutlet var eye: UIImageView!
    @IBOutlet var heart: UIImageView!
    
  */
    //アイコンのXY
    @IBOutlet var xCollection: [NSLayoutConstraint]!
    @IBOutlet var yCollection: [NSLayoutConstraint]!
    
   /* @IBOutlet weak var appleX: NSLayoutConstraint!
    @IBOutlet weak var appleY: NSLayoutConstraint!
    @IBOutlet weak var bananaX: NSLayoutConstraint!
    @IBOutlet weak var bananaY: NSLayoutConstraint!
    @IBOutlet weak var tomatoX: NSLayoutConstraint!
    @IBOutlet weak var tomatoY: NSLayoutConstraint!
    @IBOutlet weak var orangeX: NSLayoutConstraint!
    @IBOutlet weak var orangeY: NSLayoutConstraint!
   
    @IBOutlet weak var sweetX: NSLayoutConstraint!
    @IBOutlet weak var sweetY: NSLayoutConstraint!
    @IBOutlet weak var bitterX: NSLayoutConstraint!
    @IBOutlet weak var bitterY: NSLayoutConstraint!
    @IBOutlet weak var freshX: NSLayoutConstraint!
    @IBOutlet weak var freshY: NSLayoutConstraint!
    @IBOutlet weak var mildX: NSLayoutConstraint!
    @IBOutlet weak var mildY: NSLayoutConstraint!
    
    @IBOutlet weak var happyX: NSLayoutConstraint!
    @IBOutlet weak var happyY: NSLayoutConstraint!
    @IBOutlet weak var unhappyX: NSLayoutConstraint!
    @IBOutlet weak var unhappyY: NSLayoutConstraint!
    @IBOutlet weak var nervousX: NSLayoutConstraint!
    @IBOutlet weak var nervousY: NSLayoutConstraint!
    @IBOutlet weak var tiredX: NSLayoutConstraint!
    @IBOutlet weak var tiredY: NSLayoutConstraint!
    
    @IBOutlet weak var dietX: NSLayoutConstraint!
    @IBOutlet weak var dietY: NSLayoutConstraint!
    @IBOutlet weak var beautyX: NSLayoutConstraint!
    @IBOutlet weak var beautyY: NSLayoutConstraint!
    @IBOutlet weak var eyeX: NSLayoutConstraint!
    @IBOutlet weak var eyeY: NSLayoutConstraint!
    @IBOutlet weak var heartX: NSLayoutConstraint!
    @IBOutlet weak var heartY: NSLayoutConstraint!
    */
    
    
    @IBOutlet var checkLabel: UILabel!
    
    @IBOutlet var shakeLabel: UILabel!
    @IBOutlet var topLabel: UILabel!
    //蓋閉めたか
    var top = true

    //ミキサーに入ったかどうかを確認する配列
    var iconArray:[Bool]=[false,false,false,false, false,false,false,false, false,false,false,false, false,false,false,false]
    
    
    //checkメソッドで使った変数
    var isIn = false
    //iconCheckメソッドで使った変数
    var iconisIn = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初期状態で季節アイコン以外を非表示にする
        for i in 4...15 {
            iconCollection[i].hidden = true
        }
        
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
            iconArray[i] = true
        }else{
            print("Out")
            iconArray[i] = false
        }
        
        //移動量を0にする。
        sender.setTranslation(CGPointZero, inView:view)
        
        checkArray(iconArray)

    }
    

    /*
    //季節
    @IBAction func panApple(sender: UIPanGestureRecognizer) {
        //移動量を取得する。
        let move:CGPoint = sender.translationInView(view)

        //ラベルの位置の制約に移動量を加算する。
        appleX.constant += move.x
        appleY.constant += move.y
        
     
     appleX -> xCollection[0]
     appleY -> yCollection[0]
     
     
        //画面表示を更新する。
        view.layoutIfNeeded()

        let x =  (sender.view!.center.x)
        let y =  (sender.view!.center.y)
    
        if(check(x,y:y) == true){
            print("りんごIn")
            iconArray[0] = true
        }else{
            print("りんごOut")
            iconArray[0] = false
        }
       
        //移動量を0にする。
        sender.setTranslation(CGPointZero, inView:view)
        
        checkArray(iconArray)
    }
    
    
    @IBAction func panBanana(sender: UIPanGestureRecognizer) {
        let move:CGPoint = sender.translationInView(view)

        bananaX.constant += move.x
        bananaY.constant += move.y
        
        view.layoutIfNeeded()
        
        let x =  (sender.view!.center.x)
        let y =  (sender.view!.center.y)
        
        if(check(x,y:y) == true){
            print("バナナIn")
            iconArray[1] = true
        }else{
            print("バナナOut")
            iconArray[1] = false
        }
        
        sender.setTranslation(CGPointZero, inView:view)
        checkArray(iconArray)

    }

    
    @IBAction func panTomato(sender: UIPanGestureRecognizer) {
        let move:CGPoint = sender.translationInView(view)
        
        tomatoX.constant += move.x
        tomatoY.constant += move.y
        
        view.layoutIfNeeded()
        
        let x =  (sender.view!.center.x)
        let y =  (sender.view!.center.y)
        
        
        if(check(x,y:y) == true){
            print("トマトIn")
            iconArray[2] = true
        }else{
            print("トマトOut")
            iconArray[2] = false
        }

        sender.setTranslation(CGPointZero, inView:view)
        checkArray(iconArray)

    }
 
    
    @IBAction func panOrange(sender: UIPanGestureRecognizer) {
        let move:CGPoint = sender.translationInView(view)
        
        orangeX.constant += move.x
        orangeY.constant += move.y
        
        view.layoutIfNeeded()
        
        let x =  (sender.view!.center.x)
        let y =  (sender.view!.center.y)
        
        if(check(x,y:y) == true){
            print("オレンジIn")
            iconArray[3] = true
        }else{
            print("オレンジOut")
            iconArray[3] = false
        }

        sender.setTranslation(CGPointZero, inView:view)
        checkArray(iconArray)

    }
    
    //味
    @IBAction func panSweet(sender: UIPanGestureRecognizer) {
        let move:CGPoint = sender.translationInView(view)
        sweetX.constant += move.x
        sweetY.constant += move.y
        view.layoutIfNeeded()
        
        let x =  (sender.view!.center.x)
        let y =  (sender.view!.center.y)
        
        if(check(x,y:y) == true){
            print("あまいIn")
            iconArray[4] = true
        }else{
            print("あまいOut")
            iconArray[4] = false
        }
        
        sender.setTranslation(CGPointZero, inView:view)
    }
    
    @IBAction func panBitter(sender: UIPanGestureRecognizer) {
        let move:CGPoint = sender.translationInView(view)
        bitterX.constant += move.x
        bitterY.constant += move.y
        view.layoutIfNeeded()
        
        let x =  (sender.view!.center.x)
        let y =  (sender.view!.center.y)
        
        if(check(x,y:y) == true){
            print("にがいIn")
            iconArray[5] = true
        }else{
            print("にがいOut")
            iconArray[5] = false
        }
        sender.setTranslation(CGPointZero, inView:view)
    }
    
    @IBAction func panFresh(sender: UIPanGestureRecognizer) {
        let move:CGPoint = sender.translationInView(view)
        freshX.constant += move.x
        freshY.constant += move.y
        view.layoutIfNeeded()
        
        let x =  (sender.view!.center.x)
        let y =  (sender.view!.center.y)
        
        if(check(x,y:y) == true){
            print("さわやかIn")
            iconArray[6] = true
        }else{
            print("さわやかOut")
            iconArray[6] = false
        }
        
        sender.setTranslation(CGPointZero, inView:view)
    }
    
    @IBAction func panMild(sender: UIPanGestureRecognizer) {
        let move:CGPoint = sender.translationInView(view)
        mildX.constant += move.x
        mildY.constant += move.y
        view.layoutIfNeeded()
        
        let x =  (sender.view!.center.x)
        let y =  (sender.view!.center.y)
        
        if(check(x,y:y) == true){
            print("まいるどIn")
            iconArray[7] = true
        }else{
            print("まいるどOut")
            iconArray[7] = false
        }
        
        sender.setTranslation(CGPointZero, inView:view)
    }
    
    @IBAction func panHappy(sender: UIPanGestureRecognizer) {
        let move:CGPoint = sender.translationInView(view)
        happyX.constant += move.x
        happyY.constant += move.y
        view.layoutIfNeeded()
        
        
        let x =  (sender.view!.center.x)
        let y =  (sender.view!.center.y)
        
        if(check(x,y:y) == true){
            print("はっぴーIn")
            iconArray[8] = true
        }else{
            print("はっぴーOut")
            iconArray[8] = false
        }
        sender.setTranslation(CGPointZero, inView:view)
    }

    @IBAction func panUnhappy(sender: UIPanGestureRecognizer) {
        let move:CGPoint = sender.translationInView(view)
        unhappyX.constant += move.x
        unhappyY.constant += move.y
        view.layoutIfNeeded()
        
        
        let x =  (sender.view!.center.x)
        let y =  (sender.view!.center.y)
        
        if(check(x,y:y) == true){
            print("あんはっぴーIn")
            iconArray[9] = true
        }else{
            print("あんはっぴーOut")
            iconArray[9] = false
        }
        sender.setTranslation(CGPointZero, inView:view)
    }
    
    @IBAction func panNervous(sender: UIPanGestureRecognizer) {
        let move:CGPoint = sender.translationInView(view)
        nervousX.constant += move.x
        nervousY.constant += move.y
        view.layoutIfNeeded()
        
        
        let x =  (sender.view!.center.x)
        let y =  (sender.view!.center.y)
        
        if(check(x,y:y) == true){
            print("きんちょうIn")
            iconArray[10] = true
        }else{
            print("きんちょうOut")
            iconArray[10] = false
        }
        sender.setTranslation(CGPointZero, inView:view)
    }
    
    @IBAction func panTired(sender: UIPanGestureRecognizer) {
        let move:CGPoint = sender.translationInView(view)
        tiredX.constant += move.x
        tiredY.constant += move.y
        view.layoutIfNeeded()
        
        
        let x =  (sender.view!.center.x)
        let y =  (sender.view!.center.y)
        
        if(check(x,y:y) == true){
            print("つかれたIn")
            iconArray[11] = true
        }else{
            print("つかれたOut")
            iconArray[11] = false
        }
        sender.setTranslation(CGPointZero, inView:view)
    }
    
    @IBAction func panDiet(sender: UIPanGestureRecognizer) {
        let move:CGPoint = sender.translationInView(view)
        dietX.constant += move.x
        dietY.constant += move.y
        view.layoutIfNeeded()
        
        let x =  (sender.view!.center.x)
        let y =  (sender.view!.center.y)
        
        if(check(x,y:y) == true){
            print("だいえっとIn")
            iconArray[12] = true
        }else{
            print("だいえっとOut")
            iconArray[12] = false
        }
        sender.setTranslation(CGPointZero, inView:view)
    }
    
    @IBAction func panBeauty(sender: UIPanGestureRecognizer) {
        let move:CGPoint = sender.translationInView(view)
        beautyX.constant += move.x
        beautyY.constant += move.y
        view.layoutIfNeeded()
        
        
        let x =  (sender.view!.center.x)
        let y =  (sender.view!.center.y)
        
        if(check(x,y:y) == true){
            print("びはだIn")
            iconArray[13] = true
        }else{
            print("びはだOut")
            iconArray[13] = false
        }
        sender.setTranslation(CGPointZero, inView:view)
    }
    
    @IBAction func panEye(sender: UIPanGestureRecognizer) {
        let move:CGPoint = sender.translationInView(view)
        eyeX.constant += move.x
        eyeY.constant += move.y
        view.layoutIfNeeded()
        
        
        let x =  (sender.view!.center.x)
        let y =  (sender.view!.center.y)
        
        if(check(x,y:y) == true){
            print("めIn")
            iconArray[14] = true
        }else{
            print("めOut")
            iconArray[14] = false
        }
        sender.setTranslation(CGPointZero, inView:view)
    }
    
    @IBAction func panHeart(sender: UIPanGestureRecognizer) {
        let move:CGPoint = sender.translationInView(view)
        heartX.constant += move.x
        heartY.constant += move.y
        view.layoutIfNeeded()
        
        
        let x =  (sender.view!.center.x)
        let y =  (sender.view!.center.y)
        
        if(check(x,y:y) == true){
            print("かいふくIn")
            iconArray[15] = true
        }else{
            print("かいふくOut")
            iconArray[15] = false
        }
        sender.setTranslation(CGPointZero, inView:view)
    }
 */
    
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
    
    @IBAction func topClose(){
    
        for i in 0 ..< 4 {
            if(iconArray[i] == false){
                top = false
            }
        }
        
        
    //    topLabel.origin.x = 155
     //   topLabel.origin.y = 260
        
    }

    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        shakeLabel.text = "shake shake!!"
        if top == true {
        self.performSegueWithIdentifier("next", sender: self)
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

        
    }
  /*
    @IBAction func seasonButton() {
        //spring,summer,fall,winter
        
        for i in 0...15 {
            let x =  (iconCollection[i].center.x)
            let y =  (iconCollection[i].center.y)
            iconCheck(x, y: y)
            if iconisIn == true {
                iconCollection[i].hidden = true
            }
            for j in 0...3 {
                iconCollection[j].hidden = false
            }
        }
        
    }
    
    @IBAction func tasteButton() {
        //sweet,bitter,fresh,mild
        
        for i in 0...15 {
            let x =  (iconCollection[i].center.x)
            let y =  (iconCollection[i].center.y)
            iconCheck(x, y: y)
            if iconisIn == true {
                iconCollection[i].hidden = true
            }
            for j in 4...7 {
                iconCollection[j].hidden = false
            }
        }

        
    }
    
    @IBAction func feelingButton() {
        //happy,unhappy,tired,nervous
        
        for i in 0...15 {
            let x =  (iconCollection[i].center.x)
            let y =  (iconCollection[i].center.y)
            iconCheck(x, y: y)
            if iconisIn == true {
                iconCollection[i].hidden = true
            }
            for j in 8...11 {
                iconCollection[j].hidden = false
            }
        }

        
    }
    
    @IBAction func efficacyButton() {
        //diet,beauty,eye,heart
        
        for i in 0...15 {
            let x =  (iconCollection[i].center.x)
            let y =  (iconCollection[i].center.y)
            iconCheck(x, y: y)
            if iconisIn == true {
                iconCollection[i].hidden = true
            }
            for j in 12...15 {
                iconCollection[j].hidden = false
            }
        }

    }*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
