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
    func getFoodCount(userName: String)
}

protocol PresenterToInteractorMainProtocol {
    var mainPresenter: InteractorToPresenterMainProtocol? {get set}

    func getFoodList()
    func getFoodCountOfBasket(userName: String)
}

protocol InteractorToPresenterMainProtocol {
    func dataToPresenter(foodList: Array<Yemekler>)
    func dataToPresenter(foodCount: Int)
}

protocol PresenterToViewMainProtocol {
    func dataToView(foodList: Array<Yemekler>)
    func dataToView(foodCount: Int)
}

protocol PresenterToRouterMainProtocol {
    static func createModule(ref: HomeController)
}
