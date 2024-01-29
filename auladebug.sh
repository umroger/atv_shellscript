#!/bin/bash
#teste
CHAVE_CRIAR=0
CHAVE_EXCLUIR=0
CHAVE_LISTAR=0
CHAVE_VERIFICAR=0
CHAVE_TEXTO=0
CHAVE_LER=0
ARQUIVO=""
TEXTO=""
CHAVE_DEBUG=0
NIVEL_DEBUG=0

# --------------------------------------------------FUNÇÃO------------------------------------------------------
debug () {
  [ $1 -le $NIVEL_DEBUG ] && echo "DEBUG: $* -------"
}

# --------------------------------------------------EXECUÇÃO----------------------------------------------------

[ $1 = "-d" ] && CHAVE_DEBUG=1 && echo "Debug Ativado"
if [ $1 = "-d" ] && [ $2 ]; then
  CHAVE_DEBUG=1;
  NIVEL_DEBUG=$2;
fi


echo   "Escolha uma opcão:
        1 - Criar um arquivo
        2 - Excluir um arquivo
        3 - Listar os arquivos do diretorio
        4 - Verificar se um arquivo existe
        5 - Incluir texto em arquivo
        6 - Ler um arquivo de texto
        7 - Sair
        "
read OPCAO
    case $OPCAO in
        1) CHAVE_CRIAR=1 && debug 2 "coloquei chave criar como 1"              ;;
        2) CHAVE_EXCLUIR=1 && debug 2 "coloquei chave excluir como 1"          ;;
        3) CHAVE_LISTAR=1  && debug 2 "coloquei chave listar como 1"           ;;
        4) CHAVE_VERIFICAR=1 && debug 2 "coloquei chave verificar como 1"      ;;
        5) CHAVE_TEXTO=1 && debug 2 "coloquei chave criar como 1"              ;;
        6) CHAVE_LER=1 && debug 2 "coloquei chave criar como 1"                ;;
        7) exit 0                                                              ;;
        *) echo "Opcao invalida!" && exit 1                                    ;;
    esac
[ $CHAVE_CRIAR -eq 1 ] && echo "Digite o nome do arquivo que deseja criar: " && read ARQUIVO && touch $ARQUIVO && debug 1 "Criei o arquivo $ARQUIVO"
[ $CHAVE_EXCLUIR -eq 1 ] && echo "Digite o nome do arquivo que deseja excluir: " && read ARQUIVO && rm -rf $ARQUIVO && debug 1 "Arquivo $ARQUIVO excluído"
[ $CHAVE_LISTAR -eq 1 ] && ls -l # irá listar os arquivos do diretorio
[ $CHAVE_VERIFICAR -eq 1 ] && echo "Digite o nome do arquivo que deseja verificar: " && read ARQUIVO && ls -l $ARQUIVO # irá verificar se o arquivo existe
[ $CHAVE_LER -eq 1 ] && echo "Digite o nome do arquivo de texto que deseja ler: " && read ARQUIVO && cat "$ARQUIVO"
[ $CHAVE_TEXTO -eq 1 ] && echo "Digite o nome do arquivo que você quer editar: " && read ARQUIVO && echo "O que você quer incluir nele?" && read TEXTO && echo "$TEXTO" >> $ARQUIVO
