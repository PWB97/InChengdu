//
//  DisDetailViewController.swift
//  成都生活展
//
//  Created by pu on 09/12/2017.
//  Copyright © 2017 pu. All rights reserved.
//

import UIKit

class DisDetailViewController: UIViewController {

    var dict:[String:String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        title = dict!["title"]
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 64, width: view.bounds.width, height: 200))
        scrollView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        scrollView.contentSize = CGSize(width: view.bounds.width * 3, height: 200)
        for i in 1...3 {
            let imageView = UIImageView(frame: CGRect(x: CGFloat(i-1)*view.bounds.width, y: 0, width: view.bounds.width, height: 200))
            imageView.image = UIImage(named: "\(dict!["title"]!)\(i).jpg")
            scrollView.addSubview(imageView)
        }
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        
//        let textL = UILabel(frame: CGRect(x: 0, y: scrollView.frame.maxY, width: view.bounds.width + 8, height: 44))
//        textL.text = dict!["text"]
//        textL.numberOfLines = 0
//        textL.sizeToFit()
//        textL.font = UIFont.systemFont(ofSize: 13)
//
//        view.addSubview(textL)
        
        let textV = UITextView(frame: CGRect(x: 0, y: scrollView.frame.maxY + 8, width: view.bounds.width, height: view.bounds.height - scrollView.frame.maxY))
        textV.text = dict!["text"]
        textV.font = UIFont.systemFont(ofSize: 20)
        textV.isEditable = false
        textV.isSelectable = false
        
        view.addSubview(textV)
        view.addSubview(scrollView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
