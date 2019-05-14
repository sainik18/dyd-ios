//
//  APIResponseFile.swift
//  DYD
//
//  Created by apple on 2/14/19.
//  Copyright © 2019 Kiran. All rights reserved.
//

import Foundation
import UIKit


struct APIMethodResponse
{
    var Status:Bool
    var Reason:String
}
struct QuoteByDate
{
    /*
     {
     "code": "200",
     "msg": [
     {
     "id": "8",
     "background_color": "#000000",
     "text_color": "#FFFFFF",
     "text": "",
     "category": "2",
     "author": "",
     "prayer": "Cdcdcdc",
     "confession": "Cdcdcdcdc",
     "date": "February, 08 2019",
     "category_name": ""
     }
     ]
     }
     */
    
    var id:String = ""
    var background_color:String = ""
    var text_color:String = ""
    var text:String = ""
    var category:String = ""
    var author:String = ""
    var prayer:String = ""
    var confession:String = ""
    var date:String = ""
    var category_name:String = ""
    var topic:String = ""
    var bible:String = ""

}

struct QuoteDates
{
    /*
     {
     "code": "200",
     "msg": [
     {
     "date": "February, 06 2019",
     "gen_date": "2019-02-06"
     },
     {
     "date": "February, 08 2019",
     "gen_date": "2019-02-08"
     },
     {
     "date": "February, 13 2019",
     "gen_date": "2019-02-13"
     }
     ]
     }
     */
    
    var date:String = ""
    var gen_date:String = ""
}


struct QuoteById
{
    /*
     {
     "code": "200",
     "msg": [
     {
     "id": "3",
     "background_color": "#000000",
     "text_color": "#FFFFFF",
     "text": "You Don't Want To Become Guilty Of Plagiarism By Letting Someone Else's Words Get Inadvertently Mixed In With Your Own.",
     "category": "2",
     "author": "Johen M",
     "prayer": "Prayer",
     "confession": "COnfession",
     "date": "February, 13 2019",
     "category_name": ""
     }
     ]
     }
     */
    
    var id:String = ""
    var background_color:String = ""
    var text_color:String = ""
    var text:String = ""
    var category:String = ""
    var author:String = ""
    var prayer:String = ""
    var confession:String = ""
    var date:String = ""
    var category_name:String = ""
}
struct Details
{
   var name:String = ""
   var isLoggedIn:String = ""
}
enum intoTable:String
{
    case Username = "Username"
}

enum fromTable:String
{
    case Username = "Username"
}
