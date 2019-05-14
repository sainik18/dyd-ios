
//  PrayerViewController.swift
//  DYD
//
//  Created by apple on 2/1/19.
//  Copyright © 2019 Kiran. All rights reserved.



import UIKit
class PrayerViewController: UIViewController
{

    @IBOutlet weak var prayerLbl:UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        DispatchQueue.main.async
        {
            self.prayerLbl.text = UserDefaults.standard.value(forKey: "prayer") as! String
        }
        
    }
    
    @IBAction func cancel(_ sender: UIButton)
    {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(nextVC, animated: false, completion: nil)
        
    }
    
   
}
