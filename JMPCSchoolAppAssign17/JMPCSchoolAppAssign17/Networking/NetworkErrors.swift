//
//  NetworkErros.swift
//  JMPCSchoolAppAssign17
//
//  Created by Rahul Adepu on 11/11/23.
//

import SwiftUI

enum NetworkErrors: Error {
    case urlError
    case serverNotFound
    case dataNotFound
    case dataFormat
    case parsingError
    
}

extension NetworkErrors: LocalizedError {
    var errorDescription: String?{
        switch self{
        case .urlError:
            return NSLocalizedString("API URL is wrong", comment: "urlError")
        case .serverNotFound:
            return NSLocalizedString("Couldn't reach server", comment: "serverNotFound")
        case .dataNotFound:
            return NSLocalizedString("Counldn't read data from server", comment: "dataNotFound")
        case .dataFormat:
            return NSLocalizedString("Wrong data format from API URL", comment: "dataFormat")
        case .parsingError:
            return NSLocalizedString("Failed to parse data", comment: "parsingError")
        }
    }
}
