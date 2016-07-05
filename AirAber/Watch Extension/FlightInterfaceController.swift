//
//  FlightInterfaceController.swift
//  AirAber
//
//  Created by Rachel Schifano on 7/3/16.
//  Copyright © 2016 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class FlightInterfaceController: WKInterfaceController {

    @IBOutlet var flightLabel: WKInterfaceLabel!
    @IBOutlet var routeLabel: WKInterfaceLabel!
    @IBOutlet var boardingLabel: WKInterfaceLabel!
    @IBOutlet var boardTimeLabel: WKInterfaceLabel!
    @IBOutlet var statusLabel: WKInterfaceLabel!
    @IBOutlet var gateLabel: WKInterfaceLabel!
    @IBOutlet var seatLabel: WKInterfaceLabel!

    // 1. Declare optional property of type flight
    var flight: Flight? {
        // 2. Add property observer triggered every time a flight property is set
        didSet {
            // 3. Check if flight is nil, proceed with valid instance of flight
            if let flight = flight {
                // 4. Set text properties on labels
                flightLabel.setText("Flight \(flight.shortNumber)")
                routeLabel.setText(flight.route)
                boardingLabel.setText("\(flight.number) Boards")
                boardTimeLabel.setText(flight.boardsAt)
                
                // 5. If flight is delayed, change text to red
                if flight.onSchedule {
                    statusLabel.setText("On Time")
                } else {
                    statusLabel.setText("Delayed")
                    statusLabel.setTextColor(UIColor.redColor())
                }
                gateLabel.setText("Gate \(flight.gate)")
                seatLabel.setText("Seat \(flight.seat)")
            }
        }
    }
    
    // Set flight when the controller is first shown
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Load all flights from shared JSON file, take the first flight in the array
        flight = Flight.allFlights().first!
    }
}
