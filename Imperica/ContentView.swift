//
//  ContentView.swift
//  Imperica
//
//  Created by Viktor on 2023-10-19.
//
import SwiftUI


struct ContentView: View {
    @ObservedObject var viewModel = ConverterViewModel()
    @State private var rotationAngle: Double = 0
    @State private var isDarkMode = false
    
    var body: some View {
        
        
        NavigationView {
            ZStack {
                Color.colorSet.edgesIgnoringSafeArea(.all)
                
                
                
                VStack(spacing: 16) {
                        Text(viewModel.isImperialSystem ? "Imperial" : "Metric")
                            .font(.title3)
                            .fontWeight(.medium)
                            .padding(.top, 25)
                        
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
                                        .font(.system(size:35, weight: .medium))
                                        .foregroundColor(.white)
                                        
                                        .keyboardType(.decimalPad)
                                        .multilineTextAlignment(.center)
                                        .onChange(of: viewModel.inputValue) { value in
                                            viewModel.convertUnits()
                                        }
                                        
                                        Text(viewModel.inputUnitLabel)
                                            .font(.title2)
                                            .foregroundColor(.white)
                                            
                                        
                                    }
                                        .padding()
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
                                viewModel.convertUnits()
                                withAnimation {
                                     rotationAngle -= 180
                                }
                            }) {
                                Image(systemName: "arrow.up.arrow.down.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                    .padding(8)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .rotationEffect(.degrees(viewModel.isImperialSystem ? rotationAngle : -rotationAngle))
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
                                        .font(.system(size:35, weight: .medium))
                                        .foregroundColor(.white)
                                    Text(viewModel.outputUnitLabel)
                                        .font(.title2)
                                        .foregroundColor(.white)
                                }
                                    .padding()
                            )
                          
                            .onTapGesture {
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 25.0)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                        
                        
                       
                    }
                    .padding()

                    .preferredColorScheme(isDarkMode ? .dark : .light)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Text("Let's Convert")
                                .font(.headline)
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {isDarkMode.toggle()
                                     }) {
                                Image(systemName: isDarkMode == true ? "sun.max.fill" : "moon.fill")
                                    .foregroundColor(isDarkMode ? .yellow : .blue)
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
