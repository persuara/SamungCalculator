//
//  Calculate.swift
//  Calculator
//
//  Created by AmirHossein EramAbadi on 1/8/23.
//

import Foundation
import UIKit

class Calculation {
    lazy var leftover = Leftover()
    lazy var lastElement = Validation()
    lazy var settingError = ErrorSettings()
    lazy var viewCotroller = ViewController()
    
    public func calculateResult(which label: UILabel, isTapped status: Bool, temp templabel: inout String?, substitude subResult: inout String?, labelError: ErrorMessage, whichL labelL: UILabel, isEtraNeeded: inout Bool) -> Void {
        if status {
            if lastElement.isLastAnElement(subResult ?? "=") == true {
                //----------------------Mark: Revise Error message on "="
                settingError.showErrorMessage(labelError, which: labelL)
                if leftover.sameParanthesesCount(subResult ?? "") {
                    templabel = subResult ?? ""
                    if label.text != nil {
                        label.text = "\((subResult ?? "").calculate()?.truncate(places: 5) ?? 0)"
                    } else {
                        settingError.showErrorMessage(labelError, which: labelL)
                    }
                    subResult = nil
                    label.isHidden = false
                } else {
                    isEtraNeeded = true
                    let tempii = leftover.placeParatheses(subResult!)
                    subResult = "\(subResult ?? "")\(tempii)"
                    print("Placing, endResult: \(String(describing: subResult))")
                    templabel = subResult ?? ""
                    print("Temp: \(String(describing: templabel))")
                    label.text = "\(subResult!.calculate()?.truncate(places: 5) ?? 0)"
                    print("Ready to Show result: \(String(describing: label))")
                    subResult = nil
                    label.isHidden = false
                }
            }
        } else {
            if label.text != nil {
                if lastElement.isLastAnElement(label.text!) == true {
                    settingError.showErrorMessage(labelError, which: labelL)
                    label.isHidden = true
                } else {
                    if leftover.sameParanthesesCount(label.text!) {
                        label.text = "\(label.text!.calculate()?.truncate(places: 5) ?? 0 )"
                        print("Same Para: \(String(describing: label))")
                        label.isHidden = false
                    } else {
                        let tempii = leftover.placeParatheses(label.text!)
                        label.text = "\(label.text ?? "")\(tempii)"
                        print("Diff Para \(label.text!)")
                        label.text = "\(label.text!.calculate()?.truncate(places: 5) ?? 0 )"
                        label.isHidden = false
                    }
                }
            } 
        }
    }
    public func calculateWhenDeletingWasDone(which label: UILabel, isTapped status: Bool, temp templabel: inout String?, substitude subResult: inout String?, labelError: ErrorMessage, whichL labelL: UILabel, isEtraNeeded: inout Bool) {
        if status {
            if lastElement.isLastAnElement(subResult ?? "=") == true {
                //----------------------Mark: Revise Error message on "="
                settingError.showErrorMessage(labelError, which: labelL)
                if leftover.sameParanthesesCount(subResult ?? "") {
                    templabel = subResult ?? ""
                    if label.text != nil {
                        label.text = "\((subResult ?? "").calculate()?.truncate(places: 5) ?? 0)"
                        print("\(label.text)")
                    } else {
                        settingError.showErrorMessage(labelError, which: labelL)
                    }
                    subResult = nil
                    label.isHidden = false
                } else {
                    isEtraNeeded = true
                    let tempii = leftover.placeParatheses(subResult!)
                    subResult = "\(subResult ?? "")\(tempii)"
                    print("Placing, endResult: \(String(describing: subResult))")
                    templabel = subResult ?? ""
                    print("Temp: \(String(describing: templabel))")
                    label.text = "\(subResult!.calculate()?.truncate(places: 5) ?? 0)"
                    print("Ready to Show result: \(String(describing: label))")
                    subResult = nil
                    label.isHidden = false
                }
            }
        }
    }
}
