//
//  ViewController.swift
//  mind app new
//
//  Created by 夏目怜奈 on 2015/06/22.
//  Copyright (c) 2015年 夏目怜奈. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var mindDefault = NSUserDefaults.standardUserDefaults()//NSUserDefaultsを作成
    var mindArray:[String] = []
    
    @IBOutlet var myTextField: UITextField!//TextField作成
    
    @IBOutlet var myUIPicker: UIPickerView!//PickerView作成
    
    var picker1Array = ["オボエル","ヒラメキ","シラベル","ベンリ"]
    var picker2Array = ["■","■□","■□■"]
    
    /*var color = "" //"" 文字列を表す
    var font = ""
    
    var colorArray: [String] = []
    var fontArray: [String] = []
    */
    
    private let picker1Component = 0
    private let picker2Component = 1
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        
        myTextField.text = "hello!"
        myTextField.delegate = self
        self.view.addSubview(myTextField)//UITextField
        
        myUIPicker.delegate = self
        myUIPicker.dataSource = self
        self.view.addSubview(myUIPicker)//UIPickerView
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
        
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker1Array.count
        
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return picker1Array[row]
    }
    

    @IBAction func didTapmindButton(){
        
        self.mindArray.append(self.myTextField.text)
        performSegueWithIdentifier("to2", sender: nil)
            
            mindDefault.setObject(mindArray, forKey: "MIND")
            mindDefault.synchronize()
            
    }
            override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if(segue.identifier == "to2"){
            var viewController2: ViewController2 = segue.destinationViewController as!ViewController2
            viewController2.receiveArray = self.mindArray
            println(mindArray)
                }
    }


            /*colorArray.append(color)
            fontArray.append(font)
            viewController2.colorArray = self.colorArray
            viewController2.fontArray = self.fontArray*/
        //"オボエル"を選択したとき、myTextFieldのテキストはredArrayの中に
        /* (myUIPicker.selectedRowInComponent(0)==0){
            self.redArray.append(self.myTextField.text)
            var redViewController:RedViewController
            performSegueWithIdentifier("tored", sender: nil)
            
            func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if(segue.identifier == "tored"){
            var redViewController: RedViewController = segue.destinationViewController as!RedViewController
            redViewController.redArray = self.redArray
            println(redArray)
            
            
        }else if (myUIPicker.selectedRowInComponent(0)==1){
                self.yellowArray.append(self.myTextField.text)
                var yellowViewController:YellowViewController
                performSegueWithIdentifier("toyellow", sender: nil)
               // YellowViewController.yellowArray = self.yellowArray
                println(yellowArray)
                
        }else if(myUIPicker.selectedRowInComponent(0)==2){
            self.greenArray.append(self.myTextField.text)
            var greenViewController:GreenViewController
        }else if(myUIPicker.selectedRowInComponent(0)==3){
            self.blueArray.append(self.myTextField.text)
        }
            
        }
    }
*/


    /*/UIPickeViewに表示する
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
            
            //color
            //color = picker1Array[row]
            
            /*  if(row==0){
            myTextField.textColor = UIColor.redColor()
            }else if(row==1){
            myTextField.textColor = UIColor.yellowColor()
            }else if(row==2){
            myTextField.textColor = UIColor.greenColor()
            }else if(row==3){
            myTextField.textColor = UIColor.blueColor()
            }
            */
            
        }else if(component == 1){
            println("列:\(row)")
            println("値:\(picker2Array[row])")
            
            //picker2Arrayの項目をfontとする
            //font = picker2Array[row]
            
            /*     if(row == 0){
            myTextField.font = UIFont.systemFontOfSize(CGFloat(20))
            }else if (row == 1){
            myTextField.font = UIFont.systemFontOfSize(CGFloat(50))
            }else if (row == 2){
            myTextField.font = UIFont.systemFontOfSize(CGFloat(70))
            }
            
            }*/
            
        }
    }
    
    //myTextFieldに表示されたキーボードを隠す
    @IBAction func TapReturnKey(){
        myTextField.resignFirstResponder()
    }
    
    @IBAction func red(){
        
    }
    //mindButtonを押したとき:mindArrayの要素を保存
    
    @IBAction func didTapmindButton(){
        
        
        //self.mindArray.append(self.myTextField.text)
        
        //performSegueWithIdentifier("to2", sender: nil)
        
        //mindDefault.setObject(mindArray, forKey: "MIND")
        //mindDefault.synchronize()
    
    
    //override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //if(segue.identifier == "to2"){
//var viewController2: ViewController2 = segue.destinationViewController as!ViewController2
            //viewController2.receiveArray = self.mindArray
            //println(mindArray)
            /*colorArray.append(color)
            fontArray.append(font)
            viewController2.colorArray = self.colorArray
            viewController2.fontArray = self.fontArray*/

    
/* @IBAction func testButton(){
        if let names = mindDefault.objectForKey("mindArray") as? [String] {
            // namesを参照可能
            
        }
    }
    
    
    //mindArrayのkeyで保存されたものを表示
    @IBAction func didTapyouButton(){
        if let mindArray2 = mindDefault.objectForKey("MIND") as? [String] {

            //mindArray2に保存されたmindArrayを送る
        }
        performSegueWithIdentifier("to3", sender: nil)
    }
   */*/
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
}