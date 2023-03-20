class ApplicationRecord < ActiveRecord::Base
  # Sets the application record class for Active Record
  # This is useful if your application uses a different class than ApplicationRecord for your primary abstract class. This class will share a database connection with Active Record. It is the class that connects to your primary database.
  primary_abstract_class
end
