class BeerSong
    def verse (numero)
        if numero == 0
            return "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
        elsif numero > 2
            return "#{numero} bottles of beer on the wall, #{numero} bottles of beer.\nTake one down and pass it around, #{numero-1} bottles of beer on the wall.\n"
        elsif numero == 2
            return "#{numero} bottles of beer on the wall, #{numero} bottles of beer.\nTake one down and pass it around, #{numero-1} bottle of beer on the wall.\n"
        elsif numero == 1
            return "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
        end
        
    end

    def verses (max,min)
        text = ""
        for i in (min..max).reverse_each
            text+=verse(i)
            if i!=min
                text+="\n"
            end
        end
        return text
    end

    def lyrics
        return verses(99,0)
    end
end

class BookKeeping
    VERSION = 2
end