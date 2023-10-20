//
//  SplashView.swift
//  Imperica
//
//  Created by Viktor on 2023-10-19.
//
import SwiftUI

struct SplashView: View {
    @State private var zoomed = false
    
    var body: some View {
        ZStack {
            Color(hex: 0xF7FFF7).edgesIgnoringSafeArea(.all)
            
            Image("SplashLogo")
                .font(.system(size: 80))
                .scaleEffect(zoomed ? 0.25 : 0.17)
                .animation(.easeInOut(duration: 1.5))
                .onAppear {
                    zoomed.toggle()
                }
        }
    }
}

#Preview {
    SplashView()
}
