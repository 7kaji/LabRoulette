#!/usr/bin/env ruby
# -*- coding: eucjp -*-

group  = { "M2" => %w(������ ������� �ʤ����� �դ���),
           "M1" => %w(�����ߤ� ���ޤ� �դ����),
           "B4" => %w(�����Ȥ� ���Ȥ� ���Τ��� ���� �ʤ���� �Ҥ餬 �ޤ��� ���ɤ來 �ۤ� �䤮�̤�) }

class Roulette 
  def self.start members
    @result = Hash.new
    @members = members
    @members.each do | member |
      @result[member] = rand(10) + 1
    end
    @result = @result.sort{|a, b| b[1] <=> a[1]}
    if File.exist?("/usr/bin/say")
      speak
    end
    return @result
  end
  private
  def self.speak 
    result = @result.dup
    result.each_with_index do | elem, index |
      3.times { print "."; sleep(0.5) }
      puts message = "#{elem.join(", ")}����"
      `/usr/bin/say #{message}`
      if index == result.length - 1
        threads = []
        puts message = "#{elem[0]}" + "�������������ȡ�������"
        threads.push(Thread.new{`/usr/bin/afplay ./gaki.mp3`})
        sleep(4)
        threads.push(Thread.new{`/usr/bin/say #{message}`})
        threads.each{|thread| thread.join}
      end
    end
  end
end

attr = ARGV[0] 
if group.include?(attr)
  Roulette.start(group[attr])
else
  p Roulette.start($*)
end
