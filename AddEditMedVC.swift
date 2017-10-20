//
//  AddEditMedVC.swift
//  MedTracker
//
//  Created by Priscilla M Nunez on 4/9/15.
//  Copyright (c) 2015 Priscilla Nunez. All rights reserved.
//

import UIKit
import CoreData

class AddEditMedVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var medName: UITextField!
    @IBOutlet weak var medDosage: UITextField!
    @IBOutlet weak var medTime: UISegmentedControl!
    
    var timeToTake = "Morning"
    
    var newMed : Medicine? = nil 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        medName.delegate = self
        medDosage.delegate = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func touchesBegan(_medName touches: Set<NSObject>,
        withEvent event: UIEvent) {
        medName.resignFirstResponder()
        medDosage.resignFirstResponder()
    }
    
    @IBAction func timeSelectorDidChange(sender: AnyObject) {
    }
    
    @IBAction func saveTapped(sender: AnyObject) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
