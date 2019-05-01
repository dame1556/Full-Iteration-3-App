//
//  Bills.swift
//  Represent Me
//
//  Created by Darin Meeker on 3/12/19.
//  Copyright © 2019 Darin Meeker. All rights reserved.
//

import Foundation

struct Bills: Decodable{
    let number: String
    let short_title: String
    let summary: String
    let sponsor_name: String
    let sponsor_party: String
    let sponsor_state: String
    
    
}

struct BillsInfo: Decodable {
    var bills = [Bills]()
}

struct BillsData: Decodable {
    var results = [BillsInfo]()
}
