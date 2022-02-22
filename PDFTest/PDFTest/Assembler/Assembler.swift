//
//  Assembler.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 2/2/22.
//

import Foundation

final class Assembler {
    static let shared = Assembler()
}

extension Assembler: MainAssembler {}
extension Assembler: ProcessAssembler {}
