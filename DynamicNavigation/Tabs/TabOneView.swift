//
//  TabOneView.swift
//  DynamicNavigation
//
//  Created by Mohsen on 4/20/25.
//

import SwiftUI

struct TabOneView: View {
    @Environment(NavigationStateManager.self) var navigationManager: NavigationStateManager
    
    var body: some View {
        @Bindable var navigationManagerBindable = navigationManager
        NavigationStack(path: $navigationManagerBindable.tab1Path) {
            VStack(spacing: 20) {
                Text("Tab 1 Home View (Level 1)")
                    .font(.largeTitle)
                
                Button("Navigate to Level 2") {
                    navigationManager.tab1Path.append(.level1)
                }
                .buttonStyle(.borderedProminent)
                
                // Presentation test section
                GroupBox("Presentation Tests") {
                    VStack(alignment: .leading, spacing: 12) {
                        Button("Show Settings Sheet") {
                            navigationManager.presentSheet(.settings)
                        }
                        .buttonStyle(.bordered)
                        
                        Button("Show Custom Sheet") {
                            navigationManager.presentSheet(.customView(title: "Custom Sheet"))
                        }
                        .buttonStyle(.bordered)
                        
                        Button("Show Share Sheet") {
                            navigationManager.presentSheet(.shareContent(text: "Check out this awesome app!"))
                        }
                        .buttonStyle(.bordered)
                        
                        Button("Show Alert Modal") {
                            navigationManager.presentModal(.alert(
                                title: "Information",
                                message: "This is an alert modal example."
                            ))
                        }
                        .buttonStyle(.bordered)
                        
                        Button("Show Confirmation Modal") {
                            navigationManager.presentModal(.confirmation(
                                title: "Confirm Action",
                                message: "Are you sure you want to proceed with this action?"
                            ))
                        }
                        .buttonStyle(.bordered)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                
                Button("Go to Settings") {
                    navigationManager.navigateToSettings()
                }
                .buttonStyle(.bordered)
                .foregroundColor(.blue)
                
                // Deep link example
                Button("Deep Link to Level 6") {
                    navigationManager.tab1Path = [.level1, .level2, .level3, .level4, .level5]
                }
                .buttonStyle(.bordered)
                .foregroundColor(.purple)
            }
            .padding()
            .navigationTitle("Home")
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .level1:
                    Level2View()
                case .level2:
                    Level3View()
                case .level3:
                    Level4View()
                case .level4:
                    Level5View()
                case .level5:
                    Level6View()
                case .detail(let id):
                    DetailView(id: id)
                case .settings:
                    SettingsView()
                case .profile:
                    ProfileView()
                case .favorites:
                    FavoritesView()
                case .subCategory(let name):
                    SubCategoryView(name: name)
                }
            }
        }
    }
}

// MARK: - Nested Views for Tab One

struct Level2View: View {
    @Environment(NavigationStateManager.self) var navigationManager: NavigationStateManager
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Level 2 View")
                .font(.largeTitle)
            
            Button("Navigate to Level 3") {
                navigationManager.tab1Path.append(.level2)
            }
            .buttonStyle(.borderedProminent)
            
            Button("Go Back to Level 1") {
                navigationManager.tab1Path.removeLast()
            }
            .buttonStyle(.bordered)
            
            Button("Go to Settings") {
                navigationManager.navigateToSettings()
            }
            .buttonStyle(.bordered)
            .foregroundColor(.blue)
        }
        .padding()
        .navigationTitle("Level 2")
    }
}

struct Level3View: View {
    @Environment(NavigationStateManager.self) var navigationManager: NavigationStateManager
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Level 3 View")
                .font(.largeTitle)
            
            Button("Navigate to Level 4") {
                navigationManager.tab1Path.append(.level3)
            }
            .buttonStyle(.borderedProminent)
            
            Button("Go Back to Level 2") {
                navigationManager.tab1Path.removeLast()
            }
            .buttonStyle(.bordered)
            
            Button("Go to Settings") {
                navigationManager.navigateToSettings()
            }
            .buttonStyle(.bordered)
            .foregroundColor(.blue)
        }
        .padding()
        .navigationTitle("Level 3")
    }
}

struct Level4View: View {
    @Environment(NavigationStateManager.self) var navigationManager: NavigationStateManager
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Level 4 View")
                .font(.largeTitle)
            
            Button("Navigate to Level 5") {
                navigationManager.tab1Path.append(.level4)
            }
            .buttonStyle(.borderedProminent)
            
            Button("Go Back to Level 3") {
                navigationManager.tab1Path.removeLast()
            }
            .buttonStyle(.bordered)
            
            Button("Go to Settings") {
                navigationManager.navigateToSettings()
            }
            .buttonStyle(.bordered)
            .foregroundColor(.blue)
        }
        .padding()
        .navigationTitle("Level 4")
    }
}

struct Level5View: View {
    @Environment(NavigationStateManager.self) var navigationManager: NavigationStateManager
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Level 5 View")
                .font(.largeTitle)
            
            Button("Navigate to Level 6 (Final)") {
                navigationManager.tab1Path.append(.level5)
            }
            .buttonStyle(.borderedProminent)
            
            Button("Go Back to Level 4") {
                navigationManager.tab1Path.removeLast()
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .navigationTitle("Level 5")
    }
}

struct Level6View: View {
    @Environment(NavigationStateManager.self) var navigationManager: NavigationStateManager
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Level 6 View (Final Nested Level)")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            Text("You've reached the deepest level!")
                .font(.title2)
                .foregroundColor(.green)
            
            Button("Go Back to Level 5") {
                navigationManager.tab1Path.removeLast()
            }
            .buttonStyle(.bordered)
            
            Button("Return to Home (Level 1)") {
                navigationManager.tab1Path = []
            }
            .buttonStyle(.borderedProminent)
            .tint(.purple)
            
            Button("Go to Settings") {
                navigationManager.navigateToSettings()
            }
            .buttonStyle(.bordered)
            .foregroundColor(.blue)
        }
        .padding()
        .navigationTitle("Level 6")
    }
}

