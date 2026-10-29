Teste da importacao de IBS/CBS (Delphi 7)
======================================

Na pasta `tests`, em PowerShell:

```powershell
New-Item -ItemType Directory -Force bin | Out-Null
& 'C:\Program Files (x86)\Borland\Delphi7\Bin\dcc32.exe' '-U..;C:\Program Files (x86)\Borland\Delphi7\Lib' '-Ebin' '-Nbin' TestImportacaoIBSCBS.dpr
& .\bin\TestImportacaoIBSCBS.exe 'D:\BaseClientes\Demag\50260826834259000393550000000859411302221883-nfe.xml'
```

O teste usa o XML externo, sem copiar dados do cliente para o projeto.
Valida CST e classificacao com zeros a esquerda; base total 300,00;
IBS total 0,30; CBS total 2,70; rateio em sete lotes; grupos ausentes;
tributacao zerada; XML antigo; nota manual; separadores decimais ponto e virgula.

A nova rotina grava os campos existentes NUM_CST_IBS_CBS,
NUM_CLASS_TRIB_IBS_CBS, VAL_BC_IBS_CBS, VAL_IBS_EST, VAL_IBS_MUN e VAL_CBS.
Nao altera o esquema do banco. As aliquotas permanecem no mecanismo de
consulta/calculo existente, pois nao sao campos persistidos de QItemNF.

O teste isolado passou no Delphi 7. A compilacao completa de PjCompra
depende da configuracao dos componentes Oracle (Oracle.dcu nao encontrado
no ambiente de compilacao usado). Ainda e necessario validar a importacao
integrada com o banco no ambiente do sistema.
