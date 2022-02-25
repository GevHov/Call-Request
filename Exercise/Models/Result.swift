//
//  User.swift
//  Exercise
//
//  Created by Gevorg Hovhannisyan on 21.10.21.
//

import Foundation


//MARK: - Result
class Result: Codable {
    
    var success: Bool
    var errors: [Errors]
    var internal_errors: [Internal_errors]
    var metadata: [Metadata]
    
}
