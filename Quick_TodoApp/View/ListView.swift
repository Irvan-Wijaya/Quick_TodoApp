
import SwiftUI

struct ListView: View {
/**
 Personal Note
 Why using @State?
1. Dynamic View Updates
  @State is a property wrapper that tells SwiftUI to monitor changes to the variable. When the value of a @State property changes, SwiftUI automatically re-renders any parts of the view that depend on that state.
 
2. Binding Mechanism
  @State property can be passed as a binding ($items) to other views, enabling child views to update the parent view's state. in this case pass $items to another view for editing, any changes made there will reflect in the parent view.
 
3. Data Persistence During View Lifecycle:
  @State ensures that the variable persists its value as long as the view exists. Without @State, any changes to items would not persist or trigger updates to the view.
 
 Cannot used @State in regular class, we can only use in view
*/
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(title: item)
                            .onTapGesture {
                                withAnimation(.linear(duration: 0.2)) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 🔥")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                ListView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(ListViewModel())
            
            NavigationView {
                ListView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
        }
    }
}
