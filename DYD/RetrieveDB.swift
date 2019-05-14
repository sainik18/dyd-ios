//
//  RetrieveDB.swift
//  DYD
//
//  Created by apple on 2/25/19.
//  Copyright © 2019 Kiran. All rights reserved.
//
import UIKit
import CoreData

class RetrieveFromDataBase:NSObject
{
    func getViewContext() -> NSManagedObjectContext
    {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        return context
    }
    
    func getDetails(from:String)->String
    {
        var ret = [Details]()
        let main = getViewContext()
        let subMain=NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        subMain.parent=main
        
        if from == fromTable.Username.rawValue
        {
            let fetchDetails = NSFetchRequest<Username>(entityName:"Username")
            do{
                let searchResults = try subMain.fetch(fetchDetails)
                var det = Details()
                for i in 0..<searchResults.count
                {
                    let tableAttributes = searchResults[i]
                    det.name = tableAttributes.name!
                    ret.append(det)
                }
            }
            catch{}
            
            return ret.last!.name
        }
        
       return ret.last!.name
    }
    
    
    
}
