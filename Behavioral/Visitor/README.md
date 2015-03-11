# Visitor
Separates an algorithm from an object structure by moving the hierarchy of methods into one object. The nature of the Visitor makes it an ideal pattern to plug into public APIs thus allowing its clients to perform operations on a class using a “visiting” class without having to modify the source.

A practical result of this separation is the ability to add new operations to existing object structures without modifying those structures. In essence, the visitor allows one to add new virtual functions to a family of classes without modifying the classes themselves; instead, one creates a visitor class that implements all of the appropriate specializations of the virtual function. The visitor takes the instance reference as input, and implements the goal through double dispatch.
