import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }

}

// Define a struct ChatView that conforms to the View protocol
struct ChatView: View {
    // State variable to store the message entered by the user
    @State private var message = ""
    // State variable to store the array of messages
    @State private var messages = [String]()
    
    // The body of the view
    var body: some View {
        // A vertical stack container that holds all the elements of the view
        VStack {
            // A list of the messages
            List(messages, id: \.self) { message in
                // A text view for each message
                Text(message)
            }
            
            // A horizontal stack container for the input field and send button
            HStack {
                // A text field for the user to enter their message
                TextField("Enter message", text: $message)
                    .onSubmit {
                        sendMessage();
                    }
                // A button to send the message
                Button(action: sendMessage) {
                    Text("Send")
                }
            }
            .padding()
        }
    }
    
    // Method to send the message
    func sendMessage() {
        // Append the entered message to the array of messages
        if (message != "") {
            messages.append(message)
            // Clear the input field
            message = ""
        }
    }
}