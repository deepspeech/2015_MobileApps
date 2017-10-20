//
//  Medicine.swift
//  MedTracker
//
//  Created by Priscilla M Nunez on 4/8/15.
//  Copyright (c) 2015 PMN. All rights reserved.
//


import Foundation
import CoreData
@objc(Medicine)

class Medicine: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var dosage: String
    @NSManaged var time: String

}
