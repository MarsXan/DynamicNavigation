//
//  TabTwoView.swift
//  DynamicNavigation
//
//  Created by Mohsen on 4/20/25.
//

import SwiftUI

struct TabTwoView: View {
    @Environment(NavigationStateManager.self) var navigationManager: NavigationStateManager
    
    var body: some View {
        @Bindable var navigationManagerBindable = navigationManager
        NavigationStack(path: $navigationManagerBindable.tab2Path) {
            VStack {
                Text("Tab 2 Explore View")
                    .font(.largeTitle)
                
                Button("Browse Categories") {
                    navigationManager.tab2Path.append(.subCategory(name: "Featured"))
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Explore")
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
