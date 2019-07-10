class Bob
  def hey(string)
    if (string.downcase != string.upcase) && (string == string.upcase)
      'Whoa, chill ou!'
    elsif string[-1] == '?'
      'Sure.'
    elsif string.strip != ''
      'Whatever.'
    else
      'Fine. Be that way!'
    end
  end
end
