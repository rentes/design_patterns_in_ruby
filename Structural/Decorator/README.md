# Decorator
This pattern, also called a Wrapper, allows a behavior to be added to an individual object, either statically or dynamically, without
affecting the behavior of other objects from the same class. It can be used to extend (decorate) the functionality of a certain object statically, or in some cases at run-time, independently of other instances of the same class. This is achieved by designing a new decorator class that wraps the original class, by the following sequence of steps:

1. Subclass the original "Component" class into a "Decorator" class;
2. In the "Decorator" class, add a "Component" pointer as a field;
3. Pass a "Component" to the "Decorator" constructor to initialize the "Component" pointer;
4. In the "Decorator" class, redirect all "Component" methods to the "Component" pointer; and finally,
5. In the "ConcreteDecorator" class, override any "Component" method(s) whose behavior needs to be modified.

This pattern is designed so that multiple decorators can be stacked on top of each other, each time adding a new functionality to the overridden method(s). 

The Decorator pattern is an alternative to subclassing. Subclassing adds behavior at compile time, and the change affects all instances of the original class; decorating can provide new behavior at run-time for individual objects.
