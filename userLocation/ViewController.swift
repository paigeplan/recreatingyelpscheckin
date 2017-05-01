//
//  ViewController.swift
//  userLocation
//
//  Created by Shirley Li on 5/1/17.
//  Copyright © 2017 Shirley Li. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet weak var myMapView: MKMapView!
    
    let manager = CLLocationManager()
    
    // To keep track of where the user currently is. Default at Berkeley
    var userCurrentLocation: CLLocation = CLLocation(latitude: 51, longitude: -0.1276250)

    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userCurrentLocation = locations[0]
        let long = userCurrentLocation.coordinate.longitude;
        let lat = userCurrentLocation.coordinate.latitude;
        
        print(long, lat)
        
        // Create a rectangle around the users location and display it in the map
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let regionAroundUser = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userCurrentLocation.coordinate.latitude, longitude: userCurrentLocation.coordinate.longitude), span: span)
        myMapView.setRegion(regionAroundUser, animated: true)
        
        // Set a marker for the user's current location
        let currentLocationMarker = MKPointAnnotation()
        currentLocationMarker.coordinate = userCurrentLocation.coordinate
        currentLocationMarker.title = "Current Location"
        myMapView.addAnnotation(currentLocationMarker)
        
        // TODO: Find locations nearby for the user. Here's a simple example on how to do this
        // https://github.com/paigeplan/mapkit-query-demo/blob/master/Mapkit-Demo/MapViewController.swift
        // (look at the part about MKLocalSearch)
        
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

