//
//  LLTextField.swift
//  LLTextField
//
//  Created by 马国玺 on 2020/7/31.
//  Copyright © 2020 马国玺. All rights reserved.
//

import UIKit

class LLTextField: UITextField {

    var limitLength: UInt = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)), name: UITextField.textDidChangeNotification, object: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)), name: UITextField.textDidChangeNotification, object: self)
    }
    
    @objc func textDidChange(_ notification: Notification) {
        if let object = notification.object {
            if object is LLTextField {
                let textField = object as! LLTextField
                if textField.limitLength == 0 {
                    return
                }
                guard let text = textField.text else { return }
                if let _ = textField.markedTextRange {
                    
                } else {
                    textField.text = text.substring(to: limitLength-1)
                }
            }
        }
    }
}

extension String {
    func substring(to index: UInt) -> String {
        if self.count > index {
            let distance = Int(index) - self.count + 1
            let endIndex = self.index(self.endIndex, offsetBy: distance)
            let subString = self[self.startIndex..<endIndex]
            return String(subString)
        } else {
            return self
        }
    }
}
