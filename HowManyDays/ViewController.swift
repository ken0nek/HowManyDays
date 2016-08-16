//
//  ViewController.swift
//  HowManyDays
//
//  Created by Ken Tominaga on 8/16/16.
//  Copyright © 2016 ken0nek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var daysLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let datePicker = UIDatePicker()
        datePicker.addTarget(self, action: #selector(ViewController.didChangeDate(_:)), forControlEvents: UIControlEvents.ValueChanged)
        datePicker.datePickerMode = UIDatePickerMode.Date
        dateTextField.inputView = datePicker
        
        let toolBar = UIToolbar(frame: CGRectMake(0, 0, view.frame.size.width, 40.0))
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(ViewController.done))
        toolBar.items = [doneButton]
        
        dateTextField.inputAccessoryView = toolBar
    }
    
    func didChangeDate(picker: UIDatePicker) {
        let df = NSDateFormatter()
        df.dateFormat = "yyyy年MM月dd日"
        let date = df.stringFromDate(picker.date)
        dateTextField.text = date
        
        let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
        let now = NSDate()
        
        let componentsByDay = calendar.components([.Day], fromDate: now, toDate: picker.date, options: [])
        
        daysLabel.text = "あと\(componentsByDay.day)日"
    }
    
    func done() {
        dateTextField.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

