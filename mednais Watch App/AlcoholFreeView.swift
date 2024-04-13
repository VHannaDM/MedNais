//
//  AlcoholFreeView.swift
//  mednais Watch App
//
//  Created by VAITSIKHOUSKAYA on 07/02/2024.
//

import SwiftUI

struct AlcoholFreeView: View {
    @State private var showPhysicalActivity: Bool = false
    @StateObject var viewModel = VenusBloodViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                titleView
                iconView
                alcoholInformation
                confirmButton
                rejectButton
            }
        }
        .navigationDestination(isPresented: $showPhysicalActivity) {
            PhysicalActivityView()
        }
    }
    
    var titleView: some View {
        Text("ALCOHOL FREE")
            .bold()
    }
    
    var iconView: some View {
        ZStack {
            Circle()
                .frame(width: 75, height: 75)
            Text("ALC")
                .foregroundColor(.black)
        }
    }
    
    var alcoholInformation: some View {
        Text("alcohol free for 24 h")
            .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
            .multilineTextAlignment(.center)
    }
    
    var confirmButton: some View {
        Button {
            showPhysicalActivity = true
            viewModel.confirmAlcoholFree = true
        } label: {
            Text("Confirm")
        }
        .background(Color.red)
        .cornerRadius(10)
    }
    
    var rejectButton: some View {
        Button {
            showPhysicalActivity = true
            viewModel.rejectAlcoholFree = false
        } label: {
            Text("Reject")
        }
        .background(Color.gray)
        .cornerRadius(10)
    }
}

struct AlcoholFreeView_Previews: PreviewProvider {
    static var previews: some View {
        AlcoholFreeView()
    }
}
