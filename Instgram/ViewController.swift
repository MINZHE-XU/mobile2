//
//  ViewController.swift
//  Instgram
//
//  Created by 许敏哲 on 17/9/18.
//  Copyright © 2018 许敏哲. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    //the picture in image view
    @IBOutlet weak var imageUp: UIImageView!
    
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var senderLbl: UILabel!
    @IBOutlet weak var receiverLbl: UILabel!
    @IBOutlet weak var picture: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                /**
        // Do any additional setup after loading the view, typically from a nib.
        let data = UIImageJPEGRepresentation(imageUp.image!, 0.5)
        let file = PFFile(name:"picture.jpg",data:data!)
        
        let object = PFObject(className:"messages")
        object["message"] = "hello"
        object["receiver"] = "aaaaa"
        object["sender"] = "bbbb"
        object["picture"] = file
        object.saveInBackground(block: { (done,error ) in
            if done {
                print ("saved in server")
            }else{
                print ("wrong in server")
                print(error ?? 1)
            }
        })
    
    
*/

        let information = PFQuery(className: "messages")
        information.findObjectsInBackground { (objects:[PFObject]?, error:Error?) in
            // if no error...
            
            if error == nil {
                
                //take each object from list of objects.
                for object in objects!{
                    let message = object["message"] as! String
                    let receiver = object["receiver"] as! String
                    let sender = object["sender"] as! String
                    let picture = object["picture"] as! PFFile
                    
                    self.messageLbl.text = "Message:\(message)"
                    self.receiverLbl.text = "Receiver:\(receiver)"
                    self.senderLbl.text = "Sender:\(sender)"
                    picture.getDataInBackground(block: { (data:Data?, error:Error?) in
                        
                        if error == nil {
                            if data != nil {
                                self.picture.image = UIImage(data:data!)
                            }
                        } else {
                            print(error!)
                        }
                    })
                }
            }else{
                print(error!)
            }
        }

    
    //override func didReceiveMemoryWarning() {
        //super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    //}
    }
}

