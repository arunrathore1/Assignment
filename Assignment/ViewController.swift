//
//  ViewController.swift
//  Assignment
//
//  Created by Arun Rathore on 10/02/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate{

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        textView.delegate = self
        textField.addTarget(self, action: #selector(self.didChangeText(_:)), for:.allEditingEvents)
        addCustomMenu()
    }
    

    @objc func didChangeText(_ TextField: UITextField) {
        self.textView.text = textField.text
    }
    
    func addCustomMenu() {
        let changeColor = UIMenuItem(title: "Change Color", action: #selector(chnageColor))
        UIMenuController.shared.menuItems = [changeColor]
    }
    
    @objc func chnageColor() {
        if let range = textView.selectedTextRange , let _ = textField.text(in: range) {
            let attributedString = NSMutableAttributedString(string: self.textView.text)
            attributedString.addAttributes([.foregroundColor: UIColor.green, .font: textView.font!], range: textView.selectedRange)
            textView.attributedText = attributedString
        }
    }
}


