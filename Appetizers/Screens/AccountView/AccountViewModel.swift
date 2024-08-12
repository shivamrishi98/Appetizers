//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Shivam Rishi on 12/8/2024.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthdate = Date()
    @Published var extraNapkins = false
    @Published var frequentRefills = false
    
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            DispatchQueue.main.async {
                self.alertItem = AlertContext.invalidForm
            }
            return false
        }
        
        guard email.isValidEmail else {
            self.alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        
        print("Changes have been saved successfully")
    }
    
}
