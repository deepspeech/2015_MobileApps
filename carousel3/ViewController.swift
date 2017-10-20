//
//  ViewController.swift
//  carousel3
//  Project: InvertedWheel. Spin numbered wheelclockwise, fast and counter-clockwise.
//  Created by Priscilla M Nunez on 5/3/16.
//  Copyright © 2016 PMN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, iCarouselDelegate, iCarouselDataSource {

    @IBOutlet var carouselView: iCarousel!
    
    var numbers = [Int] ()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        numbers = [1,2,3,4,5,6,]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Nunez.P created a numbers array. For later purposes in the var numbers = you can switch with images or text. In this example we are using numbers!
        
       // numbers = [1,2,3,4,5,6,] InvertedWheel!
        carouselView.type = .Cylinder
    }
    
    // This function is just calling how many items you want in your carousel. 
    
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
        return numbers.count
    }
    
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
        let tempView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        button.setTitle("\(index)", forState: .Normal)
        button.backgroundColor = UIColor.lightGrayColor()
        tempView.addSubview(button)
        
        tempView.backgroundColor = UIColor.blueColor()
        
        return tempView
    }
    
    func carousel(carousel: iCarousel, valueForOption option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option == iCarouselOption.Spacing{
        
        return value * 1.2
        }
        
        return value
    // else if option = iCarouselOption.FadeMin
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

