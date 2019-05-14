//
//  QuoteViewController.swift
//  DYD
//
//  Created by apple on 2/2/19.
//  Copyright © 2019 Kiran. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController
{
    //MARK:-OUTLETS
    @IBOutlet weak var menu: UIButton!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bibleVerseLbl: UILabel!
    @IBOutlet weak var quoteText: UITextView!
    
    @IBOutlet weak var prayerTableView: UITableView!
    
    
    
    //MARK:- PROPERTIES
    var quoteDetails = QuoteByDate()
    
    
    //MARK:-VIEW METHODS
    override func viewDidLoad()
    {
        super.viewDidLoad()
        DispatchQueue.main.async
        {
          self.configureUI()
          self.adjustUITextViewHeight(arg: self.quoteText)
        }
    }

    
    //MARK:- Functions
    func configureUI()
    {
      self.dateLbl.text = quoteDetails.date
      self.quoteText.text = quoteDetails.text
      self.bibleVerseLbl.text = quoteDetails.bible
      self.titleLbl.text = quoteDetails.topic
      self.prayerTableView.rowHeight = UITableView.automaticDimension
      self.prayerTableView.estimatedRowHeight = 150.0

    }
    func adjustUITextViewHeight(arg : UITextView)
    {
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }

    
    
    
    
    //MARK:- ACTIONS
    @IBAction func menuAction(_ sender: Any)
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
    
    
}

extension QuoteViewController:UITableViewDelegate,UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0
        {
        return 1
        }
        else{
        return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.section == 0
        {
          let cell = tableView.dequeueReusableCell(withIdentifier: "prayer", for: indexPath) as! CustomTableViewCell
            cell.prayerTextView.text = quoteDetails.prayer
            self.adjustUITextViewHeight(arg: cell.prayerTextView)
            return cell
        }
        else
        {
           let cell = tableView.dequeueReusableCell(withIdentifier: "confession", for: indexPath) as! CustomTableViewCell
            cell.confessionTextView.text = quoteDetails.confession
            self.adjustUITextViewHeight(arg: cell.confessionTextView)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 150.0
    }
  
}
