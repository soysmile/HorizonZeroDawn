//
//  storage.swift
//  HorizonZeroDown
//
//  Created by George Heints on 29.01.2018.
//  Copyright © 2018 George Heints. All rights reserved.
//

import Foundation

struct info : Decodable {
    let horizon : [testing]
}
struct testing : Decodable{
    let creature : String?
    let resists : String?
    let vulnerability : String?
    let descr : String?
    let imageUrl : String?
}

