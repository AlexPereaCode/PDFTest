//
//  Mocks.swift
//  PDFTestTests
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import Foundation
@testable import PDFTest

final class Mocks {
    static let server = "api22.ilovepdf.com"
    static let task = "g27d4mrsg3ztmnzAgm5d3njAggfm52t393znyj9ycf38bj"
    static let serverFilename = "7d495c21cf0b54e97501cabd590fd376d803d4aaf00ba0ea09f4c6d8aa4d5a82.pdf"
    static let originalFilename = "Test.pdf"
    static let token = "4e97501cabd590fd376d803d4aaf00ba0ea0"
    static let processEntity = ProcessEntity(server: server, task: task, serverFilename: serverFilename, originalFilename: originalFilename)
    static let processRequest = ProcessRequest(processEntity: processEntity, tool: .compress, compressionLevel: .recommended)
}
