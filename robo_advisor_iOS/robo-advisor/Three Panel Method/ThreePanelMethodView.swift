//
//  ThreePanelMethodView.swift
//  Quartic
//
//  Created by Abraham Doe on 5/13/25.
//

import SwiftUI

enum ThreePanelRoute: Hashable {
    case guidance
}

struct ThreePanelMethodViewIntro: View {
    @State private var path: [ThreePanelRoute] = []

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Three Panel Method").font(.title2).bold()
                    Text("The Three Panel Method is a comprehensive approach to risk management, saving, and investing. By having sufficient insurance coverages, budgets, and legecy plans in place, you can lower risks of loss and ensure your long-term financial well-being.")
                    
                    Button(action: {
                        path.append(.guidance)
                    }) {
                        Text("Guidance")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .multilineTextAlignment(.center)
                }
                .padding()
            }
            .navigationDestination(for: ThreePanelRoute.self) { route in
                switch route {
                case .guidance:
                    ThreePanelMethodView()
                }
            }
        }
    }
}

struct ThreePanelMethodView: View {
    @StateObject private var viewModel = ThreePanelMethodViewModel()
    @State private var currentPage = 0
    @State private var showSummary = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: ThreePanelMethodSummaryView(viewModel: viewModel, submitted: $showSummary),
                    isActive: $showSummary
                ) {
                    EmptyView()
                }
                .hidden()
                
                TabView(selection: $currentPage) {
                    selectionPage(
                        title: "Do you have a life insurance policy for 10x to 20x your current annual income?",
                        options: viewModel.hasLifeInsurance,
                        selection: viewModel.lifeInsuranceBinding
                    )
                    .tag(0)
                    
                    selectionPage(
                        title: "Do you have health insurance?",
                        options: viewModel.hasHealthInsurance,
                        selection: viewModel.healthInsuranceBinding
                    )
                    .tag(1)
                    
                    selectionPage(
                        title: "Do you have disability insurance that is 60% to 70% current annual income?",
                        options: viewModel.hasDisabilityInsurance,
                        selection: viewModel.disabilityInsuranceBinding
                    )
                    .tag(2)
                    
                    selectionPage(
                        title: "Do you have a personal liability umbrella policy (PLUP) for at least $1,000,000?",
                        options: viewModel.hasPLUP,
                        selection: viewModel.plupBinding
                    )
                    .tag(3)
                    
                    selectionPage(
                        title: "Do you have homeowners or renters insurance?",
                        options: viewModel.hasHomeownersInsurance,
                        selection: viewModel.homeownersInsuranceBinding
                    )
                    .tag(4)

                    selectionPage(
                        title: "If you have a car, do you have car insurance?",
                        options: viewModel.hasAutoInsurance,
                        selection: viewModel.autoInsuranceBinding
                    )
                    .tag(5)
                    
                    selectionPage(
                        title: "If you have a pet, do you have pet insurance?",
                        options: viewModel.hasPetInsurance,
                        selection: viewModel.petInsuranceBinding
                    )
                    .tag(6)
                    
                    selectionPage(
                        title: "Do you have long-term care insurance?",
                        options: viewModel.hasLTCInsurance,
                        selection: viewModel.ltcBinding
                    )
                    .tag(7)
                    
                    selectionPage(
                        title: "Do you have an emergency fund ratio of at least 3-6 months?",
                        options: viewModel.emergencyRatio,
                        selection: viewModel.emergencyRatioBinding
                    )
                    .tag(8)
                    
                    selectionPage(
                        title: "Do you have a current ratio of at least 2 to 1?",
                        options: viewModel.currentRatio,
                        selection: viewModel.currentRatioBinding
                    )
                    .tag(9)
                 
                    selectionPage(
                        title: "Do you have a housing ratio 1 of less than 28%?",
                        options: viewModel.housingRatioOne,
                        selection: viewModel.hrOneBinding
                    )
                    .tag(10)
                    
                    selectionPage(
                        title: "Do you have a housing ratio 2 of less than 36%?",
                        options: viewModel.housingRatioTwo,
                        selection: viewModel.hrTwoBinding
                    )
                    .tag(11)
                    
                    selectionPage(
                        title: "Do you have debt-to-assets of less than 50%?",
                        options: viewModel.debtToAssets,
                        selection: viewModel.debtToAssetsBinding
                    )
                    .tag(12)
                    
                    selectionPage(
                        title: "Do you have a savings rate of at least 12% to 15%?",
                        options: viewModel.savingsRate,
                        selection: viewModel.savingsRateBinding
                    )
                    .tag(13)
                    
                    selectionPage(
                        title: "Do you have a retirement savings rate of at least 10% to 12%?",
                        options: viewModel.retirementSavingsRate,
                        selection: viewModel.retirementSavingsRateBinding
                    )
                    .tag(14)
                    
                    
                    selectionPage(
                        title: "If you have children, do you have an education savings rate of $3,000 to $9,000 per child, per year?",
                        options: viewModel.educationSavingsRate,
                        selection: viewModel.educationSavingsRateBinding
                    )
                    .tag(15)
                    
                    
                    selectionPage(
                        title: "Do you have cash and invested assets at least 15x your current annual income?",
                        options: viewModel.investmentMultiplier,
                        selection: viewModel.investmentMultiplierBinding
                    )
                    .tag(16)
                    
                    
                    selectionPage(
                        title: "Do you have a return on investments of at least 8% to 10%?",
                        options: viewModel.roi,
                        selection: viewModel.roiBinding
                    )
                    .tag(17)
                    
                    
                    selectionPage(
                        title: "Do you have a will?",
                        options: viewModel.hasWill,
                        selection: viewModel.willBinding
                    )
                    .tag(18)
                    
                    
                    selectionPage(
                        title: "Do you have an advance medical directive?",
                        options: viewModel.hasAdvanceDirective,
                        selection: viewModel.advanceDirectiveBinding
                    )
                    .tag(19)
                    
                    
                    selectionPage(
                        title: "Do you have a durable power of attorney for healthcare?",
                        options: viewModel.hasDPOA,
                        selection: viewModel.dpoaBinding
                    )
                    .tag(20)
                    
                    selectionPage(
                        title: "Do you have a trust?",
                        options: viewModel.hasTrust,
                        selection: viewModel.trustBinding,
                        isFinalPage: true,
                        onSubmit: {
                            showSummary = true
                        }
                    )
                    .tag(21)
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .navigationTitle("Three Panel Method")
                .navigationBarTitleDisplayMode(.inline)
                .padding(.bottom, 30)
            }
        }
    }
}
        
        // MARK: - Reusable Single-Selection Page
extension ThreePanelMethodView {
    func selectionPage(title: String, options: [String], selection: Binding<String>, isFinalPage: Bool = false, onSubmit: (() -> Void)? = nil) -> some View {
        VStack(spacing: 24) {
            Text(title)
                .font(.title2)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity) // This is critical
                .padding(.horizontal)
                .padding(.top)


            ForEach(options, id: \.self) { option in
                Button(action: {
                    selection.wrappedValue = option
                }) {
                    HStack {
                        Image(systemName: selection.wrappedValue == option ? "largecircle.fill.circle" : "circle")
                        Text(option)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .foregroundColor(.primary)
            }

            if isFinalPage {
                Button("Next") {
                    onSubmit?()
                }
                .padding()
                .foregroundColor(.blue)
                .cornerRadius(10)
            } else {
                Button("Next") {
                    currentPage += 1
                }
                .padding()
            }
            
            Spacer()
            
        }
        .padding()
    }
}


struct ThreePanelMethodViewIntro_Preview: PreviewProvider {
    static var previews: some View {
        ThreePanelMethodViewIntro()
    }
}


/*
struct ThreePanelMethodView_Preview: PreviewProvider {
    static var previews: some View {
        ThreePanelMethodView()
    }
}
*/




/*
import SwiftUI

struct ThreePanelMethodView: View {
    @State private var selectedKeyword: KeywordDefinition? = nil

    let riskManagement: [KeywordDefinition] = [
        .init(keyword: "Life Insurance", definition: "Provides a death benefit equal to 10–20 times the insured’s gross annual income."),
        .init(keyword: "Disability Insurance", definition: "Replaces 60–70% of gross income if the policyholder becomes disabled."),
        .init(keyword: "Personal Liability Umbrella Policy", definition: "Provides additional liability coverage from $1M to $3M beyond home and auto policies."),
        .init(keyword: "Health Insurance", definition: "Should cover at least 70–80% of anticipated annual medical costs including deductibles and out-of-pocket maximums."),
        .init(keyword: "Homeowners Insurance", definition: "HO-3 policy covering replacement value, insured for at least 80% of fair market value."),
        .init(keyword: "Auto Insurance", definition: "Liability limits of at least 100/300 (i.e., $100K per person, $300K per accident).")
    ]

    let shortTermFinance: [KeywordDefinition] = [
        .init(keyword: "Emergency Ratio", definition: "Liquid assets divided by monthly expenses. Target: 3–6 months of expenses."),
        .init(keyword: "Current Ratio", definition: "Current assets divided by current liabilities. Target: at least 2:1."),
        .init(keyword: "Housing Ratio 1", definition: "Monthly housing expenses (Mortage, interest, taxes, insurance) should be <28% of gross monthly income."),
        .init(keyword: "Housing Ratio 2", definition: "Total monthly housing expenses and debt obligations (e.g. credit card debt, car loans, student loan debt)  should be <36% of gross income."),
        .init(keyword: "Debt to Assets", definition: "Total liabilities divided by total assets. Target: less than 50%.")
    ]

    let longTermFinance: [KeywordDefinition] = [
        .init(keyword: "Savings Rate", definition: "Total savings should be 12%–15% of gross income annually."),
        .init(keyword: "Retirement Savings Rate", definition: "Dedicated retirement savings should be 10%–12% of gross income."),
        .init(keyword: "Education Savings Rate", definition: "Annual savings per child: $3,000 (public), $6,000 (moderate), $9,000 (private college)."),
        .init(keyword: "Investment Assets to Gross Pay", definition: "Target: Investment assets equal to 16x annual gross income by retirement."),
        .init(keyword: "Return on Investments", definition: "Target long-term average return of >8% depending on risk profile."),
        .init(keyword: "Wills", definition: "Legal document specifying asset distribution and guardianship. Essential for all adults."),
        .init(keyword: "Advance Medical Directive", definition: "Outlines healthcare preferences if incapacitated. Should be updated every 5 years."),
        .init(keyword: "Durable Power of Attorney", definition: "Authorizes someone to manage financial affairs if incapacitated."),
        .init(keyword: "Trust", definition: "Legal entity to hold assets, avoid probate, and manage wealth transfer.")
    ]

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Risk Management")) {
                    ForEach(riskManagement) { keyword in
                        Button(action: {
                            selectedKeyword = keyword
                        }) {
                            Text(keyword.keyword)
                                .font(.headline)
                        }
                    }
                }

                Section(header: Text("Short-Term Personal Finance")) {
                    ForEach(shortTermFinance) { keyword in
                        Button(action: {
                            selectedKeyword = keyword
                        }) {
                            Text(keyword.keyword)
                                .font(.headline)
                        }
                    }
                }

                Section(header: Text("Long-Term Personal Finance")) {
                    ForEach(longTermFinance) { keyword in
                        Button(action: {
                            selectedKeyword = keyword
                        }) {
                            Text(keyword.keyword)
                                .font(.headline)
                        }
                    }
                }
            }
            .navigationTitle("Three Panel Method")
            .sheet(item: $selectedKeyword) { keyword in
                KeywordSheetView(keyword: keyword)
            }
        }
    }
}

#Preview {
    ThreePanelMethodView()
}

*/
