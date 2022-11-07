//
//  ViewController.swift
//  haritaornek
//
//  Created by Mert Duran on 22.07.2022.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var haritaVb: MKMapView!
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation : CLLocation = locations[0]
        let latitude = userLocation.coordinate.latitude
        let longtitude = userLocation.coordinate.longitude
        
        
        let lanDelta : CLLocationDegrees = 0.05
        let lonDelta : CLLocationDegrees = 0.05
        
        let span = MKCoordinateSpan(latitudeDelta: lanDelta, longitudeDelta: lonDelta)
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        let region = MKCoordinateRegion(center: location, span: span)
        self.haritaVb.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.title = "Lokasyon!"
        pin.subtitle = "Bulunduğunuz Yer"
        pin.coordinate = coordinates
        haritaVb.addAnnotation(pin)
    }

}

