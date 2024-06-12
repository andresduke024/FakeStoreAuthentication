//
//  AddressResponse.swift
//  
//
//  Created by Andres Duque on 6/06/24.
//

import Foundation

struct AddressResponse: Codable {
    let city: String?
    let street: String?
    let number: Int?
    let zipcode: String?
}
