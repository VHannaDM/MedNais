//
//  PreSamplingView.swift
//  mednais Watch App
//
//  Created by VAITSIKHOUSKAYA on 07/02/2024.
//

import SwiftUI

class VenusBloodViewModel: ObservableObject {
    @Published var preSamplingDate = Date()
    @Published var confirmFasting = Bool()
    @Published var rejectFasting = Bool()
    @Published var confirmAlcoholFree = Bool()
    @Published var rejectAlcoholFree = Bool()
    @Published var confirmPhysicalActivity = Bool()
    @Published var rejectPhysicalActivity = Bool()
    @Published var punctureDate = Date()
    @Published var tourniquetDate = Date()
    @Published var timerDate = Date()
    @Published var finishingPunctureDate = Date()
    @Published var postSamplingDate = Date()
}

struct PreSamplingView: View {
    @State private var showPatientID: Bool = false
    @StateObject var viewModel = VenusBloodViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                titleView
                iconView
                instructionsView
                nextButton
            }
        }
        .navigationDestination(isPresented: $showPatientID) {
            PatientIDView(viewModel: viewModel)
        }
    }
    
    var titleView: some View {
        Text("PRE-SAMPLING")
            .bold()
    }
    
    var iconView: some View {
        ZStack {
            Circle()
                .frame(width: 75, height: 75)
            Text("TUBES")
                .foregroundColor(.black)
        }
    }
    
    var instructionsView: some View {
        Text("Welcome the Patient\nIntroduce yourself")
            .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
            .multilineTextAlignment(.center)
    }
    
    var nextButton: some View {
        Button {
            showPatientID = true
            viewModel.preSamplingDate = Date()
        } label: {
            Text("NEXT")
        }
        .background(Color.red)
        .cornerRadius(10)
    }
}

struct PreSamplingView_Previews: PreviewProvider {
    static var previews: some View {
        PreSamplingView()
    }
}
