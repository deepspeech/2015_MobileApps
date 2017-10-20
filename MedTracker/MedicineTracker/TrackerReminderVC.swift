//
//  TrackRemindVC.swift
//  MedTracker
//
//  Created by Priscilla M Nunez on 4/9/15.
//  Copyright (c) 2015 Priscilla Nunez. All rights reserved.
//

import UIKit

class TrackerReminderVC: UIViewController {
    
    @IBOutlet weak var switchMorning: UISwitch!
    @IBOutlet weak var switchAfternoon: UISwitch!
    @IBOutlet weak var switchEvening: UISwitch!
    @IBOutlet weak var switchBedtime: UISwitch!
    @IBOutlet weak var xMorning: UILabel!
    @IBOutlet weak var xAfternoon: UILabel!
    @IBOutlet weak var xEvening: UILabel!
    @IBOutlet weak var xBedtime: UILabel!
    
    @IBOutlet weak var switchReminderMorning: UISwitch!
    @IBOutlet weak var switchReminderAfternoon: UISwitch!
    @IBOutlet weak var switchReminderEvening: UISwitch!
    @IBOutlet weak var switchReminderBedtime: UISwitch!
    @IBOutlet weak var xReminderMorning: UILabel!
    @IBOutlet weak var xReminderAfternoon: UILabel!
    @IBOutlet weak var xReminderEvening: UILabel!
    @IBOutlet weak var xReminderBedtime: UILabel!
    
    var storedDate = ""
    var currentDate = ""

    var defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let daterecorded = defaults.stringForKey("storeddate") {
            storedDate = daterecorded
        }
        
        currentDate = getDate()
        
        if currentDate == storedDate {
            
            if let morningpills = defaults.stringForKey("takenmorning") {
                switchMorning.setOn(true, animated: true)
                xMorning.text = "✔︎"
                xMorning.textColor = UIColor.greenColor()
            }
            
            if let afternoonpills = defaults.stringForKey("takenafternoon") {
                switchAfternoon.setOn(true, animated: true)
                xAfternoon.text = "✔︎"
                xAfternoon.textColor = UIColor.greenColor()
            }
            
            if let eveningpills = defaults.stringForKey("takenevening") {
                switchEvening.setOn(true, animated: true)
                xEvening.text = "✔︎"
                xEvening.textColor = UIColor.greenColor()
            }
            
            if let bedtimepills = defaults.stringForKey("takenbedtime") {
                switchBedtime.setOn(true, animated: true)
                xBedtime.text = "✔︎"
                xBedtime.textColor = UIColor.greenColor()
            }
            
        } else if currentDate != storedDate {
            defaults.removeObjectForKey("takenmorning")
            defaults.removeObjectForKey("takenafternoon")
            defaults.removeObjectForKey("takenevening")
            defaults.removeObjectForKey("takenbedtime")
            defaults.synchronize()
            
            switchMorning.setOn(false, animated: false)
            switchAfternoon.setOn(false, animated: false)
            switchEvening.setOn(false, animated: false)
            switchBedtime.setOn(false, animated: false)
            
            xMorning.text = "✗"
            xMorning.textColor = UIColor.redColor()
            xAfternoon.text = "✗"
            xAfternoon.textColor = UIColor.redColor()
            xEvening.text = "✗"
            xEvening.textColor = UIColor.redColor()
            xBedtime.text = "✗"
            xBedtime.textColor = UIColor.redColor()
        }
    
        // For local notification buttons
        if let remindermorning = defaults.stringForKey("remindermorning") {
            switchReminderMorning.setOn(true, animated: true)
            xReminderMorning.text = "✔︎"
            xReminderMorning.textColor = UIColor.greenColor()
        }
        
        if let reminderafternoon = defaults.stringForKey("reminderafternoon") {
            switchReminderAfternoon.setOn(true, animated: true)
            xReminderAfternoon.text = "✔︎"
            xReminderAfternoon.textColor = UIColor.greenColor()
        }
        
        if let reminderevening = defaults.stringForKey("reminderevening") {
            switchReminderEvening.setOn(true, animated: true)
            xReminderEvening.text = "✔︎"
            xReminderEvening.textColor = UIColor.greenColor()
        }
        
        if let reminderbedtime = defaults.stringForKey("reminderbedtime") {
            switchReminderBedtime.setOn(true, animated: true)
            xReminderBedtime.text = "✔︎"
            xReminderBedtime.textColor = UIColor.greenColor()
        }

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Get date and time (in this case no time)
    func getDate() -> String {
        let date = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .NoStyle)
        println(date)
        return date
    }
    
    @IBAction func morningSwitchTapped(sender: UISwitch) {
        storedDate = getDate()
        
        if switchMorning.on {
            defaults.setObject(storedDate, forKey: "storeddate")
            defaults.setObject(switchMorning.on, forKey: "takenmorning")
            switchMorning.setOn(true, animated: true)
            xMorning.text = "✔︎"
            xMorning.textColor = UIColor.greenColor()
            defaults.synchronize()
        } else {
            if let morning = defaults.stringForKey("takenmorning") {
                xMorning.text = "✗"
                xMorning.textColor = UIColor.redColor()
                switchMorning.setOn(false, animated: false)
                defaults.removeObjectForKey("takenmorning")
                defaults.synchronize()
            }
        }
    }
    
    @IBAction func afternoonSwitchTapped(sender: UISwitch) {
        storedDate = getDate()
        
        if switchAfternoon.on {
            defaults.setObject(storedDate, forKey: "storeddate")
            defaults.setObject(switchAfternoon.on, forKey: "takenafternoon")
            switchAfternoon.setOn(true, animated: true)
            xAfternoon.text = "✔︎"
            xAfternoon.textColor = UIColor.greenColor()
            defaults.synchronize()
        } else {
            if let morning = defaults.stringForKey("takenafternoon") {
                xAfternoon.text = "✗"
                xAfternoon.textColor = UIColor.redColor()
                switchAfternoon.setOn(false, animated: false)
                defaults.removeObjectForKey("takenafternoon")
                defaults.synchronize()
            }
        }
    }
    
    @IBAction func eveningSwitchTapped(sender: UISwitch) {
        storedDate = getDate()
        
        if switchEvening.on {
            defaults.setObject(storedDate, forKey: "storeddate")
            defaults.setObject(switchEvening.on, forKey: "takenevening")
            switchEvening.setOn(true, animated: true)
            xEvening.text = "✔︎"
            xEvening.textColor = UIColor.greenColor()
            defaults.synchronize()
        } else {
            if let morning = defaults.stringForKey("takenevening") {
                xEvening.text = "✗"
                xEvening.textColor = UIColor.redColor()
                switchEvening.setOn(false, animated: false)
                defaults.removeObjectForKey("takenevening")
                defaults.synchronize()
            }
        }
    }
    
    @IBAction func bedtimeSwitchTapped(sender: UISwitch) {
        storedDate = getDate()
        
        if switchBedtime.on {
            defaults.setObject(storedDate, forKey: "storeddate")
            defaults.setObject(switchBedtime.on, forKey: "takenbedtime")
            switchBedtime.setOn(true, animated: true)
            xBedtime.text = "✔︎"
            xBedtime.textColor = UIColor.greenColor()
            defaults.synchronize()
        } else {
            if let morning = defaults.stringForKey("takenbedtime") {
                xBedtime.text = "✗"
                xBedtime.textColor = UIColor.redColor()
                switchBedtime.setOn(false, animated: false)
                defaults.removeObjectForKey("takenbedtime")
                defaults.synchronize()
            }
        }
    }
    
    var morningNotification : UILocalNotification = UILocalNotification()
    @IBAction func morningReminderTapped(sender: UISwitch) {
        if switchReminderMorning.on {
            defaults.setObject(switchReminderMorning.on, forKey: "remindermorning")
            defaults.synchronize()
            var theDate = NSDate()
            var cal = NSCalendar.currentCalendar()
            cal.timeZone = NSCalendar.currentCalendar().timeZone
            var fireDate = cal.dateBySettingHour(9, minute: 0, second: 0, ofDate: theDate, options: NSCalendarOptions.allZeros)
            
            morningNotification.alertBody = "Did you take your morning pills today?"
            morningNotification.repeatInterval = NSCalendarUnit.CalendarUnitDay
            morningNotification.fireDate = fireDate
            morningNotification.soundName = UILocalNotificationDefaultSoundName
            UIApplication.sharedApplication().scheduleLocalNotification(morningNotification)
            xReminderMorning.text = "✔︎"
            xReminderMorning.textColor = UIColor.greenColor()
        } else {
            defaults.removeObjectForKey("remindermorning")
            defaults.synchronize()
            UIApplication.sharedApplication().cancelLocalNotification(morningNotification)
            xReminderMorning.text = "✗"
            xReminderMorning.textColor = UIColor.redColor()
        }
    }

    var afternoonNotification : UILocalNotification = UILocalNotification()
    @IBAction func afternoonReminderTapped(sender: UISwitch) {
        if switchReminderAfternoon.on {
            defaults.setObject(switchReminderAfternoon.on, forKey: "reminderafternoon")
            defaults.synchronize()
            var theDate = NSDate()
            var cal = NSCalendar.currentCalendar()
            cal.timeZone = NSCalendar.currentCalendar().timeZone
            var fireDate = cal.dateBySettingHour(14, minute: 0, second: 0, ofDate: theDate, options: NSCalendarOptions.allZeros)
            
            afternoonNotification.alertBody = "Did you take your afternoon pills today?"
            afternoonNotification.repeatInterval = NSCalendarUnit.CalendarUnitDay
            afternoonNotification.fireDate = fireDate
            afternoonNotification.soundName = UILocalNotificationDefaultSoundName
            UIApplication.sharedApplication().scheduleLocalNotification(afternoonNotification)
            xReminderAfternoon.text = "✔︎"
            xReminderAfternoon.textColor = UIColor.greenColor()
        } else {
            defaults.removeObjectForKey("reminderafternoon")
            defaults.synchronize()
            UIApplication.sharedApplication().cancelLocalNotification(afternoonNotification)
            xReminderAfternoon.text = "✗"
            xReminderAfternoon.textColor = UIColor.redColor()
        }
    }
    
    var eveningNotification : UILocalNotification = UILocalNotification()
    @IBAction func eveningReminderTapped(sender: UISwitch) {
        if switchReminderEvening.on {
            defaults.setObject(switchReminderEvening.on, forKey: "reminderevening")
            defaults.synchronize()
            var theDate = NSDate()
            var cal = NSCalendar.currentCalendar()
            cal.timeZone = NSCalendar.currentCalendar().timeZone
            var fireDate = cal.dateBySettingHour(19, minute: 0, second: 0, ofDate: theDate, options: NSCalendarOptions.allZeros)
            
            eveningNotification.alertBody = "Did you take your evening pills today?"
            eveningNotification.repeatInterval = NSCalendarUnit.CalendarUnitDay
            eveningNotification.fireDate = fireDate
            eveningNotification.soundName = UILocalNotificationDefaultSoundName
            UIApplication.sharedApplication().scheduleLocalNotification(eveningNotification)
            xReminderEvening.text = "✔︎"
            xReminderEvening.textColor = UIColor.greenColor()
        } else {
            defaults.removeObjectForKey("reminderevening")
            UIApplication.sharedApplication().cancelLocalNotification(eveningNotification)
            xReminderEvening.text = "✗"
            xReminderEvening.textColor = UIColor.redColor()
        }
    }
    
    var bedtimeNotification : UILocalNotification = UILocalNotification()
    @IBAction func bedtimeReminderTapped(sender: UISwitch) {
        if switchReminderBedtime.on {
            defaults.setObject(switchReminderBedtime.on, forKey: "reminderbedtime")
            defaults.synchronize()
            var theDate = NSDate()
            var cal = NSCalendar.currentCalendar()
            cal.timeZone = NSCalendar.currentCalendar().timeZone
            var fireDate = cal.dateBySettingHour(23, minute: 0, second: 0, ofDate: theDate, options: NSCalendarOptions.allZeros)
            
            bedtimeNotification.alertBody = "Did you take your bedtime pills today?"
            bedtimeNotification.repeatInterval = NSCalendarUnit.CalendarUnitDay
            bedtimeNotification.fireDate = fireDate
            bedtimeNotification.soundName = UILocalNotificationDefaultSoundName
            UIApplication.sharedApplication().scheduleLocalNotification(bedtimeNotification)
            xReminderBedtime.text = "✔︎"
            xReminderBedtime.textColor = UIColor.greenColor()
        } else {
            defaults.removeObjectForKey("reminderbedtime")
            defaults.synchronize()
            UIApplication.sharedApplication().cancelLocalNotification(bedtimeNotification)
            xReminderBedtime.text = "✗"
            xReminderBedtime.textColor = UIColor.redColor()
        }
    }
    
    
    
}
