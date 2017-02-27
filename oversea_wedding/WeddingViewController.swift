//
//  WeddingViewController.swift
//  oversea_wedding
//
//  Created by clai on 2017/2/21.
//  Copyright © 2017年 clai. All rights reserved.
//

import UIKit

class WeddingViewController: UIViewController, UIPickerViewDelegate {

    var price = ["< 100,000", "100,000 ~ 150,000", "> 150,000"]
    
    @IBOutlet weak var locationSegment: UISegmentedControl!
    
    
    @IBOutlet weak var pickerPrice: UIPickerView!
    
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var peopleSlider: UISlider!
    @IBAction func adjustPeopleAction(_ sender: UISlider) {
        peopleLabel.text = String(Int(sender.value))
    }
    
    
    @IBOutlet weak var resultLabel: UILabel!
   
    
    @IBAction func searchButton(_ sender: Any) {
        
        if locationSegment.selectedSegmentIndex == 1{
        
            if pickerPrice.selectedRow(inComponent: 0) > 0 && peopleSlider.value < 50 {
                resultLabel.text = "白色羽翼"
            }else{
                resultLabel.text = "沒有符合的教堂"
            }
        
        }else{
           
        
            if peopleSlider.value < 60{
            
                if pickerPrice.selectedRow(inComponent: 0) < 1 {
                    resultLabel.text = "艾葵雅"
                }else{
                    resultLabel.text = "艾葵雅, 克莉絲蒂"
                }
            
            }else{
                resultLabel.text = "沒有符合的教堂"
                
            }
        }
        
        
        resultLabel.isHidden = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        peopleSlider.value = 30
        pickerPrice.selectRow(1, inComponent: 0, animated: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return price.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return price[row]
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
