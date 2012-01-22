#!/usr/bin/env ruby
# encoding: utf-8


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
    Object.const_set(name,Class.new(Activity)) if not Object.const_defined?(name)
    class_name = Object.const_get(name)
    puts "New class : #{class_name}"
    args.each do |a|
        class_name.class_eval do 
            define_method a do |value|
                @elements[a]=value
            end
        end
    end
end

def defining(expr,&block)
    if block_given?
        d=Definition.new do 
            expression expr 
            instance_eval(&block)
        end
        return d
    end
end

