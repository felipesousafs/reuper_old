# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ruby encoding: utf-8

ActiveRecord::Base.connection.execute("TRUNCATE quartos RESTART IDENTITY")
ActiveRecord::Base.connection.execute("TRUNCATE cursos RESTART IDENTITY")
ActiveRecord::Base.connection.execute("TRUNCATE residentes RESTART IDENTITY")
ActiveRecord::Base.connection.execute("TRUNCATE lixotodos RESTART IDENTITY")
ActiveRecord::Base.connection.execute("TRUNCATE lixodones RESTART IDENTITY")


#Criar quartos
Quarto.create(numero: 1, piso: 'Inferior')
Quarto.create(numero: 2, piso: 'Inferior')
Quarto.create(numero: 3, piso: 'Inferior')
Quarto.create(numero: 4, piso: 'Inferior')
Quarto.create(numero: 5, piso: 'Inferior')
Quarto.create(numero: 6, piso: 'Inferior')
Quarto.create(numero: 7, piso: 'Inferior')
Quarto.create(numero: 8, piso: 'Inferior')
Quarto.create(numero: 9, piso: 'Inferior')
Quarto.create(numero: 10, piso: 'Inferior')
Quarto.create(numero: 11, piso: 'Inferior')
Quarto.create(numero: 12, piso: 'Inferior')
Quarto.create(numero: 13, piso: 'Inferior')
Quarto.create(numero: 14, piso: 'Inferior')
Quarto.create(numero: 15, piso: 'Inferior')
Quarto.create(numero: 16, piso: 'Inferior')
Quarto.create(numero: 1, piso: 'Superior')
Quarto.create(numero: 2, piso: 'Superior')
Quarto.create(numero: 3, piso: 'Superior')
Quarto.create(numero: 4, piso: 'Superior')
Quarto.create(numero: 5, piso: 'Superior')
Quarto.create(numero: 6, piso: 'Superior')
Quarto.create(numero: 7, piso: 'Superior')
Quarto.create(numero: 8, piso: 'Superior')
Quarto.create(numero: 9, piso: 'Superior')
Quarto.create(numero: 10, piso: 'Superior')
Quarto.create(numero: 11, piso: 'Superior')
Quarto.create(numero: 12, piso: 'Superior')
Quarto.create(numero: 13, piso: 'Superior')
Quarto.create(numero: 14, piso: 'Superior')
Quarto.create(numero: 15, piso: 'Superior')
Quarto.create(numero: 16, piso: 'Superior')
#Criar Cursos
# Curso.create(nome: 'Nutrição')
# Curso.create(nome: 'Farmácia')
# Curso.create(nome: 'Medicina')
# Curso.create(nome: 'Enfermagem')
# Curso.create(nome: 'Odontologia')
# Curso.create(nome: 'Ciência da Computação')
# Curso.create(nome: 'Matemárica')
# Curso.create(nome: 'Física')
# Curso.create(nome: 'Química')
# Curso.create(nome: 'Ciências Biológicas')
# Curso.create(nome: 'Estatística')
# Curso.create(nome: 'Arqueologia')
# Curso.create(nome: 'Ciências da Natureza')
# Curso.create(nome: 'Arquitetura')
# Curso.create(nome: 'Engenharia Civil')
# Curso.create(nome: 'Engenharia de Agrimensura')
# Curso.create(nome: 'Engenharia de Produção')
# Curso.create(nome: 'Engenharia dos Materiais')
# Curso.create(nome: 'Engenharia Mecânica')
# Curso.create(nome: 'Pedagogia')
# Curso.create(nome: 'Música')
# Curso.create(nome: 'Comunicação Social')
# Curso.create(nome: 'Design da Moda e Estilismo')
# Curso.create(nome: 'Artes Visuais')
# Curso.create(nome: 'Administração')
# Curso.create(nome: 'Letras - Português/Francês')
# Curso.create(nome: 'Letras - Português')
# Curso.create(nome: 'Serviço Social')
# Curso.create(nome: 'Ciências Econômicas')
# Curso.create(nome: 'Ciências Contábeis')
# Curso.create(nome: 'Direito')
# Curso.create(nome: 'Letras - Inglês')
# Curso.create(nome: 'Ciência Política')
# Curso.create(nome: 'Ciências Sociais')
# Curso.create(nome: 'Filosofia')
# Curso.create(nome: 'Geografia')
# Curso.create(nome: 'Histíria')
# Curso.create(nome: 'Letras - Libras')
# Curso.create(nome: 'Educação Física')
# Curso.create(nome: 'Medicina Veterinária')
# Curso.create(nome: 'Engenharia Agronômica')
# Curso.create(nome: 'Engenharia Elétrica')
file1 = File.read('app/assets/images/matriculas_cursos.json')
json1 = JSON.parse(file1)

json1.each do |reg|
  curso_nome = reg['curso']
  Curso.find_or_create_by(nome: curso_nome.to_s)
end
