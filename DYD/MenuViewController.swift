//
//  MenuViewController.swift
//  DYD
//
//  Created by apple on 2/2/19.
//  Copyright © 2019 Kiran. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    var menuList:[String] = []
    @IBOutlet weak var menuListTbl: UITableView!
    @IBOutlet weak var username:UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureTable()
        leftSwipe()
        DispatchQueue.main.async
        {
          if ListViewController.userDetails.isEmpty
          {
            self.username.text = "Hi, Welcome"
          }
          else
          {
            self.username.text = "Hi, \(ListViewController.userDetails)!"
           }
          
        }
        
    }
    
    
    func configureTable()
    {
     self.menuList = ["Devotion","Confession","Prayer","About DYD"]
        
     self.menuListTbl.tableFooterView = UIView()
    }
    func leftSwipe()
    {
        let left = UISwipeGestureRecognizer(target: self, action: #selector(swipedLeft(_:)))
        left.direction = .left
        self.view.addGestureRecognizer(left)
    }
    @objc func swipedLeft(_ sender:UISwipeGestureRecognizer)
    {
        print("Swiped Left")
        UIView.animate(withDuration:0.5)
        {
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
            
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromLeft
            transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
            self.view.window!.layer.add(transition, forKey: kCATransition)
            self.present(nextVC, animated: false, completion: nil)
        }
    }
    
    
    @IBAction func cancelAction(_ sender: Any)
    {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        self.view.window?.layer.add(transition, forKey: kCATransition)
        self.present(nextVC, animated: false, completion: nil)
    }
    
}

extension MenuViewController:UITableViewDelegate,UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0
        {
        return self.menuList.count
        }
        else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.section == 0
        {
     let cell = tableView.dequeueReusableCell(withIdentifier: "menu", for: indexPath)
    cell.textLabel?.text = self.menuList[indexPath.row]
     return cell
        }
        else
        {
            //donation
            let cell = tableView.dequeueReusableCell(withIdentifier: "donation", for: indexPath)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.section == 0
        {
            return 50.0
        }
        
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.section == 0
        {
        switch indexPath.row
        {
        case 0:let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        
        self.present(nextVC, animated: true, completion: nil);break
        
        case 1:let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ConfessionViewController") as! ConfessionViewController
        
        self.present(nextVC, animated: true, completion: nil);break
            
        case 2:let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "PrayerViewController") as! PrayerViewController
        
        self.present(nextVC, animated: true, completion: nil);break
            
        case 3:let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
        
        self.present(nextVC, animated: true, completion: nil);break
            
        default:
            print("\(indexPath.row)")
        }
      }
    else
    {
        
        UIApplication.shared.openURL(URL(string: "https://www.decreeyourday.org/donate/")! as URL)
    
//        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "DonationsViewController") as! DonationsViewController
//        self.present(nextVC, animated: true, completion: nil)
        
    }
    }
    
}
