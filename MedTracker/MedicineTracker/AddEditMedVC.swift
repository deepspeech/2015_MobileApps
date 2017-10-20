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
    
    let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    @IBOutlet weak var medName: UITextField!
    @IBOutlet weak var medDosage: UITextField!
    @IBOutlet weak var medTime: UISegmentedControl!
    
    var newMed : Medicine? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        if newMed != nil {
            medName.text = newMed!.name
            medDosage.text = newMed!.dosage
            timeToTake = newMed!.time
            
            if timeToTake == "Morning" {
                medTime.selectedSegmentIndex = 0
            } else if timeToTake == "Afternoon" {
                medTime.selectedSegmentIndex = 1
            } else if timeToTake == "Evening" {
                medTime.selectedSegmentIndex = 2
            } else if timeToTake == "Bedtime" {
                medTime.selectedSegmentIndex = 3
            }
        }
        
        medName.delegate = self
        medDosage.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
//    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
//        self.view.endEditing(true)
//    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        medName.resignFirstResponder()
        medDosage.resignFirstResponder()
        
        return true
    }
    
    func dismissVC() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func saveTapped(sender: AnyObject) {
        
        if newMed == nil {
            addMed()
        } else {
            editMed()
        }
        
        dismissVC()
    }
    
    func addMed() {
        var context = self.context
        let ent = NSEntityDescription.entityForName("Medicine", inManagedObjectContext: context!)
        let newMed = Medicine(entity: ent!, insertIntoManagedObjectContext: context)
        newMed.name = medName.text
        newMed.dosage = medDosage.text
        newMed.time = timeToTake
        context?.save(nil)
    }
    
    func editMed() {
        newMed?.name = medName.text
        newMed?.dosage = medDosage.text
        
        switch medTime {
        case "Morning":
            medTime.selectedSegmentIndex = 0
        case "Afternoon":
            medTime.selectedSegmentIndex = 1
        case "Evening":
            medTime.selectedSegmentIndex = 2
        case "Bedtime":
            medTime.selectedSegmentIndex = 3
        default:
            break
        }
        
        newMed?.time = timeToTake
        context?.save(nil)
    }

    var timeToTake = "Morning"
    @IBAction func timeSelectorDidChange(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            println("Morning clicked")
            timeToTake = "Morning"
        case 1:
            println("Afternoon clicked")
            timeToTake = "Afternoon"
        case 2:
            println("Evening clicked")
            timeToTake = "Evening"
        case 3:
            println("Bedtime clicked")
            timeToTake = "Bedtime"
        default:
            break;
        }

        
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
