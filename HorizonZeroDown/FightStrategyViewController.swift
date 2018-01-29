//
//  FightStrategyViewController.swift
//  HorizonZeroDown
//
//  Created by George Heints on 25.01.2018.
//  Copyright © 2018 George Heints. All rights reserved.
//

import UIKit

class FightStrategyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var test : [testing]? = []
    var size = CGSize(width: 150, height: 150)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.collectionView.backgroundColor = .clear
        
        let attrs = [
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.font: UIFont(name: "Chalkduster", size: 24)!
        ]
        
        self.navigationController?.navigationBar.titleTextAttributes = attrs
        navigationItem.title = "Fight Strategy"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        getData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.test?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collCell", for: indexPath) as! FightCollectionViewCell
        
        cell.backgroundColor = .clear
        cell.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        //cell.dogLbl?.text = self.test?[indexPath.row].name_ru?.capitalized
        cell.imageBeasts.downloadImg(from: (test?[indexPath.row].imageUrl)!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    func getData(){
        var test1 = [info]()
        let url = "https://raw.githubusercontent.com/soysmile/AllAboutMyDog/master/MoreAboutYourDog/dogs.json"
        guard let urlPath = URL(string: url) else {return}
        URLSession.shared.dataTask(with: urlPath) { (data, response, error) in
            guard let data = data else{return}
            do{
                let courses = try JSONDecoder().decode(info.self, from: data)
                self.test = courses.dogs
                DispatchQueue.main.async {
                    
                    self.collectionView.reloadData()
                }
                
            }
            catch{
                print("error")
            }
            }.resume()
        
    }

}

//required App Transport Security Settings
extension UIImageView{
    func downloadImg(from url: String){
        
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            
            if error != nil{
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}
