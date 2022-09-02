//
//  MainInteractor.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 2.09.2022.
//

import Foundation
import Alamofire


class MainInteractor : PresenterToInteractorMainProtocol {
    
    var mainPresenter: InteractorToPresenterMainProtocol?
    
    func getFoodList() {
        // get food from API
    }
}
