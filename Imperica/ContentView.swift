//
//  ContentView.swift
//  Imperica
//
//  Created by Viktor on 2023-10-19.
//
import SwiftUI


struct ContentView: View {
    @State private var showSplash = true

        var body: some View {
            ZStack {
                if showSplash {
                                SplashView()
                                    .onAppear {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                            withAnimation {
                                                self.showSplash = false
                                            }
                                        }
                                    }
                } else {
                    // Main content of your app
                    ConverterView()
                }
            }
        }
    }


#Preview {
    ContentView()
}
