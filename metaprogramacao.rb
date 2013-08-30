# encoding: UTF-8

class Pessoa
  # ...
end

def Pessoa.pessoas_no_mundo
  100
end

puts Pessoa.pessoas_no_mundo

class Pessoa

  def self.pessoas_no_mundo
    200
  end

end

puts Pessoa.pessoas_no_mundo

p = Pessoa.new

def p.anda
  puts "andando"
end

p.anda

#p2 = Pessoa.new
#p2.anda #Isso falharia porque o metodo anda somente existe na instancia 'p'
