//
//  LoginSwitcher.swift
//  DYD
//
//  Created by apple on 2/25/19.
//  Copyright © 2019 Kiran. All rights reserved.
//

import Foundation
import UIKit

class Switcher {
    
    static func updateRootVC(){
        
        let status = UserDefaults.standard.bool(forKey: "status")
        var rootVC : UIViewController?
        
        print(status)
        
        
        if(status == true){
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        }else{
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OpeningViewController") as! OpeningViewController
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC
        
    }
    
}
