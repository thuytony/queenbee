The figure bellow represents the variation applied in this project:

In this case, we're only using three layers: Presentation, Domain and Data.

The presentation layer (UI)
This is the layer where the Flutter framework resides. Here, you'll find classes that are part of the framework, such as Widgets, BuildContexts, and libraries that consume the framework, including state management libraries.

Typically, the classes in this layer are responsible for:

Managing the application's state.
Handling UI aspects of an app, such as managing page navigation, displaying data, implementing internationalization, and ensuring proper UI updates.
The domain layer
This layer represents the core domain of the problem we are addressing, encompassing the business rules. Hence, it should be an independent Dart module without dependencies on external layers. It includes:

Plain entity classes (like Character entity)
Use-case classes that encapsulate the specific business logic for a given use case (like GetAllCharacters, SignInUser, and others...)
Abstractions for data access, normally repository or services interfaces
A use-case has no knowledge of the data source, whether it comes from a memory cache, local storage, or the internet. All these implementation details have been abstracted out through the use of Repository Interfaces. From the use-case's perspective, all that matters is that it receives the required data.

The data layer
This layer serves as a boundary between our application and the external world. Its primary responsibility is to load data from external sources, such as the internet or databases, and convert it to a format that aligns with our Domain expectations. It plays a vital role in supplying data to the use cases and performs the following tasks:

Data retrieval: It makes network and/or database calls, retrieving data from the appropriate data sources.
Repository implementations: It includes the implementations of the repositories defined in the domain layer, providing concrete functionality for accessing and manipulating data.
Data coordination: It coordinates the flow of data between multiple sources. For example, it can fetch data from the network, store it locally, and then return it to the use case.
Data (de)serialization: It handles the conversion of data to and from JSON format, transforming it into Data Transfer Objects (DTOs) for standardized representation.
Caching management: It can incorporate caching mechanisms, optimizing performance by storing frequently accessed data for quicker retrieval.
The DTOs, Entities and States
As mentioned previously, this architecture emphasizes two fundamental principles: 'Separation of Concerns' and 'Single Responsibility.' And to uphold these principles, it is crucial to allow each layer to effectively handle data according to its specific needs. This can be achieved by utilizing classes with specialized characteristics that empower their usage within each layer.

In this project, the Data layer employs Data Transfer Objects (DTOs), the Domain layer utilizes Entities, and the Presentation layer the States classes.

DTOs are specifically designed for deserializing and serializing data when communicating with the network. Hence, it is logical for them to possess the necessary knowledge of JSON serialization. Entities, on the other hand, represent the core concepts of our domain and contain 'plain' data or methods relevant to their purpose. Lastly, in the Presentation layer, States are used to represent the way we display and interact with the data in the user interface.

The specific usage of these classes may vary from project to project. The names assigned to them can differ, and there can even be additional types of classes, such as those specifically designed for database mapping. However, the underlying principle remains consistent: By utilizing these classes alongside mappers, we can provide each layer with a suitable data format and the flexibility to adapt to future changes.