#! /bin/bash

if [ ! $1 ]; then echo "ERRO: argumento 1 (\$1 - BD) vazio"; exit 1
elif [ ! -e $1 ]; then echo "ERRO: argumento 1 (\$1 - BD) inexistente"; exit 1
elif [ ! $2 ]; then echo "ERRO: argumento 2 (\$2 - CHAR) vazio"; exit 2
elif [ ! $3 ]; then echo "ERRO: argumento 3 (\$3 - COLUNA) vazio"; exit 3
elif [ ! $4 ]; then echo "ERRO: argumento 4 (\$4 - INDIC) vazio"; exit 4; fi

NQUESTAO=$(cut -d$2 -f$3 $1 | head -n1)
QUESTAO=$(cut -d$2 -f$3 $1 | tail -n+2)

NSABE=0
SIM=0
NAO=0
NRESP=0
for VALOR in $QUESTAO
do
	if [[ $VALOR == 1 ]]
	then
		NSABE=$(( $NSABE + 1 ))
	elif [[ $VALOR == 2 ]]
	then
		SIM=$(( $SIM + 1 ))
	elif [[ $VALOR == 3 ]]
	then
		NAO=$(( $NAO + 1 ))
	elif [[ $VALOR == 0 ]]
	then
		NRESP=$(( $NRESP + 1 ))
	elif echo $VALOR | grep -q ";"
	then
		echo "Votaram em mais de uma opcao: $VALOR"
	else
		echo "Valor \'$VALOR\' invalido"
	fi
done

echo "=== Resultados para $NQUESTAO ($4) ==="
echo "Quantidade de NAO: $NAO"
echo "Quantidade de SIM: $SIM"
echo "Quantidade de NSABE: $NSABE"
echo "Quantidade de NRESP: $NRESP"
echo

exit 0
