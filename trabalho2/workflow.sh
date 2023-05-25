#! /bin/bash

source confs.txt

# Passo 1 - coleta: esta em bancos/*.xls

# Passo 2 - obtem bancos de diretoras e burocratas a partir de XLSX
./p2-obtem-banco-csv.sh bancos bancos/t1.xlsx
./p2-obtem-banco-csv.sh bancos bancos/t2.xlsx

# Passo 3 - realiza as somas dos indicadores
# Passo 4 - faz as estatisticas
echo "Base Diretoras"
rm -f $EST_DIR_EXT
./p3-somar-diretoras.sh bancos/t1.csv "#" 41 externo >> $EST_DIR_EXT
cat $EST_DIR_EXT
rm -f $EST_DIR_MASC
./p3-somar-diretoras.sh bancos/t1.csv "#" 43 masculino >> $EST_DIR_MASC
cat $EST_DIR_MASC
rm -f $EST_DIR_HOMO
./p3-somar-diretoras.sh bancos/t1.csv "#" 45 homoafetivo >> $EST_DIR_HOMO
cat $EST_DIR_HOMO

echo "Base Burocratas"
rm -f $EST_BUR_EXT
./p3-somar-burocratas.sh bancos/t2.csv "#" 37 externo >> $EST_BUR_EXT
cat $EST_BUR_EXT
rm -f $EST_BUR_MASC
./p3-somar-burocratas.sh bancos/t2.csv "#" 47 masculino >> $EST_BUR_MASC
cat $EST_BUR_MASC
rm -f $EST_BUR_HOMO
./p3-somar-burocratas.sh bancos/t2.csv "#" 57 homoafetivo >> $EST_BUR_HOMO
cat $EST_BUR_HOMO

# Passo 5 - cria tabela LaTeX
./p5-cria-tabela.sh

exit 0
