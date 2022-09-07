//
//  CartPresenter.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 6.09.2022.
//

import Foundation

class CartPresenter: ViewToPresenterCartProtocol {
    var cartInteractor: PresenterToInteractorCartProtocol?
    
    var cartView: PresenterToViewCartProtocol?
    
    func getAllCart() {
        cartInteractor?.getAllCartList()
    }
    
    func delete(id: String) {
        cartInteractor?.deleteProduct(id: id)
    }
}

extension CartPresenter: InteractorToPresenterCartProtocol {
    func dataToPresenter(cartList: Array<Sepet>) {
        cartView?.dataToView(cartList: cartList)
    }
}
