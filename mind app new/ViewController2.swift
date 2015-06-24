//
//  ViewController2.swift
//  mind app new
//
//  Created by 夏目怜奈 on 2015/06/22.
//  Copyright (c) 2015年 夏目怜奈. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet var mindLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

     var receiveArray:[String] = []
     var item: Int = receiveArray.count
    
    for item in receviveArray {
    println("\(item)")
    
    }
    
    
    
    /*  if let recieveArray = savedata.objebctForKey("MIND") as?[String]{
    var mindString: AnyObject
    for mindString in recieveArray {
    recieveArray.append(mindString as NSString as String)
    }
    }
    */
    
    /*@IBOutlet var label: UILabel!
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
   
    
    /*@IBAction func TapaddButton(sender:UIButton){
        let viewController: ViewController =
        
        self.navigationController?.popViewControllerAnimated(true)
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

