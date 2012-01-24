#!/usr/bin/env ruby
# encoding: utf-8
require 'parslet' 
class UcoollParser < Parslet::Parser

    # Single character rule
    rule(:eol)        { line_end.repeat(1) }
    rule(:line_end)   { crlf >> space.maybe }
    rule(:crlf)       { match('[\r\n]').repeat(1) }
    rule(:space)      { match('\s').repeat(1) }
    # Things
    rule(:usertag)    { match['[:alnum:]'].repeat >> space.maybe }  
    rule(:command)    { (str('create') | str('read') | str('update') | str('delete')) >> space.maybe }
    # Grammar part
    rule(:ucooll_expression) { command >> usertag >> eol }
    rule(:root)              { ucooll_expression }

end

def parse(str)
    uparser = UcoollParser.new
    print "Parsing #{str}: "
    p uparser.parse(str)
rescue Parslet::ParseFailed => error
    puts error, uparser.root.error_tree
end

#parse "create "
#parse "create definition \r\n "
#parse "create definition 
