# Facade
This pattern provides a simplified interface to a large body of code, such as a class library.

The Facade pattern is often used when a system is very complex or difficult to understand because the system has a large number of interdependent classes or its source code is unavailable. This pattern hides the complexities of the larger system and provides a simpler interface to the client. These members access the system on behalf of the facade client and hide the implementation details.

A facade can:

* make a software library easier to use, understand and test, and more readable, since the facade has convenient methods for common tasks;
* reduce dependencies of outside code on the inner workings of a library, since most code uses the facade, thus allowing more flexibility in developing the system;
* wrap a poorly designed collection of APIs with a single well-designed API (as per task needs).
