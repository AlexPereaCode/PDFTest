//
//  BaseViewController.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 4/2/22.
//

import UIKit

class BaseViewController: UIViewController {

    private(set) var activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureActivityIndicator()
    }
    
    private func configureActivityIndicator() {
        activityIndicator.color = .gray
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    public func showLoading() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    public func hideLoading() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
}
