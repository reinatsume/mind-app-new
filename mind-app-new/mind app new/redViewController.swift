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
    var smallFontArray:[String] = []
    var mediumFontArray:[String] = []
    var bigFontArray:[String] = []
    
    
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
    
    //テーブルビューの表示
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        cell.textLabel?.text = self.redArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.redColor()
        self.tableView.separatorColor = UIColor.clearColor()
        
        if smallFontArray == [""]{
            cell.textLabel?.font = UIFont.systemFontOfSize(CGFloat(10))
        }
        if mediumFontArray == [""]{
            cell.textLabel?.font = UIFont.systemFontOfSize(CGFloat(20))
        }
        
        if bigFontArray == [""]{
            cell.textLabel?.font = UIFont.systemFontOfSize(CGFloat(30))
        }
        
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
    }//セルを選択したとき
    
    func tableView(tableView: UITableView,canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }//テーブルビューへの編集を可能にする
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {}
    
    
    @IBAction func mind(){
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }//前の画面に戻る
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.delegate = self
        //mindDefaultを呼び出す
        if((mindDefault.objectForKey("RED")) != nil){
            let objects = mindDefault.objectForKey("RED") as? [String]
            var mindString:AnyObject
            for mindString in objects!{
                redArray.append(mindString as String)
            }
            println(redArray)
            
            if((mindDefault.objectForKey("SMALL")) != nil){
                let obejects = mindDefault.objectForKey("SMALL") as? [String]
                var fontString:AnyObject
                for fontString in objects!{
                    smallFontArray.append(fontString as String)
                }
                if((mindDefault.objectForKey("MEDIUM")) != nil){
                    let obejects = mindDefault.objectForKey("MEDIUM") as? [String]
                    var fontString:AnyObject
                    for fontString in objects!{
                        mediumFontArray.append(fontString as String)
                    }
                    
                    if((mindDefault.objectForKey("BIG")) != nil){
                        let obejects = mindDefault.objectForKey("BIG") as? [String]
                        var fontString:AnyObject
                        for fontString in objects!{
                            bigFontArray.append(fontString as String)
                        }
                        
                    }
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

