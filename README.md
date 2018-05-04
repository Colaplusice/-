# Point_me
ios课程 第二个实验

点我啊 swift 4.0
===

## 功能

* 图片循环播放，暂停播放
- 上下左右平移，旋转
- 通过slide来旋转图片
- 动作的动画

## 效果
![效果](https://img-blog.csdn.net/20180504195500781?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2ZhbmppYWxpYW5nMjQwMQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

# 功能解释

### 上下平移
通过center来上下平移
如果通过origin.x来平移
图形在旋转是会发生变化
### 放大和缩小
通过bounds.size.height 和bounds.size。width来放大和缩小  不然旋转时会改变大小

# imageview


 建立一个imageview  在目录下建立个image文件夹，放入图片
 
```
 let imgArr=[UIImage(named: "1_13.jpg")!,

 UIImage(named: "1_31.jpg")!,

 UIImage(named: "imag.jpg")!,

 ]
 
 ```

可以设置轮播


## 图片旋转

-   let rad=20/180*Float(Double.pi)

myImageView.transform=CGAffineTransform(rotationAngle: CGFloat(rad))

- 连续旋转

  let rad=20/180*Float(Double.pi)
 myImageView.transform=myImageView.transform.rotated(by: CGFloat(rad))


- 按照周期不停旋转
```
let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")

// // 2.设置动画的属性

// rotationAnim.fromValue = 0

// rotationAnim.toValue = M_PI * 2

// rotationAnim.repeatCount = MAXFLOAT

// rotationAnim.duration = 1

// // 这个属性很重要 如果不设置当页面运行到后台再次进入该页面的时候 动画会停止

// rotationAnim.isRemovedOnCompletion = false

// // 3.将动画添加到layer中

// myImageView.layer.add(rotationAnim, forKey: nil)

```



### button

使用tag 向button传值
```
 button1.addTarget(self, action: #selector(ViewController.play(sender:)), for: .touchUpInside)
 @objc func play(sender:UIButton) {

// tag==0 start

 if sender.tag==0{
 myImageView.startAnimating()
 }
}
```

## slider
```
 myslider=UISlider(frame: CGRect(x:20, y:380, width: 300, height: 20))
 myslider.addTarget(self, action: #selector(valuechanged(_sender:)), for:UIControlEvents.valueChanged)

  myslider.minimumValue=0

  myslider.maximumValue=180

```

#### [github](https://github.com/Colaplusice/Point_me)