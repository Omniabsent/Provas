#menos versátil que o code 2, esse assume que os valores no format.yaml são apresentados na mesma ordem em que aparecem na string

require 'yaml'

input = ["97905796671Maria Neusa de00001234",
"44010762900Ricardo Fontes00000567"]

def solucao(arg)
  @yaml_format = YAML.load(File.read("format.yaml")).to_a
  @hash = {}

  arg.each do |cadastro|
    @hash1 = {@yaml_format[0][0] => cadastro.slice(0..@yaml_format[0][1]["length"].to_i-1)}
    @hash2 = {@yaml_format[1][0] => cadastro.slice(@yaml_format[0][1]["length"].to_i..@yaml_format[1][1]["length"].to_i+(@yaml_format[0][1]["length"].to_i-1)).strip}
    @hash3 = {@yaml_format[2][0] => cadastro.slice(@yaml_format[1][1]["length"].to_i+(@yaml_format[0][1]["length"].to_i)..@yaml_format[1][1]["length"].to_i+(@yaml_format[0][1]["length"].to_i+(@yaml_format[1][1]["length"].to_i-1))).to_i}

    @hash_final = @hash1.merge(@hash2.merge(@hash3))
    puts @hash_final
  end
end

solucao(input)
