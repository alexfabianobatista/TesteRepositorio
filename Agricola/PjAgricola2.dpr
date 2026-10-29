program PjAgricola2;

uses
  Forms,
  UTMenuPrincipal in '\\NT\TRABALHO\DELPHI\TEMPLATE\UTMENUPRINCIPAL.pas' {FTMenuPrincipal},
  UMenuAgricola in 'UMenuAgricola.pas' {FMenuAgricola},
  UOracle_cl in '\\Nt\trabalho\Delphi\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  ULogin in '\\Nt\trabalho\Delphi\Seguranca\ULogin.pas' {FLogin},
  UUsuario_cl in '\\Nt\trabalho\Delphi\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTrocaSenha in '\\Nt\trabalho\Delphi\Seguranca\UTrocaSenha.pas' {FTrocaSenha},
  UTela_cl in '\\Nt\trabalho\Delphi\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UParamCadFuncao in '\\Nt\trabalho\Delphi\Seguranca\UParamCadFuncao.pas' {FParamCadFuncao},
  UFuncao_cl in '\\Nt\trabalho\Delphi\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UDescontoAgricola_cl in 'UDescontoAgricola_cl.pas' {DMDescontoAgricola: TDataModule},
  UTCadSimples in '\\NT\TRABALHO\DELPHI\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UDescontoAgricolaCad in 'UDescontoAgricolaCad.pas' {FDescontoAgricolaCad},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UTConsulta in '\\NT\TRABALHO\DELPHI\TEMPLATE\UTCONSULTA.pas' {FTConsulta},
  UDescontoAgricolaCons in 'UDescontoAgricolaCons.pas' {FDescontoAgricolaCons},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UParamSistema_cl in '\\Nt\trabalho\Delphi\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UTRelSimples in '\\NT\TRABALHO\DELPHI\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URDescontoAgricola_Desconto in 'URDescontoAgricola_Desconto.pas' {FRDescAgricola_Descontos},
  UProdutoAgricola_cl in 'UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  UProdutoAgricolaCad in 'UProdutoAgricolaCad.pas' {FProdutoAgricolaCad},
  UProdutoAgricolaCons in 'UProdutoAgricolaCons.pas' {FProdutoAgricolaCons},
  URomaneioAgricola_cl in 'URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  URomaneioCad in 'URomaneioCad.pas' {FRomaneioCad},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  URomaneioCons in 'URomaneioCons.pas' {FRomaneioCons},
  UBalancaCons in 'UBalancaCons.pas' {FBalancaCons},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  URRomaneio_Periodo in 'URRomaneio_Periodo.pas' {FrRomaneio_Periodo},
  UTParametro in '\\NT\TRABALHO\DELPHI\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  URomaneioParam in 'URomaneioParam.pas' {FRomaneioParam},
  URRomaneioEmissao in 'URRomaneioEmissao.pas' {FrRomaneioEmissao},
  URRomaneioDesconto in 'URRomaneioDesconto.pas' {FrRomaneioDesconto},
  URRomaneioNotas in 'URRomaneioNotas.pas' {FrRomNotaParam},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  UTributacaoCons in '..\Estoque\UTributacaoCons.pas' {FTributacaoCons},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UMoeda_cl in '..\Cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  UNotaEntrada_cl in '..\Compras\UNotaEntrada_cl.pas' {DMNotaEntrada: TDataModule},
  UNotaEntradaCad in '..\Compras\UNotaEntradaCad.pas' {FNotaEntradaCad},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  UTransporteCons in '..\Compras\UTransporteCons.pas' {FTransporteCons},
  UTransporte_cl in '..\Compras\UTransporte_cl.pas' {DMTransporte: TDataModule},
  UOperacaoCons in '..\Compras\UOperacaoCons.pas' {FOperacaoCons},
  UMensagemCons in '..\Compras\UMensagemCons.pas' {FMensagemCons},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UTipoLote_cl in '..\Estoque\UTipoLote_cl.pas' {DMTipoLote: TDataModule},
  UTipoLoteCons in '..\Estoque\UTipoLoteCons.pas' {FTipoLoteCons},
  UNotaEntradaCons in '..\Compras\UNotaEntradaCons.pas' {FNotaEntradaCons},
  UNotaEntrada_Confirma in '..\Compras\UNotaEntrada_Confirma.pas' {FNotaEntrada_Confirma},
  UNotaEntrada_Cancela in '..\Compras\UNotaEntrada_Cancela.pas' {FNotaEntrada_Cancela},
  URNotaEntr_Moinho in '..\Compras\URNotaEntr_Moinho.pas' {FRNotaEntr_Moinho},
  UNotaEntradaParam in '..\Compras\UNotaEntradaParam.pas' {FNotaEntradaParam},
  URNotasES_Relacao in '..\Compras\URNotasES_Relacao.pas' {FRNotasES_Relacao},
  URNotasES_Conferencia in '..\Compras\URNotasES_Conferencia.pas' {FRNotasES_Conferencia},
  UNotaSaida_cl in '..\Vendas\UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  UOrdemCompra_cl in '..\Compras\UOrdemCompra_cl.pas' {DMOrdemCompra: TDataModule},
  UOrdemCompraCons in '..\Compras\UOrdemCompraCons.pas' {FOrdemCompraCons},
  URNotasES_Futura in '..\Compras\URNotasES_Futura.pas' {FRNotasES_Futura},
  URNotasES_MovEstoque in '..\Compras\URNotasES_MovEstoque.pas' {FRNotasES_MovEstoque},
  UOrdemCompra_ConsAberto in '..\Compras\UOrdemCompra_ConsAberto.pas' {FOrdemCompra_ConsAberto},
  UFinalidadeCons in '..\ContaPagar\UFinalidadeCons.pas' {FFinalidadeCons},
  UMotivoCons in '..\Cadastro\UMotivoCons.pas' {FMotivoCons},
  UMotivo_cl in '..\Cadastro\UMotivo_cl.pas' {DMMotivo: TDataModule},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  URomConsultaFixar in 'URomConsultaFixar.pas' {FRomConsultaFixar},
  URomSaldo_Param in 'URomSaldo_Param.pas' {FRomSaldo_Param},
  URomDemSaldo2 in 'URomDemSaldo2.pas' {FrRomDemSaldo2},
  URomDemSaldo in 'URomDemSaldo.pas' {FrRomDemSaldo},
  UNotaAgricolaCad in 'UNotaAgricolaCad.pas' {FNotaAgricolaCad},
  UNotaAgricolaConf in 'UNotaAgricolaConf.pas' {FNotaAgricolaConf},
  UMonitorSistema in '\\Nt\trabalho\Delphi\Banco\UMonitorSistema.pas' {FMonitorSistema},
  URRomaneioCadastro in 'URRomaneioCadastro.pas' {FRRomaneioCadastro};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFMenuAgricola, FMenuAgricola);
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMDescontoAgricola, DMDescontoAgricola);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMTransporte, DMTransporte);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMTipoLote, DMTipoLote);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMOrdemCompra, DMOrdemCompra);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TFRRomaneioCadastro, FRRomaneioCadastro);
  Application.Run;
end.
