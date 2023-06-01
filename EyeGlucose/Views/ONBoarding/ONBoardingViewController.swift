//
//  ONBoardingViewController.swift
//  EyeGlucose
//
//  Created by hamdi on 31/05/2023.
//

import UIKit

class ONBoardingViewController: UIViewController {
    var currentPage = 0 {
        didSet {
            if currentPage == arrSlides.count - 1 {
                btnNext.setTitle("Get Start", for: .normal)
            }else{
                btnNext.setTitle("Next", for: .normal)
            }
        }
    }
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var onBoardingCollectionView: UICollectionView!
    var arrSlides = [OnboardingSlide]()
    override func viewDidLoad() {
        super.viewDidLoad()
        onBoardingCollectionView.dataSource = self
        onBoardingCollectionView.delegate = self
      
        arrSlides.append(OnboardingSlide(tittle: "Let Your Eyes Tell Us About Your Health", description: "With EyeDiabetes, simply capture a photo of your eye, and our advanced technology will analyze it to provide you with valuable insights into your diabetes management. No more painful finger pricks or cumbersome devices – our app makes monitoring your glucose levels quick, convenient, and non-invasive", photo: UIImage(named: "ONBoarding1")!))
        arrSlides.append(OnboardingSlide(tittle: "We will help you to detect diabetes with just a click of a button ", description: "Welcome to EyeDiabetes, the revolutionary app that helps you monitor and manage your diabetes using the power of your eyes. Get ready to take control of your health and discover a new way to track your glucose levels effortlessly.", photo: UIImage(named: "ONBoarding0")!))
        arrSlides.append(OnboardingSlide(tittle: "We will help you to managing diabetes ", description: "We understand that managing diabetes can be overwhelming, but with EyeDiabetes, you'll have a reliable companion by your side. Our user-friendly interface and intuitive features make it easy for anyone, regardless of their technical expertise, to navigate and benefit from the app", photo: UIImage(named: "ONBoarding2")!))
       
    }
    

   
    @IBAction func btnNextAction(_ sender: Any) {
        if currentPage != arrSlides.count - 1 {
            currentPage += 1
            let index = IndexPath(item: currentPage, section: 0)
            onBoardingCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = currentPage
        }else {
            let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
            present(vc!, animated: true,completion: nil)
        }
    }
    
}
extension ONBoardingViewController :UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       arrSlides.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardingCollectionViewCell", for: indexPath)as!OnBoardingCollectionViewCell
       

        cell.setup(slide: arrSlides[indexPath.row])
        
        return cell
    }
    
    
}
