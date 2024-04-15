//
//  PatientIDView.swift
//  mednais Watch App
//
//  Created by VAITSIKHOUSKAYA on 07/02/2024.
//

import SwiftUI

struct PatientIDView: View {
    @State private var showFasting: Bool = false
    @ObservedObject var viewModel: VenusBloodViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                titleView
                iconView
                infoOfPatient
                nextButton
            }
        }
        .navigationDestination(isPresented: $showFasting) {
            FastingView(viewModel: viewModel)
        }
    }
    
    
    var titleView: some View {
        Text("PATIENT ID")
            .bold()
    }
    
    var iconView: some View {
        Image(systemName: "person.crop.circle.fill")
            .resizable()
            .frame(width: 50, height: 50)
    }
    
    var infoOfPatient: some View {
        Text("What is your name?\nWhat is your date of birth?")
            .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
            .multilineTextAlignment(.center)
    }
    
    var nextButton: some View {
        Button {
            showFasting = true
        } label: {
            Text("NEXT")
        }
        .background(Color.red)
        .cornerRadius(10)
    }
}

struct PatientIDView_Previews: PreviewProvider {
    static var previews: some View {
        PatientIDView(viewModel: VenusBloodViewModel())
    }
}
