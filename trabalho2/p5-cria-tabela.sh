#! /bin/bash

source confs.txt

cp $BASE_TABELA $TABELA

# Base 1: Diretoras
SIM=$(grep "SIM" $EST_DIR_EXT | cut -d" " -f4)
NAO=$(grep "NAO" $EST_DIR_EXT | cut -d" " -f4)
NSABE=$(grep "NSABE" $EST_DIR_EXT | cut -d" " -f4)
sed -i -e "s/DIR-EXT-SIM/$SIM/g" \
	-e "s/DIR-EXT-NAO/$NAO/g" \
	-e "s/DIR-EXT-NSABE/$NSABE/g" $TABELA

SIM=$(grep "SIM" $EST_DIR_MASC | cut -d" " -f4)
NAO=$(grep "NAO" $EST_DIR_MASC | cut -d" " -f4)
NSABE=$(grep "NSABE" $EST_DIR_MASC | cut -d" " -f4)
sed -i -e "s/DIR-MASC-SIM/$SIM/g" \
	-e "s/DIR-MASC-NAO/$NAO/g" \
	-e "s/DIR-MASC-NSABE/$NSABE/g" $TABELA

SIM=$(grep "SIM" $EST_DIR_HOMO | cut -d" " -f4)
NAO=$(grep "NAO" $EST_DIR_HOMO | cut -d" " -f4)
NSABE=$(grep "NSABE" $EST_DIR_HOMO | cut -d" " -f4)
sed -i -e "s/DIR-HOMO-SIM/$SIM/g" \
	-e "s/DIR-HOMO-NAO/$NAO/g" \
	-e "s/DIR-HOMO-NSABE/$NSABE/g" $TABELA

# Base 2: Burocratas
SIM=$(grep "SIM" $EST_BUR_EXT | cut -d" " -f4)
NAO=$(grep "NAO" $EST_BUR_EXT | cut -d" " -f4)
NSABE=$(grep "NSABE" $EST_BUR_EXT | cut -d" " -f4)
sed -i -e "s/BUR-EXT-SIM/$SIM/g" \
	-e "s/BUR-EXT-NAO/$NAO/g" \
	-e "s/BUR-EXT-NSABE/$NSABE/g" $TABELA

SIM=$(grep "SIM" $EST_BUR_MASC | cut -d" " -f4)
NAO=$(grep "NAO" $EST_BUR_MASC | cut -d" " -f4)
NSABE=$(grep "NSABE" $EST_BUR_MASC | cut -d" " -f4)
sed -i -e "s/BUR-MASC-SIM/$SIM/g" \
	-e "s/BUR-MASC-NAO/$NAO/g" \
	-e "s/BUR-MASC-NSABE/$NSABE/g" $TABELA

SIM=$(grep "SIM" $EST_BUR_HOMO | cut -d" " -f4)
NAO=$(grep "NAO" $EST_BUR_HOMO | cut -d" " -f4)
NSABE=$(grep "NSABE" $EST_BUR_HOMO | cut -d" " -f4)
sed -i -e "s/BUR-HOMO-SIM/$SIM/g" \
	-e "s/BUR-HOMO-NAO/$NAO/g" \
	-e "s/BUR-HOMO-NSABE/$NSABE/g" $TABELA

exit 0
