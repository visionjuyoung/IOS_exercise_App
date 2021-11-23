//
//  PageControlViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/11/23.
//

import UIKit

class PageControlViewController: UIViewController {
    
    let images: [String] = ["pasta", "pizza", "bulgogi", "riceWater"]
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.allowsContinuousInteraction = true
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .black
        imageView.image = UIImage(named: images[0])
    }
    
    @IBAction func update(_ sender: UIPageControl) {
        imageView.image = UIImage(named: images[pageControl.currentPage])
    }
    
    @IBAction func close(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
    }
}
