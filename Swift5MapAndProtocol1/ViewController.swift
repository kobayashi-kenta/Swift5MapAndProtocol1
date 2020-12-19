//
//  ViewController.swift
//  Swift5MapAndProtocol1
//
//  Created by Kenta on 2020/12/19.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate,UIGestureRecognizerDelegate {

    var adressString = ""
    @IBOutlet var longPress: UILongPressGestureRecognizer!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    var locManager:CLLocationManager!
    @IBOutlet weak var adressLabel: UILabel!
    


    override func viewDidLoad() {
        super.viewDidLoad()
     
        settingButton.backgroundColor = .white
        settingButton.layer.cornerRadius = 20.0
    }
    
    
    @IBAction func longPressTap(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            
        }else if sender.state == .ended{
            
            let tapPoint = sender.location(in: view)
            let center = mapView.convert(tapPoint, toCoordinateFrom: mapView)
            let lat = center.latitude
            let log = center.longitude
            convert(lat: lat, log: log)
            
        }
        
    }
    
    func convert(lat:CLLocationDegrees,log:CLLocationDegrees){
    
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: lat, longitude: log)
    
        geocoder.reverseGeocodeLocation(location) { (placeMark,error) in
            
            if let placeMark = placeMark{
                if let pm = placeMark.first{
                    
                    if pm.administrativeArea != nil || pm.locality != nil{
                        
                        self.adressString = pm.name! + pm.administrativeArea! + pm.locality!
                    } else {
                        
                        self.adressString = pm.name!
                    }
                    
                    self.adressLabel.text = self.adressString
                }
            }
            
        }
    }
}

