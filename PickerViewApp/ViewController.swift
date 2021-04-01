//
//  ViewController.swift
//  PickerViewApp
//
//  Created by Mac on 01.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var starLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var starsNames = ["Kareem Abdul-Jabbar", "Magic Johnson",
                      "Kobe Bryant", "Shaquille O'Neal",
                      "Larry Bird", "Wilt Chamberlain",
                      "Bill Russell", "Tim Duncan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldSettings()
        createToolbar()
    }

    func textFieldSettings() {
        
        let picker = UIPickerView()
        
        picker.backgroundColor = .gray
        picker.delegate = self
        
        textField.inputView = picker
    }
    
    func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(dismissKeyboard))
        
        toolbar.setItems([doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        textField.inputAccessoryView = toolbar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        starsNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        starLabel.text = starsNames[row]
    }
    
    // MARK: Без надстроек
    /*
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return starsNames[row]
    }
    */
    
    // MARK: С надстройками
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let pickerViewLabel = UILabel()
                
        pickerViewLabel.textColor = .white
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.font = UIFont(name: "AmericanTypewriter", size: 20)
        pickerViewLabel.text = starsNames[row]
        
        return pickerViewLabel
    }
}
