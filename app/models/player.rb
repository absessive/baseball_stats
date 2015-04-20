class Player < ActiveRecord::Base

  # Create and add players from a given year
  # year - The year for which data has to be loaded
  def self.get_players_from_xml_and_add(year)
    doc = Nokogiri::XML.parse(File.open(year.file.path))
    players = doc.xpath("//PLAYER")
    players.each do |p|
      create_player(p)
    end
  end

  def self.create_player(player)
    new_player = Player.new
    temp = {}
    player.children.to_a.each do |c|
      temp[c.name.downcase.to_sym] = c.text
    end
    new_player.name = temp[:given_name] + " " + temp[:surname]
    new_player.average = get_average(temp)
    new_player.hr = temp[:home_runs].to_i
    new_player.rbi = temp[:rbi].to_i
    new_player.runs = temp[:runs].to_i
    new_player.sb = (temp[:steals].to_i - temp[:caught_stealing].to_i)
    new_player.ops = get_ops(temp).round(3)
    position = temp[:position]
    new_player.save unless position.include?("Pitcher")
  end

  private
  def self.get_average(player_info)
    average = (player_info[:hits].to_f / player_info[:at_bats].to_f).round(3)
    average.is_a?(Numeric) ? average : 0
  end


  def self.get_ops(player_info)
    h = player_info[:hits].to_f
    bb = player_info[:walks].to_f
    hbp = player_info[:hit_by_pitch].to_f
    ab = player_info[:at_bats].to_f
    sf = player_info[:sacrifice_flies].to_f
    d = player_info[:doubles].to_f
    t = player_info[:triples].to_f
    hr = player_info[:home_runs].to_f
    b = h - d - t - hr
    ops =( (h+bb+hbp)/ (ab+bb+sf+hbp))+(((1*b)+(2*d)+(3*t)+(4*hr))/ab)
    ops.is_a?(Float) ? ops : 0
  end

end
