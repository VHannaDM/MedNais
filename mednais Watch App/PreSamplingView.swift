//
//  PreSamplingView.swift
//  mednais Watch App
//
//  Created by VAITSIKHOUSKAYA on 07/02/2024.
//

import SwiftUI

class VenusBloodViewModel: ObservableObject {
    var preSamplingDate = Date()
    var confirmFasting = Bool()
    var rejectFasting = Bool()
    var confirmAlcoholFree = Bool()
    var rejectAlcoholFree = Bool()
    var confirmPhysicalActivity = Bool()
    var rejectPhysicalActivity = Bool()
    var punctureDate = Date()
    var tourniquetDate = Date()
    var timerDate = Date()
    var finishingPunctureDate = Date()
    var postSamplingDate = Date()
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
            PatientIDView()
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
