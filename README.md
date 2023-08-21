# GlassmorphismDemo
Glassmorphism UI Effect made by SwiftUI Material

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
