//
//  PreSamplingView.swift
//  mednais Watch App
//
//  Created by VAITSIKHOUSKAYA on 07/02/2024.
//

import SwiftUI

struct PreSamplingView: View {
    @State private var showPatientID: Bool = false
    
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
