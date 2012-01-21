#!/usr/bin/env ruby
# encoding: utf-8

require "test/unit"
require_relative "../lib/ucooll.rb"

class ActitivyTest < Test::Unit::TestCase
    def test_defition_constructor
        d=Definition.new do
            expression "mon S.I.G.L.E."
            meaning "signification"
            related "O.T.H.E.R."
            author "moi"
        end
        assert_equal("mon S.I.G.L.E.",d.elements[:expression])
        assert_equal("signification",d.elements[:meaning])
        assert_equal("O.T.H.E.R.",d.elements[:related])
        assert_equal("moi",d.elements[:author])
    end

    def test_defining_method
         d=defining "mon S.I.G.L.E." do
            meaning "signification"
            related "O.T.H.E.R."
            author "moi"
        end
        assert_equal("mon S.I.G.L.E.",d.elements[:expression])
        assert_equal("signification",d.elements[:meaning])
        assert_equal("O.T.H.E.R.",d.elements[:related])
        assert_equal("moi",d.elements[:author])
        d.elements.each_pair{ |k,e| puts "#{k} ~~> #{e}"}
    end
end


