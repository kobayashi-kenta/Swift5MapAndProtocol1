//
//  NextViewController.swift
//  Swift5MapAndProtocol1
//
//  Created by Kenta on 2020/12/19.
//

import UIKit

protocol SearchLocationDelegate {
    func searchLocation(idoValue:String,keidoValue:String)
}

class NextViewController: UIViewController {

    
    @IBOutlet weak var idoTextField: UITextField!
    
    
    @IBOutlet weak var keidoTextField: UITextField!
    
    var delegate:SearchLocationDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

  
    @IBAction func okAction(_ sender: Any) {
        
        let idoValue = idoTextField.text!
        let keidoValue = keidoTextField.text!
        
        
        
        if idoTextField.text != nil && keidoTextField.text != nil {
            delegate?.searchLocation(idoValue: idoValue, keidoValue: keidoValue)
            dismiss(animated: true, completion: nil)
            
            
        }
        
    }
    
}
