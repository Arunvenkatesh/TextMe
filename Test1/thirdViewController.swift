//
//  thirdViewController.swift
//  Test1
//
//  Created by CC on 6/2/17.
//  Copyright © 2017 CC. All rights reserved.
//


import UIKit
import FirebaseDatabase
class thirdViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextViewDelegate{
    

    @IBOutlet weak var msgData: UITextView!
    @IBOutlet weak var tabledata: UITableView!
    
    var ref: DatabaseReference?
    
    //var Dict =  [String: String]()
    var myList:[String] = []
    var myTime:[String] = []
    let userId = "123"
    let toId = "345"
    var messages: [[String: Any]] = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.msgData.delegate = self
    
        displayMessage()
    }
    //Textfield delegate methods
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5, animations: {
          
            
        }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cells")
        let displayMsg = cell?.viewWithTag(1) as! UILabel
        
        let timeStamp = cell?.viewWithTag(2) as! UILabel
        
        let messageDict = messages[indexPath.row]
        let message = messageDict["msg"]
        //displayMsg.text = String(describing: message)
        displayMsg.text = message as? String
        let timess = messageDict["timeStamp"]
        
        
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy HH:mm:ss"
        
        let dates = formatter.date(from: timess as! String)
     
        
       
        formatter.dateFormat = "HH:mm a"
        
        let datess = formatter.string(from: dates!)
     
        timeStamp.text = datess 
        
        return cell!
    }
  
    
    
    
    
    @IBAction func sendData(_ sender: UIButton) {
    
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy HH:mm:ss"
        let timeStamp = formatter.string(from: NSDate() as Date)
        
        let msg: String = msgData.text!
        if msg != ""
        {
        ref = Database.database().reference()
        let entry = ["msg" : msg , "fromId" : toId , "toId" : "567" , "timeStamp" : timeStamp] as [String : Any]
        if userId < "567"{
            ref?.child("message").child("\(toId)_\("567")").childByAutoId().setValue(entry)
        }else{
            ref?.child("message").child("\("567")_\(toId)").childByAutoId().setValue(entry)
        }
        msgData.text = ""
        
        // Add to inbox
        let inboxEntry = ["msg" : msg , "fromId" : toId , "toId" : "567" , "timeStamp" : timeStamp, "name": "ABC"] as [String : Any]
        let inboxRef = ref?.child("inbox")
        inboxRef?.child(toId).child("567").setValue(inboxEntry)
        inboxRef?.child("567").child(toId).setValue(inboxEntry)
        }
    }
    
    func displayMessage() {
        
        
        let refresh = UIRefreshControl()
        ref =  Database.database().reference()
        ref?.child("message").child("123_345").queryOrdered(byChild: "timeStamp").observe(.value, with: {(snapshot) in
            
            if let val = snapshot.value as? [String : Any] {

                let some = val.map({ $1}) as! [[String: Any]]
                let sorted = some.sorted(by: { ($0["timeStamp"] as! String) < ($1["timeStamp"] as! String) })
                
                //print("final *** \(sorted)")
                self.messages = sorted
                self.tabledata.reloadData()
            }
            refresh.endRefreshing()
        })
    }
    
   }
