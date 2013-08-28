# encoding: UTF-8

require 'net/http' 

Net::HTTP.start( 'www.google.com.br', 80 ) do |http| 
    puts http.get( '/' ).body
end

print "Escreva um texto: " 
texto = gets
File.open( "arquivo_teste.txt", "w" ) do |f| 
  f << texto 
end
E para imprimir seu conteúdo:

puts File.read("arquivo_teste.txt")


Dir.entries('../Estudos_com_Ruby').each do |file_name|
   idea = File.read( file_name )
   puts idea
end
