#!/usr/bin/env ruby
# encoding: utf-8

class Activity 
    attr_accessor :elements
    def initialize
        @elements={}
    end
    def self.element(key)
        define_method(key) do |value|
            @elements[key]=value
        end
    end
end

class Definition < Activity
    def initialize(&block)
        super
        if block_given?
            instance_eval(&block)
        end
    end
    element :expression
    element :meaning
    element :related
    element :author
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

