//
//  ListViewController.swift
//  DYD
//
//  Created by apple on 2/2/19.
//  Copyright © 2019 Kiran. All rights reserved.
//

import UIKit

class ListViewController: UIViewController
{
    
    @IBOutlet weak var quotesTable:UITableView!
    @IBOutlet weak var calandarView: UICollectionView!
    
    var dates_array = [QuoteDates]()
    var quotes_array = [QuoteByDate]()
    var dbRetrieveAccess = RetrieveFromDataBase()
    static var userDetails:String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let date_now = Date.getFormattedDate(string:"\(Date())")
        DispatchQueue.main.async
        {
            self.configureTable()
            print("new  \(date_now)")
            self.getDetails()
            if Connectivity.isConnectedToNetwork(){
            self.getDateDetails()
            self.getQuotes(Id:"\(date_now)")
            self.rightSwipe()
            }
            else
            {
              self.present(showAlert("OOPS !! This seems to be no Internet Conncetion"), animated: true, completion: nil)
            }
        }
       

    }
    
    
    func getDetails()
    {
        DispatchQueue.main.async
            {
                ListViewController.userDetails = self.dbRetrieveAccess.getDetails(from: fromTable.Username.rawValue)
        }
    }
    
    
    
    func getDateDetails()
    {
      makeGetRequest(urlPath:APIConfigure.quoteDates)
       { (response) in
        print(response)
        
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
                var date_Val = QuoteDates()
                for i in 0..<details.count
                {
                    var arr = details[i] as! [String:Any]
                    
                    date_Val.date = arr["date"] as! String
                    date_Val.gen_date = arr["gen_date"] as! String
                    self.dates_array.append(date_Val)
                }
                DispatchQueue.main.async
                {
                self.calandarView.reloadData()
                }
            }
        }
        else
        {
            
        }
        
        }
    
       }
        
    }
    
    
    
    func getQuotes(Id:String)
    {
        self.quotes_array = []
        makeGetRequest(urlPath:APIConfigure.quoteByDate+Id)
        { (response) in
            print(response)
            print(APIConfigure.quoteByDate+Id)
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
                            quote_Val.confession = arr["confession"] as! String
                            quote_Val.date = arr["date"] as! String
                            quote_Val.prayer = arr["prayer"] as! String
                            quote_Val.text = arr["text"] as! String
                            quote_Val.topic = arr["topic"] as! String
                            quote_Val.bible = arr["bible"] as! String
                            self.quotes_array.append(quote_Val)
                        }
                        DispatchQueue.main.async
                        {
                         self.quotesTable.reloadData()
                        }
                    }
                }
                else
                {
                    
                }
                
            }
            
        }
        
    }
    

    @IBAction func menuReveal(_ sender: UIButton)
    {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(nextVC, animated: false, completion: nil)
    }
    
    
    //MARK:- Functions
    func configureTable()
    {
      self.quotesTable.tableFooterView = UIView()
    }
    func rightSwipe()
    {
        let left = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight(_:)))
        left.direction = .right
        self.view.addGestureRecognizer(left)
    }
    @objc func swipedRight(_ sender:UISwipeGestureRecognizer)
    {
        print("Swiped Right")
        UIView.animate(withDuration:0.5)
        {
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
            
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromLeft
            transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
            self.view.window!.layer.add(transition, forKey: kCATransition)
            self.present(nextVC, animated: false, completion: nil)
        }
    }

    
    
}
extension ListViewController:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
      return self.quotes_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier:"quote", for: indexPath)
       cell.textLabel?.text = self.quotes_array[indexPath.item].topic
       cell.detailTextLabel?.text = self.quotes_array[indexPath.item].date
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "QuoteViewController") as! QuoteViewController
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        self.view.window?.layer.add(transition, forKey: kCATransition)
        nextVC.quoteDetails = self.quotes_array[indexPath.row]
        self.present(nextVC, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }

}
extension ListViewController:UICollectionViewDelegate,UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.dates_array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calandar", for: indexPath) as! CalandarCollectionViewCell
        
        let date_txt =  self.dates_array[indexPath.item].date.replacingOccurrences(of: ",", with: "").components(separatedBy: " ")[0].prefix(3)
        cell.monthLbl.text = self.dates_array[indexPath.item].date.replacingOccurrences(of: ",", with: "").components(separatedBy: " ")[1]
        cell.dateLbl.text = String(date_txt)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
      let select = indexPath.item
      
      getQuotes(Id:self.dates_array[select].gen_date)
        
    }
    
    
}

extension Date
{
    
    static func getFormattedDate2(string: String) -> String{
        let dateFormatter = DateFormatter()
        let dateVal = Date()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss +zzzz" // This formate is input formated .
        
        let formateDate = dateFormatter.date(from:"\(dateVal)")!
        dateFormatter.dateFormat = "yyyy-MM-dd" // Output Formated
        
        print ("Print :\(dateFormatter.string(from: formateDate))")//Print :02-02-2018
        return dateFormatter.string(from: formateDate)
    }
    
    
    static func getFormattedDate(string: String) -> String{
        let dateFormatter = DateFormatter()
        let dateVal = Date()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss +zzzz" // This formate is input formated .
        
        let formateDate = dateFormatter.date(from:"\(dateVal)")!
        dateFormatter.dateFormat = "dd-MM-yyyy" // Output Formated
        
        print ("Print :\(dateFormatter.string(from: formateDate))")//Print :02-02-2018
        return dateFormatter.string(from: formateDate)
    }
}
