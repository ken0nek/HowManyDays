//
//  ViewController.swift
//  HowManyDays
//
//  Created by Ken Tominaga on 8/16/16.
//  Copyright © 2016 ken0nek. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var dateTextField: UITextField!
    
    @IBOutlet private weak var daysLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let datePicker = UIDatePicker()
        datePicker.addTarget(self, action: #selector(ViewController.didChangeDate(_:)), for: .valueChanged)
        datePicker.datePickerMode = .date
        dateTextField.inputView = datePicker
        
        let toolBar = UIToolbar(frame: CGRect(origin: .zero, size: CGSize(width: view.frame.size.width, height: 40)))
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ViewController.done))
        toolBar.items = [doneButton]
        
        dateTextField.inputAccessoryView = toolBar
    }
    
    func didChangeDate(_ picker: UIDatePicker) {
        let df = DateFormatter()
        df.dateFormat = "yyyy年MM月dd日"
        let date = df.string(from: picker.date)
        dateTextField.text = date
        
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let now = Date()

        let componentsByDay = calendar.dateComponents([.day], from: now, to: picker.date)

        guard let day = componentsByDay.day else {
            return
        }

        daysLabel.text = "あと\(day + 1)日"
    }
    
    func done() {
        dateTextField.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
