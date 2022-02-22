//
//  BaseButton.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 5/2/22.
//

import UIKit

class BaseButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        clipsToBounds = true
        layer.cornerRadius = 8
        backgroundColor = Colors.accentColor
        tintColor = .white
    }
}
