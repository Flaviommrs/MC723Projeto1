# Projeto 1 - Benchmark Rsync

## O que faz? Para que serve?

Para esse projeto iremos usar o Rsync como benchmark de disco e de tempo de CPU.

Rsync é um programa utilizado para sincronização e transferencia de arquivos entre diretorios locais e entre computadores.

## Porque é bom para medir o desempenho?

A vantagem do rsync é que ele permite medir o desempenho em três ramos, no caso performance da cpu, performace relacionada ao disco e ele tambem permite medir a performance da rede. 

No caso apenas iremos apenas medir o tempo de cpu e disco, mas mesmo assim por ser um programa capaz de sincronizar arquivos de diretorios diferentes ele acaba por usar intensivamente o disco, sendo assim um otimo candidato para benchmarcks de disco

## O que baixar? Como compilar/instalar?

Para baixar o rsync basta seguir os seguintes passos:

1. Primeiramente se ja tiver o rsync instalado (caso não tenha va para o proximo passo)utilize o seguinte comando para desinstala-lo :

    	sudo apt-get remove rsync

2. Após a desinstalação baixe a versão 3.1.1 do seguinte site:
	[https://download.samba.org/pub/rsync/src/](https://download.samba.org/pub/rsync/src/)

3. Com o zip em mão descompacte e siga os seguintes comandos: 
		
		tar -xf rsync-3.1.1.tar.gz 
		cd rsync-3.1.1

4. Dentro do diretorio faça os seguintes comandos:

		$ ./configure
		$ make
		$ sudo checkinstall

	Caso o checkinstall não funcione use o seguinte:

		sudo make install

5. Por fim utilize o seguinte comando para checar a instalação do rsync:

		rsync --version

## Como executar?

Para executar o rsync basta utilizar a seguinte formatação:

		rsync [Optional] [Source] [Destination]

Sendo que caso a pasta utilizada como destino não exista ele criara. Como Optionals existem varias flags, sendo as usadas no teste seram as seguintes:

1. -v: verbose;
2. -a: modo de arquivamento, o modo de arquivo permite a cópia de arquivos de forma recursiva e também preserva links simbólicos, permissões de arquivos, posses usuário e grupo e timestamps;
3. -z: arquivos serão comprimidos durante transferencia;
4. -h: saida legivel para humanos;
5. --progress: mostra o progresso da transferência;

No nosso teste usaremos como nos exemplos abaixo:

		rsync -zvh planilha.xls teste/
		(Transferencia de arquivo local)

		rsync -avzh imagens/ teste/backup/
		(Sincronização de Diretorios Locais)

## Como medir o desempenho?

Para medir o desempenho de cpu fora o usado o comando perf. Usando os seguintes:

		perf stat -d
		perf report -stdio

Já o desempenho de disco é mostrado pelo próprio rsync, basta utilizar o modo verbose e o de human readable especificados na parte anterior.

Por fim fora disponibilizado um script que chamado desempenho.sh que roda os comandos necessarios para o teste de desempenho.

Para rodar o script basta usar o seguinte comando:

		sh desempenho.sh

## Como apresentar o desempenho?

O desempenho sera coletado atraves dos seguintes campos: 
		
		1.184645160 seconds time elapsed                                          ( +- 93.27% ) 
		coletado do perf com repetições sendo a porcentagem o desvio padrão

		11.216647547 seconds time elapsed
		tambem coletado do pef mas sem repetições (teste de sincronia)

		sent 1.40K bytes  received 12 bytes  2.83K bytes/sec
		Coletado dos dois ultimos testes de disco (impresso pelo rsync)
		
Com isso teremos o desempenho do rsync fazendo apenas uma transferencia e sincronizando dois diretorios distintos.

Nota: Como pode ser visto o resultado do tempo de execução da transferencia de uma arquivo depende muito do tamanho do arquivo e infelizmente não foi possivel passar de 1s com os arquivos foram escolhidos para o teste, logo pode ser ignorado o tempo do teste de transferência.

## Medições base (na máquina "smurfs")

Especificações da Máquina: Intel Core i5-4590, 3.3 GHz, 4 Cores, 6MB Cache, 8GB RAM, 1TB.

Na fase do Teste da CPU obtivemos os seguintes valores:

3.471816437 seconds time elapsed                                          ( +-  0.18% )

27.467542085 seconds time elapsed

Na fase do Teste do Disco, obtivemos:

sent 232.91M bytes  received 604 bytes  8.17M bytes/sec, para a parte com compressão

sent 235.10M bytes  received 607 bytes  10.93M bytes/sec, para a parte sem compressão
