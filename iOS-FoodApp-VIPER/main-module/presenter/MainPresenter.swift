//
//  MainPresenter.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 2.09.2022.
//

import Foundation

class MainPresenter : ViewToPresenterMainProtocol {
  
    var mainInteractor: PresenterToInteractorMainProtocol?
    var mainView: PresenterToViewMainProtocol?
    
    func getFoods() {
        mainInteractor?.getFoodList()
    }
}

extension MainPresenter : InteractorToPresenterMainProtocol {
    func dataToPresenter(foodList: Array<Food>) {
        mainView?.dataToView(foodList: foodList)
    }
}
