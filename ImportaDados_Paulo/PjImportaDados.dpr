program PjImportaDados;

uses
  Forms,
  UImportaDados in 'UImportaDados.pas' {FImportaDados},
  UOracle_cl in '..\banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UImportaDados_cl in 'UImportaDados_cl.pas' {DMImportaDados: TDataModule},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UConverte_cl in 'UConverte_cl.pas' {DMConverte: TDataModule},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UTConsulta in '..\Template\UTConsulta.pas' {FTConsulta},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UEmbarque_cl in '..\Vendas\UEmbarque_cl.pas' {DMEmbarque: TDataModule},
  UEmbarqueCons in '..\Vendas\UEmbarqueCons.pas' {FEmbarqueCons},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UClassCadastroCons in '..\Cadastro\UClassCadastroCons.pas' {FClassCadastroCons},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UCidade_cl in '..\Cadastro\UCidade_cl.pas' {DMCidade: TDataModule},
  UCidadeCons in '..\Cadastro\UCidadeCons.pas' {FCidadeCons},
  UCidadeCad in '..\Cadastro\UCidadeCad.pas',
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UEstado_cl in '..\Cadastro\UEstado_cl.pas' {DMEstado: TDataModule},
  UEstadoCons in '..\Cadastro\UEstadoCons.pas' {FEstadoCons},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URCidade_Cidade in '..\Cadastro\URCidade_Cidade.pas' {FRCidade_Cidade},
  UCadastroParam in '..\Cadastro\UCadastroParam.pas',
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  URegiao_cl in '..\Cadastro\URegiao_cl.pas' {DMRegiao: TDataModule},
  URegiaoCons in '..\Cadastro\URegiaoCons.pas' {FRegiaoCons},
  URamo_cl in '..\Cadastro\URamo_cl.pas' {DMRamo: TDataModule},
  URamoCons in '..\Cadastro\URamoCons.pas' {FRamoCons},
  UMotivoCons in '..\Cadastro\UMotivoCons.pas' {FMotivoCons},
  UMotivo_cl in '..\Cadastro\UMotivo_cl.pas' {DMMotivo: TDataModule},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UPracaCons in '..\Cadastro\UPracaCons.pas' {FPracaCons},
  UPraca_cl in '..\Cadastro\UPraca_cl.pas' {DMPraca: TDataModule},
  UFmCidade in '..\Frames\UFmCidade.pas' {FmCidade: TFrame},
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  UFmTipoCadastro in '..\Frames\UFmTipoCadastro.pas' {FmTipoCadastro: TFrame},
  UFmRegiao in '..\Frames\UFmRegiao.pas' {FmRegiao: TFrame},
  UFmRamo in '..\Frames\UFmRamo.pas' {FmRamo: TFrame},
  UFmVendedor in '..\Frames\UFmVendedor.pas' {FmVendedor: TFrame},
  UFmEstado in '..\Frames\UFmEstado.pas' {FmEstado: TFrame},
  UFmClassificacao in '..\Frames\UFmClassificacao.pas' {FmClassificacao: TFrame},
  UFmMotivo in '..\Frames\UFmMotivo.pas' {FmMotivo: TFrame},
  UFmFilial in '..\Frames\UFmFilial.pas' {FmFilial: TFrame},
  UUsuarioCons in '..\Seguranca\UUsuarioCons.pas' {FUsuarioCons},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  UClasseCons in '..\Estoque\UClasseCons.pas' {FClasseCons},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOficinaPassword},
  UMensagemSMS in '..\Template\UMensagemSMS.pas' {FMensagemSMS},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMImportaDados, DMImportaDados);
  Application.CreateForm(TFImportaDados, FImportaDados);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMConverte, DMConverte);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TFTConsulta, FTConsulta);
  Application.CreateForm(TFVendedorCons, FVendedorCons);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMEmbarque, DMEmbarque);
  Application.CreateForm(TFEmbarqueCons, FEmbarqueCons);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TFCadastroCons, FCadastroCons);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TFClassCadastroCons, FClassCadastroCons);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TFTipoCadastroCons, FTipoCadastroCons);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TFCidadeCons, FCidadeCons);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TFEstadoCons, FEstadoCons);
  Application.CreateForm(TFRCidade_Cidade, FRCidade_Cidade);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TFRegiaoCons, FRegiaoCons);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TFRamoCons, FRamoCons);
  Application.CreateForm(TFMotivoCons, FMotivoCons);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TFFilialCons, FFilialCons);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TFPracaCons, FPracaCons);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TFUsuarioCons, FUsuarioCons);
  Application.CreateForm(TFPersonalizaRelatorio, FPersonalizaRelatorio);
  Application.CreateForm(TFRConsulta, FRConsulta);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TFOficinaPassword, FOficinaPassword);
  Application.CreateForm(TFMensagemSMS, FMensagemSMS);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.Run;
end.
