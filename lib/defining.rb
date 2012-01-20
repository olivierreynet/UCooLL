#!/usr/bin/env ruby
# encoding: utf-8

require 'erb'
require 'optparse'

module defining

  class Definition
    attr_accessor :expression,:meaning,:related
    def initialize(expression, meaning, related)
      @expression=expression
      @meaning=meaning
      @related=related
    end
  end

  class Builder
    def initialize(&block)
      @questions = []
      @options={}
      if block_given?
         instance_eval(&block)
      end
    end
    def self.option(key)
      define_method(key) do |value|
        @options[key]=value
      end
    end
    def method_missing(m, *args, &block)
     if (Question.types.include?(m))
        @questions <<  Question.new(m,args[0],&block)
      else
        puts "There's no method called #{m} here -- please try again."
      end
    end
    def dump  extension
      output_template = File.open("#{extension}_template.erb", 'rb') { |f| f.read }
      generator = ERB.new(output_template,nil,'-')
      gres=generator.result(self.get_binding).gsub(/[[:blank:]]+/, " ")
      fileOut="#{@options[:title].tr(' ','_')}.#{extension}"
      puts "==> dumping quiz in file : #{fileOut}"
      File.open(fileOut,'w') do |f|
        f << gres
        f.close
      end
      puts "==> done"
    end
    def get_binding
      binding
    end
    option :title
    option :category
  end

end

