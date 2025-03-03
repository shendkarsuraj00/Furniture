//
//  TabView.swift
//  Furniture
//
//  Created by Macbook on 22/02/25.
//

import SwiftUI

struct FurnitureTabView: View {
    
    @StateObject var cartManger = CartManager()
    @State var currentTab: TabBar = .Home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @Namespace var animation
    
    var body: some View {
        
        TabView(selection: $currentTab) {
            
            Text("Home View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(TabBar.Home)
            
            Text("Search View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(TabBar.Search)
            
            Text("Cart View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(TabBar.Cart)
            
            Text("Notification View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(TabBar.Notification)
            
            Text("Profile View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(TabBar.Profile)
            
        }
        .overlay(alignment: .bottom) {
            HStack(alignment: .bottom, spacing: 0) {
                ForEach(TabBar.allCases, id: \.rawValue) { tab in
                    TabButton(tab: tab)
                }
                .padding(.vertical)
                .padding(.bottom, getSafeArea().bottom == 0 ? 5: (getSafeArea().bottom - 15))
                .background(.kSecondary)
                
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    func TabButton(tab: TabBar) -> some View {
        GeometryReader { proxy in
            Button {
                withAnimation(.spring()) {
                    currentTab = tab
                }
            } label: {
                VStack(spacing: 0) {
                    Image(systemName: currentTab == tab ? tab.rawValue + ".fill": tab.rawValue)
                        .resizable()
                        .foregroundStyle(.kPrimary)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .frame(maxWidth: .infinity)
                        .background(
                            ZStack {
                                if currentTab == tab {
                                    MaterialEffect(style: .light)
                                        .clipShape(.circle)
                                        .matchedGeometryEffect(id: "TabBar", in: animation)
                                    
                                    Text(tab.name)
                                        .foregroundStyle(.primary)
                                        .font(.footnote)
                                        .padding(.top, 50)
                                }
                            }
                        )
                        .contentShape(.rect)
                        .offset(y: currentTab == tab ? -15 : 0)
                }
            }
        }
        .frame(height: 25)
    }
}

#Preview {
    FurnitureTabView()
        .environmentObject(CartManager())
}
