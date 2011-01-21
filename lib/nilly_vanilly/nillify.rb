module NillyVanilly
  module Nillify
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
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
      def nillification
        for attribute in self.class.nillify_attributes
          self.send("#{attribute}=", nil) if self.send(attribute) == ""
        end
      end
    end
  end
end