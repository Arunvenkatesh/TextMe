//
//  secondViewController.swift
//  Test1
//
//  Created by CC on 6/8/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit
import Firebase

class secondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var table: UITableView!
    
     var messages : [[String : Any]] = [[String : Any]]()
    var ref: DatabaseReference?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayInbox()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return messages.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "inbox")
        let inboxName = cell?.viewWithTag(10) as! UILabel
        let inboxMsg = cell?.viewWithTag(20) as! UILabel
        let inboxTime = cell?.viewWithTag(30) as! UILabel

        let inboxDict = messages[indexPath.row]
        
        inboxName.text = inboxDict["name"] as? String
        inboxMsg.text = inboxDict["msg"] as? String
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy HH:mm:ss"
        let timeString = formatter.date(from: inboxDict["timeStamp"] as! String)
        
        formatter.dateFormat = "HH:mm a"
        inboxTime.text = formatter.string(from: timeString!)
 
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func displayInbox() {
        
        
        let refresh = UIRefreshControl()
        ref =  Database.database().reference()
        ref?.child("inbox").child("123").queryOrdered(byChild: "timeStamp").observe(.value, with: {(snapshot) in
            
            if let val = snapshot.value as? [String : Any] {
                
                let some = val.map({ $1}) as! [[String: Any]]
                let sorted = some.sorted(by: { ($0["timeStamp"] as! String) < ($1["timeStamp"] as! String) })
                
                //print("final *** \(sorted)")
                self.messages = sorted
                self.table.reloadData()
            }
            refresh.endRefreshing()
        })
    }

}
