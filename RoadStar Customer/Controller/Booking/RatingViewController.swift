//
//  RatingViewController.swift
//  RoadStar Customer
//
//  Created by Roamer on 21/07/2020.
//  Copyright © 2020 Osama Azmat Khan. All rights reserved.
//

import UIKit
import Cosmos

protocol  RateTripPopoverProtocol  {
    func didDismissedWithResponse()
}

class RatingViewController: BaseViewController {

    var delegate : RateTripPopoverProtocol?
    
    var tripId = -1
    var rating = 0
    
    @IBOutlet var commentView : UITextView!
    @IBOutlet var ratingView : CosmosView!
    
    override func setupUI() {
        
    }
    
    override func setupTheme() {
        super.setupTheme()
        
    }

    @IBAction func btnRateStarTapped(_ sender: Any) {
        
        let request = RatingTripModel(trip_id: tripId, rating: Int(ratingView.rating), comment: commentView.text!)
        
        NetworkRepository.shared.rateTripRepository.rateTrip(with: request) { (response, error) in
            if let error = error{
                Toast.show(message: "Trip not completed")
                print("Something went wrong in Searching THE Driver. \(error.localizedDescription)")
                
            } else {
                print("response")
                
                //
                DispatchQueue.main.async {
                    //
                    
                    Toast.show(message: "Thank you for feedback")
                    self.delegate?.didDismissedWithResponse()
                }
            }
        }
    }
}
