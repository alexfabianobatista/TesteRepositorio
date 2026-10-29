program pjSuino;

uses
  Forms,
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  ULogin in '..\Seguranca\ULOGIN.pas' {FLogin},
  UTMenuPrincipal in '..\Template\UTMenuPrincipal.pas' {FTMenuPrincipal},
  UMenuSuino in 'UMenuSuino.pas' {FMenuSuino},
  UTConsulta in '..\Template\UTConsulta.pas' {FTConsulta},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  UTParametro in '..\Template\UTPARAMETRO.pas' {FTParametro},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  UMensagemUsuario_cl in '..\Cadastro\UMensagemUsuario_cl.pas' {DmMensagemUsuario: TDataModule},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UTCadSimples in '\\servidor\trabalho\Delphi_New\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  USuino_cl in 'USuino_cl.pas' {DmSuino: TDataModule},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOficinaPassword},
  UTRelSimples in '..\Template\UTRELSIMPLES.pas' {FTRelSimples},
  URPrecoMarca in '..\Frames\URPrecoMarca.pas' {FRPrecoMarca},
  UFmCidade in '..\Frames\UFmCidade.pas' {FmCidade: TFrame},
  UFmTipoCadastro in '..\Frames\UFmTipoCadastro.pas' {FmTipoCadastro: TFrame},
  UFmRegiao in '..\Frames\UFmRegiao.pas' {FmRegiao: TFrame},
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  UFmRamo in '..\Frames\UFmRamo.pas' {FmRamo: TFrame},
  UFmVendedor in '..\Frames\UFmVendedor.pas' {FmVendedor: TFrame},
  UFmEstado in '..\Frames\UFmEstado.pas' {FmEstado: TFrame},
  UFmClassificacao in '..\Frames\UFmClassificacao.pas' {FmClassificacao: TFrame},
  UFmMotivo in '..\Frames\UFmMotivo.pas' {FmMotivo: TFrame},
  UFmFilial in '..\Frames\UFmFilial.pas' {FmFilial: TFrame},
  UProdutoRelatorio_cl in '..\Estoque\UProdutoRelatorio_cl.pas' {DMProdutoRelatorio: TDataModule},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UHistoricoCons in '..\ContaPagar\UHistoricoCons.pas' {FHistoricoCons},
  UHistorico_cl in '..\ContaPagar\UHistorico_cl.pas' {DMHistorico: TDataModule},
  USuinoDespesaCad in 'USuinoDespesaCad.pas' {FSuinoDespesaCad},
  USuinoDespesaCons in 'USuinoDespesaCons.pas' {FSuinoDespesaCons},
  USuinoSobraProduto in 'USuinoSobraProduto.pas' {FSuinoSobraProduto},
  USuinoSobraProdutoCons in 'USuinoSobraProdutoCons.pas' {FSuinoSobraProdutoCons},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UFmProduto in '..\Frames\UFmProduto.pas' {FmProduto: TFrame},
  USuinoParam in 'USuinoParam.pas' {FSuinoParam},
  UControleUPL in 'UControleUPL.pas' {FControleUPL},
  UrUPL_Rel in 'UrUPL_Rel.pas' {FrUPL_Rel},
  UIncentivo_cl in 'UIncentivo_cl.pas' {DMIncentivo: TDataModule},
  UIncentivo_Cad in 'UIncentivo_Cad.pas' {FIncentivo_Cad},
  UIncentivo_Cons in 'UIncentivo_Cons.pas' {FIncentivo_Cons},
  URemuneracaoLeitao_cl in 'URemuneracaoLeitao_cl.pas' {DMRemuneracaoLeitao: TDataModule},
  URemuneracaoLeitao_Cad in 'URemuneracaoLeitao_Cad.pas' {FRemuneracaoLeitao_Cad},
  URemuneracaoLeitao_Cons in 'URemuneracaoLeitao_Cons.pas' {FRemuneracaoLeitao_Cons};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Controle de Suínos';
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TDmMensagemUsuario, DmMensagemUsuario);
  Application.CreateForm(TDmSuino, DmSuino);
  Application.CreateForm(TDMProdutoRelatorio, DMProdutoRelatorio);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMHistorico, DMHistorico);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TFMenuSuino, FMenuSuino);
  Application.CreateForm(TFControleUPL, FControleUPL);
  Application.CreateForm(TFrUPL_Rel, FrUPL_Rel);
  Application.CreateForm(TDMIncentivo, DMIncentivo);
  Application.CreateForm(TFIncentivo_Cad, FIncentivo_Cad);
  Application.CreateForm(TFIncentivo_Cons, FIncentivo_Cons);
  Application.CreateForm(TDMRemuneracaoLeitao, DMRemuneracaoLeitao);
  Application.CreateForm(TFRemuneracaoLeitao_Cad, FRemuneracaoLeitao_Cad);
  Application.CreateForm(TFRemuneracaoLeitao_Cons, FRemuneracaoLeitao_Cons);
  Application.Run;
end.
