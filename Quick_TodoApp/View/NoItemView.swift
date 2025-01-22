import SwiftUI

struct NoItemView: View {
    @State var animate: Bool = false
    
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            Spacer()
            VStack (spacing: 12) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Wanna start productive day? you should click the add button and add bunch of todo items! ✨")
                    .padding(.bottom, 12)
                NavigationLink(
                    destination: AddView(),
                    label: {
                    Text("Add Something 🤩")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(animate ? secondaryAccentColor : Color.accentColor)
                            .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30  : 20,
                        x: 0,
                        y: animate ? 50 : 30)
            }
            .multilineTextAlignment(.center)
            .padding(32)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        NoItemView()
            .navigationTitle("Title")
    }
}
