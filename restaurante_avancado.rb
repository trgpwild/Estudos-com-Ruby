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

class Array
  def cria_uma_array
    array = []
    self.each do |elemento|
      array << yield(elemento)
    end
    array
  end  
end

nm_array = funcionarios.cria_uma_array { |nome| "teste: #{nome.upcase}" }

puts "funcionarios.cria_uma_array: #{nm_array}"

puts "-----------------------------------"

puts (1..7).to_a #=> [1, 2, 3, 4, 5, 6, 7]

puts "-----------------------------------"

puts (1..10).find_all { |i|  i % 3 == 0 } #=> [3, 6, 9]

puts "-----------------------------------"

puts [1,2,3,4,5].select { |num|  num.even?  } #=> [2, 4] numeros pares (.even?) retorna o proprio numero

puts "-----------------------------------"

puts (1..100).detect { |i| i % 5 == 0 and i % 7 == 0 } #=> 35 divisao exata (sem resto) com 5 e 7 e retorna o proprio numero

puts "-----------------------------------"

puts (1..100).select { |i| i % 5 == 0 and i % 7 == 0 } #=> [35, 70] divisao exata (sem resto) com 5 e 7 e retorna lista com os numeros encontrados

puts "-----------------------------------"

puts (1..100).find_index { |i| i % 5 == 0 and i % 7 == 0 }  #=> 34 retorna o indice do primeiro encontrado

puts "-----------------------------------"

puts (5..10).reduce(:+) #=> 45 soma todos os elementos do array (:+)

puts "-----------------------------------"

puts (5..10).inject { |sum, n| sum + n } #=> 45 tambem soma todos os elementos de uma forma mais verbosa

puts "-----------------------------------"

puts (5..10).reduce(:*) #=> 151200 multiplica todos os elementos do array

puts "-----------------------------------"

puts (5..10).inject(1) { |product, n| product * n } #=> 151200 multiplica todos os elementos do array de uma forma mais verbosa

puts "-----------------------------------"

#duas formas de criar um array de strings e pegar a maior palavra dentre elas

longest = ['cat', 'sheep', 'bear' ].inject do |memo, word|
   memo.length > word.length ? memo : word
end

puts longest

longest = %w{ cat sheep bear }.inject do |memo, word|
   memo.length > word.length ? memo : word
end

puts longest

puts "-----------------------------------"

caelum = [
  {:ruby => 'rr-71', :java => 'fj-11'}, 
  {:ruby => 'rr-75', :java => 'fj-21'} 
]

caelum.sort_by { |curso| curso[:ruby] }.each do |curso| 
  puts "Curso de RoR na Caelum: #{ curso[:ruby] }" 
end

puts "-----------------------------------"

caelum.sort_by { |curso| curso[:ruby] }.each do |curso| 
   next if curso[:ruby] == 'rr-71'
   puts "Curso de RoR na Caelum: #{ curso[:ruby] }" 
end
