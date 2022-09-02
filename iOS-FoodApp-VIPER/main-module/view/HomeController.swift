//
//  ViewController.swift
//  iOS-FoodApp-VIPER
//
//  Created by Melih on 2.09.2022.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var mainPresenterObject: ViewToPresenterMainProtocol?
    var foodList = [Yemekler]()

    override func viewDidLoad() {
        super.viewDidLoad()
        MainRouter.createModule(ref: self)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainPresenterObject?.getFoods()
    }
}

extension HomeController: PresenterToViewMainProtocol {
    func dataToView(foodList: Array<Yemekler>) {
        self.foodList = foodList
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = foodList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath) as! MainTableViewCell
        
        cell.label.text = food.yemek_adi
        
        return cell
    }
    
    
}

