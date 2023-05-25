#! /bin/bash

if [ ! $1 ]; then echo "ERRO: argumento 1 (\$1) vazio"; exit 1
elif [ ! -d $1 ]; then echo "ERRO: argumento 1 (\$1) inexistente"; exit 1
elif [ ! $2 ]; then echo "ERRO: argumento 2 (\$2) vazio"; exit 2
elif [ ! -e $2 ]; then echo "ERRO: argumento 2 (\$2) inexistente"; exit 2; fi

# https://help.libreoffice.org/latest/en-GB/text/shared/guide/csv_params.html
# Argumento  1: 35 -> # na tabela ASCII (delimitador de campo)
# Argumento  2:    -> (delimitador de texto)
# Argumento  3:  0 -> usa codificacao (encoding) do sistema
# Argumento  4:  1 -> linha a iniciar
# Argumento  5:    -> formatacao da celula
# Argumento  6:  0 -> lingua (language) da interface do usuario
# Argumento  7:    -> ?
# Argumento  8:    -> ?
# Argumento  9:    -> ?
# Argumento 10:    -> ?
# Argumento 11:    -> ?
# Argumento 12: -1 -> converter todas as planilhas do XLSX
libreoffice --headless --convert-to csv:"Text - txt - csv (StarCalc):35,,0,1,,0,,,,,,-1" --outdir $1 $2

exit 0
