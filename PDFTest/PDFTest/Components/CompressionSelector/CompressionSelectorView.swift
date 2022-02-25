//
//  CompressionSelectorView.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 5/2/22.
//

import UIKit

protocol CompressionSelectorViewDelegate: AnyObject {
    func compressionSelected(type: CompressType)
}

final class CompressionSelectorView: UIView {
    
    @IBOutlet private(set) weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 12
        }
    }
    
    @IBOutlet private(set) weak var firstSelector: SelectorView! {
        didSet {
            firstSelector.delegate = self
            firstSelector.type = CompressType.low
            firstSelector.isSelected = false
        }
    }
    
    @IBOutlet private(set) weak var secondSelector: SelectorView! {
        didSet {
            secondSelector.delegate = self
            secondSelector.type = CompressType.recommended
            secondSelector.isSelected = true
        }
    }
    
    @IBOutlet private(set) weak var thirdSelector: SelectorView! {
        didSet {
            thirdSelector.delegate = self
            thirdSelector.type = CompressType.extreme
            thirdSelector.isSelected = false
        }
    }
    
    weak var delegate: CompressionSelectorViewDelegate?
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupXib()
    }

}

extension CompressionSelectorView: SelectorViewDelegate {
    func selected(view: SelectorView, type: CompressType) {
        
        delegate?.compressionSelected(type: type)
        
        [firstSelector, secondSelector, thirdSelector].forEach {
            if $0 == view {
                $0?.isSelected = true
                return
            }
            $0?.isSelected = false
        }
    }
}
