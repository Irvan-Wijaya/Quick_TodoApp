/*
MVVM
 Model: data point
 View: User Interface
 ViewModel: manage Models for View
 
*/
import SwiftUI

@main
struct Quick_TodoAppApp: App {
    
    @State var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            // all views in this project automatically within a navigation view
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
            .navigationViewStyle(StackNavigationViewStyle()) // because for iPad navigationView is different way, so need to declare this
        }
    }
}
