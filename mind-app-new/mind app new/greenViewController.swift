//
//  greenViewController.swift
//  mind app new
//
//  Created by 夏目怜奈 on 2015/07/01.
//  Copyright (c) 2015年 夏目怜奈. All rights reserved.
//

import Foundation


import UIKit

class greenViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var mindDefault = NSUserDefaults.standardUserDefaults()
    //テーブルビューインスタンス作成
    var tableView: UITableView  =   UITableView()
    
    //テーブルに表示するセル配列
    var greenArray: [String] = []
    
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
        return self.greenArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.textLabel?.text = self.greenArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.greenColor()
        self.tableView.separatorColor = UIColor.clearColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("セルを選択しました！ #\(indexPath.row)!")
    }
    
    @IBAction func mind () {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.delegate = self
        if((mindDefault.objectForKey("GREEN")) != nil){
            let objects = mindDefault.objectForKey("GREEN") as? [String]
            var mindString:AnyObject
            for mindString in objects!{
                greenArray.append(mindString as String)
            }
        }
        println(greenArray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
};