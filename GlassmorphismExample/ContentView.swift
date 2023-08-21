//
//  ContentView.swift
//  GlassmorphismExample
//
//  Created by admin on 2023/8/21.
//

import SwiftUI

struct ContentView: View {
    
    let engraveWhite = Color.white.opacity(0.6)
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            BackgroundView()
            ForegroundView()
          
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Image(systemName: "xmark.square")
                        .foregroundStyle(.white)
                        .scaleEffect(CGSize(width: 0.9, height: 0.9))
                        .foregroundColor(engraveWhite)
                }
                Spacer()
                Text("HybridX")
                    .font(.title3)
                    .bold()
                    .foregroundColor(engraveWhite)
                    .padding(.bottom, 2)
                Text("UI design x SwiftuI")
                    .textCase(.uppercase)
                    .font(.caption2)
                    .foregroundColor(engraveWhite)
            }
            .padding(20)
            .frame(width: 300, height: 180)
        }
    }
}

#Preview {
    ContentView()
}

struct BackgroundView: View {
    @State private var isLoading = false
    var body: some View {
       ZStack {
            CircleShape(size: 100, color1: .orange, color2: .pink, offsetX: -140, offsetY: 70)
               .scaleEffect(isLoading ? 0.8 : 1)
                .animation(.linear(duration: 8).repeatForever(autoreverses: true), value: isLoading)
            CircleShape(size: 180, color1: .green, color2: .cyan, offsetX: 100, offsetY: -50)
               .scaleEffect(isLoading ? 0.8 : 1)
                .animation(.linear(duration: 4).repeatForever(autoreverses: true), value: isLoading)
            CircleShape(size: 40, color1: .cyan, color2: .blue, offsetX: -80, offsetY: -80)
               .scaleEffect(isLoading ? 0.9 : 1)
                .animation(.linear(duration: 2).repeatForever(autoreverses: true), value: isLoading)
        }
        .onAppear(){
            isLoading = true
        }
    }
}

struct CircleShape: View {
    let size: CGFloat
    let color1: Color
    let color2: Color
    let offsetX: CGFloat
    let offsetY: CGFloat
    var body: some View {
        Image(systemName: "circle.fill")
            .font(.system(size: size))
            .foregroundStyle(LinearGradient(colors: [color1, color2], startPoint: .topLeading, endPoint: .bottomTrailing))
            .offset(x: offsetX, y: offsetY)
            
    }
}



struct ForegroundView: View {
    let gradientSurface = LinearGradient(colors: [.white.opacity(0.1), .clear], startPoint: .topLeading, endPoint: .bottomTrailing)
    let gradientBorder = LinearGradient(colors: [.white.opacity(0.5), .white.opacity(0.0), .white.opacity(0.0), .green.opacity(0.0), .green.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15, style: .continuous)
            .foregroundStyle(gradientSurface)
            .background(.ultraThinMaterial)
            .mask( RoundedRectangle(cornerRadius: 15, style: .circular).foregroundColor(.black) )
            .overlay(
                RoundedRectangle(cornerRadius: 15, style: .circular)
                    .stroke(lineWidth: 1.5)
                    .foregroundStyle(gradientBorder)
                    .opacity(0.8)
            )
            .frame(width: 300, height: 180)
            .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 8)
    }
}
