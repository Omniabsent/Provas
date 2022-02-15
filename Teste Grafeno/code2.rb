require 'yaml'

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
  @yaml_format = YAML.load(File.read("format.yaml")).to_a
  @string = ""

  arg.each do |cadastro|
    i=0
    while i<3 do
      sorter(cadastro, i)
      i+=1
    end
    @string += "\n"
  end
  puts @string
end

def sorter(cadastro, i)
  case @yaml_format[i][0]
  when "cpf"
    @hash_cpf = @yaml_format[i][1]
    @campo_valor = cadastro[:cpf]
    padder(@hash_cpf)
  when "name"
    @hash_name = @yaml_format[i][1]
    @campo_valor = cadastro[:name]
    padder(@hash_name)
  when "value"
    @hash_value = @yaml_format[i][1]
    @campo_valor = cadastro[:value]
    padder(@hash_value)
  when "state"
    @hash_state = @yaml_format[i][1]
    @campo_valor = cadastro[:state]
    padder(@hash_state)
  end
end

def padder(hash)
  if hash["padding"] == "zeroes" then
    @padding_type = "0"
  else
    @padding_type = " "
  end

  if hash["align"] == "left" then
    @string += @campo_valor.slice(0..hash["length"].to_i-1).ljust(hash["length"].to_i, @padding_type)
  else
    @string += @campo_valor.slice(0..hash["length"].to_i-1).rjust(hash["length"].to_i, @padding_type)
  end
end

solucao(input)
