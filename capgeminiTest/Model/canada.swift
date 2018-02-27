//
//    canada.swift
//
//    Create by Jigar Thakkar on 27/2/2018
//    Copyright © 2018. All rights reserved.
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct canada{
    
    var rows : [Row]!
    var title : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        rows = [Row]()
        if let rowsArray = dictionary["rows"] as? [[String:Any]]{
            for dic in rowsArray{
                let value = Row(fromDictionary: dic)
                rows.append(value)
            }
        }
        title = dictionary["title"] as? String
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if rows != nil{
            var dictionaryElements = [[String:Any]]()
            for rowsElement in rows {
                dictionaryElements.append(rowsElement.toDictionary())
            }
            dictionary["rows"] = dictionaryElements
        }
        if title != nil{
            dictionary["title"] = title
        }
        return dictionary
    }
    
}
