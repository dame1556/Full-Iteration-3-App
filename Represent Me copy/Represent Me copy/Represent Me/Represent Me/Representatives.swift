//
//  Representatives.swift
//  Represent Me
//
//  Created by Darin Meeker on 3/12/19.
//  Copyright © 2019 Darin Meeker. All rights reserved.
//

import Foundation

struct Representatives: Decodable{
    let first_name: String
    let last_name: String
    let state: String
    let party: String
    let date_of_birth: String
    let phone: String?
    let twitter_account = String()
    let total_votes = String()
    let missed_votes = String()
    let votes_with_party_pct = String()
}

struct RepresentativesMembers: Decodable {
    var members = [Representatives]()
}

struct RepresentativesData: Decodable {
    var results = [RepresentativesMembers]()
}

