import SwiftUI

struct AddView: View {
    // When value @State changed, SwiftUI will automatically akan otomatis re-render the part of the view associated with that value.
    @State var textFieldTodo: String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    
    // by using presentationMode, basically tell it to go back one in view hierarchy
    @Environment(\.presentationMode) var presentationMode
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                TextField("Add task here...", text: $textFieldTodo)
                    .frame(height: 55)
                    .padding(.horizontal)
                    .background(Color(UIColor.secondarySystemBackground))
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
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if validateInput(){
            listViewModel.addItem(title: textFieldTodo)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func validateInput() -> Bool {
        if textFieldTodo.count < 3 {
            alertTitle = "Your new todo item must at least 3 characters 🙃"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView(){
        AddView()
    }
    .environmentObject(ListViewModel())
}
