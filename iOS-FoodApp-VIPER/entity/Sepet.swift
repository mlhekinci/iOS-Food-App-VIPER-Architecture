//
//  Sepet.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 6.09.2022.
//

import Foundation

class Sepet: Codable {
    let sepet_yemek_id: Int?
    let yemek_adi: String?
    let yemek_resim_adi: String?
    let yemek_fiyat: Int?
    let yemek_siparis_adet: Int?
    let kullanici_adi: String?
    
    
    init(sepet_yemek_id: Int, yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String) {
        self.sepet_yemek_id = sepet_yemek_id
        self.yemek_adi = yemek_adi
        self.yemek_resim_adi = yemek_resim_adi
        self.yemek_fiyat = yemek_fiyat
        self.yemek_siparis_adet = yemek_siparis_adet
        self.kullanici_adi = kullanici_adi
    }
}
