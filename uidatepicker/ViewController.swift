//
//  ViewController.swift
//  uidatepicker
//
//  Created by Yuhsuan Lin on 2016/11/16.
//  Copyright © 2016年 cgua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myDatePicker: UIDatePicker!
    
    @IBOutlet var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let full_screen_size = UIScreen.main.bounds.size
        //datepicker 的參數設定
        myDatePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: full_screen_size.width, height: 100))
        
        myDatePicker.datePickerMode = .dateAndTime
        
        myDatePicker.minuteInterval = 15
        
        myDatePicker.date = Date()
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let from_date_time = formatter.date(from: "2016-01-02 00:00")
        
        myDatePicker.minimumDate = from_date_time
        
        let end_date_time = formatter.date(from: "2017-12-25 11:00")
        
        myDatePicker.maximumDate = end_date_time
        
        myDatePicker.locale = Locale(identifier: "zh-TW")
        //設計改變日期後，會執行的動作
        myDatePicker.addTarget(self, action: #selector(self.datePickerChanged) , for: .valueChanged)
        //設置位置加入到畫面中
        myDatePicker.center = CGPoint(x: full_screen_size.width * 0.5, y: full_screen_size.height * 0.4)
        
        self.view.addSubview(myDatePicker)
        
        
    }
    
    func datePickerChanged(datePicker:UIDatePicker) {
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        myLabel.text = formatter.string(from: datePicker.date)
        
    }
    


}

