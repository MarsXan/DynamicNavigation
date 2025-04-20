//
//  PresentationViews.swift
//  DynamicNavigation
//
//  Created by Mohsen on 4/21/25.
//

import SwiftUI

// MARK: - Sheet Content Views

struct SheetContentView: View {
    let destination: SheetDestination
    @Environment(NavigationStateManager.self) var navigationManager: NavigationStateManager
    
    var body: some View {
        NavigationStack {
            VStack {
                switch destination {
                case .settings:
                    SettingsView()
                case .profile:
                    ProfileView()
                case .detail(let id):
                    DetailView(id: id)
                case .shareContent(let text):
                    ShareContentView(text: text)
                case .customView(let title):
                    CustomSheetView(title: title)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        navigationManager.dismissSheet()
                    }
                }
            }
        }
    }
}

struct ShareContentView: View {
    let text: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Share Content")
                .font(.largeTitle)
                .padding()
            
            Text(text)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
            
            Button(action: {
                // Implement share action
            }) {
                Label("Share", systemImage: "square.and.arrow.up")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .navigationTitle("Share")
    }
}

struct CustomSheetView: View {
    let title: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.largeTitle)
                .padding()
            
            Text("This is a custom sheet view that can be configured with different content.")
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
        }
        .navigationTitle(title)
    }
}

// MARK: - Modal Content Views

struct ModalContentView: View {
    let destination: ModalDestination
    @Environment(NavigationStateManager.self) var navigationManager: NavigationStateManager
    
    var body: some View {
        VStack {
            switch destination {
            case .alert(let title, let message):
                AlertModalView(title: title, message: message)
            case .confirmation(let title, let message):
                ConfirmationModalView(title: title, message: message)
            case .customModal(let title):
                CustomModalView(title: title)
            }
        }
    }
}

struct AlertModalView: View {
    let title: String
    let message: String
    @Environment(NavigationStateManager.self) var navigationManager: NavigationStateManager
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.headline)
                .padding(.top)
            
            Text(message)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button("OK") {
                navigationManager.dismissModal()
            }
            .buttonStyle(.borderedProminent)
            .padding(.bottom)
        }
        .frame(width: 300, height: 200)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 10)
    }
}

struct ConfirmationModalView: View {
    let title: String
    let message: String
    @Environment(NavigationStateManager.self) var navigationManager: NavigationStateManager
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.headline)
                .padding(.top)
            
            Text(message)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            HStack(spacing: 20) {
                Button("Cancel") {
                    navigationManager.dismissModal()
                }
                .buttonStyle(.bordered)
                
                Button("Confirm") {
                    navigationManager.dismissModal()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(.bottom)
        }
        .frame(width: 300, height: 200)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 10)
    }
}

struct CustomModalView: View {
    let title: String
    @Environment(NavigationStateManager.self) var navigationManager: NavigationStateManager
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.headline)
                .padding(.top)
            
            Text("This is a custom modal view with custom content and actions.")
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button("Close") {
                navigationManager.dismissModal()
            }
            .buttonStyle(.borderedProminent)
            .padding(.bottom)
        }
        .frame(width: 300, height: 200)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 10)
    }
}
