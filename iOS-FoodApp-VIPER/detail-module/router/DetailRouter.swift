//
//  DetailRouter.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 6.09.2022.
//

import Foundation

class DetailRouter: PresenterToRouterDetailProtocol {
    static func createModule(ref: DetailController) {
        ref.detailPresenterObject = DetailPresenter()
        ref.detailPresenterObject?.detailInteractor = DetailInteractor()
    }
}
