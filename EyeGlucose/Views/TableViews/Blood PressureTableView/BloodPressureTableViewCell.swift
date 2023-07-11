//
//  BloodPressureTableViewCell.swift
//  EyeGlucose
//
//  Created by hamdi on 08/07/2023.
//

import UIKit

class BloodPressureTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblPulse: UILabel!
    @IBOutlet weak var lblDiastolic: UILabel!
    @IBOutlet weak var lblSystolic: UILabel!
    override func layoutSubviews() {
        super.layoutSubviews()
      
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0))
        let spacingView = UIView(frame: CGRect(x: 0, y: contentView.frame.size.height, width: contentView.frame.size.width, height: 20))
           spacingView.backgroundColor = superview?.backgroundColor ?? .white // Use the table view's background color
           addSubview(spacingView)
        
    }
    func setupCell(systolic:String,diastolic:String,pulse:String,date:Date){
        lblPulse.text = pulse
        lblSystolic.text = systolic
        lblDiastolic.text = diastolic
        lblDate.text = ("\(date)")
    }
   
    
}
