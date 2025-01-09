
import SwiftUI

struct ListView: View {
/**
 Why using @State
1. Dynamic View Updates
  @State is a property wrapper that tells SwiftUI to monitor changes to the variable. When the value of a @State property changes, SwiftUI automatically re-renders any parts of the view that depend on that state.
 
2. Binding Mechanism
  @State property can be passed as a binding ($items) to other views, enabling child views to update the parent view's state. in this case pass $items to another view for editing, any changes made there will reflect in the parent view.
 
3. Data Persistence During View Lifecycle:
  @State ensures that the variable persists its value as long as the view exists. Without @State, any changes to items would not persist or trigger updates to the view.
*/
    
    @State var items: [ItemModel] = [
        ItemModel(title: "Learn SwiftUI", isCompleted: false),
        ItemModel(title: "Learn Swift", isCompleted: true),
        ItemModel(title: "Learn MVVM", isCompleted: false)
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(title: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 🔥")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
}

#Preview {
    NavigationView {
        ListView()
    }
}
