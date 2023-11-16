//
//  SchoolDetailModel.swift
//  JMPCSchoolAppAssign17
//
//  Created by Rahul Adepu on 11/11/23.
//

import SwiftUI

struct SchoolDetailModel: Codable, Identifiable {
    let id: String
    let schoolName: String
    let numSatTestTakers, criticalReadingScore, mathScore, writingScore: String
    
    enum CodingKeys: String, CodingKey {
        case id = "dbn"
        case schoolName = "school_name"
        case numSatTestTakers = "num_of_sat_test_takers"
        case criticalReadingScore = "sat_critical_reading_avg_score"
        case mathScore = "sat_math_avg_score"
        case writingScore = "sat_writing_avg_score"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.schoolName = try container.decode(String.self, forKey: .schoolName)
        self.numSatTestTakers = try container.decode(String.self, forKey: .numSatTestTakers)
        self.criticalReadingScore = try container.decode(String.self, forKey: .criticalReadingScore)
        self.mathScore = try container.decode(String.self, forKey: .mathScore)
        self.writingScore = try container.decode(String.self, forKey: .writingScore)
    }
    
    init(id: String, schoolName: String, numSatTestTakers: String, criticalReadingScore: String, mathScore: String, writingScore: String) {
        self.id = id
        self.schoolName = schoolName
        self.numSatTestTakers = numSatTestTakers
        self.criticalReadingScore = criticalReadingScore
        self.mathScore = mathScore
        self.writingScore = writingScore
    }
    
}
