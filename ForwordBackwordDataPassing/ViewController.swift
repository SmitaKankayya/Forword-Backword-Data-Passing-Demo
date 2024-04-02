//
//  ViewController.swift
//  ForwordBackwordDataPassing
//
//  Created by Smita Kankayya on 01/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var fullNameTextField: UITextField!
    @IBOutlet var collegeNameTextField: UITextField!
    @IBOutlet var mobileNumberTextField: UITextField!
    @IBOutlet var courseDoneTextField: UITextField!
    
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var pincodeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnForword(_ sender: Any) {
        let secondViewController = (self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController)
        secondViewController!.fullNameContainer = fullNameTextField.text
        secondViewController!.collegeNameContainer = collegeNameTextField.text
        secondViewController!.mobileNumberContainer = Int(mobileNumberTextField.text!)
        secondViewController!.coursedoneContainer = courseDoneTextField.text
        
        navigationController?.pushViewController(secondViewController!, animated: true)
    }
    
    @IBAction func btnMoveToSVC(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
        secondViewController!.backDataPassingClosure = {
            (address, state, city, pincode) in
            self.addressLabel.text = address
            self.stateLabel.text = state
            self.cityLabel.text = city
            self.pincodeLabel.text = String(pincode)
        }
        
        self.navigationController?.pushViewController(secondViewController!, animated: true)
    }
    
}

