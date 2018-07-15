//
//  detailController.swift
//  成都生活展
//
//  Created by pu on 2017/12/17.
//  Copyright © 2017年 pu. All rights reserved.
//

import UIKit

class detailController: UIViewController {

    var detailDict:[String:String]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "详细信息"
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let imageView = UIImageView(frame: CGRect(x: 8, y: 64, width: view.bounds.width - 16, height: 200))
        imageView.image = UIImage(named: detailDict!["detailImage"]!)
        let textV = UITextView(frame: CGRect(x: 8, y: 264+8, width: view.bounds.width - 16, height: view.bounds.height - 272))
        
        textV.text = try! NSString(contentsOfFile: Bundle.main.path(forAuxiliaryExecutable: detailDict!["intro"]!)!, encoding: String.Encoding.utf8.rawValue) as String
        textV.font = UIFont.systemFont(ofSize: 20)
        textV.isEditable = false
        textV.isSelectable = false
        view.addSubview(imageView)
        view.addSubview(textV)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
