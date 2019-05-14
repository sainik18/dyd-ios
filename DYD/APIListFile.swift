//
//  APIListFile.swift
//  DYD
//
//  Created by apple on 2/14/19.
//  Copyright © 2019 Kiran. All rights reserved.
//

import Foundation

struct APIConfigure
{
    static var devHost:String = "https://missafricaindia.com//"
    static var liveHost:String = "https://www.decreeyourday.org/"
    static var testHost:String = liveHost
    static var quoteDates:String = testHost + "admin/API/index.php?p=getQuoteDates"
    static var quoteByDate:String = testHost + "admin/API/index.php?p=GetQuoteByDate&quote_date="
    static var quoteById:String = testHost + "admin/API/index.php?p=GetQuoteById&quote_id="
    static var todayQuote:String = testHost + "admin/API/index.php?p=GetTodayQuote"
    static var sendDate:String = testHost + "admin/API/index.php?p=getQuoteDates&quote_date="
}



/*
 http://missafricaindia.com//church/API/index.php?p=getQuoteDates
 
 http://missafricaindia.com//church/API/index.php?p=GetQuoteByDate&quote_date=2019-02-08
 
 http://missafricaindia.com//church/API/index.php?p=GetQuoteById&quote_id=3
*/




/*class GETstadiumDetails:NSObject
 {
 
 static var stadiumData = GETstadiumDetails()
 
 public var stadiums = [stadiumDetails]()
 
 
 public func details() -> [stadiumDetails]
 {
 let url = APIConfigure.stadiumDetailsAPI
 
 makeGetRequest(urlPath: url) { response in
 
 print(" STADIUM details \(response)")
 
 let dict = response as! [String:Any]
 
 if ((dict["Value"] as? [[String:Any]]) != nil)
 {
 let details = dict["Value"] as! [[String:Any]]
 
 if details.count == 0
 {
 
 
 }else
 {
 var stadium = stadiumDetails()
 for i in 0..<details.count
 {
 var arr = details[i] as! [String:Any]
 stadium.ID = arr["ID"] as! Int
 stadium.Name = arr["Name"] as! String
 stadium.Address = arr["Address"]  as! String
 stadium.Description = arr["Description"] as! String
 stadium.Latitude = arr["Latitude"] as! Double
 stadium.Longitude = arr["Longitude"] as! Double
 stadium.MainImage = arr["MainImage"] as! String
 stadium.Status = arr["Status"] as! String
 stadium.Type = arr["Type"] as! String
 stadium.Capacity = arr["Capacity"] as! Int
 stadium.PerHourCharges = arr["PerHourCharges"] as! Int
 stadium.Date = arr["Date"] as! String
 stadium.Ratings = arr["Ratings"] as! Int
 stadium.Opened = arr["Opened"] as! String
 stadium.Latitude = arr["Latitude"] as! Double
 stadium.NoOfFEDlights = arr["NoOfFEDlights"] as! Int
 stadium.Indoor = arr["Indoor"] as! Int
 stadium.WaterCapacity = arr["WaterCapacity"] as! Int
 stadium.PowerConsumption = arr["PowerConsumption"] as! Int
 stadium.Length = arr["Length"] as! Int
 stadium.Width = arr["Width"] as! Int
 stadium.RoofHeight = arr["RoofHeight"] as! Int
 stadium.FloorType = arr["FloorType"] as! String
 stadium.SuitedFor = arr["SuitedFor"] as! String
 stadium.Tags = arr["Tags"] as! String
 self.stadiums.append(stadium)
 }
 }
 }
 else
 {
 
 }
 
 }
 return self.stadiums
 }
 
 }
*/
