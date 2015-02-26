require 'sqlite3'
require_relative 'legislator.rb'
# legislator = Legislator.new

def senators_state(select_state)
  legislator =Legislator.select("lastname", "firstname", "party").where("state = '#{select_state}'")
  puts "Senators"
  legislator.where("title = 'Sen'")

  legislator.each do |field|
    puts "#{field.firstname}" + " " + "#{field.lastname}" + " " + "(" + "#{field.party}" + ")"
  end
end

def representative_state(select_state)
  legislator =Legislator.select("lastname", "firstname", "party").where("state = '#{select_state}'")
  puts "Representative"
  legislator.where("title = 'Rep'")

  legislator.each do |field|
    puts "#{field.firstname}" + " " + "#{field.lastname}" + " " + "(" + "#{field.party}" + ")"
end
end

def legislator_gender(select_gender, select_title)
  gender = Legislator.where("gender = '#{select_gender}'").where("title= '#{select_title}'").count
  total = Legislator.where("title = '#{select_title}'").count 
  percentage = ((gender.to_f / total.to_f)*100).round
      if select_gender == "M"
          puts "Male" + " "+ "#{select_title}: " "#{gender} " + "(" + percentage.to_s + "%" + ")"
      else
          puts "Female" + " " + "#{select_title}: " "#{gender} " + "(" + percentage.to_s + "%" + ")"
      end
  end 

def active_legislator
  active = Legislator.select("state").where("title = 'Sen'").where("in_office = '1'").group("state").count
  rep = Legislator.select("state").where("title = 'Rep'").where("in_office = '1'").group("state").count

  rep = rep.sort_by {|key, value| value}.reverse!

  rep.each do |key, value|
    p "#{key}: " "#{active[key]} Senators, #{value} Representative(s)"
  end

end 

def del_inactive
  p Legislator.where(:in_office => 0).destroy_all
end

def total_legislator
  sen = Legislator.select("title").where("title = 'Sen'").count
  rep = Legislator.select("title").where("title = 'Rep'").count

  p " Senators : #{sen}"
  p "Representatives : #{rep}"
end


senators_state("IN")

representative_state("NY")

puts legislator_gender("F","Rep")

active_legislator

del_inactive

total_legislator