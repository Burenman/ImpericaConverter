//
//  ConversionModel.swift
//  Imperica
//
//  Created by Viktor on 2023-10-19.
//

import Foundation
import Observation

enum UnitType {
    case lengthUS, lengthMetric
    case weightUS, weightMetric
    case temperatureFahrenheit, temperatureCelsius
    case squareFeet, squareMeters
    case milesPerHour, kilometersPerHour
    case miles, kilometers
    case gallons, liters
    
    
}

struct UnitPair: Hashable {
    let from: UnitType
    let to: UnitType
}

let unitTypeLabels: [UnitPair: String] = [
    UnitPair(from: .lengthUS, to: .lengthMetric): "Length",
    UnitPair(from: .weightUS, to: .weightMetric): "Weight",
    UnitPair(from: .temperatureFahrenheit, to: .temperatureCelsius): "Temperature",
    UnitPair(from: .squareFeet, to: .squareMeters): "Area",
    UnitPair(from: .milesPerHour, to: .kilometersPerHour): "Speed",
    UnitPair(from: .miles , to: .kilometers): "Distance",
    UnitPair(from: .gallons, to: .liters): "Volume"
]


struct ConversionModel {
    static func convert(value: Double, from unitType: UnitType, to outputUnitType: UnitType) -> Double {
        switch (unitType, outputUnitType) {
        case (.lengthUS, .lengthMetric):
            // Convert inches to centimeters: 1 inch = 2.54 centimeters
            return value * 2.54
        case (.lengthMetric, .lengthUS):
            // Convert centimeters to inches: 1 centimeter ≈ 0.393701 inches
            return value * 0.393701
        case (.weightUS, .weightMetric):
            // Convert pounds to kilograms: 1 pound ≈ 0.453592 kilograms
            return value * 0.453592
        case (.weightMetric, .weightUS):
            // Convert kilograms to pounds: 1 kilogram ≈ 2.20462 pounds
            return value * 2.20462
        case (.temperatureFahrenheit, .temperatureCelsius):
            // Convert Fahrenheit to Celsius: (°F - 32) * 5/9
            return (value - 32) * 5/9
        case (.temperatureCelsius, .temperatureFahrenheit):
            // Convert Celsius to Fahrenheit: (°C * 9/5) + 32
            return (value * 9/5) + 32
        case (.squareFeet, .squareMeters):
            // Convert square feet to square meters: 1 sq ft ≈ 0.092903 sq m
            return value * 0.092903
        case (.squareMeters, .squareFeet):
            // Convert square meters to square feet: 1 sq m ≈ 10.7639 sq ft
            return value * 10.7639
        case (.milesPerHour, .kilometersPerHour):
            // Convert miles per hour to kilometers per hour: 1 mph ≈ 1.60934 km/h
            return value * 1.60934
        case (.kilometersPerHour, .milesPerHour):
            // Convert kilometers per hour to miles per hour: 1 km/h ≈ 0.621371 mph
            return value * 0.621371
        case (.miles, .kilometers):
            // Convert miles to kilometers: 1 mile ≈ 1.60934 kilometers
            return value * 1.60934
        case (.kilometers, .miles):
            // Convert kilometers to miles: 1 kilometer ≈ 0.621371 miles
            return value * 0.621371
        case (.gallons, .liters):
            // Convert gallons to liters: 1 gallon ≈ 3.78541 liters
            return value * 3.78541
        case (.liters, .gallons):
            // Convert liters to gallons: 1 liter ≈ 0.264172 gallons
            return value * 0.264172
            
        default:
            // Handle additional conversion cases if needed
            return value
        }
    }
    
    static func unitLabel(for unitType: UnitType) -> String {
        switch unitType {
        case .lengthUS:
            return "inches"
        case .lengthMetric:
            return "cm"
        case .weightUS:
            return "lbs"
        case .weightMetric:
            return "kg"
        case .temperatureFahrenheit:
            return "°F"
        case .temperatureCelsius:
            return "°C"
        case .squareFeet:
            return "sq ft"
        case .squareMeters:
            return "sq m"
        case .milesPerHour:
            return "mph"
        case .kilometersPerHour:
            return "km/h"
        case .miles:
            return "mi"
        case .kilometers:
            return "km"
        case .gallons:
            return "gal"
        case .liters:
            return "L"
        }
        
    }
    
    
    
}


