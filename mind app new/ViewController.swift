//
//  ViewController.swift
//  mind app new
//
//  Created by 夏目怜奈 on 2015/06/22.
//  Copyright (c) 2015年 夏目怜奈. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet var myTextField: UITextField!
    
    
    @IBOutlet var myUIPicker: UIPickerView!
    
    var picker1: NSArray = ["オボエル","ヒラメキ","シラベル","ベンリ"]
    var picker2: NSArray = ["■","■□","■□■"]
    
    private let picker1Component = 0
    private let picker2Component = 1
    
    /*let picker1Row = myUIPicker.selectedRowInComponent(picker1Component)
    let picker2Row = myUIPicker.selectedRowInComponent(picker2Component)
    */
    
    
    
    
    var mindArray:[String] = []
    /*let savedata = NSUserDefaults.standardUserDefaults()
    savedata.setObject(mindArray, forKey:"MIND")
    saveadata.synchronize()
*/
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        //UITextFieldに表示
    myTextField.text = "hello!"
    myTextField.delegate = self
    self.view.addSubview(myTextField)
        
        //UIPickerView
    
    myUIPicker.delegate = self
    myUIPicker.dataSource = self
    self.view.addSubview(myUIPicker)
    
    }
    //表示
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    //表示個数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0){
        return picker1.count
            
        
        }else if(component == 1){
            return picker2.count
            
        }
        return 0;
        }
    //表示内容
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        if(component == 0){
        return picker1[row] as! String
        }else if (component == 1){
         return picker2[row] as! String
    }
        return"";
    }
    
    //選択時
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0){
            println("列:\(row)")
            println("値:\(picker1[row])")
            
        }else if(component == 1){
            println("列:\(row)")
            println("値:\(picker2[row])")
            
        }
    }

    
    
    @IBAction func TapReturnKey(){
                myTextField.resignFirstResponder()
    }


    @IBAction func didTapmindButton(){
        self.mindArray.append(self.myTextField.text)
        performSegueWithIdentifier("to2", sender: nil)
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "to2"){
            var viewController2: ViewController2 = segue.destinationViewController as!ViewController2
            viewController2.receiveArray = self.mindArray
            println(mindArray)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    }
