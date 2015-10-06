#!/usr/bin/ruby

class PlayYahtzee
    
    attr_accessor :score
    
    def initialize(rule)
        @score = 0
        roll = []
        5.times do |i|
            i = rand(1..5)
            roll.push(i)
        end
#        puts roll
        @rule = rule
        m = self.method(@rule)
        @score = m.call(roll,@score)
    end
            
    def fullHouse(roll,score)
        if roll.uniq.size().eql? 2
            @score += 30
        else 
            @score += 0
        end
    end

    def count_n(roll,score)  
        @score += roll.count(roll[0]) * roll[0]
    end

    def sm_straight(roll,score)
        a = roll.sort()
        b = a.first
        if roll.include?([b..b+3])
            @score += 30
        else 
            @score += 0
        end
    end
 
    def lg_straight(roll,score)
        if roll.uniq.size().eql? 5
            @score += 40
        else 
            @score += 0
        end
    end

    def chance(roll,score)
        @score = roll.reduce(:+)
    end
 
    def yahtzee(roll,score)
        if roll.uniq.size().eql? 1
            @score += 50
        else 
            @score += 0
        end
    end
end

puts "enter rule"
r = STDIN.gets.chomp()
scr = PlayYahtzee.new(r)
puts scr.score
