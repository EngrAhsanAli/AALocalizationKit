//
//  AAPickerView.swift
//  AAPickerView
//
//  Created by Engr. Ahsan Ali on 01/06/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

/// MARK:- AAPickerView
open class AAPickerView: UITextField {
    
    /// Callback for end editing
    open var valueDidSelected: ((Any) -> Void)?
    
    /// Callback for value change
    open var valueDidChange: ((Any) -> Void)?
    
    open var pickerType: AAPickerType = .date {
        
        didSet {
            
            switch pickerType {
            case .date:
                datePicker = UIDatePicker()
            case .string(let stringData):
                stringPicker = UIPickerView()
                stringPickerData = stringData
            }
            
            inputAccessoryView = toolbar
        }
    }
    
    // For DatePicker
    open var dateFormatter = DateFormatter()
    
    open var datePicker: UIDatePicker? {
        get {
            return self.inputView as? UIDatePicker
        }
        set {
            inputView = newValue
            dateFormatter.dateFormat = "MM/dd/YYYY"
            
        }
    }
    
    // For String Picker
    
    var stringPickerData = [String]()
    
    open var heightForRow: CGFloat = 30
    
    open var pickerRow: UILabel {
        let pickerLabel = UILabel()
        pickerLabel.textColor = .black
        pickerLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        pickerLabel.textAlignment = .center
        pickerLabel.sizeToFit()
        return pickerLabel
    }

    open var stringPicker: UIPickerView? {
        get {
            return self.inputView as? UIPickerView
        }
        set(picker) {
            picker?.delegate = self
            inputView = picker
        }
    }
    

    // Configurations

    open var toolbar: UIToolbar {
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = .blue
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(doneAction))

        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                          target: nil,
                                          action: nil)
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel,
                                           target: self,
                                           action: #selector(cancelAction))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        inputAccessoryView = toolBar
        return toolBar
    }


    @objc func doneAction() {
                
        switch pickerType {
        case .date:
            
            let date = datePicker!.date
            self.text = dateFormatter.string(from: date)
            valueDidSelected?(date)

        case .string:
            let row = stringPicker!.selectedRow(inComponent: 0)
            self.text = stringPickerData[row]
            valueDidSelected?(row)
            
        }
        
        sendActions(for: .editingDidEnd)
        resignFirstResponder()
    }
    
    @objc func cancelAction() {
        resignFirstResponder()
    }
    
}
