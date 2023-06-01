//
//  OnBoardingCollectionViewCell.swift
//  EyeGlucose
//
//  Created by hamdi on 31/05/2023.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblTittle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var onBoardingPhoto: UIImageView!
    func setup(slide:OnboardingSlide){
        lblDescription.text = slide.description
        lblTittle.text = slide.tittle
        onBoardingPhoto.image = slide.photo
    }
}
