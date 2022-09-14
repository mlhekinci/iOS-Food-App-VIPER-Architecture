//
//  DetailRouter.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 6.09.2022.
//

import Foundation

class DetailRouter: PresenterToRouterDetailProtocol {
    static func createModule(ref: DetailController) {
        let presenter = DetailPresenter()
        
        ref.detailPresenterObject = presenter
        ref.detailPresenterObject?.detailInteractor = DetailInteractor()
        ref.detailPresenterObject?.detailView = ref
        ref.detailPresenterObject?.detailInteractor?.detailPresenter = presenter
    }
}
