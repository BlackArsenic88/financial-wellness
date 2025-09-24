//
//  ThreePanelModel.swift
//  Quartic
//
//  Created by Abraham Doe on 5/7/25.
//

import Foundation

struct ThreePanelMethod: Codable {
    // Risk Management
    var hasLifeInsurance: String // Benchmark: 10–16 × gross pay
    var hasHealthInsurance: String
    var hasDisabilityInsurance: String // 60–70% of gross pay
    var hasPLUP: String // $1–3M
    var hasHomeownersInsurance: String // 80% FMV
    var hasAutoInsurance: String // 100/300
    var hasLTCInsurance: String // LTC (inflation protection) 36–60 months
    var hasPetInsurance: String

    // Financial Short-Term
    var emergencyRatio: String // 3–6 months
    var currentRatio: String // 2:1
    var housingRatioOne: String // <28%
    var housingRatioTwo: String// <36%
    var debtToAssets: String // <50%

    // Financial Long-Term
    var savingsRate: String // 12–15%
    var retirementSavingsRate: String // 10–12%
    var educationSavingsRate: String // ublic/private/private elite ($3,000/$6,000/$9,000 per child per year for 18 years)
    var investmentMultiplier: String // >16x pre-ret income
    var roi: String // Return (8–10%) Risk measured by standard deviation (8–14%)

    var hasWill: String
    var hasAdvanceDirective: String
    var hasDPOA: String
    var hasTrust: String
}

