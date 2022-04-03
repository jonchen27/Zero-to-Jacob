access(all) contract SendEvent {

    pub event greeted(greeting:String)
    access(all) let greeting:String

    // The init() function is required if the contract contains any fields.
    init() {
        self.greeting = "Hello, World!"
    }

    // Public function that returns our friendly greeting!
    access(all) fun hello(): String {
        pre {
          self.greeting.length >= 0: "Greeting is invalid."
        }
        post {
          self.greeting.length <= 120: "Greeting is too long."
        }
        emit greeted(greeting: self.greeting)
        return self.greeting
    }
}
