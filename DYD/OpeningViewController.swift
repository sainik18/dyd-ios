//
//  OpeningViewController.swift
//  DYD
//
//  Created by apple on 02/26/19.
//  Copyright © 2018 Kiran. All rights reserved.
//

import UIKit
import WebKit


class OpeningViewController: UIViewController,UIScrollViewDelegate
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
        if Connectivity.isConnectedToNetwork()
        {
        self.webConfigurations()
        }
        else{
            self.present(showAlert("Oops !! please check your internet Connection"), animated: true, completion: nil)
        }
       self.timer = Timer.scheduledTimer(timeInterval:12.0, target: self, selector:#selector(buttonVisible), userInfo: nil, repeats: false)
    }
    

    
    //MARK:- WebMethods
    func webConfigurations()
    {
        self.webView.scrollView.delegate = self
        self.webView.scrollView.bounces = false
        self.webView.clearsContextBeforeDrawing = true
        self.webView.load(URLRequest(url:URL(string: "http://www.decreeyourday.org/admin/API/LoadingScreen.html")!))
    }
    
    
    //MARK: - Scroll Methods
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?)
    {
        scrollView.pinchGestureRecognizer?.isEnabled = false
        scrollView.panGestureRecognizer.isEnabled = false
    }

    
    //MARK:- Make button visible
    @objc func buttonVisible()
    {
      var status = UserDefaults.standard.bool(forKey: "status")
      if status == true
      {
      let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
       self.present(nextVC, animated: true, completion: nil)
      }
      else{
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginScreenViewController") as! LoginScreenViewController
        self.present(nextVC, animated: true, completion: nil)
        
        }
    }
    
    
    
    //MARK:- LoadAPIRequests
    func loadRequests()
    {
        self.webConfigurations()
    }
    
    
}
