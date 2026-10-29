program PjOperador;

uses
  Forms,
  UTMenuPrincipal in '..\TEMPLATE\UTMENUPRINCIPAL.pas' {FTMenuPrincipal},
  UMenuOperador in 'UMenuOperador.pas' {FMenuOperador},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  ULogin in '..\Seguranca\ULogin.pas' {FLogin},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTrocaSenha in '..\Seguranca\UTrocaSenha.pas' {FTrocaSenha},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UParamCadFuncao in '..\Seguranca\UParamCadFuncao.pas' {FParamCadFuncao},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UMonitorSistema in '..\Banco\UMonitorSistema.pas' {FMonitorSistema},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UEstoqueCons in '..\Estoque\UEstoqueCons.pas' {FEstoqueCons},
  UMoeda_cl in '..\Cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  UOperador_cl in 'UOperador_cl.pas' {DMOperador: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UDMComprasDia_cl in 'UDMComprasDia_cl.pas' {DMComprasDia: TDataModule},
  UMovimentoPeriodo in 'UMovimentoPeriodo.pas' {FMovimentoPeriodo},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UTConsulta in '..\TEMPLATE\UTConsulta.pas' {FTConsulta},
  UOperador_Cons1 in 'UOperador_Cons1.pas' {FOperador_Cons1},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UTRelSimples in '..\Template\UTRELSIMPLES.pas' {FTRelSimples},
  UTParametro in '\\Servidor\trabalho\Delphi_new\Template\UTPARAMETRO.pas' {FTParametro},
  UFmCidade in '..\Frames\UFmCidade.pas' {FmCidade: TFrame},
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  UFmTipoCadastro in '..\Frames\UFmTipoCadastro.pas' {FmTipoCadastro: TFrame},
  UFmRegiao in '..\Frames\UFmRegiao.pas' {FmRegiao: TFrame},
  UFmRamo in '..\Frames\UFmRamo.pas' {FmRamo: TFrame},
  UFmVendedor in '..\Frames\UFmVendedor.pas' {FmVendedor: TFrame},
  UFmEstado in '..\Frames\UFmEstado.pas' {FmEstado: TFrame},
  UFmClassificacao in '..\Frames\UFmClassificacao.pas' {FmClassificacao: TFrame},
  UFmMotivo in '..\Frames\UFmMotivo.pas' {FmMotivo: TFrame};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMOperador, DMOperador);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMComprasDia, DMComprasDia);
  Application.CreateForm(TFMenuOperador, FMenuOperador);
  Application.Run;
end.
