//
//  HomeVC.swift
//  EyeGlucose
//
//  Created by hamdi on 06/07/2023.
//

import UIKit

class HomeVC: UIViewController {
    var arrSlide = [HomeSlide]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        arrSlide.append(HomeSlide(tittle: "Check Diabetes", photo: UIImage(named: "Home1")))
        arrSlide.append(HomeSlide(tittle: "Blood Pressure", photo: UIImage(named: "Home2")))
        arrSlide.append(HomeSlide(tittle: "Blood Suger", photo: UIImage(named: "Home3")))
        arrSlide.append(HomeSlide(tittle: "BMI Calculator ", photo: UIImage(named: "Home4")))
        
        registerCell()
       
    }
    func registerCell() {
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
    


}
extension HomeVC :UITableViewDelegate,UITableViewDataSource ,UIScrollViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrSlide.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell {
            cell.selectionStyle = .none
            let photo  = arrSlide[indexPath.row].photo
            let tille = arrSlide[indexPath.row].tittle
            cell.setupCell(photo: photo!, tittle: tille!)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedRow = indexPath.row
        var vc = UIViewController()
        switch selectedRow {
        case 0 :
            vc = DiabetesViewController.instantiate()
            navigationController?.pushViewController(vc, animated: true)
        break
        case 1 :
            
            vc = BloodPressureViewController.instantiate()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            break
        case 2:
            navigationController?.pushViewController(vc, animated: true)
            break
        case 3  :
            vc = BMIViewController.instantiate()
            navigationController?.pushViewController(vc, animated: true)
            break
        default :
            break
        }
       
    }
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            UIView.animate(withDuration: 0.2) {
                cell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }
        }
    }

    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            UIView.animate(withDuration: 0.2) {
                cell.transform = CGAffineTransform.identity
            }
        }
    }

    
    
}
