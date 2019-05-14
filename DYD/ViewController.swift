//
//  ViewController.swift
//  DYD
//
//  Created by apple on 2/1/19.
//  Copyright © 2019 Kiran. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var todayQuoteLbl:UILabel!
    var quoteArry = [QuoteByDate]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        DispatchQueue.main.async
        {
            if Connectivity.isConnectedToNetwork()
            {
                let date_now = Date.getFormattedDate2(string:"\(Date())")
                self.getTodayQuote()
                self.sendDate(dateVal:date_now)
            }
            else
            {
                self.present(showAlert("OOPS !! This seems to be no Internet Conncetion"), animated: true, completion: nil)
            }
        }
    }


    @IBAction func readDevotionAction(_ sender: Any)
    {
       let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        self.present(nextVC, animated: true, completion: nil)
    }
    
    
    func getTodayQuote()
    {
        makeGetRequest(urlPath:APIConfigure.todayQuote)
        { (response) in
            //print(response)
            
            var dict = response as! [String:Any]
            
            if (dict["status"] as! String)  !=  "OK"
            {
                
            }else
            {
                if ((dict["msg"] as? [[String:Any]]) != nil)
                {
                    let details = dict["msg"] as! [[String:Any]]
                    
                    if details.count == 0
                    {
                        
                        
                    }else
                    {
                        var quote_Val = QuoteByDate()
                        for i in 0..<details.count
                        {
                            var arr = details[i]
                            quote_Val.id = arr["id"] as! String
                            quote_Val.author = arr["author"] as! String
                        
                            if ((arr["confession"] as? String) != nil)
                            {
                                quote_Val.confession = arr["confession"] as! String
                                let storage1 = UserDefaults.standard.setValue(quote_Val.confession, forKey:"confession")
                            }
                            else
                            {
                                quote_Val.confession = "No Confession"
                                let storage1 = UserDefaults.standard.setValue(quote_Val.confession, forKey:"confession")
                            }
                            if ((arr["prayer"] as? String) != nil)
                            {
                                quote_Val.prayer = arr["prayer"] as! String
                                let storage2 = UserDefaults.standard.setValue(quote_Val.prayer, forKey:"prayer")
                            }
                            else
                            {
                                quote_Val.prayer = "No Prayer"
                                let storage1 = UserDefaults.standard.setValue(quote_Val.prayer, forKey:"prayer")
                            }
                            quote_Val.date = arr["date"] as! String
                            quote_Val.text = arr["text"] as! String
                            quote_Val.topic = arr["topic"] as! String
                            quote_Val.bible = arr["bible"] as! String
                            self.quoteArry.append(quote_Val)
                    }
                }
            }
            
        }
        
    }
    
    
    }
    
    
    func sendDate(dateVal:String)
    {
      let val = dateVal
      print(APIConfigure.sendDate+val)
      if !val.isEmpty
      {
        makeGetRequest(urlPath:APIConfigure.sendDate+val)
        {
           (Response) in
           print(APIConfigure.sendDate+val)
           print("\(Response)  respo")
        }
      }
    }
    
    
    
    
    
    
    
    
    
}

