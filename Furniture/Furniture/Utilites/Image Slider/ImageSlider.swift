//
//  ImageSlider.swift
//  Furniture
//
//  Created by Macbook on 25/02/25.
//

import SwiftUI

struct ImageSlider: View {
    
    @State private var currentIndex = 0
    var slides: [String] = ["Cupboard", "SofaSet", "DinnerTable", "OfficeTable"]
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            TabView(selection: $currentIndex) {
                ForEach(0..<slides.count, id: \.self) { index in
                    Image(slides[index])
                        .resizable()
                        .scaledToFill()
                        .tag(index)
                }
            }
            .tabViewStyle(.page)
            .frame(width: .infinity, height: 180)
            .clipShape(.rect(cornerRadius: 15))
            .padding([.leading, .trailing], 10)
            Spacer()
                .onReceive(timer) { _ in
                    withAnimation {
                        currentIndex = (currentIndex + 1) % slides.count
                    }
                }
                .onAppear {
                    setupTabView()
                }
        }
        
    }
    
    func setupTabView() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .kPrimary
        UIPageControl.appearance().pageIndicatorTintColor = .kSecondary
    }
}

#Preview {
    ImageSlider()
}
