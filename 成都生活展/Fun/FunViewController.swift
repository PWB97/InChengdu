//
//  FunViewController.swift
//  成都生活展
//
//  Created by pu on 2017/11/25.
//  Copyright © 2017年 pu. All rights reserved.
//

import UIKit

class FunViewController: UIViewController {

    lazy var dataArray: [[String:String]] = {
        guard let filePath = Bundle.main.path(forAuxiliaryExecutable: "viewSpot.plist")
            else { return[[:]] }
        let dictArray = NSArray(contentsOfFile: filePath) as! [[String:String]]
        return dictArray
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName:"funVCCell", bundle: nil), forCellReuseIdentifier: "funVC")
        tableView.rowHeight = 96
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension FunViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dict = dataArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "funVC", for: indexPath) as! funVCCell
        cell.spotImage.image = UIImage(named: dict["image"]!)
        cell.phoneL.text = dict["tel"]
        cell.titleL.text = dict["title"]
        cell.addressL.text = dict["address"]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = dataArray[indexPath.row]
        let detailVC = DisDetailViewController()
        detailVC.dict = dict
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
