//
//  ViewController.swift
//  practice04
//
//  Created by FISH on 2019/3/10.
//  Copyright © 2019 FISH. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var genderSegment: UISegmentedControl!
    @IBOutlet weak var hairSwitch: UISwitch!
    @IBOutlet weak var hairLabel: UILabel!
    @IBOutlet weak var branchInput: UITextField!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var genderResultImg: UIImageView!
    @IBOutlet weak var hairResultImg: UIImageView!
    @IBOutlet weak var branchResultImg: UIImageView!
    @IBOutlet weak var heightResultImg: UIImageView!
    @IBOutlet weak var resultAnsTitle: UILabel!
    @IBOutlet weak var genderAnsTitle: UILabel!
    @IBOutlet weak var hairAnsTitle: UILabel!
    @IBOutlet weak var branchAnsTitle: UILabel!
    @IBOutlet weak var heightAnsTitle: UILabel!
    
    let twelveBranches = ["鼠", "牛", "虎", "兔", "龍", "蛇", "馬", "羊", "猴", "雞", "狗", "豬"]
    let heights = [140, 150, 160, 170, 180, 190, 200, 210]
    var genderAns: Int?
    var hairAns: Bool?
    var branchAns: Int?
    var heightAns: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAns()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setAns() {
        genderAns = Int.random(in: 0...2)
        hairAns = Bool.random()
        branchAns = Int.random(in: 0...11)
        heightAns = Int.random(in: 0...7)
        //print(branchAns!)
    }
    
    @IBAction func changeHeightSlider(_ sender: UISlider) {
        sender.value.round()
        let heightIndex = Int(sender.value)
        let height = heights[heightIndex]
        heightLabel.text = "\(height) cm"
    }

    @IBAction func pressGuessButton(_ sender: Any) {
        if genderSegment.selectedSegmentIndex != genderAns {
            genderResultImg.image = UIImage(named: "x")
        } else {
            genderResultImg.image = UIImage(named: "o")
        }
        if hairSwitch.isOn != hairAns {
            hairResultImg.image = UIImage(named: "x")
        } else {
            hairResultImg.image = UIImage(named: "o")
        }
        if branchInput.text != twelveBranches[branchAns!] {
            branchResultImg.image = UIImage(named: "x")
        } else {
            branchResultImg.image = UIImage(named: "o")
        }
        if Int(heightSlider.value) != heightAns {
            heightResultImg.image = UIImage(named: "x")
        } else {
            heightResultImg.image = UIImage(named: "o")
        }
        resultAnsTitle.isHidden = false
        genderAnsTitle.isHidden = false
        hairAnsTitle.isHidden = false
        branchAnsTitle.isHidden = false
        heightAnsTitle.isHidden = false
        genderResultImg.isHidden = false
        hairResultImg.isHidden = false
        branchResultImg.isHidden = false
        heightResultImg.isHidden = false
    }
    
    @IBAction func pressRestartButton(_ sender: Any) {
        resultAnsTitle.isHidden = true
        genderAnsTitle.isHidden = true
        hairAnsTitle.isHidden = true
        branchAnsTitle.isHidden = true
        heightAnsTitle.isHidden = true
        genderResultImg.isHidden = true
        hairResultImg.isHidden = true
        branchResultImg.isHidden = true
        heightResultImg.isHidden = true
        setAns()
    }
    
}

