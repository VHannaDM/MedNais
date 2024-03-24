//
//  FastingView.swift
//  mednais Watch App
//
//  Created by VAITSIKHOUSKAYA on 07/02/2024.
//

import SwiftUI

struct FastingView: View {
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Text("FASTING")
                .bold()
            Text("What is your\nname")
                .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                .multilineTextAlignment(.center)
            Text("What is your date\nof birth?")
                .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                .multilineTextAlignment(.center)
            NavigationStack {
                Button(action: {
                    isPresented = true
                }) {
                    Text("NEXT")
                }
                .background(Color.red)
                .cornerRadius(10)
                .navigationDestination(isPresented: $isPresented) {
                    Text("Details screen")
                }
            }
        }
    }
}

struct FastingView_Previews: PreviewProvider {
    static var previews: some View {
        FastingView()
    }
}
