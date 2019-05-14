//
//  LoginScreenViewController.swift
//  DYD
//
//  Created by apple on 2/25/19.
//  Copyright © 2019 Kiran. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController {

    var dbInsertAccess = InsertIntoDataBase()
    var username = [Details]()
    
    @IBOutlet weak var nameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTF.delegate = self
    }
    

    @IBAction func takeMeAction(_ sender: UIButton)
    {
        if (nameTF.text?.isEmpty)!
        {
        self.present(showAlert("Name Field cannot be Empty"), animated: true, completion: nil)
        }
        else
        {
            DispatchQueue.main.async
            {
                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                var det = Details()
                det.name = self.nameTF.text!
                UserDefaults.standard.set(true, forKey: "status")
                Switcher.updateRootVC()
             self.dbInsertAccess.insertDetails(into:intoTable.Username.rawValue, details:det)
                self.present(nextVC, animated: true, completion: nil)
                
            
            }
        }
    }
}

extension LoginScreenViewController:UITextFieldDelegate
{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
     textField.resignFirstResponder()
        return true
    }
    
    
}
