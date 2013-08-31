# encoding: UTF-8
class Animal
  def come
    "comendo"
  end
end

class Pato < Animal
  def quack
    "Quack!"
  end
end

pato = Pato.new

puts pato.come

class PatoNormal
  def faz_quack
    "Quack!"
  end
end

class PatoEstranho
  def faz_quack
    "Queck!"
  end
end

class CriadorDePatos
  def castiga(pato)
    pato.faz_quack
  end
end

pato1 = PatoNormal.new
pato2 = PatoEstranho.new
c = CriadorDePatos.new
puts c.castiga(pato1) # => "Quack!"
puts c.castiga(pato2) # => "Queck!"
