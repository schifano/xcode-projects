//
//  ViewController.swift
//  MapWithPins
//
//  Created by Rachel Schifano on 12/29/15.
//  Copyright © 2015 schifano. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // TODO: Add mapview methods
    
    /**
        Returns the view associated with the specified annotation object.
        - parameter mapView: The map view that requested the annotation view.
        - parameter annotation: The object representing the annotation that is about to be displayed.
        - returns: The annotation view to display for the specified annotation or nil to disaply a standard annotation view.
    */
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseID = "pin"
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseID) as? MKPinAnnotationView
        
        if pinView == nil {
            // create pin
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
            pinView!.canShowCallout = true
            pinView!.pinTintColor = UIColor.redColor()
            pinView!.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure)
        } else {
            pinView!.annotation = annotation
        }
        return pinView
    }
    

}