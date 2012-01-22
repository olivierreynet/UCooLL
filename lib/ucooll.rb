#!/usr/bin/env ruby
# encoding: utf-8

module UCooLL

    class Activity 
        attr_accessor :elements
        def initialize(&block)
            @elements={}
            if block_given?
                instance_eval(&block)
            end
        end
    end

    def create_activity(name,*args)
        Object.const_set(name.capitalize,Class.new(Activity)) if not Object.const_defined?(name.capitalize)
        class_name = Object.const_get(name.capitalize)
        puts "New class : #{class_name}"
        args.each do |a|
            class_name.class_eval do 
                define_method a do |value|
                    @elements[a]=value
                end
            end
        end
    end

    def method_missing(method_name,&block)
            puts "Method missing !"
        if  Object.const_defined?(method_name.to_s.capitalize)
            class_name=Object.const_get(method_name.to_s.capitalize)
            d=class_name.new do
                instance_eval(&block)
            end
        end
    end

end

#    def defining(expr,&block)
#        if block_given?
#            d=Definition.new do 
#                expression expr 
#                instance_eval(&block)
#            end
#            return d
#        end
#   end

