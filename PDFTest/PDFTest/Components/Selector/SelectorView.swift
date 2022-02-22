//
//  SelectorView.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 5/2/22.
//

import UIKit

protocol SelectorViewDelegate: AnyObject {
    func selected(view: SelectorView, type: CompressType)
}

final class SelectorView: UIView {
    
    @IBOutlet private weak var button: UIButton!
    weak var delegate: SelectorViewDelegate?
    
    var isSelected: Bool = false {
        didSet {
            UISelectedAction()
        }
    }
    
    var type: CompressType = .recommended {
        didSet {
            button.setTitle(type.rawValue.capitalized, for: .normal)
        }
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupXib()
    }
    
    private func UISelectedAction() {
        let color: UIColor = isSelected ? Colors.accentColor : .white
        backgroundColor = color
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        delegate?.selected(view: self, type: type)
    }
}
