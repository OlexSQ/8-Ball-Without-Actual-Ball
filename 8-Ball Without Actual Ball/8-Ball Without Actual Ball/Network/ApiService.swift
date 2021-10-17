//
//  ApiService.swift
//  8-Ball Without Actual Ball
//
//  Created by Mac on 17.10.2021.
//

import Foundation

class APIService: NSObject {
    
    private let sourceURL = URL(string: "https://8ball.delegator.com/magic/JSON/willMyTestTaskGood")!
    
    func apiToGetMagicBall(comletion: @escaping (Ball?) -> ()) {
        URLSession.shared.dataTask(with: sourceURL) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let ball = try! jsonDecoder.decode(Ball.self, from: data)
                comletion(ball)
            } else {
                comletion(nil)
            }
        }.resume()
    }
}
