//
//  Model.swift
//  NASAProjectAPI
//
//  Created by Matthew Garlington on 10/30/22.
//

import Foundation

struct NASAImage: Decodable, Hashable {
    var date: String
    var explanation: String
    var hdurl: URL
    var title: String
    var url: URL
}
