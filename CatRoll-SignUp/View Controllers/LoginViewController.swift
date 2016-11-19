//
//  LoginViewController.swift
//  CatRoll-SignUp
//
//  Created by Louis Tur on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    // MARK: - Validations
    
    func textFieldsAreValid() -> Bool {
        
        // 1. some set up
        let textFields: [UITextField] = [self.nameTextField, self.passwordTextField]
        let minimumLengthRequireMents: [UITextField : Int] = [
            self.nameTextField : 1,
            self.passwordTextField : 6
        ]
        // 2. iterrate over the text fields
        var errorMessage = ""
        var correct = [UITextField]()
        for textField in textFields {
            // 3. if the textfield doesn't have the minimum required characters...
            if let text = textField.text, let minRequirement = minimumLengthRequireMents[textField] {
                //print(correct)
                if text.characters.count < minRequirement {
                    // 4. make sure that the label isn't hidden
                    errorLabel.isHidden = false
                    // 5. display an error to the user
                    // 6. indicate that the fields are not valid
                    switch textField{
                    case nameTextField:
                        errorMessage += "Name Field must have at least 1 character. "
                    case passwordTextField:
                        errorMessage += "Password Field must have at least 6 characters"
                    default:
                        break
                    }
                    errorLabel.text = errorMessage
                    
                // 7. hide the error label if all gets validated
                // 8. indicate that the fields are valid
                } else if text.characters.count >= minRequirement {
                    switch textField{
                    case nameTextField:
                        correct.append(textField)
                    case passwordTextField:
                        correct.append(textField)
                    default:
                        break
                    }
                    //print("correct count:\(correct.count)")
                    //print("textFields count:\(textFields.count)")
                    if correct.count == textFields.count {
                        errorLabel.isHidden = true
                        correct.removeAll()
                    }
                }
            }
        }
        errorMessage = ""
        return true
    }
    
    func textField(_ textField: UITextField, hasMinimumCharacters minimum: Int) -> Bool {
        if textField == nameTextField {
            if (nameTextField.text?.characters.count)! >= 1 {
                return true
            }
        }
        if textField == passwordTextField{
            if (passwordTextField.text?.characters.count)! >= 6 {
                return true
            }
        }
        return false
    }
    
    func string(_ string: String, containsOnly characterSet: CharacterSet) -> Bool {
        for character in string.unicodeScalars {
            if !characterSet.contains(character) {
                errorLabel.isHidden = false
                errorLabel.text = "Invalid character"
                return false
            }
        }
        errorLabel.isHidden = true
        //gives a range of the letters in character set
        //var range = string.rangeOfCharacter(from: characterSet)
        return true
    }
    @IBAction func didTapLogin(_ sender: UIButton) {
        _ = textFieldsAreValid()
    }
    
 
    
    func updateErrorLabel(with message: String) {
        if self.errorLabel.isHidden {
            self.errorLabel.isHidden = false
        }
        self.errorLabel.text = message
        self.errorLabel.textColor = UIColor.red
        self.errorLabel.backgroundColor = UIColor.red.withAlphaComponent(0.25)
    }
    
    // MARK: - UI Helper
    // (add the label update function here when the lesson calls for it)
    
    
    // MARK: - UITextFieldDelegate
    // (add delegate functions below here)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // the .debugId property is defined in an extension, it's not actually part of UITextField
        print("********************\n + \(textField.debugId) SHOULD BEGIN EDITING") // replace this with the function shorthand
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) -> Bool {
        // the .debugId property is defined in an extension, it's not actually part of UITextField
        print("********************\n + \(textField.debugId) DID BEGIN EDITING") // replace this with the function shorthand
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // the .debugId property is defined in an extension, it's not actually part of UITextField
        print("********************\n + \(textField.debugId) SHOULD END EDITING") // replace this with the function shorthand
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) -> Bool {
        // the .debugId property is defined in an extension, it's not actually part of UITextField
        print("********************\n + \(textField.debugId) DID END EDITING") // replace this with the function shorthand
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("********************\n + \(textField.debugId) SHOULD RETURN")
        // this will generate a warning about an unused return variable without the "_ = "
        _ = self.textFieldsAreValid()
        return true
        
        /*
        if textField == self.nameTextField {
            let textIsLongEnough: Bool = self.textField(textField, hasMinimumCharacters: 1)
            if textIsLongEnough == false {
                errorLabel.isHidden = false
                errorLabel.text = "Name Field must have at least 1 character"
            } else {
                errorLabel.isHidden = true
            }
         
            // write in code to handle this case
            // 1. check the Bool value, if false, write some error message to the errorLabel
        }
        
        if textField == self.passwordTextField {
            let textIsLongEnough: Bool = self.textField(textField, hasMinimumCharacters: 6)
            if textIsLongEnough == false {
                errorLabel.isHidden = false
                errorLabel.text = "Password Field must have at least 6 characters"
            } else {
                errorLabel.isHidden = true
            }
         
            // write in code to handle this case
            // 1. check the Bool value, if false, write some error message to the errorLabel
        }
        */
    }
}
