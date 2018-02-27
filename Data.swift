//
//  Data.swift
//  TestApp
//
//  Created by Jigar Thakkar on 1/6/15.
//  Copyright (c) 2018 Jigar Thakkar. All rights reserved.
//

import Foundation

class Data {
    
    var name:String = ""
    var des:String = ""
    var hrefString: String = ""
    var title:String = ""
    
    init(name:String, des:String, hrefString:String){
        self.name = name
        self.des = des
        self.hrefString = hrefString
    }
}
