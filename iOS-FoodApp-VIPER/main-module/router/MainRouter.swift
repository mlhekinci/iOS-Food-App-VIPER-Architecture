//
//  MainRouter.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 2.09.2022.
//

import Foundation

class MainRouter : PresenterToRouterMainProtocol {
    static func createModule(ref: HomeController) {
        let presenter = MainPresenter()
        
        ref.mainPresenterObject = presenter
        ref.mainPresenterObject?.mainInteractor = MainInteractor()
        ref.mainPresenterObject?.mainView = ref
        ref.mainPresenterObject?.mainInteractor?.mainPresenter = presenter
    }
}
