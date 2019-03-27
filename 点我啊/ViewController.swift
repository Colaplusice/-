//
//  ViewController.swift
//  点我啊
//
//  Created by 樊佳亮 on 2018/4/27.
//  Copyright © 2018年 樊佳亮. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let fullScreenSize = UIScreen.main.bounds.size
    var myImageView:UIImageView!
    var myslider:UISlider!
    override func viewDidLoad() {
         myImageView = UIImageView(
                frame: CGRect(
                        x: 0, y: 0, width: 200, height: 200))
        let imgArr=[UIImage( named: "1_13.jpg")!,
                    UIImage(named: "1_31.jpg")!,
                    UIImage(named: "imag.jpg")!,
                    ]
        myImageView.animationImages=imgArr
        
        myImageView.animationDuration=6
        
        myImageView.animationRepeatCount=0
        myImageView.startAnimating()
        
        let iconArr=[UIImage(named: "start.jpeg"),
                     UIImage(named: "stop.jpg"),
                     UIImage(named: "big.png")!,
                     UIImage(named: "up.png")!,
                     UIImage(named: "small.png")!,
                     UIImage(named: "rightX.png")!,
                     UIImage(named: "leftX.png")!,
                     UIImage(named: "left.jpeg")!,
                     UIImage(named: "down.png")!,
                     UIImage(named: "right.jpeg")!,
                     ]
        
//        var buttonarr:Ar
//        设置button
//        print(fullScreenSize.width)
//        print(fullScreenSize.height)
        
        for i in 0...9{
            let  button1=UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
            button1.setImage(iconArr[i], for: .normal)
            button1.tag=i
button1.center=CGPoint(x:fullScreenSize.width*0.2*CGFloat(i%5)+CGFloat(30),y:fullScreenSize.height * CGFloat(0.7+(0.15 * Double(i/5))))
            
            self.view.addSubview(button1)
            button1.addTarget(self, action: #selector(ViewController.play(sender:)), for: .touchUpInside)
//            buttonarr.append(button1)
        }
        //background
//        myImageView.backgroundColor=UIColor.yellow
        //显示模式 在最右边
//        myImageView.contentMode = .bottomLeft
// 使用 UIImage(named:) 放置圖片檔案
//        myImageView.image = UIImage(named: "imag.jpg")

// 設置新的位置並放入畫面中
        myImageView.center = CGPoint(
                x: fullScreenSize.width * 0.5,
                y: fullScreenSize.height * 0.15)
        self.view.addSubview(myImageView)
        super.viewDidLoad()
        
//        uislider
        myslider=UISlider(frame: CGRect(x:20, y:380, width: 300, height: 20))
        
        myslider.addTarget(self, action: #selector(valuechanged(sender:)), for:UIControlEvents.valueChanged)
        myslider.minimumValue=0
        myslider.maximumValue=180
        self.view.addSubview(myslider)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func play(sender:UIButton) {
//        tag==0  start
        if sender.tag==0{
            myImageView.startAnimating()
        }
        //stop
        if sender.tag==1{
            UIView.animate(withDuration: 1.0) {
               self.myImageView.stopAnimating()

            }
            
        }
        //放大
        if sender.tag==2{
            UIView.animate(withDuration: 1.0) {
                var resize = self.myImageView.bounds
                if (resize.size.width*(10/9)<self.fullScreenSize.width&&resize.size.height*(10/9)<self.fullScreenSize.height){
                    resize.size.height*=(10/9)
                    resize.size.width*=(10/9)
                }
                self.myImageView.bounds=resize
            }
        }
        //up
        if sender.tag==3{
            UIView.animate(withDuration: 1.0) {
                var resize = self.myImageView.center
                resize.y -= 20
                self.myImageView.center=resize
            }
       
        }
        //缩小
        if sender.tag==4{
            UIView.animate(withDuration: 1.0) {
                var resize = self.myImageView.bounds
                resize.size.width/=(10/9)
                resize.size.height/=(10/9)
                self.myImageView.bounds=resize
            }
        }
        //右旋转
        
        if sender.tag==5{
            //            let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")
            //
            //            // 2.设置动画的属性
            //            rotationAnim.fromValue = 0
            //            rotationAnim.toValue = M_PI * 2
            //            rotationAnim.repeatCount = MAXFLOAT
            //            rotationAnim.duration = 1
            //            // 这个属性很重要 如果不设置当页面运行到后台再次进入该页面的时候 动画会停止
            //            rotationAnim.isRemovedOnCompletion = false
            //            // 3.将动画添加到layer中
            //            myImageView.layer.add(rotationAnim, forKey: nil)
            //            var transform:CGAffineTransform
            UIView.animate(withDuration: 1.0) {
                let rad = (20/180*Float(Double.pi))
                self.myImageView.transform=self.myImageView.transform.rotated(by: CGFloat(rad))
            }
        
            
        }
        //        左旋转
        if sender.tag==6{
            UIView.animate(withDuration: 1.0) {
                let rad = -(20/180*Float(Double.pi))
self.myImageView.transform=self.myImageView.transform.rotated(by: CGFloat(rad))
            }
        }
        //left
        if sender.tag==7{
            UIView.animate(withDuration: 1.0) {
                var resize = self.myImageView.center
                
                resize.x -= 20
                
                self.myImageView.center=resize
            }
            
        
        }
        //down
        if sender.tag==8{
            UIView.animate(withDuration: 1.0) {
                var resize = self.myImageView.center
                resize.y += 20
                self.myImageView.center=resize
            }
           
        }
        //right
        if sender.tag==9{
            UIView.animate(withDuration: 1.0) {
                var resize =  self.myImageView.center
                resize.x += 20
                self.myImageView.center=resize
            }
      
        }
    }
    @IBAction func valuechanged(sender:UISlider){
        let deg=sender.value
        let rad=deg/180*Float(Double.pi)
        myImageView.transform=CGAffineTransform(rotationAngle: CGFloat(rad))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


