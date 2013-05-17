class Array
  def get_point
    number = 0
    number = rand(10) + 1
  end

  def roulette
    return self if self.size <= 1

    master = Hash.new
    master = self.map do |p|
      {
        :name => p,
        :point => get_point 
      }
    end

    master.each do |p|
      3.times do
        print '.'
        sleep 0.5
      end
      puts kyoko = "#{p[:name].to_s.capitalize},  #{p[:point].to_s} 点。"
      system("say #{kyoko}")
    end
    outman = master.sort{|a,b| a[:point] <=> b[:point]}
    puts kyoko = "#{outman.first[:name].to_s.capitalize}ーーー。アウトーーー。"
    system("afplay gaki.mp3")
    system("say #{kyoko}")
  end

end

