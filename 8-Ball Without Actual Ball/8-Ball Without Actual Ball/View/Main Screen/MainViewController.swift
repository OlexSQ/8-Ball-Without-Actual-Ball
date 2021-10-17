//
//  ViewController.swift
//  8-Ball Without Actual Ball
//
//  Created by Mac on 17.10.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    private var mainViewModel: MainViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.isHidden = true
        callToViewModelForUIUpdate()
    }
    
    private func callToViewModelForUIUpdate() {
        self.mainViewModel = MainViewModel()
        self.mainViewModel.bindMainViewModelToController = { answer in
            DispatchQueue.main.async {
                self.answerLabel.text = answer
            }
        }
    }
    
    //MARK: - Shake methods
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        answerLabel.isHidden = false
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        callToViewModelForUIUpdate()
    }

    //MARK: - Actions
    
    @IBAction func settingsButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        let settingsViewController = storyboard.instantiateInitialViewController() as! SettingsViewController
        present(settingsViewController, animated: true, completion: nil)
    }
    
}

