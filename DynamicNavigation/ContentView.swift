//
//  ContentView.swift
//  DynamicNavigation
//
//  Created by Mohsen on 4/20/25.
//

import SwiftUI

struct ContentView: View {
    var navigationManager = NavigationStateManager()
    
    var body: some View {
        @Bindable var navigationManagerBindable = navigationManager
        TabView(selection: $navigationManagerBindable.selectedTab) {
            TabOneView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
            
            TabTwoView()
                .tabItem {
                    Label("Explore", systemImage: "safari")
                }
                .tag(1)
            
            TabThreeView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
                .tag(2)
            
            TabFourView()
                .tabItem {
                    Label("Messages", systemImage: "message")
                }
                .tag(3)
            
            TabFiveView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(4)
        }
        .environment(navigationManager)
        .onOpenURL { url in
            navigationManager.handleDeepLink(url)
        }
        // Sheet presentation
        .sheet(isPresented: $navigationManagerBindable.isSheetPresented) {
            if let destination = navigationManager.currentSheetDestination {
                SheetContentView(destination: destination)
                    .environment(navigationManager)
            }
        }
        // Full-screen sheet presentation
        .fullScreenCover(isPresented: $navigationManagerBindable.isFullScreenSheetPresented) {
            if let destination = navigationManager.currentFullScreenSheetDestination {
                SheetContentView(destination: destination)
                    .environment(navigationManager)
            }
        }
        // Modal presentation
        .overlay {
            if navigationManager.isModalPresented, let destination = navigationManager.currentModalDestination {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                    }
                
                ModalContentView(destination: destination)
                    .environment(navigationManager)
                    .transition(.scale)
            }
        }
        .animation(.easeInOut, value: navigationManager.isModalPresented)
    }
}

#Preview {
    ContentView()
}
