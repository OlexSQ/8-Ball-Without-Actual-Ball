//
//  MainViewModel.swift
//  8-Ball Without Actual Ball
//
//  Created by Mac on 17.10.2021.
//

import Foundation

class MainViewModel : NSObject {
    
    private var apiService: APIService!
    
    private(set) var ball: Ball? {
        didSet {
            if let answer = ball?.magic.answer {
                self.bindMainViewModelToController(answer)
            } else {
                let defaults = UserDefaults.standard
                let answers = defaults.stringArray(forKey: "DefaultAnswers") ?? ["Think about it one more time"]
                self.bindMainViewModelToController(answers.randomElement() ?? "Think about it one more time")
            }
        }
    }
    
    var bindMainViewModelToController: ((String) -> ()) = {_ in }
    
    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetMagicBall()
    }
    
    private func callFuncToGetMagicBall() {
        self.apiService.apiToGetMagicBall { ball in
            self.ball = ball
        }
    }

}
