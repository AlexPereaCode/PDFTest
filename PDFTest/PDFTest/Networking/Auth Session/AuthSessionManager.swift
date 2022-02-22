//
//  AuthSessionManager.swift
//  PDFTest
//
//  Created by Alejandro Perea Navarrete on 2/2/22.
//

import Foundation
import Alamofire

final class AuthSessionManager {
    static let current = AuthSessionManager()
    let session = Session(interceptor: AuthInterceptor())
}
