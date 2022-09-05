//
//  ViewController.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 2.09.2022.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var mainPresenterObject: ViewToPresenterMainProtocol?
    var foodList = [Yemekler]()

    override func viewDidLoad() {
        super.viewDidLoad()
        MainRouter.createModule(ref: self)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        let height = collectionView.frame.size.width
        let cellWidth = (height - 30) / 2
        design.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.5)
        collectionView.collectionViewLayout = design
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainPresenterObject?.getFoods()
    }
}

extension HomeController: PresenterToViewMainProtocol {
    func dataToView(foodList: Array<Yemekler>) {
        self.foodList = foodList
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let food  = foodList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! FoodCollectionViewCell

        cell.showImage(imageName: food.yemek_resim_adi!)
        cell.title.text = food.yemek_adi!
        
        cell.layer.cornerRadius = 8
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.gray.cgColor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let food = foodList[indexPath.row]
        performSegue(withIdentifier: "toFoodDetail", sender: food)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFoodDetail" {
            if let food = sender as? Yemekler {
                let targetController = segue.destination as! DetailController
                targetController.foods = food
            }
        }
    }
}

