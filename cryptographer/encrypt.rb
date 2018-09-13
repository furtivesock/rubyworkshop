class EncryptionEngine

    def encrypt(string)
        encrypted_text = ""
        string.each_char { |c|
            if not "ABCDEFGHIJKLMNOPQRSTUVWXYZ".include? c.capitalize
                encrypted_text += c
            elsif c.capitalize == c
                encrypted_text += ((c.ord - 65 + 13) % 26 + 65).chr
            else
                encrypted_text += ((c.ord - 97 + 13) % 26 + 97).chr
            end
        }
        return encrypted_text
    end
    
    def decrypt(string)
        decrypted_text = ""
        string.each_char { |c|
            if not "ABCDEFGHIJKLMNOPQRSTUVWXYZ".include? c.capitalize
                decrypted_text += c
            elsif c.capitalize == c
                decrypted_text += ((c.ord - 65 - 13) % 26 + 65).chr
            else
                decrypted_text += ((c.ord - 97 - 13) % 26 + 97).chr
            end
        }
        return decrypted_text
    end
    
end