//
//  ProcessEntity.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 5/2/22.
//

import Foundation

struct ProcessEntity: Codable {
    let server: String
    let task: String
    let serverFilename: String
    let originalFilename: String
}
