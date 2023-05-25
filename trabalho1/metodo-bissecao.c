#include <stdio.h>
#include <math.h>

void monta_funcao (float x2, float x1, float x0)
{
	printf("Sua funcao eh: %.1f*x^2 ", x2);
	if (x1 < 0)
		printf("%.1f*x ", x1);
	else
		printf("+ %.1f*x ", x1);

	if (x0 < 0)
		printf("%.1f\n", x0);
	else
		printf("+ %.1f\n", x0);
}

int existe_raiz (float x2, float x1, float x0, float a, float b, float *fa, float *fb)
{
	*fa = x2*a*a + x1*a + x0;
	*fb = x2*b*b + x1*b + x0;

	if (*fa * *fb < 0)
		return 1;
	else
		return 0;
}

int main(int argc, char const *argv[])
{
	float x2, x1, x0;
	float a, b;
	float fa, fb;
	float metade;
	float fmetade;
	int i;
	float anterior;
	float erro;
	char continuar;

	printf("Digite os coeficientes da funcao que se quer descobri o zero de funcao\n");
	printf("x^2: ");
	scanf("%f", &x2);
	printf("x^1: ");
	scanf("%f", &x1);
	printf("x^0: ");
	scanf("%f", &x0);
	
	monta_funcao(x2, x1, x0);

	printf("Digite o intervalo de busca das raízes\n");
	printf("a: ");
	scanf("%f", &a);
	printf("b: ");
	scanf("%f", &b);
	getchar();

	/*if (existe_raiz(x2, x1, x0, a, b, &fa, &fb))
		printf("Existe raiz real entre %.1f e %.1f\n porque f(a) = %.1f e f(b) = %.1f\n", a, b, fa, fb);
	else
	{
		printf("Nao ha raiz real entre %.1f e %.1f pois f(a) = %.1f e f(b) = %.1f\n", a, b, fa, fb);
		printf("Parando\n");
		return 1;
	}*/

	i=1;
	do {
		printf("\n\n");

		fa = x2*a*a + x1*a + x0;
		fb = x2*b*b + x1*b + x0;

		if (i != 1)
		{
			anterior = metade;
		}
		metade = (a + b) / 2;
		fmetade = x2*metade*metade + x1*metade + x0;

		printf("*** Iteracao %d - ", i);
		printf("a = %f, x = %f, b = %f\n", a, metade, b);
		printf("f(a) = %f, f(x) = %f, f(b) = %f\n", fa, fmetade, fb);

		if (i != 1)
		{
			erro = fabs(anterior - metade);
			printf("Erro: %.20f\n", erro);
		}
		i++;

		if (fa * fmetade < 0)
		{
			b = metade;
			printf("Troca o intervalo B.\n");
		}
		else
		{
			a = metade;
			printf("Troca o intervalo A.\n");
		}

		printf("Continuar? ");
		scanf("%c", &continuar);
	} while (continuar != 'n');

	printf("Resultado: %f\n", metade);
	
	return 0;
}