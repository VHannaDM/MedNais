//
//  ParametersView.swift
//  mednais Watch App
//
//  Created by VAITSIKHOUSKAYA on 01/04/2024.
//

import SwiftUI

struct ParametersView: View {
    @State private var showExplication: Bool = false
    @ObservedObject var viewModel: VenusBloodViewModel
    
    private func createFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm dd.MM.yyyy"
        return formatter
    }
    
    func formattedTimer(from startDate: Date, to endDate: Date) -> String {
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.unitsStyle = .abbreviated
        dateComponentsFormatter.allowedUnits = [.hour, .minute, .second]
        return dateComponentsFormatter.string(from: startDate, to: endDate) ?? ""
    }
    
    func formattedPuncture(from startDate: Date, to endDate: Date) -> String {
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.unitsStyle = .abbreviated
        dateComponentsFormatter.allowedUnits = [.hour, .minute, .second]
        return dateComponentsFormatter.string(from: startDate, to: endDate) ?? ""
    }
    
    func formattedSampling(from startDate: Date, to endDate: Date) -> String {
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.unitsStyle = .abbreviated
        dateComponentsFormatter.allowedUnits = [.hour, .minute, .second]
        return dateComponentsFormatter.string(from: startDate, to: endDate) ?? ""
    }
    
    var body: some View {
        ScrollView {
            VStack {
                titleView
                estView
                tatView
                tstView
                pttView
                fastingView
                alcoholView
                physActView
                saveCloseButton
                sendEmailButton
            }
        }
    }
    
    var titleView: some View {
        Text("PARAMETERS")
            .bold()
            .multilineTextAlignment(.center)
    }
    
    var estView: some View {
        HStack {
            Text("EST")
            Spacer()
            Text("\(viewModel.preSamplingDate, formatter: createFormatter())")
        }
    }
    
    var tatView: some View {
        HStack {
            Text("TAT")
            Spacer()
            Text(formattedTimer(from: viewModel.timerDate, to: viewModel.tourniquetDate))
        }
    }
    
    var tstView: some View {
        HStack {
            Text("TST")
            Spacer()
            Text(formattedPuncture(from: viewModel.punctureDate, to: viewModel.finishingPunctureDate))
        }
    }
    
    var pttView: some View {
        HStack {
            Text("PTT")
            Spacer()
            Text(formattedSampling(from: viewModel.preSamplingDate, to: viewModel.postSamplingDate))
        }
    }
    
    var fastingView: some View {
        HStack {
            Text("FASTING")
            Spacer()
            if viewModel.confirmFasting == true {
                Text("YES")
            } else if viewModel.rejectFasting == false {
                Text("NO")
            }
        }
    }
    
    var alcoholView: some View {
        HStack {
            Text("ALCOHOL")
            Spacer()
            if viewModel.confirmAlcoholFree == true {
                Text("YES")
            } else if viewModel.rejectAlcoholFree == false {
                Text("NO")
            }
        }
    }
    
    var physActView: some View {
        HStack {
            Text("PHYS ACT")
            Spacer()
            if viewModel.confirmPhysicalActivity == true {
                Text("YES")
            } else if viewModel.rejectPhysicalActivity == false {
                Text("NO")
            }
        }
    }
    
    var saveCloseButton: some View {
        Button {
            showExplication = true
        } label: {
            Text("SAVE&CLOSE")
        }
        .background(Color.red)
        .cornerRadius(10)
    }
    
    var sendEmailButton: some View {
        Button {
            showExplication = true
        } label: {
            Text("SEND TO EMAIL")
        }
        .background(Color.gray)
        .cornerRadius(10)
    }
}

struct ParametersView_Previews: PreviewProvider {
    static var previews: some View {
        ParametersView(viewModel: VenusBloodViewModel())
    }
}
