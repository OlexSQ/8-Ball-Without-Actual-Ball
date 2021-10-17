//
//  SettingsViewController.swift
//  8-Ball Without Actual Ball
//
//  Created by Mac on 17.10.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var predictionTextField: UITextField!
    
    private var settingsViewModel: SettingsViewModel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        callViewModelToSavePrediction()
    }
    
    private func callViewModelToSavePrediction() {
        settingsViewModel = SettingsViewModel()
        settingsViewModel.bindSettingsViewModelToController = { result in
            switch result {
            case .Success:
                self.clearTextField()
                self.predictionTextField.endEditing(true)
                self.showToast(message: "Prediction was added", font: .systemFont(ofSize: 20.0))
            case .Failure:
                self.predictionTextField.endEditing(true)
                self.showToast(message: "Nothing to add", font: .systemFont(ofSize: 20.0))
            }
        }
    }
    
    private func clearTextField() {
        predictionTextField.text = ""
    }
    
    //MARK: - Actions
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        clearTextField()
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        settingsViewModel.saveNewPrediction(prediction: predictionTextField.text ?? "")
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
 
}
