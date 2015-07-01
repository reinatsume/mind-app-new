//
//  ViewController2.swift
//  mind app new
//
//  Created by 夏目怜奈 on 2015/06/22.
//  Copyright (c) 2015年 夏目怜奈. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    
    //ラベルを作成
    var mindLabel : UILabel!
    
    var colorArray: [String] = []
    var fontArray: [String] = []
    var receiveArray : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // mindLabel.text = defaults.receiveArray("MIND") as! String?
        
        //recieveArrayの中の要素
        var item : Int = self.receiveArray.count
        for item in receiveArray{
            println("\(item)")
            
        }
        
        //recieveArrayの要素をラベルに表示
        for (var item = 0 ; item < receiveArray.count ; item++){
            var mindLabel : UILabel = UILabel(frame:CGRectMake(20, CGFloat(40*item+30),200,100))//ラベル作成
            mindLabel.text = receiveArray[item]
            self.view.addSubview(mindLabel)
            
            if colorArray[item] == "オボエル"{
                mindLabel.textColor = UIColor.redColor()
            }else if colorArray[item] == "ヒラメキ"{
                mindLabel.textColor = UIColor.yellowColor()
            }else if  colorArray[item] == "シラベル"{
                mindLabel.textColor = UIColor.greenColor()
            }else if colorArray[item] == "ベンリ"{
                mindLabel.textColor = UIColor.blueColor()
            }
            
            if fontArray[item] == "■"{
                mindLabel.font = UIFont.systemFontOfSize(CGFloat(15))
            }else if fontArray[item] == "■□"{
                mindLabel.font = UIFont.systemFontOfSize(CGFloat(25))
            }else if fontArray[item] == "■□■"{
                mindLabel.font = UIFont.systemFontOfSize(CGFloat(40))
            }
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //前の画面に戻る
    @IBAction func add () {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

