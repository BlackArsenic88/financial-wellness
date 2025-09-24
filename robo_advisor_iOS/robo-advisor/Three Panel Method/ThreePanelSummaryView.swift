//
//  InvestorSummaryView.swift
//  Quartic
//
//  Created by Abraham Doe on 4/30/25.
//

import SwiftUI

struct ThreePanelMethodSummaryView: View {
    @ObservedObject var viewModel: ThreePanelMethodViewModel
    @Binding var submitted: Bool
    @State private var returnToInvestments = false

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("Financial Wellness Record")
                    .font(.largeTitle)
                    .padding()
                
                //Win Loss Count
                Text("Record: \(viewModel.winLossCounter)")
                    .font(.headline)

                //Risk Management
                summaryRow("Life Insurance", viewModel.profile.hasLifeInsurance)
                summaryRow("Health Insurance", viewModel.profile.hasHealthInsurance)
                summaryRow("Disability Insurance", viewModel.profile.hasDisabilityInsurance)
                summaryRow("Personal Liability Insurance", viewModel.profile.hasPLUP)
                summaryRow("Homeowners Insurance", viewModel.profile.hasHomeownersInsurance)
                summaryRow("Auto Insurance", viewModel.profile.hasAutoInsurance)
                summaryRow("Long-Term Care Insurance", viewModel.profile.hasLTCInsurance)
                summaryRow("Pet Insurance", viewModel.profile.hasPetInsurance)
                //Financial Short-Term
                summaryRow("Emergency Fund Ratio", viewModel.profile.emergencyRatio)
                summaryRow("Current Ratio", viewModel.profile.currentRatio)
                summaryRow("Housing Ratio 1", viewModel.profile.housingRatioOne)
                summaryRow("Housing Ratio 2", viewModel.profile.housingRatioTwo)
                summaryRow("Debt-to-Assets", viewModel.profile.debtToAssets)
                //Financial Long-Term
                summaryRow("Savings Rate", viewModel.profile.savingsRate)
                summaryRow("Retirement Savings Rate", viewModel.profile.retirementSavingsRate)
                summaryRow("Education Savings Rate", viewModel.profile.educationSavingsRate)
                summaryRow("Investment Multiplier", viewModel.profile.investmentMultiplier)
                summaryRow("Return on Investment", viewModel.profile.roi)
                summaryRow("Will", viewModel.profile.hasWill)
                summaryRow("Advance Medical Directive", viewModel.profile.hasAdvanceDirective)
                summaryRow("Durable Power of Attorney", viewModel.profile.hasDPOA)
                summaryRow("Trust", viewModel.profile.hasTrust)

                NavigationLink(
                    destination: ThreePanelMethodViewIntro(),
                    isActive: $returnToInvestments
                ) {
                    EmptyView()
                }

                Button("Save") {
                    print("Saved button tapped")
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 80, height: 80)
                .background(Color.blue)
                .clipShape(Circle())

           
            }
            .padding()
        }
    }

    func summaryRow(_ title: String, _ value: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            Text(value)
                .font(.body)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 8)
    }
}

