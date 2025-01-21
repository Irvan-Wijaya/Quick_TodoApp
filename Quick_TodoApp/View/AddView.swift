import SwiftUI

struct AddView: View {
    // Ketika nilai @State berubah, SwiftUI akan otomatis merender ulang bagian view yang terkait dengan nilai tersebut.
    @State var textFieldTodo: String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    
    // by using presentationMode, basically tell it to go back one in view hierarchy
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView {
            VStack {
                TextField("Add task here...", text: $textFieldTodo)
                    .frame(height: 55)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10) // there an order when declare views
                // case: cornerRadius,
                    // background applies the background color to the text view.
                    // cornerRadius is applied to the resulting view, creating rounded corners for both the text and the background.
                
                Button(action: saveButtonPressed
                       , label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity) // same there's order when declare views
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add Todo 🖋️")
    }
    
    func saveButtonPressed() {
        listViewModel.addItem(title: textFieldTodo)
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    NavigationView(){
        AddView()
    }
    .environmentObject(ListViewModel())
}
