//
//  SchoolModel.swift
//  JMPCSchoolAppAssign17
//
//  Created by Rahul Adepu on 11/11/23.
//

import Foundation

struct SchoolModel: Codable, Identifiable {
    let id: String
    let school_name, overview_paragraph :String
    
    let academicopportunities: [String]?
    let requirement: [String]?
    let admissionspriority: [String]?
    
    let ell_programs: String?
    let language_classes: String?
    let advancedplacement_courses: String?
    let diplomaendorsements: String?
    
    // School Contact Data
    let neighborhood: String?
    let campus_name: String?
    let building_code: String?
    let phone_number: String?
    let fax_number: String?
    let school_email: String?
    let website: String?
    let primary_address_line_1 : String
    let city: String
    let state_code: String
    let zip: String
    let finalgrades: String
    let total_students: String?
    
    // School Timing
    let start_time: String?
    let end_time: String?
    
    // School Features
    let extracurricular_activities: String?
    let psal_sports_boys: String?
    let psal_sports_girls: String?
    let psal_sports_coed: String?
    let school_sports: String?
    
    // School Data
    let graduation_rate: String?
    let attendance_rate: String?
    let college_career_rate: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "dbn"
        case school_name
        case overview_paragraph
        case academicopportunities, requirement, admissionspriority
        case ell_programs
        case language_classes
        case advancedplacement_courses
        case diplomaendorsements
        case neighborhood
        case campus_name, building_code, phone_number, fax_number, school_email, website
        case primary_address_line_1, city, state_code, zip
        case total_students
        case finalgrades
        case start_time, end_time
        case extracurricular_activities, psal_sports_boys, psal_sports_girls, psal_sports_coed, school_sports
        case graduation_rate, attendance_rate, college_career_rate
    }
    
    init(id: String, school_name: String, overview_paragraph: String, academicopportunities: [String]?, requirement: [String]?, admissionspriority: [String]?, ell_programs: String?, language_classes: String?, advancedplacement_courses: String?, diplomaendorsements: String?, neighborhood: String?, campus_name: String?, building_code: String?, phone_number: String?, fax_number: String?, school_email: String?, website: String?, primary_address_line_1: String, city: String, state_code: String, zip: String, finalgrades: String, total_students: String?, start_time: String?, end_time: String?, extracurricular_activities: String?, psal_sports_boys: String?, psal_sports_girls: String?, psal_sports_coed: String?, school_sports: String?, graduation_rate: String?, attendance_rate: String?, college_career_rate: String?) {
        self.id = id
        self.school_name = school_name
        self.overview_paragraph = overview_paragraph
        self.academicopportunities = academicopportunities
        self.requirement = requirement
        self.admissionspriority = admissionspriority
        self.ell_programs = ell_programs
        self.language_classes = language_classes
        self.advancedplacement_courses = advancedplacement_courses
        self.diplomaendorsements = diplomaendorsements
        self.neighborhood = neighborhood
        self.campus_name = campus_name
        self.building_code = building_code
        self.phone_number = phone_number
        self.fax_number = fax_number
        self.school_email = school_email
        self.website = website
        self.primary_address_line_1 = primary_address_line_1
        self.city = city
        self.state_code = state_code
        self.zip = zip
        self.finalgrades = finalgrades
        self.total_students = total_students
        self.start_time = start_time
        self.end_time = end_time
        self.extracurricular_activities = extracurricular_activities
        self.psal_sports_boys = psal_sports_boys
        self.psal_sports_girls = psal_sports_girls
        self.psal_sports_coed = psal_sports_coed
        self.school_sports = school_sports
        self.graduation_rate = graduation_rate
        self.attendance_rate = attendance_rate
        self.college_career_rate = college_career_rate
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.school_name = try container.decode(String.self, forKey: .school_name)
        self.overview_paragraph = try container.decode(String.self, forKey: .overview_paragraph)
        
        // Handle dynamic "academicopportunities" keys
        self.academicopportunities = container.allKeys
            .filter { $0.stringValue.hasPrefix("academicopportunities") }
            .compactMap { try? container.decode(String.self, forKey: $0) }
        
        // Handle dynamic "requirement" keys
        self.requirement = container.allKeys
            .filter { $0.stringValue.hasPrefix("requirement") }
            .compactMap { try? container.decode(String.self, forKey: $0) }
        
        // Handle dynamic "admissionspriority" keys
        self.admissionspriority = container.allKeys
            .filter { $0.stringValue.hasPrefix("admissionspriority") }
            .compactMap { try? container.decode(String.self, forKey: $0) }
        
        self.ell_programs = try container.decodeIfPresent(String.self, forKey: .ell_programs)
        self.language_classes = try container.decodeIfPresent(String.self, forKey: .language_classes)
        self.advancedplacement_courses = try container.decodeIfPresent(String.self, forKey: .advancedplacement_courses)
        self.diplomaendorsements = try container.decodeIfPresent(String.self, forKey: .diplomaendorsements)
        self.neighborhood = try container.decodeIfPresent(String.self, forKey: .neighborhood)
        self.campus_name = try container.decodeIfPresent(String.self, forKey: .campus_name)
        self.building_code = try container.decodeIfPresent(String.self, forKey: .building_code)
        self.phone_number = try container.decodeIfPresent(String.self, forKey: .phone_number)
        self.fax_number = try container.decodeIfPresent(String.self, forKey: .fax_number)
        self.school_email = try container.decodeIfPresent(String.self, forKey: .school_email)
        self.website = try container.decodeIfPresent(String.self, forKey: .website)
        self.primary_address_line_1 = try container.decode(String.self, forKey: .primary_address_line_1)
        self.city = try container.decode(String.self, forKey: .city)
        self.state_code = try container.decode(String.self, forKey: .state_code)
        self.zip = try container.decode(String.self, forKey: .zip)
        self.total_students = try container.decodeIfPresent(String.self, forKey: .total_students)
        self.finalgrades = try container.decode(String.self, forKey: .finalgrades)
        self.start_time = try container.decodeIfPresent(String.self, forKey: .start_time)
        self.end_time = try container.decodeIfPresent(String.self, forKey: .end_time)
        self.extracurricular_activities = try container.decodeIfPresent(String.self, forKey: .extracurricular_activities)
        self.psal_sports_boys = try container.decodeIfPresent(String.self, forKey: .psal_sports_boys)
        self.psal_sports_girls = try container.decodeIfPresent(String.self, forKey: .psal_sports_girls)
        self.psal_sports_coed = try container.decodeIfPresent(String.self, forKey: .psal_sports_coed)
        self.school_sports = try container.decodeIfPresent(String.self, forKey: .school_sports)
        self.graduation_rate = try container.decodeIfPresent(String.self, forKey: .graduation_rate)
        self.attendance_rate = try container.decodeIfPresent(String.self, forKey: .attendance_rate)
        self.college_career_rate = try container.decodeIfPresent(String.self, forKey: .college_career_rate)
    }
}
