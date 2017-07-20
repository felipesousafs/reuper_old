# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ruby encoding: utf-8

ActiveRecord::Base.connection.execute("TRUNCATE quartos RESTART IDENTITY")
ActiveRecord::Base.connection.execute("TRUNCATE residentes RESTART IDENTITY")
ActiveRecord::Base.connection.execute("TRUNCATE cursos RESTART IDENTITY")

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
Curso.create(nome: 'Nutrição')
Curso.create(nome: 'Farmácia')
Curso.create(nome: 'Medicina')
Curso.create(nome: 'Enfermagem')
Curso.create(nome: 'Odontologia')
Curso.create(nome: 'Ciência da Computação')
Curso.create(nome: 'Matemárica')
Curso.create(nome: 'Física')
Curso.create(nome: 'Química')
Curso.create(nome: 'Ciências Biológicas')
Curso.create(nome: 'Estatística')
Curso.create(nome: 'Arqueologia')
Curso.create(nome: 'Ciências da Natureza')
Curso.create(nome: 'Arquitetura')
Curso.create(nome: 'Engenharia Civil')
Curso.create(nome: 'Engenharia de Agrimensura')
Curso.create(nome: 'Engenharia de Produção')
Curso.create(nome: 'Engenharia dos Materiais')
Curso.create(nome: 'Engenharia Mecânica')
Curso.create(nome: 'Pedagogia')
Curso.create(nome: 'Música')
Curso.create(nome: 'Comunicação Social')
Curso.create(nome: 'Design da Moda e Estilismo')
Curso.create(nome: 'Artes Visuais')
Curso.create(nome: 'Administração')
Curso.create(nome: 'Letras - Português/Francês')
Curso.create(nome: 'Letras - Português')
Curso.create(nome: 'Serviço Social')
Curso.create(nome: 'Ciências Econômicas')
Curso.create(nome: 'Ciências Contábeis')
Curso.create(nome: 'Direito')
Curso.create(nome: 'Letras - Ingês')
Curso.create(nome: 'Ciência Política')
Curso.create(nome: 'Ciências Sociais')
Curso.create(nome: 'Filosofia')
Curso.create(nome: 'Geografia')
Curso.create(nome: 'Histíria')
Curso.create(nome: 'Letras - Libras')
Curso.create(nome: 'Educação Física')
Curso.create(nome: 'Medicina Veterinária')
Curso.create(nome: 'Engenharia Agronômica')
Curso.create(nome: 'Engenharia Elétrica')
#Residentes
residentes_list = [
    ['Felipe Sousa', 9, 5],
    ['Jeová Gomes', 9, 5],
    ['João Paulo Feitosa', 11, 5],
    ['João Paulo Castro', 10, 3],
    ['Eduardo Barroso', 12, 11],
    ['Eduardo Adriano', 14, 10],
    ['Felipe Castro', 11, 10],
    ['Francisca Damares', 13, 12],
    ['Isabella Custódio', 5, 15],
    ['Fábio Renan', 20, 18],
    ['Francisco Bruno', 22, 17],
    ['Francisco Allisson', 25, 18],
    ['Charles Lima', 31, 16],
    ['Valdemar Soares', 40, 16],
    ['Ana Jéssica', 30, 20],
    ['João Gabriel', 32, 22],
    ['Pablo Nunes', 22, 11],
    ['Jorge Augusto', 22, 12],
    ['Francisco Antônio (Markin)', 21, 12],
    ['Jonas Oliveira', 10, 13],
    ['Jonathan Alves', 5, 13]
]
matricula = 20150000
residentes_list.each do |nome, curso, quarto|
  Residente.create(nome: nome, matricula: matricula, curso_id: curso, quarto_id: quarto)
  matricula = matricula+1
end