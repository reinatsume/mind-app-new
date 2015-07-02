//
//  redViewController.swift
//  mind app new
//
//  Created by 夏目怜奈 on 2015/07/01.
//  Copyright (c) 2015年 夏目怜奈. All rights reserved.
//

import Foundation
import UIKit

class redViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var mindDefault = NSUserDefaults.standardUserDefaults()
    
    
    //テーブルビューインスタンス作成
    var tableView: UITableView  =   UITableView()
    
    //テーブルに表示するセル配列
    var redArray: [String] = []
    
    var fontArray:[String] = []
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //テーブルビュー初期化、関連付け
        tableView.frame         =   CGRectMake(0, 50, 320, 200);
        tableView.delegate      =   self
        tableView.dataSource    =   self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.redArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        /*
        if fontArray[0] == "■" {
        cell.textLabel?.font = UIFont.systemFontOfSize(CGFloat(10))
        }else if fontArray[1] == "■□"{
        cell.textLabel?.font = UIFont.systemFontOfSize(CGFloat(20))
        }else if fontArray[2] == "■□■"{
        cell.textLabel?.font = UIFont.systemFontOfSize(CGFloat(30))
        }
        */
        cell.textLabel?.text = self.redArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.redColor()
        self.tableView.separatorColor = UIColor.clearColor()
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath) as UITableViewCell
        var newBounds = cell.bounds
        newBounds.size.width = tableView.bounds.width
        cell.bounds = newBounds
        
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        return cell.bounds.height
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        
        // 削除
        let del = UITableViewRowAction(style: .Default, title: "Delete") {
            (action, indexPath) in
            
            self.redArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            self.mindDefault.removeObjectForKey("RED")//mindUserDefault

        }
        
        del.backgroundColor = UIColor.redColor()
        
        return [del]
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("セルを選択しました！ #\(indexPath.row)!")
    }
    
    func tableView(tableView: UITableView,canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {}
    
    
    @IBAction func mind(){
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
 
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.delegate = self
        //mindDe
        if((mindDefault.objectForKey("RED")) != nil){
            let objects = mindDefault.objectForKey("RED") as? [String]
            var mindString:AnyObject
            for mindString in objects!{
                redArray.append(mindString as String)
                }
            println(redArray)
            
        if((mindDefault.objectForKey("FONT")) != nil){
            let obejects = mindDefault.objectForKey("FONT") as? [String]
            var fontString:AnyObject
            for fontString in objects!{
            fontArray.append(fontString as String)
            }
        }
        
        
        
    }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

