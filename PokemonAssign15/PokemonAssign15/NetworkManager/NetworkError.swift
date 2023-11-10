//
//  NetworkError.swift
//  PokemonAssign15
//
//  Created by Rahul Adepu on 11/10/23.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case serverNotFound
    case dataNotFound
    case dataFormat
    case parsingError
    
}

extension NetworkError: LocalizedError {
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
