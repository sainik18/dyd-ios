//
//  InsertionDB.swift
//  DYD
//
//  Created by apple on 2/25/19.
//  Copyright © 2019 Kiran. All rights reserved.
//

import UIKit
import CoreData

class InsertIntoDataBase:NSObject
{
    
    func getViewContext() -> NSManagedObjectContext
    {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        return context
    }
    
    func insertDetails(into:String,details:Details)
    {
        let main = getViewContext()
        let subMain=NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        subMain.parent=main
        subMain.perform({
            if into == intoTable.Username.rawValue
            {
                let tableAttributes = Username(context: subMain)
                tableAttributes.name = details.name
                do
                {
                    try subMain.save()
                    main.perform({
                        do
                        {
                            try main.save()
                        }
                        catch
                        {
                            
                        }
                        
                    })
                }
                catch
                {
                    
                    
                }
            }
           
          })
    }
}
