//
//  ViewController.swift
//  mind app new
//
//  Created by 夏目怜奈 on 2015/06/22.
//  Copyright (c) 2015年 夏目怜奈. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    
    //NSUserDefaultsを作成
    var mindDefault = NSUserDefaults.standardUserDefaults()
    var num = 0
    
    //TextField作成
    @IBOutlet var myTextField: UITextField!
    
    
    //PickerView作成
    @IBOutlet var myUIPicker: UIPickerView!
    
    var picker1Array = ["オボエル","ヒラメキ","シラベル","ベンリ"]
    var picker2Array = ["■","■□","■□■"]
    var font = ""
    var fontArray: [String] = []
    
    
    private let picker1Component = 0
    private let picker2Component = 1
    
    
    
    var redArray:[String] = []//”オボエル”のテキストの配列
    var yellowArray:[String] = []//"ヒラメキ"のテキストの配列
    var greenArray:[String] = []//"シラベル"のテキストの配列
    var blueArray:[String] = []//"ベンリ"のテキストの配列
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UITextFieldを作成
        myTextField.text = "hello!"
        myTextField.delegate = self
        self.view.addSubview(myTextField)
        
        //UIPickerViewを作成
        myUIPicker.delegate = self
        myUIPicker.dataSource = self
        self.view.addSubview(myUIPicker)
        
        
        //fontの初期値を設定
        font = "■"
        
    }
    
    
    /*//昔"openKey"という鍵で保存したかどうか確認
    if((mindDefault.objectForKey("RED")) = nil){
    
    //objectsを配列として確定させ、前回の保存内容を格納
    let objects = defaults.objectForKey("openKey") as? [String]
    
    //各名前を格納するための変数を宣言
    var nameString:AnyObject
    
    //前回の保存内容が格納された配列の中身を一つずつ取り出す
    for nameString in objects!{
    //配列に追加していく
    stringArray.append(nameString as String)
    }
    
    }
    
    
    
    
    
    //現在保存されているstringArrayの要素数を表示
    textNumOfArray.text = String(stringArray.count)
    */
    
    
    //UIPickerViewを表示
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //表示個数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0){
            return picker1Array.count
            
        }else if(component == 1){
            return picker2Array.count
            
        }
        return 0;
    }
    //表示内容
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        if(component == 0){
            return picker1Array[row]
            
        }else if (component == 1){
            return picker2Array[row]
        }
        
        return"";
    }
    
    //選択時
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0){
            println("列:\(row)")
            println("値:\(picker1Array[row])")
            
        }else if(component == 1){
            println("列:\(row)")
            println("値:\(picker2Array[row])")
            
            font = picker2Array[row]
        }
    }
    
    //myTextFieldに表示されたキーボードを隠す
    @IBAction func TapReturnKey(){
        myTextField.resignFirstResponder()
    }
    
    
    //mindButtonを押したとき
    @IBAction func didTapmindButton(){
        
        var config : SwiftLoader.Config = SwiftLoader.Config()
        config.size = 120
        config.titleTextColor = UIColor.redColor()
        SwiftLoader.setConfig(config)
        SwiftLoader.show (title: "mind...", animated: true)
        
        let delay = 1.0 * Double(NSEC_PER_MSEC)
        var time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            SwiftLoader.hide()
        })//SwiftLoaderを使用
        
        fontArray.append(font)//fontArray
        
        
        if (myUIPicker.selectedRowInComponent(0) == 0){
            redArray.append(self.myTextField.text)//"オボエル"を選んだ時、テキストはredArrayに配列される
            mindDefault.setObject(redArray, forKey: "RED")
            mindDefault.synchronize()//redArrayを"RED"で保存
            
        }else if (myUIPicker.selectedRowInComponent(0) == 1){
        yellowArray.append(self.myTextField.text)
            mindDefault.setObject(yellowArray, forKey: "YELLOW")
            mindDefault.synchronize()
        
        }else if(myUIPicker.selectedRowInComponent(0) == 2){
            greenArray.append(self.myTextField.text)
            mindDefault.setObject(greenArray, forKey: "GREEN")
            mindDefault.synchronize()
        
        }else{
            blueArray.append(self.myTextField.text)
            mindDefault.setObject(blueArray, forKey: "BLUE")
            mindDefault.synchronize()
        }
    }
    
        
    @IBAction func red(){
        performSegueWithIdentifier("tored", sender: nil)
    }
    
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        if(segue.identifier == "tored"){
            var redviewController: redViewController = segue.destinationViewController as!redViewController
            redviewController.redArray = self.redArray
            println(redArray)
            }
    }
    
    @IBAction func yellow (){
        performSegueWithIdentifier("toyellow", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
    if(segue.identifier == "toyellow"){
            var yellowviewController: yellowViewController = segue.destinationViewController as!yellowViewController
            yellowviewController.yellowArray = self.yellowArray
            println(yellowArray)
    }

    }
    
/*@IBAction func green(){
        performSegueWithIdentifier("togreen", sender: nil)
    }
    
  

            
            performSegueWithIdentifier("togreen", sender: nil)
            mindDefault.setObject(greenArray, forKey: "GREEN")
            mindDefault.synchronize()
            
        }else if(segue.identifier == "togreen"){
            var greenviewController: greenViewController = segue.destinationViewController as!greenViewController
            greenviewController.greenArray = self.greenArray
            println(greenArray)
            
            performSegueWithIdentifier("toblue", sender: nil)
            mindDefault.setObject(blueArray, forKey: "BLUE")
            
            
        }else if(segue.identifier == "toblue"){
            var blueviewController: blueViewController = segue.destinationViewController as!blueViewController
            blueviewController.blueArray = self.blueArray
            println(blueArray)
    }
    
        }
    @IBAction func red(){
        performSegueWithIdentifier("tored", sender: nil)
      
        if !redArray.isEmpty == true{
            
            //配列の要素数以上の数字になったらエラーをおこすので、越えたら0に戻す
            if num >= stringArray.count {
                
                num = 0
                
            }
            
            //配列の中身を表示してあげる
            myLabel.text = stringArray[num]
            
            //配列の何番目にいるのかを表示してあげる
            textAtNum.text = String(num)
            
            //配列の確認する番数を増やす
            num++
        }


    
    }*/
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
}
