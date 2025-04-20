//
//  TabThreeView.swift
//  DynamicNavigation
//
//  Created by Mohsen on 4/20/25.
//

import SwiftUI

struct TabThreeView: View {
    @Environment(NavigationStateManager.self) var navigationManager: NavigationStateManager
    
    var body: some View {
        @Bindable var navigationManagerBindable = navigationManager
        NavigationStack(path: $navigationManagerBindable.tab3Path) {
            VStack {
                Text("Tab 3 Favorites View")
                    .font(.largeTitle)
                
                Button("View Favorite #7") {
                    navigationManager.tab3Path.append(.detail(id: 7))
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Favorites")
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
