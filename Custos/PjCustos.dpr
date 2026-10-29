program PjCustos;

uses
  Forms,
  UTMenuPrincipal in '..\TEMPLATE\UTMENUPRINCIPAL.pas' {FTMenuPrincipal},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UTConsulta in '..\TEMPLATE\UTCONSULTA.pas' {FTConsulta},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UMenuCustos in 'UMenuCustos.pas' {FMenuCustos},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  ULogin in '..\Seguranca\ULogin.pas' {FLogin},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTrocaSenha in '..\Seguranca\UTrocaSenha.pas' {FTrocaSenha},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UParamCadFuncao in '..\Seguranca\UParamCadFuncao.pas' {FParamCadFuncao},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UMonitorSistema in '..\Banco\UMonitorSistema.pas' {FMonitorSistema},
  UDMCustos in 'UDMCustos.pas' {DMCustos: TDataModule},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UFilialCons in '..\Cadastro\UFilialCons.pas',
  UFCustoCons in 'UFCustoCons.pas' {FCustosCons},
  UFRateioCustosCons in 'UFRateioCustosCons.pas' {FRateioCustosCons},
  UDepartamentoCons in '..\Cadastro\UDepartamentoCons.pas' {FDepartamentoCons},
  UDepartamento_cl in '..\Cadastro\UDepartamento_cl.pas' {DMDepartamento: TDataModule},
  UFRateioCustoCad in 'UFRateioCustoCad.pas' {FRateioCustoCad},
  UFCustosCad in 'UFCustosCad.pas' {FCustoCad},
  UFRateioCustoCons in 'UFRateioCustoCons.pas' {FRateio_CustoCons},
  UFCustosParam in 'UFCustosParam.pas' {FCustosParam},
  UFRRateioCustos in 'UFRRateioCustos.pas' {FRRateioCustos},
  UFRCustosLancamentos in 'UFRCustosLancamentos.pas' {FRCustosLancamentos},
  UFCustoCalculoRateio in 'UFCustoCalculoRateio.pas' {FCustosCalculo},
  URCustos_Departamento in 'URCustos_Departamento.pas' {FRCustoDepartamento},
  URApuracaoResultado in 'URApuracaoResultado.pas' {FRApuracaoResultado},
  UPlanoContaCons in '..\Contabil\UPlanoContaCons.pas' {FPlanoContaCons},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  UFGrupo_CustosCad in 'UFGrupo_CustosCad.pas' {FGrupo_CustosCad},
  UFGrupo_CustosCons in 'UFGrupo_CustosCons.pas' {FGrupo_CustosCons},
  UGrupo_cl in 'UGrupo_cl.pas' {DMGrupo: TDataModule},
  URGrupoCustos in 'URGrupoCustos.pas' {FRGrupoCustos};
{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Custos';
  Application.HelpFile := 'F:\Executaveis\Manual\P_custos.hlp';
  Application.CreateForm(TFMenuCustos, FMenuCustos);
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMCustos, DMCustos);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMDepartamento, DMDepartamento);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMGrupo, DMGrupo);
  Application.Run;
end.
