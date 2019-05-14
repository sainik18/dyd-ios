//
//  DonationsViewController.swift
//  DYD
//
//  Created by apple on 2/27/19.
//  Copyright © 2019 Kiran. All rights reserved.
//

import UIKit
import WebKit

class DonationsViewController: UIViewController,UIScrollViewDelegate
{

        //MARK: - IBOutlets
        @IBOutlet var webView: WKWebView!
    
    //MARK: - Properties
        /*Loading variable tells us the loading sequence of the methods API*/
        var loading:Int = 0
        var timer:Timer!
        var stop:Bool = false
        
        //MARK: - ViewMethods
        override func viewDidLoad()
        {
            super.viewDidLoad()
            self.webConfigurations()
        }
        
        
        
        //MARK:- WebMethods
        func webConfigurations()
        {
            self.webView.scrollView.delegate = self
            self.webView.scrollView.bounces = false
            self.webView.clearsContextBeforeDrawing = true
            self.webView.load(URLRequest(url:URL(string: "http://www.decreeyourday.org/donate/")!))
        }
        
        
        //MARK: - Scroll Methods
        func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?)
        {
            scrollView.pinchGestureRecognizer?.isEnabled = false
            scrollView.panGestureRecognizer.isEnabled = false
        }
        
        
        
        //MARK:- LoadAPIRequests
        func loadRequests()
        {
            self.webConfigurations()
        }
        
    
    @IBAction func cancelAction(_ sender: Any)
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
