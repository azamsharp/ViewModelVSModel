//
//  BankAccount.swift
//  ViewModelsVSModelsWeekly
//
//  Created by Mohammad Azam on 5/7/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

enum BankAccountError: Error {
    case minimumFundsRequirementError(_ minAmount: Double)
}

class BankAccount {
    
    var ssn: String
    var balance: Double
    var accountType: BankAccountType
    var accountNumber: String?
    
    init(ssn: String, balance: Double, accountType: BankAccountType = .checking) {
        self.ssn = ssn
        self.balance = balance
        self.accountType = accountType
    }
    
    func open() throws -> String? {
        
        if accountType == .checking {
            if balance < 100 {
                //
                throw BankAccountError.minimumFundsRequirementError(100)
            }
        } else if accountType == .saving {
            if balance < 500 {
                //
                throw BankAccountError.minimumFundsRequirementError(500)
                
            }
        }
        
        self.accountNumber = UUID().uuidString
        return self.accountNumber
        
    }
    
    
}
