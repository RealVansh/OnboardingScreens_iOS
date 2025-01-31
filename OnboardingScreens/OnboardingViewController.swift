//
//  OnboardingViewController.swift
//  OnboardingScreens
//
//  Created by admin100 on 19/12/24.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    var currentPage = 0{
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count-1{
                
                nextButton.setTitle("Get Started", for: .normal)
            }
            else{
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self

        slides = [OnboardingSlide(title: "Hassle Free Storage" , description: "Easy store and access to all your Medical Records. No more searching through papers.", image: UIImage.first),OnboardingSlide(title: "Never Miss a Dose or Appointment ", description: "Get timely reminders for your medications and upcoming appointments.", image: UIImage.second),OnboardingSlide(title: "Your Health, At a Glance", description: "Quickly access your vital health details in one place", image: UIImage.last)
        ]
        pageControl.numberOfPages = slides.count
    }
    
     
    @IBAction func nextButtonClicked(_ sender: Any) {
        if currentPage == slides.count-1{
            print("Go to the next screen")
            /*see the video from 41.40 mins (https://www.youtube.com/watch?v=VMiaNFabsZA&list=PLgBVHL8joMCthoqCwsWAUWIiyJaPrqPA4&index=3)*/
        }
        else{
            currentPage += 1
            let IndexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: IndexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
