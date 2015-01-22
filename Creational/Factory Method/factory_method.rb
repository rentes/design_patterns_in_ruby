# Application Abstraction capable of manipulating documents
# This is the Creator class
class Application
  attr_accessor :doc

  # Factory Method Abstraction
  def create_document
  end

  def new_document
    @doc = create_document
  end

  def open_document
    @doc.open
  end
end

# Document Abstraction
# This is the Product class
class Document
  def open
    puts 'Document: opening document'
  end

  def close
    puts 'Document: closing document'
  end

  def save
    puts 'Document: saving document'
  end
end

# Concrete Creator class that contains the implementation of an application
# able to manipulate documents of type MyDocument
class MyApplication < Application
  # The Factory Method implementation. This method is specialized
  # when creating documents of type MyDocument
  def create_document
    MyDocument.new
  end
end

# Concrete Product class that contains the implementation of
# a document of type MyDocument
class MyDocument < Document
end

doc = MyDocument.new
doc.open
doc.save
doc.close
