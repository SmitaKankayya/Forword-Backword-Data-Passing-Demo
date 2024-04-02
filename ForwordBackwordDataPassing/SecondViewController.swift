//
//  SecondViewController.swift
//  ForwordBackwordDataPassing
//
//  Created by Smita Kankayya on 01/04/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var collegeNameLabel: UILabel!
    @IBOutlet var mobileNumberLabel: UILabel!
    @IBOutlet var coursedoneLabel: UILabel!
    
    var fullNameContainer : String?
    var collegeNameContainer : String?
    var mobileNumberContainer : Int?
    var coursedoneContainer : String?
    
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var stateTextField: UITextField!
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var pincodeTextField: UITextField!
    
    var extractedAddress : String?
    var extractedState : String?
    var extractedCity : String?
    var extractedPincode : Int?
    
    var backDataPassingClosure : ((String, String, String, Int) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindData()
        
    }
    
    func bindData(){
        self.fullNameLabel.text = fullNameContainer
        self.collegeNameLabel.text = collegeNameContainer
        self.mobileNumberLabel.text = "\(String(describing: mobileNumberContainer ?? 0))"
        self.coursedoneLabel.text = coursedoneContainer
    }
    
    @IBAction func btnBackword(_ sender: Any) {
        
        guard let backDataPass = backDataPassingClosure else { return }
        extractedAddress = self.addressTextField.text
        extractedState = self.stateTextField.text
        extractedCity = self.cityTextField.text
        extractedPincode =  Int(self.pincodeTextField.text!)
        
        backDataPass(extractedAddress!, extractedState!, extractedCity!, extractedPincode!)
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
