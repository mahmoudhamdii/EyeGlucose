//
//  NewPressureRecordViewController.swift
//  EyeGlucose
//
//  Created by hamdi on 10/07/2023.
//

import UIKit

class NewPressureRecordViewController: UIViewController {
    var systolic = 100
    var diastolic = 78
    var pulse = 80
    var date :Date?
    @IBOutlet weak var pluSlider: UISlider!
    @IBOutlet weak var daiSlider: UISlider!
    @IBOutlet weak var sysSlider: UISlider!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblPulse: UILabel!
    @IBOutlet weak var lblDiastolic: UILabel!
    @IBOutlet weak var datePiker: UIDatePicker!
    @IBOutlet weak var lblSystolic: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        date = datePiker.date
    }
    
    @IBAction func DataPikerAction(_ sender: UIDatePicker) {
        let x  = sender.date
        date = x
    }
    @IBAction func btnSaveAction(_ sender: Any) {
        BloodPressureViewController.arrPressure.append(pressure(systolic: systolic,diastolic: diastolic,pulse: pulse,date: date))
         systolic = 100
         diastolic = 78
         pulse = 80
    sysSlider.value = Float(systolic)
        daiSlider.value = Float(diastolic)
        pluSlider.value = Float(pulse)
        lblPulse.text = "\(pulse)"
        lblSystolic.text = "\(systolic)"
        lblDiastolic.text = "\(diastolic)"
        
    }
    
    @IBAction func btninfoAction(_ sender: Any) {
    }
    @IBAction func sysSliderAction(sender: UISlider) {
        let x :Int = Int(sender.value)
        lblSystolic.text = ("\(x)")
        systolic = x
        statusChanger()
    }
    
    @IBAction func diaSliderAction(sender: UISlider) {
        let x :Int = Int(sender.value)
        lblDiastolic.text = ("\(x)")
        diastolic = x
        statusChanger()
    }
    
    @IBAction func pulseSliderAction(sender: UISlider) {
        let x :Int = Int(sender.value)
        lblPulse.text = ("\(x)")
        pulse = x
        statusChanger()
    }
    
    
    func getBloodPressureStatus(systolic: Int, diastolic: Int, pulse: Int) -> String {
        if systolic < 90 || diastolic < 60 {
            return "Hypotension"
        } else if (systolic >= 90 && systolic <= 119) && (diastolic >= 60 && diastolic <= 79) {
            return "Normal"
        } else if (systolic >= 120 && systolic <= 129) && (diastolic >= 60 && diastolic <= 79)  {
            return "Elevated"
        } else if (systolic >= 130 && systolic <= 139) || (diastolic >= 80 && diastolic <= 89)  {
            return "Hypertension Stage 1"
        } else if (systolic >= 140 && systolic <= 180) || (diastolic >= 90 && diastolic <= 120) {
            return "Hypertension Stage 2"
        } else if systolic > 180 || diastolic > 120 {
            return "Hypertensive"
        }
        else {
            return "unknown"
        }
    }
    func statusChanger(){
        lblStatus.text = getBloodPressureStatus(systolic: systolic, diastolic: diastolic, pulse: pulse)
        let tester = lblStatus.text
        
        if tester == "Hypotension" {
            statusView.backgroundColor = #colorLiteral(red: 0.269909721, green: 0.4983237569, blue: 0.9426887631, alpha: 1)
            
        }else if tester == "Normal" {
            statusView.backgroundColor = #colorLiteral(red: 0.3316394687, green: 0.8057181239, blue: 0.3841226399, alpha: 1)
            
        }else if tester == "Elevated" {
            statusView.backgroundColor = #colorLiteral(red: 0.9957228722, green: 1, blue: 0.2788296363, alpha: 1)
            
        }else if tester == "Hypertension Stage 1"{
            statusView.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        }else if tester == "Hypertension Stage 2" {
            statusView.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            
        }else if tester == "Hypertensive" {
            statusView.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
        
    }
}
