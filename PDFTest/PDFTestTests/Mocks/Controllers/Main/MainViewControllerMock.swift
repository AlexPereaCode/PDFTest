//
//  MainViewControllerMock.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 23/2/22.
//

import Foundation
@testable import PDFTest

final class MainViewControllerMock: BaseViewController, MainView {
    var showActivityCalled = false
    var hideActivityCalled = false
    var documentPickerCalled = false
    
    func showActivityIndicator() {
        showActivityCalled = true
    }
    func hideActivityIndicator() {
        hideActivityCalled = true
    }
    func presentDocumentPicker() {
        documentPickerCalled = true
    }
}
