//
//  CreateBankAccountViewModel.swift
//  ViewModelsVSModelsWeekly
//
//  Created by Mohammad Azam on 5/7/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

enum BankAccountType {
    case checking
    case saving
}

class CreateBankAccountViewModel: ObservableObject {
    
    var ssn: String = ""
    var balance: String = ""
    var accountType: BankAccountType = .checking
    
    @Published var message: String = ""
    
    func openBankAccount() {
        
        if ssn.isEmpty || balance.isEmpty {
            self.message = "SSN and balance is required!"
            return
        }
        
        guard let balance = Double(self.balance), balance > 0 else {
            self.message = "Balance should be a number"
            return
        }
        
        let bankAccount = BankAccount(ssn: self.ssn, balance: balance, accountType: self.accountType)
        
        do {
            guard let accountNumber = try bankAccount.open() else {
                self.message = "Error creating account"
                return
            }
            
            self.message = "Bank Account \(accountNumber) has been created"
            
        } catch BankAccountError.minimumFundsRequirementError(let amount) {
            self.message = "The minimum amount is \(amount)"
            
        } catch {
            print(error)
        }
        
        
    }
    
}
