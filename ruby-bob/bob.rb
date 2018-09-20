class Bob
    def hey(string)
        if string.downcase != string.upcase and string == string.upcase
            return "Whoa, chill out!"
        elsif string[-1] == "?"
            return "Sure."
        elsif string.strip != ""
            return "Whatever."
        else
            return "Fine. Be that way!"
        end
    end
end