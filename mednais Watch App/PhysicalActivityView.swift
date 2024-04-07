//
//  PhysicalActivityView.swift
//  mednais Watch App
//
//  Created by VAITSIKHOUSKAYA on 07/02/2024.
//

import SwiftUI

struct PhysicalActivityView: View {
    @State private var showObtainSupplies: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                titleView
                iconView
                physicalActivityInformation
                confirmButton
                rejectButton
            }
        }
        .navigationDestination(isPresented: $showObtainSupplies) {
            ObtainSupplies()
        }
    }
    
    var titleView: some View {
        Text("PHYSICAL ACTIVITY")
            .bold()
    }
    
    var iconView: some View {
        ZStack {
            Circle()
                .frame(width: 75, height: 75)
            Text("GYM")
                .foregroundColor(.black)
        }
    }
    
    var physicalActivityInformation: some View {
        Text("Intense physical activity avoided for 24 h")
            .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
            .multilineTextAlignment(.center)
    }
    
    var confirmButton: some View {
        Button {
            showObtainSupplies = true
        } label: {
            Text("Confirm")
        }
        .background(Color.red)
        .cornerRadius(10)
    }
    
    var rejectButton: some View {
        Button {
            showObtainSupplies = true
        } label: {
            Text("Reject")
        }
        .background(Color.gray)
        .cornerRadius(10)
    }
}

struct PhysicalActivityView_Previews: PreviewProvider {
    static var previews: some View {
        PhysicalActivityView()
    }
}
