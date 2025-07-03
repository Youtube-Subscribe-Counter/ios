//
//  User.swift
//  ios
//
//  Created by Munkyu Yang on 7/3/25.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    let name: String
    let subscribers: String
    let thumbnail: String
    let rank: Int
}
