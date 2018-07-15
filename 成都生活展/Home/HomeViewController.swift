//
//  HomeViewController.swift
//  成都生活展
//
//  Created by pu on 2017/11/25.
//  Copyright © 2017年 pu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var dataArray: [[String:String]]! = {
        let filePath = Bundle.main.path(forAuxiliaryExecutable: "Home.plist")
        if filePath == nil {
            return [[:]]
        }
        let Array = NSArray(contentsOfFile: filePath!) as! [[String:String]]
        return Array
    }()
    
    var tableview:UITableView!
    
    var timer:Timer!
    
    var imageNum = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview = UITableView(frame: view.bounds, style: .plain)
        tableview.dataSource = self
        tableview.delegate = self
        tableview.estimatedRowHeight = 200
        tableview.rowHeight = UITableViewAutomaticDimension
        tableview.register(UINib(nibName: "homeCell", bundle: nil), forCellReuseIdentifier: "homeCell")
        view.addSubview(tableview)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        stopTimer()
    }
    
    @objc func CellAnimation() {
        let indexP = IndexPath(row: 0, section: 0)
        guard let cell = tableview.cellForRow(at: indexP) as? homeCell else {
            return
        }
        let transition =  CATransition()
        transition.type = "push"
        transition.subtype = "fromLeft"
        transition.duration = 3
        transition.repeatCount = 1
        if imageNum > 3 {
            imageNum = 1
        }
        cell.homeImageView.image = UIImage(named: "首页\(imageNum).png")
        cell.homeImageView.layer.add(transition, forKey: "cellAnimate")
        imageNum += 1
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(CellAnimation), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer.invalidate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! homeCell
            let dic = dataArray[indexPath.row]
            cell.homeImageView.image = UIImage(named: dic["image"]!)
            cell.homeIntroL.text = dic["intro"]
            return cell
    }
}
