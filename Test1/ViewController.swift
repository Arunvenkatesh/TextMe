//
//  ViewController.swift
//  Test1
//
//  Created by CC on 6/1/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var sendMsg: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
  
    
    
    var myList:[String] = []
    var myTime:[String] = []
//
      var ref: DatabaseReference?
//    var handle: DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //retrieve_act()
        
            }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func onSend(_ sender: Any) {
        
        
        // for displaying time
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm a"
        let time = dateFormatter.string(from: Date())
        
        //for displaying message
        let msg: String = sendMsg.text!
        
        ref = Database.database().reference()
        let entry = ["msg" : msg , "time" : time]
        
        ref?.child("Inbox").child("hij").setValue(entry)
        
 
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    

    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
     let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
       let displayMsg = cell?.viewWithTag(1) as! UILabel
        displayMsg.text = myList[indexPath.row]
        
        
        
        let timeStamp = cell?.viewWithTag(2) as! UILabel
        timeStamp.text = myTime[indexPath.row]
        
        return cell!
        
    }
    
    func retrieve_act() {
        
        
        
        ref =  Database.database().reference()
        ref?.child("Inbox").child("hij").observe(.value, with: {(snapshot) in
            
            
            let val = snapshot.value as! [String : Any]
           
            let msg = val["msg"] as! String
            let time = val["time"] as! String
            self.myList.append(msg)
            self.myTime.append(time)
            self.tableView.reloadData()
            
            
            
        })
        


            }

}


