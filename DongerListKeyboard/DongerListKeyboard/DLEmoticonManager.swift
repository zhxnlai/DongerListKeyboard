//
//  DLEmoticonManager.swift
//  DongerListKeyboard
//
//  Created by Zhixuan Lai on 11/12/14.
//  Copyright (c) 2014 Zhixuan Lai. All rights reserved.
//

import Foundation
import SwiftyJSON

let appGroupId = "group.dongerListKeyboard"


private let _singletonInstance = DLEmoticonManager()

let kJSONCategoryKey = "category"
let kJSONValueKey = "value"

class DLEmoticonManager: NSObject {
    class var sharedInstance: DLEmoticonManager {
        return _singletonInstance
    }
    
    var emoticons:Dictionary<String,Array<String>> = Dictionary<String,Array<String>>()

    func initialize(data:NSData) {
        let json = JSON(data:data)
        let jsonColumns = json["columns"] //array
        let jsonRows = json["data"].arrayValue; //array
        
//        println("jsonColumns: \(jsonColumns)")

//        jsonRows.reduce(emoticons, combine: { (acc:Dictionary<String,Array<String>>, json:JSON) -> Dictionary<String,Array<String>> in
//            let category = json[kJSONCategoryKey].arrayValue[0].stringValue
//            let value = json[kJSONValueKey].arrayValue[0].stringValue
//            if var array = acc[category] {
//                array.append(value)
//            } else {
//                acc.updateValue(value: [value], forKey: category)
//            }
//        })
        
        
        for row in jsonRows {
            let category = formatCategory(row[kJSONCategoryKey].arrayValue[0].stringValue)
            let value = row[kJSONValueKey].arrayValue[0].stringValue
//            println("value \(value)")
            
//            if var array = emoticons[category] {
            if var array = emoticons[category] {
                array.append(value)
                emoticons.updateValue(array, forKey: category)
            } else {
                emoticons.updateValue([value], forKey: category)
            }
        }
        
//        println("dictionary: \(emoticons)")
        
        let sharedDefaults = NSUserDefaults(suiteName: appGroupId)!
//        sharedDefaults?.setObject(emoticons, forKey: "emoticons")
        sharedDefaults.setInteger(1, forKey: "test")

        sharedDefaults.setObject(NSKeyedArchiver.archivedDataWithRootObject(emoticons), forKey: "emoticons")
        if sharedDefaults.synchronize() {
            println("synchronized")
            println("share defaults: \(sharedDefaults.dictionaryRepresentation())")
        }
        
//        NSUserDefaults.standardUserDefaults().setObject(NSKeyedArchiver.archivedDataWithRootObject(object), forKey: key)

    }
    
    func formatCategory(name:String) -> String {
        let nameArray = name.componentsSeparatedByString(" ")
        return nameArray[1]
    }
}
