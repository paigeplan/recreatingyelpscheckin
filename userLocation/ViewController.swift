//
//  ViewController.swift
//  userLocation
//
//  Created by Shirley Li on 5/1/17.
//  Copyright © 2017 Shirley Li. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    
    @IBAction func button(_ sender: Any) {
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Hello")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0]
        let long = userLocation.coordinate.longitude;
        let lat = userLocation.coordinate.latitude;
        
        print(long, lat)
        
        //Do What ever you want with it
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if CLLocationManager.locationServicesEnabled() {
            manager.requestAlwaysAuthorization()
        manager.requestWhenInUseAuthorization()
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.startUpdatingLocation()
        }
        let currRegion = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 51, longitude: -0.1276250), radius: 1000, identifier: "Berkeley")
        manager.startMonitoring(for: currRegion)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

