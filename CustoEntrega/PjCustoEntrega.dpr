program PjCustoEntrega;

uses
  Forms,
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UTMenuPrincipal in '\\SERVIDOR\TRABALHO\DELPHI_NEW\TEMPLATE\UTMENUPRINCIPAL.pas' {FTMenuPrincipal},
  UMenuCustoEntrega in 'UMenuCustoEntrega.pas' {FMenuCustoEntrega},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  USplash in '..\Banco\USplash.pas' {FSplash},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  ULogin in '..\Seguranca\ULOGIN.pas' {FLogin},
  UTCadSimples in '\\SERVIDOR\TRABALHO\DELPHI_NEW\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UCustoEntrega_Cad in 'UCustoEntrega_Cad.pas' {FCustoEntregaCad},
  UCustoEntrega_cl in 'UCustoEntrega_cl.pas' {DMCustoEntrega: TDataModule},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UBaixaEntrega in 'UBaixaEntrega.pas' {FBaixaEntrega},
  UTConsulta in '\\SERVIDOR\TRABALHO\DELPHI_NEW\TEMPLATE\UTCONSULTA.pas' {FTConsulta},
  UCustoEntregaCons in 'UCustoEntregaCons.pas' {FCustoEntregaCons},
  UNotaSaidaCons in '..\Vendas\UNotaSaidaCons.pas' {FNotaSaidaCons},
  UNotaSaida_cl in '..\Vendas\UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UMoeda_cl in '..\Cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UNotaEntrada_cl in '..\Compras\UNotaEntrada_cl.pas' {DMNotaEntrada: TDataModule},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  URRomaneioNotas in '..\Agricola\URRomaneioNotas.pas' {FrRomNotaParam},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UCidadeCons in '..\Cadastro\UCidadeCons.pas' {FCidadeCons},
  UCidade_cl in '..\Cadastro\UCidade_cl.pas' {DMCidade: TDataModule},
  UCidadeCad in '..\Cadastro\UCidadeCad.pas' {FCidadeCad},
  UEstadoCons in '..\Cadastro\UEstadoCons.pas' {FEstadoCons},
  UEstado_cl in '..\Cadastro\UEstado_cl.pas' {DMEstado: TDataModule},
  URCidade_Cidade in '..\Cadastro\URCidade_Cidade.pas' {FRCidade_Cidade},
  UCadastroParam in '..\Cadastro\UCadastroParam.pas' {FCadastroParam},
  URegiaoCons in '..\Cadastro\URegiaoCons.pas' {FRegiaoCons},
  URegiao_cl in '..\Cadastro\URegiao_cl.pas' {DMRegiao: TDataModule},
  URamoCons in '..\Cadastro\URamoCons.pas' {FRamoCons},
  URamo_cl in '..\Cadastro\URamo_cl.pas' {DMRamo: TDataModule},
  UMotivoCons in '..\Cadastro\UMotivoCons.pas' {FMotivoCons},
  UMotivo_cl in '..\Cadastro\UMotivo_cl.pas' {DMMotivo: TDataModule},
  UClassCadastroCons in '..\Cadastro\UClassCadastroCons.pas' {FClassCadastroCons},
  UPracaCons in '..\Cadastro\UPracaCons.pas' {FPracaCons},
  UPraca_cl in '..\Cadastro\UPraca_cl.pas' {DMPraca: TDataModule},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  URomaneioCons in '..\Agricola\URomaneioCons.pas' {FRomaneioCons},
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  UContasPagar_cl in '..\ContaPagar\UContasPagar_cl.pas' {DMContasPagar: TDataModule},
  UCaixaLanc_Cont in '..\Caixa\UCaixaLanc_Cont.pas' {FCaixa_Lanc_Cont},
  UPlanoContaCons in '..\Contabil\UPlanoContaCons.pas' {FPlanoContaCons},
  UConhecimentoFrete_cl in '..\Conhecimento\UConhecimentoFrete_cl.pas' {DMConhecimentoFrete: TDataModule},
  USenha in '..\Vendas\USenha.pas' {FSenha},
  USerieCons in '..\Compras\USerieCons.pas' {FSerieCons},
  UTParametro in '\\SERVIDOR\TRABALHO\DELPHI_NEW\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UCustoEntregaParam in 'UCustoEntregaParam.pas' {FCustoEntregaParam},
  UTRelSimples in '\\SERVIDOR\TRABALHO\DELPHI_NEW\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URCustoEntrega in 'URCustoEntrega.pas' {FRCustoEntrega};

{$R *.RES}

begin
  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.Title := 'Custo Entrega';
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TFMenuCustoEntrega, FMenuCustoEntrega);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TFCustoEntregaCad, FCustoEntregaCad);
  Application.CreateForm(TDMCustoEntrega, DMCustoEntrega);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TFFilialCons, FFilialCons);
  Application.CreateForm(TFVendedorCons, FVendedorCons);
  Application.CreateForm(TFBaixaEntrega, FBaixaEntrega);
  Application.CreateForm(TFCustoEntregaCons, FCustoEntregaCons);
  Application.CreateForm(TFNotaSaidaCons, FNotaSaidaCons);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMNotaEntrada, DMNotaEntrada);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TFrRomNotaParam, FrRomNotaParam);
  Application.CreateForm(TFCadastroCons, FCadastroCons);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TFTipoCadastroCons, FTipoCadastroCons);
  Application.CreateForm(TFCidadeCons, FCidadeCons);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TFCidadeCad, FCidadeCad);
  Application.CreateForm(TFEstadoCons, FEstadoCons);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TFRCidade_Cidade, FRCidade_Cidade);
  Application.CreateForm(TFCadastroParam, FCadastroParam);
  Application.CreateForm(TFRegiaoCons, FRegiaoCons);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TFRamoCons, FRamoCons);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TFMotivoCons, FMotivoCons);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TFClassCadastroCons, FClassCadastroCons);
  Application.CreateForm(TFPracaCons, FPracaCons);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TFProdutoCons, FProdutoCons);
  Application.CreateForm(TFRomaneioCons, FRomaneioCons);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TDMContasPagar, DMContasPagar);
  Application.CreateForm(TFCaixa_Lanc_Cont, FCaixa_Lanc_Cont);
  Application.CreateForm(TFPlanoContaCons, FPlanoContaCons);
  Application.CreateForm(TDMConhecimentoFrete, DMConhecimentoFrete);
  Application.CreateForm(TFSenha, FSenha);
  Application.CreateForm(TFSerieCons, FSerieCons);
  Application.CreateForm(TFCustoEntregaParam, FCustoEntregaParam);
  Application.CreateForm(TFRCustoEntrega, FRCustoEntrega);
  FSplash.Hide;
  FSplash.Free;
  Application.Run;
end.
