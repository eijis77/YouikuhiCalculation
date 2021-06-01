//
//  InformationViewController.swift
//  YouikuhiCalculation
//
//  Created by 柴英嗣 on 2021/04/11.
//

import UIKit
import Cartography

class InformationViewController: UIViewController {

    let scrollView = UIScrollView()
    let screenWidth = Int(UIScreen.main.bounds.size.width)
    let screenHeight = Int(UIScreen.main.bounds.size.height)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.frame = self.view.frame
        if UIScreen.main.nativeBounds.height > 2208 || UIScreen.main.nativeBounds.height == 1792{
            scrollView.contentSize = CGSize(width:screenWidth, height:screenWidth * 6)
        }
        else{
            scrollView.contentSize = CGSize(width:screenWidth, height:screenWidth * 6)
        }
        self.view.addSubview(scrollView)
        
        self.navigationController?.navigationBar.titleTextAttributes = [
                .foregroundColor: UIColor.white
            ]
        
        let nextImage0 : UIImage = UIImage(named:"youikuhi_info")!
        let imageView0 = UIImageView(image:nextImage0)
        scrollView.addSubview(imageView0)
        constrain(imageView0) { image  in
            image.width  == image.superview!.width
            image.height == image.superview!.width * 6
            image.centerX == image.superview!.centerX
            image.top == image.superview!.top
        }
    }


}
