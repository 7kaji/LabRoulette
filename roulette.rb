#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

SAY    = "/usr/bin/say"
PLAYER = "/usr/bin/afplay"
BGM    = "./gaki.mp3"

group  = { "M2" => %w(おくつ すがわら なかじま ふじい),
           "M1" => %w(たけみち こまつ ふるだて),
           "B4" => %w(おくとも かとう いのうえ あべ なかむら ひらが まいた かどわき ほし やぎぬま) }

class Roulette 
  def self.start members
    @result = Hash.new
    @members = members
    @members.each do | member |
      @result[member] = rand(10) + 1
    end
    @result = @result.sort{|a, b| b[1] <=> a[1]}
    if File.exist?("#{SAY}")
      speak
    end
    return @result
  end
  private
  def self.speak 
    result = @result.dup
    result.each_with_index do | elem, index |
      3.times { print "."; sleep(0.5) }
      puts message = "#{elem.join(", ")}点。"
      `#{SAY} #{message}`
      if index == result.length - 1
        threads = []
        puts message = "#{elem[0]}" + "ーーー。アウトーーー。"
        threads.push(Thread.new{`#{PLAYER} #{BGM}`})
        sleep(4)
        threads.push(Thread.new{`#{SAY} #{message}`})
        threads.each{|thread| thread.join}
      end
    end
  end
end

attr = ARGV[0] 
if group.include?(attr)
  Roulette.start(group[attr])
else
  Roulette.start($*)
end
