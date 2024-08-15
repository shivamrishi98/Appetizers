//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Shivam Rishi on 12/8/2024.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            print(user)
            let data = try JSONEncoder().encode(user)
            userData = data
            DispatchQueue.main.async {
                self.alertItem = AlertContext.userSaveSuccess
            }
        } catch {
            DispatchQueue.main.async {
                self.alertItem = AlertContext.invalidUserData
            }
        }
    }
    
    func retreiveUser() {
        guard let userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            DispatchQueue.main.async {
                self.alertItem = AlertContext.invalidUserData
            }
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            DispatchQueue.main.async {
                self.alertItem = AlertContext.invalidForm
            }
            return false
        }
        
        guard user.email.isValidEmail else {
            self.alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
}
