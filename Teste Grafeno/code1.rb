  input = [
  { name: 'Maria Neusa de Aparecida',
  cpf: '97905796671',
  state: 'Sao Paulo',
  value: '1234' },
  { name: 'Ricardo Fontes',
  cpf: '44010762900',
  state: 'Rio Grande do Sul',
  value: '567' }
  ]

  def solucao(arg)
    string = ""
    arg.each do |cadastro|
      string += (cadastro[:name]).slice(0..10).ljust(11, ' ')
      string += (cadastro[:cpf]).slice(0..10).ljust(11, ' ')
      string += (cadastro[:state]).slice(0..10).ljust(11, ' ')
      string += (cadastro[:value]).slice(0..10).ljust(11, ' ')
      string += "\n"
    end
    puts string
  end

  solucao(input)
