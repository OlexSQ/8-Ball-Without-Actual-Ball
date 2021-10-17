//
//  Ball.swift
//  8-Ball Without Actual Ball
//
//  Created by Mac on 17.10.2021.
//

import Foundation


struct Ball: Codable {
    let magic: Magic
}

struct Magic: Codable {
    let question, answer, type: String
}
