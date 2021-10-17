//
//  SettingsViewModel.swift
//  8-Ball Without Actual Ball
//
//  Created by Mac on 17.10.2021.
//

import Foundation

class SettingsViewModel: NSObject {
    
    var bindSettingsViewModelToController: ((SettingsScreenStates) -> ()) = { _ in }
    
    enum SettingsScreenStates {
        case Success
        case Failure
    }
    
    func saveNewPrediction(prediction: String) {
        if prediction.isEmpty {
            bindSettingsViewModelToController(.Failure)
        } else {
            let defaults = UserDefaults.standard
            var answers = defaults.stringArray(forKey: "DefaultAnswers") ?? [String]()
            answers.append(prediction)
            defaults.set(answers, forKey: "DefaultAnswers")
            bindSettingsViewModelToController(.Success)
        }
    }
    
    
}
