#include <stdio.h>

/*
Fazer um algoritmo que leia a hora de entrada e de saída de um funcionário (considere apenas a hora inteira) e escreva o valor que ele deve receber. 
O funcionário recebe 10,00 por hora normal e 20% de adicional noturno (das 20 horas até às 8 horas da manhã). 
Considere também que o funcionário pode entrar em um dia e sair no dia seguinte, desde que respeite um número máximo de 23 horas consecutivas trabalhadas. 
Exemplos:
Hora inicial | Hora final | Horas (normais) | Horas (noturnas) | Valor a receber
9 | 15 | 6 | 0 | 60,00
6 | 21 | 12 | 3 | 156,00
19 | 11 | 4 | 12 | 184,00 
16 | 23 | 4 | 3 | 76,00
*/

int main(){
	int entrada=0;
	int saida=0;
	int horas=0;
	int salario=0;
	int normais=0;
	int noturnas=0;
	scanf ("%i", &entrada);
	scanf ("%i", &saida);
	if (entrada<saida){
		horas=(saida-entrada);
	} else {
		horas=(24-(entrada-saida));
	}
	printf("Horas totais: %i \n", horas);
	if (entrada<saida){                              //entra e sai no mesmo dia
		if ((entrada>=8)&&(saida<=20)){
			normais=horas;
		} else if ((entrada<8)&&(saida<=20)){
			normais=((8-entrada)+(saida-8));
		} else if ((entrada>=8)&&(saida>20)){
			normais=((20-saida)+(saida-entrada)); 
		} else if ((entrada<8)&&(saida>20)){
			normais=12;
		}

	} else if (saida<entrada){ 
		if ((entrada>=20)&&(saida<=8)){              // vira a noite
			normais=0;
		} else if ((entrada<20)&&(saida<=8)){
			normais=(20-entrada);
		} else if ((entrada>=20)&&(saida>8)){
			normais=(saida-8); 
		} else if ((entrada<20)&&(saida>8)){
			normais=((20-entrada)+(saida-8));
		}
	}
	noturnas=(horas-normais);
	printf("Horas normais: %i \n", normais);
	printf("Horas noturnas: %i \n", noturnas);	
	salario=((normais*10)+(noturnas*12));
	printf("%i", salario); 
return 0;
}
