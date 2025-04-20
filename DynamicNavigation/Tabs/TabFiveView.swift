//
//  TabFiveView.swift
//  DynamicNavigation
//
//  Created by Mohsen on 4/20/25.
//

import SwiftUI

struct TabFiveView: View {
    @Environment(NavigationStateManager.self) var navigationManager: NavigationStateManager
    
    var body: some View {
        @Bindable var navigationManagerBindable = navigationManager
        NavigationStack(path: $navigationManagerBindable.tab5Path) {
            VStack {
                Text("Tab 5 Profile View")
                    .font(.largeTitle)
                
                Button("View Profile") {
                    navigationManager.tab5Path.append(.profile)
                }
                .buttonStyle(.borderedProminent)
                
                Button("View Settings") {
                    navigationManager.tab5Path.append(.settings)
                }
                .buttonStyle(.bordered)
            }
            .padding()
            .navigationTitle("Profile")
            .navigationDestination(for: Route.self) { route in
                switch route {
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
                default:
                    Text("Unsupported route for this tab")
                }
            }
        }
    }
}
