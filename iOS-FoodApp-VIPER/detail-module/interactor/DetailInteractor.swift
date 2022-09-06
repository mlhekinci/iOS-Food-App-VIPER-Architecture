//
//  DetailInteractor.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 6.09.2022.
//

import Foundation
import Alamofire

class DetailInteractor: PresenterToInteractorDetailProtocol {
    
    func addToCart(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: Int, kullanici_adi: String) {
        let params: Parameters = ["yemek_adi": yemek_adi, "yemek_resim_adi": yemek_resim_adi, "yemek_fiyat": yemek_fiyat, "yemek_siparis_adet": yemek_siparis_adet, "kullanici_adi": kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post, parameters: params).response {res in
            if let data = res.data {
                do {
                    if let response = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print(response)
                    }
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
