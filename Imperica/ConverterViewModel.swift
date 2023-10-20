//
//  ConverterViewModel.swift
//  Imperica
//
//  Created by Viktor on 2023-10-19.
//

import SwiftUI
import Observation

@Observable
class ConverterViewModel: ObservableObject {
    var inputValue = ""
    var outputValue = ""
    var selectedUnitPair: UnitPair = UnitPair(from: .lengthUS, to: .lengthMetric)
    var isImperialSystem = true
   
    
    var inputUnitType: UnitType {
        return isImperialSystem ? selectedUnitPair.from : selectedUnitPair.to
    }

    var outputUnitType: UnitType {
        return isImperialSystem ? selectedUnitPair.to : selectedUnitPair.from
    }

    var inputUnitLabel: String {
        return ConversionModel.unitLabel(for: inputUnitType)
    }

    var outputUnitLabel: String {
        return ConversionModel.unitLabel(for: outputUnitType)
    }

    

    func convertUnits() {
        guard let inputValue = Double(inputValue) else {
            outputValue = "Waiting for your input"
            return
        }

        let convertedValue = ConversionModel.convert(value: inputValue, from: inputUnitType, to: outputUnitType)
        outputValue = String(format: "%.2f", convertedValue)
    }
}


  
       
    
