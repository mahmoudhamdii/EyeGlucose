//
//  BloodPressureViewController.swift
//  EyeGlucose
//
//  Created by hamdi on 08/07/2023.
//

import UIKit

class BloodPressureViewController: UIViewController {
    let categroies = ["Min","Max","Avarage","Lastes","All"]
    var index = 4
    var testFlag = false
    static var arrPressure = [pressure]()
    var pressureTemp = [pressure]()
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
      
       
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    func registerCell(){
        tableView.register(UINib(nibName: "BloodPressureTableViewCell", bundle: nil), forCellReuseIdentifier: "BloodPressureTableViewCell")
    }
    
    
    @IBAction func btnRightArowAction(_ sender: Any) {
        if index == 4 {
            index = 0
        }else {
            index += 1
            
        }
        lblCategory.text = categroies[index]
        updateTableViewData()
        
        
    }
    @IBAction func btnLeftArowAction(_ sender: Any) {
        if index == 0 {
            index = 4
        }else{
            index -= 1
        }
        lblCategory.text = categroies[index]
        updateTableViewData()
        
    }
    
    func updateTableViewData () {
        
        
        switch index {
        case  0 :
            //min
            minRow()
            break
        case  1 :
            //max
            maxRow()
            break
        case  2 :
            //avrage
           avrageRow()
            break
        case  3 :
           lastesRow()
            break
        case 4 :
            tableView.reloadData()
            break
        default:
            break
            
        }
    }
    func lastesRow(){
        testFlag = true
        pressureTemp = BloodPressureViewController.arrPressure
        BloodPressureViewController.arrPressure.removeAll()
        BloodPressureViewController.arrPressure.append(pressureTemp[pressureTemp.count - 1 ])
        tableView.reloadData()
        
    }
    func avrageRow(){
        testFlag = true
        var i = 0
        pressureTemp = BloodPressureViewController.arrPressure
        var systolicAvg = 0
        var diastolicAvg = 0
        var pulseAvg = 0
        while i < BloodPressureViewController.arrPressure.count  {
            systolicAvg += BloodPressureViewController.arrPressure[i].systolic!
            diastolicAvg += BloodPressureViewController.arrPressure[i].diastolic!
            pulseAvg += BloodPressureViewController.arrPressure[i].pulse!
            i += 1
        }
        let j  = pressureTemp.count - 1
        systolicAvg = systolicAvg / j
        diastolicAvg = diastolicAvg / j
        pulseAvg = pulseAvg / j
        print(systolicAvg)
        print(diastolicAvg)
        print(pulseAvg)
        BloodPressureViewController.arrPressure.removeAll()
        BloodPressureViewController.arrPressure.append(pressure(systolic:systolicAvg,diastolic: diastolicAvg,pulse: pulseAvg ))
        
        tableView.reloadData()
      
    }

    func minRow(){
        testFlag = true
        var i = 0
        var j = 0
        pressureTemp = BloodPressureViewController.arrPressure
        var min = BloodPressureViewController.arrPressure[0].systolic!
        while i < BloodPressureViewController.arrPressure.count  {
            if min > BloodPressureViewController.arrPressure[i].systolic! {
                min =  BloodPressureViewController.arrPressure[i].systolic!
                j = i
            }
            i += 1
        }
        BloodPressureViewController.arrPressure.removeAll()
        BloodPressureViewController.arrPressure.append(pressureTemp[j])
        tableView.reloadData()
        
    }
    func maxRow(){
        testFlag = true
        pressureTemp = BloodPressureViewController.arrPressure
        var i = 0
        var j  = 0
        var max = BloodPressureViewController.arrPressure[0].systolic!
        while i < BloodPressureViewController.arrPressure.count  {
            if max < BloodPressureViewController.arrPressure[i].systolic! {
                max =  BloodPressureViewController.arrPressure[i].systolic!
                j = i
            }
            i += 1
        }
        BloodPressureViewController.arrPressure.removeAll()
        BloodPressureViewController.arrPressure.append(pressureTemp[j])
        tableView.reloadData()
      
    }
    
}



extension BloodPressureViewController :UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        BloodPressureViewController.arrPressure.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell  = tableView.dequeueReusableCell(withIdentifier:"BloodPressureTableViewCell", for: indexPath) as? BloodPressureTableViewCell {
            cell.selectionStyle = .none
            let arr = Array(BloodPressureViewController.arrPressure.reversed())
            let systolic = "\( arr[indexPath.row].systolic ?? 0)"
            let diastolic = "\( arr[indexPath.row].diastolic ?? 0)"
            let pulse = "\( arr[indexPath.row].pulse ?? 0)"
            let date = arr[indexPath.row].date
            cell.setupCell(systolic: systolic, diastolic: diastolic, pulse: pulse, date: date!)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
        
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 && testFlag {
            BloodPressureViewController.arrPressure = pressureTemp
            testFlag = false
        }
    }
    
   

    
}
