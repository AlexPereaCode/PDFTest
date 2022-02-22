//
//  ProcessRequest.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 5/2/22.
//

import Foundation

struct ProcessRequest: Codable {
    let processEntity: ProcessEntity
    let tool: ProcessToolType
    let compressionLevel: CompressType
}
