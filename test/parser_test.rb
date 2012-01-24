#!/usr/bin/env ruby
# encoding: utf-8

require_relative '../lib/parser.rb'
require 'parslet/rig/rspec'

describe UcoollParser  do
    let(:parser) { UcoollParser.new }
    context "command" do
        it "should consume 'create'" do
            parser.command.should parse('create')
            parser.command.should parse('create   ')
        end 
        it "should consume 'read'" do
            parser.command.should parse('read')
            parser.command.should parse('read  ')
        end 
        it "should consume 'update'" do
            parser.command.should parse('update')
            parser.command.should parse('update  ')
        end 
        it "should consume 'delete'" do
            parser.command.should parse('delete')
            parser.command.should parse('delete  ')
        end 
    end
    context "usertag" do
        it "should consume 'definition'" do
            parser.usertag.should parse('definition')
            parser.usertag.should parse('definition   ')
        end
    end
    context "ucooll_expression" do
        it "should consume 'read definition \n'" do
            parser.ucooll_expression.should parse('read definition\r\n')
            parser.ucooll_expression.should parse('read definition  \r\n ')
        end
    end


end

