//
//  CartRouter.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 6.09.2022.
//

import Foundation

class CartRouter: PresenterToRouterCartProtocol {
    static func createModule(ref: CartController) {
        let presenter = CartPresenter()
        
        ref.cartPresenterObject = presenter
        ref.cartPresenterObject?.cartInteractor = CartInteractor()
        ref.cartPresenterObject?.cartView = ref
        ref.cartPresenterObject?.cartInteractor?.cartPresenter = presenter
    }
}
