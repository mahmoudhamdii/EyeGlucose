//
//  HomeTableViewCell.swift
//  EyeGlucose
//
//  Created by hamdi on 06/07/2023.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var imgCategory: UIImageView!
    
    @IBOutlet weak var lblTittle: UILabel!
    
    func setupCell(photo:UIImage,tittle:String){
        imgCategory.image  = photo
        lblTittle.text = tittle
    }
    func applyGradient(to view: UIView, colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    override func awakeFromNib() {
        let lightGray = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 0.2)
        let darkGray = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 0.8)
        applyGradient(to: shadowView, colors: [lightGray, darkGray], startPoint: CGPoint(x: 0, y: 1), endPoint: CGPoint(x: 0, y: 0))
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0))
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)

           if selected {
               UIView.animate(withDuration: 0.2) {
                   self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)}
                   
               let backgroundView = UIView()
               backgroundView.backgroundColor = .clear
               selectedBackgroundView = backgroundView
               
           } else {
               UIView.animate(withDuration: 0.2) {
                   self.transform = CGAffineTransform.identity}
               selectedBackgroundView = nil
           }
       }
}
