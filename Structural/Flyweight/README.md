# Flyweight
This pattern reduces the cost of creating and manipulating a large number of similar objects.

A flyweight is an object that minimizes memory use by sharing as much data as possible with other similar objects. It represents a solution to use objects in large numbers when a simple repeated representation would use an unacceptable amount of memory. Often some parts of the object state can be shared, and it is common practice to hold them in external data structures, and pass them to the flyweight objects temporarily when they are used.
