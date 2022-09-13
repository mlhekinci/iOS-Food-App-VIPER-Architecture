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
    
    func getFoodCount(userName: String) {
        mainInteractor?.getFoodCountOfBasket(userName: userName)
    }
}

extension MainPresenter : InteractorToPresenterMainProtocol {
    func dataToPresenter(foodList: Array<Yemekler>) {
        mainView?.dataToView(foodList: foodList)
    }
    
    func dataToPresenter(foodCount: Int) {
        mainView?.dataToView(foodCount: foodCount)
    }
}
