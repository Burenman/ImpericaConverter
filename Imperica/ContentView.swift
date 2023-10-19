//
//  ContentView.swift
//  Imperica
//
//  Created by Viktor on 2023-10-19.
//
import SwiftUI


struct ContentView: View {
    @ObservedObject var viewModel = ConverterViewModel()
    @State private var isDarkMode = false
    
    var body: some View {
        NavigationView {
            ZStack {

            Color.colorSet.edgesIgnoringSafeArea(.all)
            
           
                
                
                VStack(spacing: 16) {
                    Text(viewModel.isImperialSystem ? "Imperial" : "Metric")
                        .font(.title3)
                        .fontWeight(.medium)
                        .padding(.top, 16)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .fill(viewModel.isImperialSystem ? Color.blue.opacity(0.8) : Color.yellow.opacity(0.8))
                            .frame(height: 150)
            
                            .overlay(
                                VStack {
                                    TextField("Enter \(viewModel.inputUnitLabel) value", text: $viewModel.inputValue, onEditingChanged: { editing in
                                        if !editing {
                                            // User finished editing, update the conversion instantly
                                            viewModel.convertUnits()
                                        }
                                    })
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding()
                                    .keyboardType(.decimalPad)
                                    .multilineTextAlignment(.center)
                                    Text(viewModel.inputUnitLabel)
                                        .foregroundColor(.white)
                                    
                                }
                            )
                            .onTapGesture {
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 25.0)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                    }
                    
                    HStack {
                        Button(action: {
                            viewModel.isImperialSystem.toggle()
                            viewModel.convertUnits() // Convert the units again when the toggle is switched
                        }) {
                            Image(systemName: "arrow.up.arrow.down.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .padding(8)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        
                        Picker("Select Conversion Type", selection: $viewModel.selectedUnitPair) {
                            ForEach(Array(unitTypeLabels.keys), id: \.self) { pair in
                                Text(unitTypeLabels[pair] ?? "Unknown")
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .onChange(of: viewModel.selectedUnitPair) { _ in
                            viewModel.convertUnits()
                        }
                        
                    }
                    
                    Text(viewModel.isImperialSystem ? "Metric" : "Imperial")
                        .font(.title3)
                        .fontWeight(.medium)
                    
                    RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                        .fill(viewModel.isImperialSystem ?  Color.yellow.opacity(0.8) : Color.blue.opacity(0.8))
                        .frame(height: 150)
                        .overlay(
                            VStack {
                                Text(viewModel.outputValue)
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding()
                                Text(viewModel.outputUnitLabel)
                                    .foregroundColor(.white)
                            }
                        )
                        .onTapGesture {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(Color.white, lineWidth: 1)
                        )
                    
                    
                    Button("Convert", action: viewModel.convertUnits)
                        .padding()
                        .frame(width: 250, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
                .padding()
                .navigationTitle("Let's Convert")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {isDarkMode.toggle()
                            if isDarkMode {
                                UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .dark
                            } else {
                                UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .light
                            }
                        }) {
                            Image(systemName: isDarkMode == true ? "sun.max.fill" : "moon.fill")
                        }
                    }
            }
          
            
        }
       
        }
    }
}


#Preview {
    ContentView()
}




//Picker("Select Conversion Type", selection: $viewModel.selectedUnitPair) {
//    ForEach(Array(unitTypeLabels.keys), id: \.self) { pair in
//        Text(unitTypeLabels[pair] ?? "Unknown")
//    }
//}
//.pickerStyle(WheelPickerStyle())

//                    Picker("Select Conversion Type", selection: $viewModel.selectedUnitPair) {
//                        ForEach([UnitPair(from: .lengthUS, to: .lengthMetric),
//                                 UnitPair(from: .weightUS, to: .weightMetric),
//                                 UnitPair(from: .temperatureFahrenheit, to: .temperatureCelsius)], id: \.self) { pair in
//                            switch pair {
//                            case UnitPair(from: .lengthUS, to: .lengthMetric):
//                                Text("Length")
//                            case UnitPair(from: .weightUS, to: .weightMetric):
//                                Text("Weight")
//                            case UnitPair(from: .temperatureFahrenheit, to: .temperatureCelsius):
//                                Text("Temperature")
//                            default:
//                                Text("Unknown")
//                            }
//                        }
//                    }
//                    .pickerStyle(WheelPickerStyle())
//                    .padding(.horizontal)

