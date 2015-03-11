# Proxy
This pattern provides a placeholder for another object to control access, reduce cost, and reduce complexity.

In its most general form, a proxy is a class functioning as an interface to something else: a network connection, a large object in memory, a file, or some other resource that is expensive or even impossible to duplicate. Typically, one instance of the complex object and multiple proxy objects are created, all of which contain a reference to the single original complex object. Any operations performed on the proxies are forwarded to the original object. Once all instances of the proxy are out of scope, the complex object's memory may be deallocated.
