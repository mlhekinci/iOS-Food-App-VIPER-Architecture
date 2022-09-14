//
//  DetailProtocol.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 6.09.2022.
//

import Foundation

protocol ViewToPresenterDetailProtocol {
    var detailInteractor: PresenterToInteractorDetailProtocol? {get set}
    var detailView: PresenterToViewDetailProtocol? {get set}
    
    func add(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: Int, kullanici_adi: String)
}

protocol PresenterToInteractorDetailProtocol {
    var detailPresenter: InteractorToPresenterDetailProtocol? {get set}
    
    func addToCart(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: Int, kullanici_adi: String)
}

protocol InteractorToPresenterDetailProtocol {
    func dataToPresenter(isSuccess: Bool)
}

protocol PresenterToViewDetailProtocol {
    func dataToView(isSuccess: Bool)
}

protocol PresenterToRouterDetailProtocol {
    static func createModule(ref: DetailController)
}
