//
//  FastingView.swift
//  mednais Watch App
//
//  Created by VAITSIKHOUSKAYA on 07/02/2024.
//

import SwiftUI

struct FastingView: View {
    @State private var showAlcoholFree: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                titleView
                iconView
                fastingInformation
                confirmButton
                rejectButton
            }
        }
        .navigationDestination(isPresented: $showAlcoholFree) {
            AlcoholFreeView()
        }
    }
    
    var titleView: some View {
        Text("FASTING")
            .bold()
    }
    
    var iconView: some View {
        ZStack {
            Circle()
                .frame(width: 75, height: 75)
            Text("FOOD")
                .foregroundColor(.black)
        }
    }
    
    var fastingInformation: some View {
        Text("fasting state, 12 h after the last meal")
            .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
            .multilineTextAlignment(.center)
    }
    
    var confirmButton: some View {
        Button {
            showAlcoholFree = true
        } label: {
            Text("Confirm")
        }
        .background(Color.red)
        .cornerRadius(10)
    }
    
    var rejectButton: some View {
        Button {
            showAlcoholFree = true
        } label: {
            Text("Reject")
        }
        .background(Color.gray)
        .cornerRadius(10)
    }
}


struct FastingView_Previews: PreviewProvider {
    static var previews: some View {
        FastingView()
    }
}
