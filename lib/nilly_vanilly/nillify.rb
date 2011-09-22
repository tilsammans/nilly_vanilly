module NillyVanilly
  #the main logic code for this plugin
  module Nillify
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      #the method used to setting the attributes that you want to 'nillify'
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
      #set attributes to nil if empty string exists
      def nillification
        for attribute in self.class.nillify_attributes
          self.send("#{attribute}=", nil) if self.send(attribute) == ""
        end
      end
    end
  end
end