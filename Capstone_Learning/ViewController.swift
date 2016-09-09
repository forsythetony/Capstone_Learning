//
//  ViewController.swift
//  Capstone_Learning
//
//  Created by Tony Forsythe on 9/8/16.
//  Copyright © 2016 Tony Forsythe. All rights reserved.
//

import UIKit

enum SegueType : String
{
    case ViewController = "segue_to_viewcontroller_example"
    case Unknown = "unknown"
    
    
    static func countUnknown() -> Int {
        
        return SegueType.Unknown.rawValue.characters.count
    }
}






class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var testViewController: UITableView!
    
    let tableViewData = [
                            "Basic View Controller",
                            "Collection View Controller",
                            "Animations",
                            "Image Taking"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        
        
        print(SegueType.countUnknown())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    private func setupTableView() {
        
        self.testViewController.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuse")
        self.testViewController.delegate = self
        self.testViewController.dataSource = self
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewData.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("reuse", forIndexPath: indexPath)
        
        let name = self.tableViewData[indexPath.row]
        
        cell.textLabel?.text = name
        
        return cell
        
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let name = self.tableViewData[indexPath.row]
        
        if name == "Basic View Controller" {
            
            self.performSegueWithIdentifier("segue_to_viewcontroller_example", sender: nil)
        }
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        guard let segue_id = segue.identifier else { return }
            
            switch segue_id {
            case SegueType.ViewController.rawValue:
                
                let dest = segue.destinationViewController as! ViewControllerExampleVC
                
                dest.someName = "wow there"
                
                
                
                
            default: break
                
            }
       
    }
}

