# encoding: UTF-8

print "Digite um número:"
numero = gets.to_i

begin
  resultado = 100 / numero
rescue
  puts "Número digitado inválido!"
  exit
end

puts "100/#{numero} é #{resultado}"

puts "-----------------------------------------"

def verifica_idade(idade)
  unless idade > 18
    raise ArgumentError,
    "Você precisa ser maior de idade para jogar jogos violentos." 
  end
end

def digite_idade
  print "Digite sua idade:"
  idade = gets.to_i
  verifica_idade(idade)
end

digite_idade

puts "-----------------------------------------"

class IdadeInsuficienteException < Exception
end

def verifica_idade2(idade)
  raise IdadeInsuficienteException,
   "Você precisa ser maior de idade..." unless idade > 18
end

begin 
  verifica_idade2(13)
rescue IdadeInsuficienteException => e
  puts "Foi lançada a exception: #{e}"
end

def pesquisa_banco(nome)
  if nome.size<10
    throw :nome_invalido, "Nome invalido, digite novamente"
  end
  # executa a pesquisa
  "cliente #{nome}"
end

def executa_pesquisa(nome)
  catch :nome_invalido do
    cliente = pesquisa_banco(nome)
    return cliente
  end
end

puts executa_pesquisa("ana") # => "Nome invalido, digite novamente"

puts "-----------------------------------------"

puts executa_pesquisa("guilherme silveira") # => cliente guilherme silveira

puts "-----------------------------------------"

class Conta
  
  attr_reader :saldo
  
  def initialize(saldo)
    @saldo = saldo
  end

end

# require 'conta' # --> para importar o arquivo "conta.rb"

puts Conta.new(500).saldo
