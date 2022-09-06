//
//  CartProtocol.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 6.09.2022.
//

import Foundation

protocol ViewToPresenterCartProtocol {
    var cartInteractor: PresenterToInteractorCartProtocol? {get set}
    var cartView: PresenterToViewCartProtocol? {get set}
    
    func getAllCart()
    func delete(id: String)
}

protocol PresenterToInteractorCartProtocol {
    var cartPresenter: InteractorToPresenterCartProtocol? {get set}
    func getAllCartList()
    func deleteProduct(id: String)
}

protocol InteractorToPresenterCartProtocol {
    func dataToPresenter(cartList: Array<Sepet>)
}

protocol PresenterToViewCartProtocol {
    func dataToView(cartList: Array<Sepet>)
}

protocol PresenterToRouterCartProtocol {
    static func createModule(ref: CartController)
}

