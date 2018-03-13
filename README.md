# Projeto 1 - Benchmark Rsync

## O que faz? Para que serve?

Para esse projeto iremos usar o Rsync como benchmark de disco, tempo e rede.

Rsync é um programa utilizado para sincronização e transferencia de arquivos entre diretorios locais e entre computadores.

## Porque é bom para medir o desempenho?

A vantagem do rsync é que ele permite medir o desempenho em três ramos, no caso performance da cpu, performace relacionada ao disco e ele tambem permite medir a performance da rede. 

Obviamente fazer a medida de rede dificulta um pouco o benchmark devido a necessidade de usar 2 computadores, mas o fato dele permitir isso é o grande diferencial.

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

Já o desempenho de disco é mostrado pelo próprio rsync e o desempenho da rede tambem, basta utilizar o modo verbose e o de human readable especificados na parte anterior.

Por fim fora disponibilizado um script que chamado desempenho.sh que roda os comandos necessarios para o teste de desempenho.

## Como apresentar o desempenho?

O desempenho 

## Medições base (uma maquina)