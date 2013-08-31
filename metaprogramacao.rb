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

class Restaurante
  def initialize(nome)
    puts "criando um novo restaurante: #{nome}"
    @@total ||= 0
    @@total = @@total + 1
    puts "Restaurantes criados: #{@@total}"
    @nome = nome
  end
end

class Restaurante
  def self.relatorio
    puts "Foram criados #{@@total} restaurantes"
  end
end

rest = Restaurante.new "teste"

Restaurante.relatorio

# Refatorando a classe e usando agrupamento para os metodos de classe
class Restaurante

  class << self # É dessa maneira que se agrupa, dentro de uma classe interna
    def relatorio
      puts "Foram criados #{@@total} restaurantes"
    end
  end

end

#texto = "nao sou vazio"
#texto.empty? # => false

#class Pessoa
#  def ==(outra)
#    self.cpf == outra.cpf
#  end
#end

class Aluno
  # nao sabe nada
end

class Professor
  def ensina(aluno)
    def aluno.escreve
      "sei escrever!"
    end
  end
end

juca = Aluno.new
puts "Juca sabe escrever? #{juca.respond_to? :escreve}"
# => false

professor = Professor.new
professor.ensina juca
puts juca.escreve
# => "sei escrever!"

class Pessoa
  attr_accessor :nome # Cria os metodos 'nome' e 'nome='
end

p = Pessoa.new
p.nome = "Joaquim"
puts p.nome
# => "Joaquim"

#Encapsulamento
class Pessoa

  private
  def vai_ao_banheiro
    # ...
  end

  public
  def sou_um_metodo_publico
    # ...
  end

end
