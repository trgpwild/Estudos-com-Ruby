# encoding: UTF-8

class Restaurante
  
  attr_accessor :nota
  attr_accessor :nome

  def initialize(nome)
    @nome = nome
  end

  def qualifica(nota, msg="Obrigado")
    @nota = nota
    puts "A nota do restaurante #{@nome} foi #{@nota}. #{msg}"
  end
end

rest_um = Restaurante.new('Fogo de chao')

rest_um.qualifica(10)

rest_dois = Restaurante.new('Italiano')

rest_dois.qualifica(1, "Comida ruim")

class Pessoa
  def fala
    puts "Sei Falar"
  end
  def troca(roupa, lugar="banheiro")
    "trocando de #{roupa} no #{lugar}"
  end
end

pessoa = Pessoa.new()

puts pessoa.class

pessoa.send(:fala)

pessoa.troca("bermuda")

class Fixnum
  def +(outro)
    self - outro # fazendo a soma subtrair
  end
end

puts 3 + 3

class Pessoa

  def initialize(nome)
    puts "Criando o objeto Pessoa"
    @nome = nome
  end

  def muda_nome(nome)
    @nome = nome
  end
  
  def diz_nome
    "meu nome é #{@nome}"
  end
end

p = Pessoa.new("Joao")

puts p.diz_nome

p.muda_nome "Thiago"

puts p.diz_nome

class Pessoa
  def nome # acessor
    @nome
  end
  
  def nome=(novo_nome)
    @nome = novo_nome
  end
end

p.nome = "Jose"

puts p.diz_nome

puts p.nome

lista = Array.new
lista << "RR-71"
lista << "RR-75"
lista << "FJ-91"

puts lista.size

puts lista[1]
puts lista[0]

lista = [1, 2, "string", :simbolo, /$regex^/]
puts lista[2]

puts p.methods[0]

class Pessoa
  def compra(*produtos)
    puts produtos.size
  end
end

puts p.compra('tenis','camiseta')

config = Hash.new
config[:porta] = 80
config["ssh"] = false
config["nome"] = "Caelum.com.br"

puts config.size

puts "porta: #{config[:porta]}"
puts "ssh: #{config["ssh"]}"

class Conta
  def transfere(infos)
    puts "destino: #{infos[:destino]}"
    puts "data: #{infos[:data]}"
    puts "valor: #{infos[:valor]}"
  end
end

conta = Conta.new

conta.transfere({
  :destino => 'escola', 
  :data => Time.now, 
  :valor => 50.00
})

class Conta
  def transfere(valor, infos)
    puts "transferindo #{valor} para #{infos[:para]} em #{infos[:em]}"
  end
end

conta.transfere(50.00, { :para => 'escola', :em => Time.now })

class Banco
  
  def initialize(contas)
    @contas = contas
  end
  
  def status
    saldo = 0
    for conta in @contas
      saldo += conta
    end
    saldo
  end
  
end

banco = Banco.new([200, 300, 400])
puts banco.status

class Banco

  def status(&block)
    saldo = 0
    for conta in @contas
      saldo += conta
      if block_given?
        block.call saldo
      end
    end
    saldo
  end

end

puts "-----------------------------------"

banco.status do |saldo_parcial|
  puts saldo_parcial
end

puts "-----------------------------------"

banco.status { |saldo_parcial| puts saldo_parcial }

puts "-----------------------------------"

#Mais uma forma de invocar blocos para programacao funcional

class Banco
  def status
    saldo = 0
    for conta in @contas
      saldo += conta
      if block_given?
        yield(saldo) #somente com o metodo 'yeld'
      end
    end
    saldo
  end
end

banco.status { |saldo_parcial| puts saldo_parcial }

puts "-----------------------------------"

lista = ["rails", "rake", "ruby", "rvm"]
lista.each do |programa|
  puts programa
end

puts "-----------------------------------"

funcionarios = ["Guilherme", "Sergio", "David"]
nomes_maiusculos = []

funcionarios.each do |nome|
  nomes_maiusculos << nome.upcase
end

puts "normais: #{funcionarios}"
puts "maiusculos: #{nomes_maiusculos}"

puts "-----------------------------------"

