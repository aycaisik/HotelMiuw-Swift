//
//  AddRegistrationTableViewController.swift
//  HotelMiuw
//
//  Created by Ayça Işık on 17.01.2023.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {
    //MARK: - UI Elements
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var checkInDateLabel : UILabel!
    @IBOutlet var checkInDatePicker : UIDatePicker!
    @IBOutlet var checkOutLabel : UILabel!
    @IBOutlet var checkOutDatePicker : UIDatePicker!
    
    
    
    //MARK: - Properties
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Not: Date() o anın tarihini verir(saat bilgisi dahil).
        //Check-In tarihini bugünün gecesi olarak ayarla.
        let midnightToday = Calendar.current.startOfDay(for: Date())
        
        //Seçilebilecek en küçük tarihi ayarlar.
        checkInDatePicker.minimumDate = midnightToday
        //Seçili olan tarihi ayarlar.
        checkInDatePicker.date = midnightToday
        
    }
    
    //MARK: - Functions
    
    func updateDateViews(){
        //.short --> saat
        //.medium --> ay gün , yıl
        //. lar enumdur
        
        //Otelimizde min bir gece konaklama yapılacağı için checkoutdatepickerin min datesi
        //o an seçili olan checkindatepickerın 24 saat ilerisi olmalıdır.
        
        //addingtimeinterval : var olan bir date nesnesinin üzerine belirtilen miktarda saniye ekler.
        let oneDay : Double = 24 * 60 * 60
        checkOutDatePicker.minimumDate = checkOutDatePicker.date.addingTimeInterval(oneDay)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        checkInDateLabel.text = dateFormatter.string(from: checkInDatePicker.date)
        checkOutLabel.text = dateFormatter.string(from: checkOutDatePicker.date)
        
    }
    
    //MARK: - Actions
    @IBAction func doneBarButtonTapped(_ button: UIBarButtonItem){
        let firstName = firstNameTextField.text!
        let lastName = lastNameTextField.text!
        let email = emailTextField.text!
        
    }
}
