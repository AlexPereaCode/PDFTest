//
//  ProcessResponse.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 5/2/22.
//

import Foundation

struct ProcessResponse: Codable {
    let downloadName: String
    let filesize: Int
    let outputSize: Int
    let outputNumber: Int
    let outputExtensions: String
    let timer: String
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case downloadName = "download_filename"
        case filesize
        case outputSize = "output_filesize"
        case outputNumber = "output_filenumber"
        case outputExtensions = "output_extensions"
        case timer
        case status
    }
}
