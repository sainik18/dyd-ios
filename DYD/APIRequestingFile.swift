//
//  APIRequestingFile.swift
//  DYD
//
//  Created by apple on 2/14/19.
//  Copyright © 2019 Kiran. All rights reserved.
//

import Foundation
import UIKit

protocol JSONRepresentable {
    var JSONRepresentation: Any { get }
}

protocol JSONSerializable: JSONRepresentable {}

//: ### Implementing the functionality through protocol extensions
extension JSONSerializable {
    var JSONRepresentation: Any {
        var representation = [String: Any]()
        
        for case let (label?, value) in Mirror(reflecting: self).children {
            
            switch value {
                
            case let value as Dictionary<String, Any>:
                representation[label] = value as AnyObject
                
            case let value as Array<Any>:
                if let val = value as? [JSONSerializable] {
                    representation[label] = val.map({ $0.JSONRepresentation as AnyObject }) as AnyObject
                } else {
                    representation[label] = value as AnyObject
                }
                
            case let value:
                representation[label] = value as AnyObject
                
            default:
                // Ignore any unserializable properties
                break
            }
        }
        return representation as Any
    }
}

extension JSONSerializable {
    func toJSON() -> String? {
        let representation = JSONRepresentation
        
        guard JSONSerialization.isValidJSONObject(representation) else
        {
            print("Invalid JSON Representation")
            return nil
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: representation, options: [])
            
            return String(data: data, encoding: .utf8)
        } catch {
            return nil
        }
    }
}

func makePostRequest(urlPath:String, postString:String,completionHandler:@escaping (_ retData:NSDictionary)->())->Void
{
    //print("the request in ppost is \(postString)")
    let json=convertToDictionary(text:postString)
    
    let data = try? JSONSerialization.data(withJSONObject: json ?? "{}", options: .prettyPrinted)
    
    
    var request = URLRequest(url: URL(string: urlPath)!)
    request.httpMethod = "POST";
    request.httpBody=data
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    
    let session = URLSession.shared
    
    session.dataTask(with: request) {data, response, err in
        do {
            
            
            if(data != nil)
            {
                if let jsonResult = try JSONSerialization.jsonObject(with:  data!, options: []) as? NSDictionary {
                    
                    
                    print(jsonResult)
                    
                    
                    
                    //print(jsonResult["Status"])
                    completionHandler(jsonResult)
                    
                }
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        }.resume()
    
}


func convertToDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}

func makeGetRequest(urlPath:String, completionHandler:@escaping (_ retData:NSDictionary)->())->Void
{
    
    var request = URLRequest(url: URL(string: urlPath)!)
    request.httpMethod = "GET";
    //request.httpBody=data
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    
    let session = URLSession.shared
    
    session.dataTask(with: request) {data, response, err in
        do {
            
            //let responseData = String(data: data!, encoding: String.Encoding.utf8)
            // print("URLResponse\(data)")
            if(data != nil)
            {
                if let jsonResult = try JSONSerialization.jsonObject(with:  data!, options: []) as? NSDictionary {
                    
                    print("ASynchronous\(jsonResult)")
                    
                    completionHandler(jsonResult)
                    
                }
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        }.resume()
        
  
}

func getDeviceId()->String{
    let ret:String=UIDevice.current.identifierForVendor!.uuidString
    //print("################ the device id is \(ret)")
    return ret
}

/*
 This Function is used only when you write API in info.plist
 func getLoginAPI()->String
 {
 var ret:String = ""
 let path = Bundle.main.path(forResource: "APIList", ofType:"plist")
 if let dict = NSDictionary.init(contentsOfFile: path!) as? [String:Any]
 {
 ret = dict["TestDomain"] as! String
 ret += dict["LoginAPI"] as! String
 }
 return ret
 }
 */
func showAlert(_ actionMessage : String) -> UIAlertController
{
    let alertController = UIAlertController(title: actionMessage, message: "", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default) { (action) -> Void in
    }
    alertController.addAction(okAction)
    return alertController
}
