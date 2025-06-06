There are two main points to understand about the architecture: it splits the project into different layers and conforms to the Dependency rule.

The number of layers used can vary slightly from one project to another, but by utilizing them, we promote the principle of 'separation of concerns.' If you're a new developer and have never heard of it before, it's simply a fancy way of saying, 'Hey! I'm a layer, and I'm concerned about a single aspect of the system only'. If a layer is responsible for displaying the UI, it won't handle database operations. Conversely, if a layer is responsible for data persistence, it won't have any knowledge of UI components

And what about the Dependency rule? Let's put it in simple terms. First, you need to understand that the layers discussed above are not stacked on top of each other; instead, they resemble the layers of an 'onion.' There is a central layer surrounded by outer layers. The Dependency rule states that classes within a layer can only access classes from their own layer or the outer layers, but never from the inner layers

Usually, when working with this architecture, you'll come across some additional terminology such as Entities, Interface Adapters, Use Cases, DTOs, and other terms. These terms are simply names given to components that also fulfill 'single responsibilities' within the project:

Entities: Represent the core business objects, often reflecting real-world entities. Examples include Character, Episode, or Location classes. These entities usually correspond to real-world concepts or objects, possessing properties specific to them and encapsulating behavior through their own methods. You'll be reading, writting, and transforming entities throughout the layers

Interface Adapters: Also known as Adapters, they're responsible for bridging the gap between layers of the system, facilitating the conversion and mapping of data between layers. There are various approaches available, such as specialized mapper classes or inheritance. The point is, by using these adapters, each layer can work with data in a format that suits better for its needs. As data moves between layers, it is mapped to a format that is suitable for the next layer. Thus, any future changes can be addressed by modifying these adapters to accommodate the updated format without impacting the layer's internals

Use Cases: Also known as Interactors, they contain the core business logic and coordinate the flow of data. For example, they handle user login/logout, data saving or retrieval, and other functionalities. Use Case classes are typically imported and used by classes in the presentation (UI) layer. They also utilize a technique called 'inversion of control' to be independent of the data retrieval or sending mechanism, while coordinating the flow of data

Data Transfer Objects (DTOs): Are objects used for transferring data between different layers of the system. They serve as simple containers that carry data without any behavior or business logic

Known limitations
The initial setup involves dealing with some boilerplate code
There is a risk of over-engineering the solution
Known benefits
A/B testing can be easily applied
Feature toggles can be effortlessly implemented
All layers can be independently unit tested
The unidirectional data flow facilitates code comprehension
UI becomes an implementation detail - In fact, we could even reuse the Domain and Data layers to create things like CLIs