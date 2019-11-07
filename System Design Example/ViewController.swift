//
//  ViewController.swift
//  System Design Example
//
//  Created by Stephen Anthony on 07/11/2019.
//  Copyright © 2019 Darjeeling Apps. All rights reserved.
//

import UIKit

/// A view controller showing how to modify fonts using
/// `UIFontDescriptor.SystemDesign`.
class ViewController: UIViewController {
    @IBOutlet private var textView: UITextView!
    
    @IBAction private func changeFont(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            updateTextFieldFont(withDesign: .default)
        case 1:
            updateTextFieldFont(withDesign: .rounded)
        case 2:
            updateTextFieldFont(withDesign: .serif)
        case 3:
            updateTextFieldFont(withDesign: .monospaced)
        default:
            fatalError("Unnavailable design selected.")
        }
    }
    
    private func updateTextFieldFont(withDesign design: UIFontDescriptor.SystemDesign) {
        guard let descriptor = textView.font?.fontDescriptor.withDesign(design) else {
            print("Could not update font.")
            return
        }
        textView.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: UIFont(descriptor: descriptor, size: 0))
    }
}
