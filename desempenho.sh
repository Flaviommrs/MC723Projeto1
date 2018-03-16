#!bin/bash

clear

echo 'Começo dos Testes'
echo '================='

echo 'Teste de CPU'
echo '============'

echo 'tempo de cpu com transferencia'
perf stat -r 10 rsync -zvh TesteDeTransferencia.mp4 DestinoTransferencia/

echo 'tempo de cpu com sincronizacao - 1'
perf stat  rsync -azvh TesteDeSincronizacao/ DestinoSincronizacao/

rm -r DestinoSincronizacao/

echo 'tempo de cpu com sincronizacao - 2'
perf stat  rsync -azvh TesteDeSincronizacao/ DestinoSincronizacao/

rm -r DestinoSincronizacao/

echo 'tempo de cpu com sincronizacao - 3'
perf stat  rsync -azvh TesteDeSincronizacao/ DestinoSincronizacao/

rm -r DestinoSincronizacao/

echo 'tempo de cpu com sincronizacao - 4'
perf stat  rsync -azvh TesteDeSincronizacao/ DestinoSincronizacao/

rm -r DestinoSincronizacao/

echo 'tempo de cpu com sincronizacao - 5'
perf stat  rsync -azvh TesteDeSincronizacao/ DestinoSincronizacao/

echo 'Preparando para o proximo teste'
echo '==============================='
rm -r DestinoSincronizacao/
rm -r DestinoTransferencia/

echo 'Teste de Disco'
echo '=============='

echo 'Teste de Sincronização de Diretorios - com compressao'
rsync -azvh --progress TesteDeSincronizacao/ DestinoSincronizacaoCompressao/

rm -r DestinoSincronizacaoCompressao/

echo 'Teste de Sincronização de Diretorios - sem compressao'
rsync -avh --progress TesteDeSincronizacao/ DestinoSincronizacaoSemCompressao/
