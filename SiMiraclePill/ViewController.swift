//
//  ViewController.swift
//  SiMiraclePill
//
//  Created by Simon Davies on 14/02/2017.
//  Copyright © 2017 Simon Davies. All rights reserved.
//

import UIKit

// this example shows how to implement a UIPickerView element in your app
// ViewController is a subclass of UIViewController class
// UIPickerDataSource and UIPickerDelegate are protocols ViewController must adhere too

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
//first job is to link view items that we will want to change/access
    @IBOutlet weak var statePicker: UIPickerView! //links picker roladex to this ViewController class
    @IBOutlet weak var statePickerBtn: UIButton! //links the button which accesses the picker to this ViewController class
//links the country and zip labels and text entry fields so can hide later
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryTxtField: UITextField!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var zipTxtField: UITextField!
    @IBOutlet weak var whiteCover: UIView!
    @IBOutlet weak var successImage: UIImageView!
    
//array of values for the state picker roladex
    let states = ["Alaska", "Alabama", "Arkansas", "American Samoa", "Arizona", "California", "Colorado", "Connecticut", "District of Columbia", "Delaware", "Florida", "Georgia", "Guam", "Hawaii", "Iowa", "Idaho", "Illinois", "Indiana", "Kansas", "Kentucky", "Louisiana", "Massachusetts", "Maryland", "Maine", "Michigan", "Minnesota", "Missouri", "Mississippi", "Montana", "North Carolina", "North Dakota", "Nebraska", "New Hampshire", "New Jersey", "New Mexico", "Nevada", "New York", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Puerto Rico", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Virginia", "Virgin Islands", "Vermont", "Washington", "Wisconsin", "West Virginia", "Wyoming"]
    
//viewDidLoad() is a default function automatically included in ViewController class. It is overridden so any custom eements need to be added. super.viewDidLoad() is included so the required top level class elements are not omitted
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self //tells statePicker to get its data in this class
        statePicker.delegate = self //tells statePicker it can access relevant delegate 'stuff' etc here
    }
    
//Dispose of any resources that can be recreated. Comes as default with ViewController class
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

//link view element that user can do soemthing too and define what is done (unhides the picker roladex)
    @IBAction func stateBtnPressed(_ sender: Any) {
        statePicker.isHidden = false
        countryLabel.isHidden = true
        countryTxtField.isHidden = true
        zipLabel.isHidden = true
        zipTxtField.isHidden = true
    }
    //sets one column for the picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //sets the number of items in the picker list to the number of states in array
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    //returns the name of the state selected
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    //changes the text on the button to the selected state and hides the picker
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
        countryLabel.isHidden = false
        countryTxtField.isHidden = false
        zipLabel.isHidden = false
        zipTxtField.isHidden = false
    }
    
    @IBAction func buyBtnPressed(_ sender: Any) {
        whiteCover.isHidden = false
        successImage.isHidden = false
    }

}
