//
//  BasePresenter.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 3/2/22.
//

import Foundation

class BasePresenter<T: BaseView> {
    weak var view: T?
}
