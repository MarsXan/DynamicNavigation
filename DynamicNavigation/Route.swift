//
//  Route.swift
//  DynamicNavigation
//
//  Created by Mohsen on 4/20/25.
//

enum Route: Hashable {
    case level1
    case level2
    case level3
    case level4
    case level5
    case detail(id: Int)
    case settings
    case profile
    case favorites
    case subCategory(name: String)
}

// Presentation types for sheets, full-screen sheets, and modals
enum PresentationType: Hashable {
    case sheet(SheetDestination)
    case fullScreenSheet(SheetDestination)
    case modal(ModalDestination)
}

// Sheet destinations
enum SheetDestination: Hashable {
    case settings
    case profile
    case detail(id: Int)
    case shareContent(text: String)
    case customView(title: String)
}

// Modal destinations
enum ModalDestination: Hashable {
    case alert(title: String, message: String)
    case confirmation(title: String, message: String)
    case customModal(title: String)
}


// TODO: - For Advanced Routing we can implement Route with protocol
//protocol Route: Hashable {
//}

// Tab 1 specific routes
//enum HomeRoute: Route {
//    case level1
//    case level2
//    case level3
//    case level4
//    case level5
//}


// Tab 2 specific routes
//enum ExploreRoute: Route {
//    case category(name: String)
//    case item(id: Int)
//    case search(query: String)
//}


//// Common routes that can be used across tabs
//enum CommonRoute: Route {
//    case detail(id: Int)
//    case webView(url: URL)
//    case shareSheet(content: String)
//}
