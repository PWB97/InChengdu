//
//  RecommendViewController.swift
//  成都生活展
//
//  Created by pu on 2017/11/25.
//  Copyright © 2017年 pu. All rights reserved.
//

import UIKit

class RecommendViewController: UIViewController {
    
    lazy var dataArray: [[String:String]] = {
        guard let filePath = Bundle.main.path(forAuxiliaryExecutable: "recommend.plist")
            else {
                print("cannot find file")
                return []
        }
        let dictArray = NSArray(contentsOfFile: filePath) as! [[String:String]]
        return dictArray
    }()
    
    var collectionView:UICollectionView!
    
    var timer:Timer!
    
    var number = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame:self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "recommendCell", bundle: nil), forCellWithReuseIdentifier: "recommendCell")
        view.addSubview(collectionView)
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(animateWithCell), userInfo: nil, repeats: true)
    }
    
    @objc func animateWithCell() {
        
        if number >= dataArray.count {
            number = 0
        }
        let indexP = IndexPath(item: number, section: 0)
        guard let cell = collectionView.cellForItem(at: indexP) else {
            return
        }
        UIView.transition(with: cell, duration: 2, options: .transitionFlipFromLeft, animations: nil) { (_) in
            self.number += 1
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension RecommendViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommendCell", for: indexPath) as! recommendCell
        let dict = dataArray[indexPath.item]
        cell.logoImageView.image = UIImage(named: dict["logoImage"]!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dict = dataArray[indexPath.item]
        let detailVC = detailController()
        detailVC.detailDict = dict
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
