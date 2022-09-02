//
//  MainProtocol.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 2.09.2022.
//

import Foundation


protocol ViewToPresenterMainProtocol {
    var mainInteractor: PresenterToInteractorMainProtocol? {get set}
    var mainView: PresenterToViewMainProtocol? {get set}
    
    func getFoods()
}

protocol PresenterToInteractorMainProtocol {
    var mainPresenter: InteractorToPresenterMainProtocol? {get set}

    func getFoodList()
}

protocol InteractorToPresenterMainProtocol {
    func dataToPresenter(foodList: Array<Yemekler>)
}

protocol PresenterToViewMainProtocol {
    func dataToView(foodList: Array<Yemekler>)
}

protocol PresenterToRouterMainProtocol {
    static func createModule(ref: HomeController)
}
