//
//  yellowViewController.swift
//  mind app new
//
//  Created by 夏目怜奈 on 2015/07/01.
//  Copyright (c) 2015年 夏目怜奈. All rights reserved.
//

import Foundation
import UIKit

class yellowViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var mindDefault = NSUserDefaults.standardUserDefaults()
    
    
    //テーブルビューインスタンス作成
    var tableView: UITableView  =   UITableView()
    
    //テーブルに表示するセル配列
    var yellowArray: [String] = []
    
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
        return self.yellowArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.textLabel?.text = self.yellowArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.yellowColor()
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
            
            self.yellowArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        
        del.backgroundColor = UIColor.redColor()
        
        return [del]
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {}
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("セルを選択しました！ #\(indexPath.row)!")
    }
    
    @IBAction func mind () {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.delegate = self
        if((mindDefault.objectForKey("YELLOW")) != nil){
            let objects = mindDefault.objectForKey("YELLOW") as? [String]
            var mindString:AnyObject
            for mindString in objects!{
                yellowArray.append(mindString as String)
            }
        }
        println(yellowArray)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
};
