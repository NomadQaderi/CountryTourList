//
//  DataModel.swift
//  TourList
//
//  Created by NOMAD on 9/19/22.
//

import Foundation

protocol ImageViewModel {
    var iconImageUrl: String? { get }
    var largeImageUrl: String? { get }
}

struct DataModel: Codable {
    let alpha2Code: String?
    let name: String?
    let callingCodes: [String]?
    let topLevelDomain: [String]?
    let capital: String?
    let region: String?
}

// MARK:- Country Image Extension
// Using open source image url to load country flag images
//
extension DataModel: ImageViewModel {
    var iconImageUrl: String? {
        guard let countryCode = alpha2Code?.lowercased(),
              !countryCode.isEmpty else {
                  return nil
              }
        return "https://flagcdn.com/w40/\(countryCode).png"
    }
    
    var largeImageUrl: String? {
        guard let countryCode = alpha2Code?.lowercased(),
              !countryCode.isEmpty else {
                  return nil
              }
        return "https://flagcdn.com/w640/\(countryCode).png"
    }
}
