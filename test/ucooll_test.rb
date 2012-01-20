#!/usr/bin/env ruby
# encoding: utf-8

require "test/unit"
require_relative "../lib/ucooll.rb"

class ActitivyTest < Test::Unit::TestCase
    def test_defition_macros
        a=Definition.new
        a.expression "mon S.I.G.L.E."
        a.meaning "signification"
        a.related "O.T.H.E.R."
        a.author "moi"
        assert_equal("mon S.I.G.L.E.",a.elements[:expression])
        assert_equal("signification",a.elements[:meaning])
        assert_equal("O.T.H.E.R.",a.elements[:related])
        assert_equal("moi",a.elements[:author])
    end
end


