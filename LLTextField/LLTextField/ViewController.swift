//
//  ViewController.swift
//  LLTextField
//
//  Created by 马国玺 on 2020/7/31.
//  Copyright © 2020 马国玺. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: LLTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.limitLength = 5
    }


}

