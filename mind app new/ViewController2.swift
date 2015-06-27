//
//  ViewController2.swift
//  mind app new
//
//  Created by 夏目怜奈 on 2015/06/22.
//  Copyright (c) 2015年 夏目怜奈. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    
    var mindLabel : UILabel!
    var colorArray: [String] = []
    var fontArray:[String] = []
    
    var receiveArray : [String] = []
    
    /*if(defaults.objectForKey("NAME")){
    let objects = defaults.objectForKey("MIND") as? NSArray
    var mindString:AnyObject
    for mindString in objects!{
    receiveArray.append(mindString as NSArray)
    }*/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var item : Int = self.receiveArray.count
        for item in receiveArray{
            println("\(item)")
            
            }
        
        let row1 : Int = self.colorArray.count
        let row2 : Int = self.fontArray.count
        
        for (var item = 0 ; item < receiveArray.count ; item++){
            var mindLabel : UILabel = UILabel(frame:CGRectMake(20, CGFloat(40*item+30),150,30))
            mindLabel.text = receiveArray[item]
            self.view.addSubview(mindLabel)
            
            if(row1 == 0){
                mindLabel.textColor = UIColor.redColor()
               }else if(row1 == 1){
                mindLabel.textColor = UIColor.yellowColor()
                }else if(row1 == 2){
                    mindLabel.textColor = UIColor.greenColor()
                }else if(row1 == 3){
                    mindLabel.textColor = UIColor.blueColor()
            }
            
            if(row2 == 0){
                mindLabel.font = UIFont.systemFontOfSize(CGFloat(20))
            }else if(row2 == 1){
                mindLabel.font = UIFont.systemFontOfSize(CGFloat(30))
            }else if(row2 == 2){
                mindLabel.font = UIFont.systemFontOfSize(CGFloat(50))
            }
        }
    }
    
        
        /*let mindLabel : UILabel = UILabel (frame: CGRectMake(20, 20, 100, 100))
            mindLabel.layer.masksToBounds = true
            mindLabel.layer.cornerRadius = 20.0
            mindLabel.text =
            mindLabel.textAlignment = NSTextAlignment.Center
            mindLabel.layer.position = CGPoint(x: self.view.bounds.width/2, y:200)
            self.view.addSubview(mindLabel)        }
*/
    
    /*
    @IBOutlet var label: UILabel!
    @IBOutlet var label2: UILabel!
    
*/
    
            // Do any additional setup after loading the view, typically from a nib.
       // NSLog("受け取った%@",recieveArray)
        //println(mindArray)
    
        /*var n = recieveArray.count
        label.text = recieveArray[0]
        println(n)
        if n == 2{
            label2.text = recieveArray[0]
        }*/
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}

//前の画面に戻る
    @IBAction func add () {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}

