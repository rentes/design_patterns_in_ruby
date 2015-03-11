# Interpreter
Implements a specialized language. This pattern specifies how to evaluate sentences in a language. The basic idea is to have a class for each symbol (terminal or nonterminal) in a specialized computer language. The syntax tree of a sentence in the language is an instance of the composite pattern and is used to evaluate (interpret) the sentence for a client. Uses for this pattern include:

* Specialized database query languages such as SQL;
* Specialized computer languages which are often used to describe communication protocols;
* Most general-purpose computer languages actually incorporate several specialized languages.
