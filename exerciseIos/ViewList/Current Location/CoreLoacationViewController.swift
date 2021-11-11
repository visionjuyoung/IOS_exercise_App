//
//  CoreLoacationViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/11/11.
//

import UIKit
import CoreLocation
import MapKit

class CoreLoacationViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    var locationManager = CLLocationManager()
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longtitueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        myMap.showsUserLocation = true
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            myMap.isZoomEnabled = true
            myMap.isScrollEnabled = true
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let userLocation = locations.first {
            let lat: CLLocationDegrees = userLocation.coordinate.latitude
            let lng: CLLocationDegrees = userLocation.coordinate.longitude
            let degrees = CLLocationCoordinate2D.init(latitude: lat, longitude: lng)
            let spans = MKCoordinateSpan.init(latitudeDelta: 0.5, longitudeDelta: 0.5)
            
            let location = MKCoordinateRegion.init(center: degrees, span: spans)
            
            myMap.setRegion(location, animated: true)
            
            latitudeLabel.text = "위도 : \(userLocation.coordinate.latitude)"
            longtitueLabel.text = "위도 : \(userLocation.coordinate.longitude)"
        }
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
