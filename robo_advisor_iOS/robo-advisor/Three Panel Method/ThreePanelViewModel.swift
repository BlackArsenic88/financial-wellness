//
//  ThreePanelMethodViewModel.swift
//  Quartic
//
//  Created by Abraham Doe on 5/30/25.
//

import Foundation
import Combine
import SwiftUI
    
class ThreePanelMethodViewModel: ObservableObject {
    // MARK: - Published Profile State
    @Published var profile = ThreePanelMethod(
        hasLifeInsurance: "",
        hasHealthInsurance: "",
        hasDisabilityInsurance: "",
        hasPLUP: "",
        hasHomeownersInsurance: "",
        hasAutoInsurance: "",
        hasLTCInsurance: "",
        hasPetInsurance: "",

        // Financial Short-Term
        emergencyRatio: "", // 3–6 months
        currentRatio: "", // 2:1
        housingRatioOne: "", // <28%
        housingRatioTwo: "", // <36%
        debtToAssets: "", // Ideally <50%

        // Financial Long-Term
        savingsRate: "",  // 12–15%
        retirementSavingsRate: "",  // 10–12%
        educationSavingsRate: "", // 3k–9k per child/yr
        investmentMultiplier: "", // >16x pre-ret income
        roi: "", // 8–10%

        hasWill: "",
        hasAdvanceDirective: "",
        hasDPOA: "",
        hasTrust: ""
    )

    // MARK: - Constants for UI
    // Risk Management
    let hasLifeInsurance = ["Yes", "No", "Not Applicable"]
    let hasHealthInsurance = ["Yes", "No", "Not Applicable"]
    let hasDisabilityInsurance = ["Yes", "No", "Not Applicable"]
    let hasPLUP = ["Yes", "No", "Not Applicable"]
    let hasHomeownersInsurance = ["Yes", "No", "Not Applicable"]
    let hasAutoInsurance = ["Yes", "No", "Not Applicable"]
    let hasLTCInsurance = ["Yes", "No", "Not Applicable"]
    let hasPetInsurance = ["Yes", "No", "Not Applicable"]

    // Financial Short-Term
    let emergencyRatio = ["Yes", "No"] // 3–6 months
    let currentRatio = ["Yes", "No", "Not Applicable"] // 2:1
    let housingRatioOne = ["Yes", "No", "Not Applicable"]  // <28%
    let housingRatioTwo = ["Yes", "No", "Not Applicable"] // <36%
    let debtToAssets = ["Yes", "No", "Not Applicable"] // Ideally <50%

    // Financial Long-Term
    let savingsRate = ["Yes", "No", "Not Applicable"]  // 12–15%
    let retirementSavingsRate = ["Yes", "No", "Not Applicable"]  // 10–12%
    let educationSavingsRate = ["Yes", "No", "Not Applicable"]  // 3k–9k per child/yr
    let investmentMultiplier = ["Yes", "No", "Not Applicable"] // >16x pre-ret income
    let roi = ["Yes", "No", "Not Applicable"] // 8–10%

    let hasWill = ["Yes", "No", "Not Applicable"]
    let hasAdvanceDirective = ["Yes", "No", "Not Applicable"]
    let hasDPOA = ["Yes", "No", "Not Applicable"]
    let hasTrust = ["Yes", "No", "Not Applicable"]
    
    //Counter
    var winLossCounter: String {
        let mirror = Mirror(reflecting: profile)
        var yesCount = 0
        var noCount = 0
        
        for child in mirror.children {
            if let value = child.value as? String {
                if value == "Yes" {
                    yesCount += 1
                } else if value == "No" {
                    noCount += 1
                }
            }
        }
        
        return "\(yesCount)-\(noCount)"
    }
    /*
    // MARK: - Init
    init() {
        loadThreePanel()
    }
     */

 
    // MARK: - Reset
    func reset() {
        profile = ThreePanelMethod(
            hasLifeInsurance: "",
            hasHealthInsurance: "",
            hasDisabilityInsurance: "",
            hasPLUP: "",
            hasHomeownersInsurance: "",
            hasAutoInsurance: "",
            hasLTCInsurance: "",
            hasPetInsurance: "",

            // Financial Short-Term
            emergencyRatio: "", // 3–6 months
            currentRatio: "", // 2:1
            housingRatioOne: "", // <28%
            housingRatioTwo: "", // <36%
            debtToAssets: "", // Ideally <50%

            // Financial Long-Term
            savingsRate: "",  // 12–15%
            retirementSavingsRate: "",  // 10–12%
            educationSavingsRate: "", // 3k–9k per child/yr
            investmentMultiplier: "", // >16x pre-ret income
            roi: "", // 8–10%

            hasWill: "",
            hasAdvanceDirective: "",
            hasDPOA: "",
            hasTrust: ""
        )
    }
}

// MARK: - SwiftUI Bindings for Profile Properties
extension ThreePanelMethodViewModel {
    var lifeInsuranceBinding: Binding<String> {
        Binding(
            get: { self.profile.hasLifeInsurance },
            set: { self.profile.hasLifeInsurance = $0 }
        )
    }

    var healthInsuranceBinding: Binding<String> {
        Binding(
            get: { self.profile.hasHealthInsurance },
            set: { self.profile.hasHealthInsurance = $0 }
        )
    }

    var disabilityInsuranceBinding: Binding<String> {
        Binding(
            get: { self.profile.hasDisabilityInsurance },
            set: { self.profile.hasDisabilityInsurance = $0 }
        )
    }

    var plupBinding: Binding<String> {
        Binding(
            get: { self.profile.hasPLUP },
            set: { self.profile.hasPLUP = $0 }
        )
    }
    
    var homeownersInsuranceBinding: Binding<String> {
        Binding(
            get: { self.profile.hasHomeownersInsurance },
            set: { self.profile.hasHomeownersInsurance = $0 }
        )
    }
    
    var autoInsuranceBinding: Binding<String> {
        Binding(
            get: { self.profile.hasAutoInsurance },
            set: { self.profile.hasAutoInsurance = $0 }
        )
    }
    
    var ltcBinding: Binding<String> {
        Binding(
            get: { self.profile.hasLTCInsurance },
            set: { self.profile.hasLTCInsurance = $0 }
        )
    }
    
    var petInsuranceBinding: Binding<String> {
        Binding(
            get: { self.profile.hasPetInsurance },
            set: { self.profile.hasPetInsurance = $0 }
        )
    }
    
    var emergencyRatioBinding: Binding<String> {
        Binding(
            get: { self.profile.emergencyRatio },
            set: { self.profile.emergencyRatio = $0 }
        )
    }
    
    var currentRatioBinding: Binding<String> {
        Binding(
            get: { self.profile.currentRatio },
            set: { self.profile.currentRatio = $0 }
        )
    }
    
    var hrOneBinding: Binding<String> {
        Binding(
            get: { self.profile.housingRatioOne },
            set: { self.profile.housingRatioOne = $0 }
        )
    }
    
    var hrTwoBinding: Binding<String> {
        Binding(
            get: { self.profile.housingRatioTwo },
            set: { self.profile.housingRatioTwo = $0 }
        )
    }
    
    var debtToAssetsBinding: Binding<String> {
        Binding(
            get: { self.profile.debtToAssets },
            set: { self.profile.debtToAssets = $0 }
        )
    }
    
    var savingsRateBinding: Binding<String> {
        Binding(
            get: { self.profile.savingsRate },
            set: { self.profile.savingsRate = $0 }
        )
    }
    
    var retirementSavingsRateBinding: Binding<String> {
        Binding(
            get: { self.profile.retirementSavingsRate },
            set: { self.profile.retirementSavingsRate = $0 }
        )
    }
    
    var educationSavingsRateBinding: Binding<String> {
        Binding(
            get: { self.profile.educationSavingsRate },
            set: { self.profile.educationSavingsRate = $0 }
        )
    }
    
    var investmentMultiplierBinding: Binding<String> {
        Binding(
            get: { self.profile.investmentMultiplier },
            set: { self.profile.investmentMultiplier = $0 }
        )
    }
    
    var roiBinding: Binding<String> {
        Binding(
            get: { self.profile.roi },
            set: { self.profile.roi = $0 }
        )
    }
    
    var willBinding: Binding<String> {
        Binding(
            get: { self.profile.hasWill },
            set: { self.profile.hasWill = $0 }
        )
    }
    
    var advanceDirectiveBinding: Binding<String> {
        Binding(
            get: { self.profile.hasAdvanceDirective },
            set: { self.profile.hasAdvanceDirective = $0 }
        )
    }
    
    var dpoaBinding: Binding<String> {
        Binding(
            get: { self.profile.hasDPOA },
            set: { self.profile.hasDPOA = $0 }
        )
    }
    
    var trustBinding: Binding<String> {
        Binding(
            get: { self.profile.hasTrust },
            set: { self.profile.hasTrust = $0 }
        )
    }
}
