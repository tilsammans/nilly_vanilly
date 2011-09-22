module NillyVanilly
  # Inject the nillifcation process in ActiveRecord
  module Nillify
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods

      # Register a before_save hook to nillify attributes defined by nillify_attributes accessor
      def nillify(*attributes)
        class_eval do
          before_save :nillification
        end

        cattr_accessor :nillify_attributes
        self.nillify_attributes = attributes

        include InstanceMethods
      end
    end

    module InstanceMethods
      
      # Nillify attribute if it is a empty string
      def nillification
        for attribute in self.class.nillify_attributes
          self.send("#{attribute}=", nil) if self.send(attribute) == ""
        end
      end
    end
  end
end