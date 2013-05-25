#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

group  = { "M2" => %w(おくつ すがわら なかじま ふじい),
           "M1" => %w(たけみち こまつ ふるだて),
           "B4" => %w(おくとも かとう いのうえ あべ なかむら ひらが まいた かどわき ほし やぎぬま) }

class Roulette 
  def initialize members
    @result  = Hash.new
    @message = Hash.new
    @members = Array.new(members)
  end
  def start
    @members.each do | member |
      @result[member] = rand(10) + 1
    end
    @result = @result.sort{|a, b| b[1] <=> a[1]}
    self.speak
  end
  protected
  def speak 
    result = @result.dup
    result.each_with_index do | elem, index |
      3.times do 
        print "."
        sleep(0.5)
      end
      if index == result.length - 1
        threads = []
        puts  "#{elem.join(", ")}点。"
        puts message = "#{elem[0]}" + "ーーー。アウトーーー。"
        threads.push(Thread.new{`/usr/bin/afplay ./gaki.mp3`})
        sleep(2)
        threads.push(Thread.new{`/usr/bin/say #{message}`})
        threads.each{|thread| thread.join}
      else
        puts message = "#{elem.join(", ")}点。"
        `/usr/bin/say #{message}`
      end
    end
  end
end

attr = ARGV[0] 
if group.include?(attr)
  Roulette.new(group[attr]).start
else
  Roulette.new($*).start
end
