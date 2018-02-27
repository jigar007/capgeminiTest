//
//    Row.swift
//
//    Create by Jigar Thakkar on 27/2/2018
//    Copyright © 2018. All rights reserved.
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Row{
    
    var descriptionField : String!
    var imageHref : AnyObject!
    var title : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        descriptionField = dictionary["description"] as? String
        imageHref = dictionary["imageHref"] as? AnyObject
        title = dictionary["title"] as? String
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if imageHref != nil{
            dictionary["imageHref"] = imageHref
        }
        if title != nil{
            dictionary["title"] = title
        }
        return dictionary
    }
    
}
