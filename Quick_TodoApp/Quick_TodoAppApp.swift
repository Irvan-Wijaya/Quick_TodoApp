/*
MVVM
 Model: data point
 View: User Interface
 ViewModel: manage Models for View
 
*/
import SwiftUI

@main
struct Quick_TodoAppApp: App {
    var body: some Scene {
        WindowGroup {
            // all views in this project automatically within a navigation view
            NavigationView {
                ListView()
            }
        }
    }
}
