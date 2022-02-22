//
//  URLExtensions.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 6/2/22.
//

import Foundation

extension URL {
    func data() -> Data? {
        do {
            let data = try Data(contentsOf: self)
            return data
        } catch {
            return nil
        }
    }
}
