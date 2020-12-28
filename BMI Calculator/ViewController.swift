//
//  ViewController.swift
//  BMI Calculator
//
//  Created by 吳世馨 on 2020/12/28.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var catagoryLabel: UILabel!
    
//編輯完收鍵盤的function
    func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func hideKeyboard(){
        self.view.endEditing(true)
    }
 
//viewDidLoad中呼叫此function，之後點空白處就可以收鍵盤。
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGesture()
    }

    
//宣告身高、體重常數型別
    @IBAction func calculateBMI(_ sender: Any) {
        let height = Double(heightTextField.text!)
        let weight = Double(weightTextField.text!)
        if height != nil, weight != nil {
            let heightMeter = height! / 100
            let bmiIndex = weight! / (heightMeter * heightMeter)
        bmiLabel.text = String(format: "%.1f", bmiIndex)
        
        
//判斷BMI數值分別落於哪個區間（每色塊區間相差30度），並改變字體顏色&指針角度。
        let oneDegree = CGFloat.pi / 180
        let pointerImageView = UIImageView(image: UIImage(named: "pointer"))
            view.addSubview(pointerImageView)
        if bmiIndex < 18.5 {
            catagoryLabel.text = "Under weight"
            bmiLabel.textColor = UIColor(red: 172/255, green: 216/255, blue: 209/255, alpha: 1)
            catagoryLabel.textColor = UIColor(red: 172/255, green: 216/255, blue: 209/255, alpha: 1)
            pointerImageView.transform = CGAffineTransform.identity.translatedBy(x: 108, y: 637).rotated(by: oneDegree * 15)
        }else if bmiIndex > 18.5, bmiIndex < 24.9 {
            catagoryLabel.text = "Normal weight"
            bmiLabel.textColor = UIColor(red: 162/255, green: 226/255, blue: 87/255, alpha: 1)
            catagoryLabel.textColor = UIColor(red: 162/255, green: 226/255, blue: 87/255, alpha: 1)
            pointerImageView.transform = CGAffineTransform.identity.translatedBy(x: 117, y: 625).rotated(by: oneDegree * 45)
        }else if bmiIndex > 25.0, bmiIndex < 29.9{
            catagoryLabel.text = "Over weight"
            bmiLabel.textColor = UIColor(red: 255/255, green: 250/255, blue: 149/255, alpha: 1)
            catagoryLabel.textColor = UIColor(red: 255/255, green: 250/255, blue: 149/255, alpha: 1)
            pointerImageView.transform = CGAffineTransform.identity.translatedBy(x: 140, y: 620).rotated(by: oneDegree * 75)
        }else if bmiIndex > 30.0, bmiIndex < 34.9{
            catagoryLabel.text = "Obese(I)"
            bmiLabel.textColor = UIColor(red: 253/255, green: 210/255, blue: 29/255, alpha: 1)
            catagoryLabel.textColor = UIColor(red: 253/255, green: 210/255, blue: 29/255, alpha: 1)
            pointerImageView.transform = CGAffineTransform.identity.translatedBy(x: 170, y: 605).rotated(by: oneDegree * 105)
        }else if bmiIndex > 35.0, bmiIndex < 39.9{
            catagoryLabel.text = "Obese(II)"
            bmiLabel.textColor = UIColor(red: 251/255, green: 139/255, blue: 60/255, alpha: 1)
            catagoryLabel.textColor = UIColor(red: 251/255, green: 139/255, blue: 60/255, alpha: 1)
            pointerImageView.transform = CGAffineTransform.identity.translatedBy(x: 175, y: 620).rotated(by: oneDegree * 135)
        }else{
            catagoryLabel.text = "Obese(III)"
            bmiLabel.textColor = UIColor(red: 241/255, green: 120/255, blue: 130/255, alpha: 1)
            catagoryLabel.textColor = UIColor(red: 241/255, green: 120/255, blue: 130/255, alpha: 1)
            pointerImageView.transform = CGAffineTransform.identity.translatedBy(x: 200, y: 640).rotated(by: oneDegree * 175)
        }
        }

    }
 
//設定一鍵清除全部資料
    @IBAction func clearButton(_ sender: UIButton) {
        heightTextField.text = ""
        weightTextField.text = ""
        bmiLabel.text = "0.0"
        catagoryLabel.text = "0.0"
        let bmiChartImageView = UIImageView(image: UIImage(named: "bmiChart"))
        bmiChartImageView.transform = CGAffineTransform.identity.translatedBy(x: 16, y: 480)
        view.addSubview(bmiChartImageView)
    }
}
