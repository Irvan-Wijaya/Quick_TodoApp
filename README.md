
# Quick - Simple Todo App ✓

"Quick adalah aplikasi iOS sederhana yang dibangun menggunakan SwiftUI, UserDefautls, dan MVVM architecture. Proyek ini dibuat untuk memahami konsep dasar pengembangan iOS.



## Features 🚀

 - Add task
 - Edit task
 - Delete task
 - Mark tasks as complete
 - Drag & drop system
 - Compatible with dark mode
 - Layouting - responsive with potrait & landscape and compatible with iPad 
## Lessons Learned ✨

What did you learn while building this project? What challenges did you face and how did you overcome them?

**🧩 State Management in SwiftUI**

- ```@State``` and ```@Binding``` - Stores and links local state in views between parent and child views, allowing automatic changes to re-render the view
- ```@EnvironmentObject``` – Used to share global data across views in an application.

**🏗️ MVVM Architecture**

- Model – Represents a data structure, usually confirming to a protocol such as ```Codable``` or ```Identifiable```.
- View – Sets the view and receives data from the ViewModel.
- ViewModel – Acts as a link between Model and View, and organizes the application's business logic.
```
class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
}
```
**🎨 UI & Navigation Enhancements**
- ```@Environment(\.presentationMode)``` – Used to close the view when returning to the previous screen in navigation.
- ```navigationBarItems``` – Add buttons to the top navigation bar.
- ```Animation``` and ```.transition``` - Added animations to UI state changes as well as transitions when elements appear.

**📄 Data Handling**
- ```Identifiable``` – Helps SwiftUI differentiate each element in the list.
- ```Codable``` – Makes it easy to encode and decode objects to and from JSON.
- ```JSONDecoder()``` and ```JSONEncoder()``` – For parsing and saving data in JSON format.
- ```UserDefaults``` – For storing simple data such as user preferences.

**🌙 Dark Mode Compatibility**

- Use ```.preferredColorScheme()``` for testing light/dark mode.
- Use adaptive colors such as ```.primary``` to automatically follow the system theme.
- Handle colors manually using ```ColorScheme``` in Environment.

**📱 Responsive Layouting**
- Dynamic Type: uses ```.font(.headline)``` which automatically adjusts the text size.
- Stacking Elements: Uses ```VStack```, ```HStack```, and ```ZStack``` for flexible layout arrangements.
```
VStack {
    Text("Hello, World!")
}
.frame(maxWidth: .infinity)
.frame(height: 55)
```
## Tech Stack ⚙️
**Swift** - Programming Language

**SwiftUI** - UI framework

**UserDefaults** – Local data management

**MVVM Architecture** – Design pattern 

**Auto Layout** – Responsive design

## Demo 📸
https://github.com/user-attachments/assets/adafaff8-441c-46ef-882d-e952a83033e2
