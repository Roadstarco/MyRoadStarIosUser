//
//  NetworkRepository.swift
//  RoadStar Customer
//
//  Created by Faizan Ali  on 2020/10/4.
//  Copyright © 2020 Faizan.Technology. All rights reserved.
//

import Foundation

class NetworkRepository{
    
    static let shared: NetworkRepository = NetworkRepository()
    
    var signUpRepository: SignUpRepository = SignUpRepository()
    var logInRepository: LogInRepository = LogInRepository()
    var userProfileRepository: UserProfileRepository = UserProfileRepository()
    var servicesRepository: ServicesRepository = ServicesRepository()
    var fareRepository: FareEstimateRepository = FareEstimateRepository()
    var cardRepository: CardsRepository = CardsRepository()
    var sendRequestRepository: TripRequestRepository = TripRequestRepository()
    var rateTripRepository: RateTripRepository = RateTripRepository()
}
