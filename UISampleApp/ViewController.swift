//
//  ViewController.swift
//  UISampleApp
//
//  Created by 高良 on 2020/12/16.
//  Copyright © 2020年 TAKA. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var vi: UIView!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    let dataSource =  ["Google", "Apple", "Facebook", "Amazon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerView.delegate   = self
        pickerView.dataSource = self

        vi.addSubview(pickerView)
        print("viewDidLoad()")
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print("pickerView():" + String(row))
        return dataSource[row]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print("viewDidLoad() Int")
        return dataSource.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("viewDidLoad() void:" + String(row))
        switch row {
        case 0:
            //　Googleが選ばれたらHPにアクセスする
            guard let url = URL(string: "https://www.google.com/?client=safari") else { return }
            let safariController = SFSafariViewController(url: url)
            present(safariController, animated: true, completion: nil)
        case 1:
            guard let url = URL(string: "https://www.apple.com/jp/") else { return }
            let safariController = SFSafariViewController(url: url)
            present(safariController, animated: true, completion: nil)
        case 2:
            guard let url = URL(string: "https://www.facebook.com") else { return }
            let safariController = SFSafariViewController(url: url)
            present(safariController, animated: true, completion: nil)
        case 3:
            guard let url = URL(string: "https://www.amazon.co.jp") else { return }
            let safariController = SFSafariViewController(url: url)
            present(safariController, animated: true, completion: nil)
        default:
            break
        }
    }

}

