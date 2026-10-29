program PjLivrosFiscais;

uses
  Forms,
  UTMenuPrincipal in '..\TEMPLATE\UTMENUPRINCIPAL.pas' {FTMenuPrincipal},
  UMenuLivroFiscal in 'UMenuLivroFiscal.pas' {FMenuLivroFiscal},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  ULogin in '..\Seguranca\ULogin.pas' {FLogin},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UTrocaSenha in '..\Seguranca\UTrocaSenha.pas' {FTrocaSenha},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UParamCadFuncao in '..\Seguranca\UParamCadFuncao.pas' {FParamCadFuncao},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UMonitorSistema in '..\Banco\UMonitorSistema.pas' {FMonitorSistema},
  URegEntrada_cl in 'URegEntrada_cl.pas' {DMRegEntrada: TDataModule},
  URegEntradaParam in 'URegEntradaParam.pas' {FRegEntradaParam},
  URRegSaida in 'URRegSaida.pas' {FRRegSaida: TQuickRep},
  UFilialCons in '..\Cadastro\UFilialCons.pas',
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UTConsulta in '..\TEMPLATE\UTCONSULTA.pas' {FTConsulta},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  URegSaida_cl in 'URegSaida_cl.pas' {DMRegSaida: TDataModule},
  URegSaidaParam in 'URegSaidaParam.pas' {FRegSaidaParam},
  URRegEntrada in 'URRegEntrada.pas' {FRRegEntrada: TQuickRep},
  UApuracaoParam in 'UApuracaoParam.pas' {FApuracaoParam},
  URApuracaoS in 'URApuracaoS.pas' {FRApuracaoS},
  URApuracaoE in 'URApuracaoE.pas' {FRApuracaoE},
  URApuracaoResumo in 'URApuracaoResumo.pas' {FRApuracaoResumo},
  ULivroFiscal_Cl in 'ULivroFiscal_Cl.pas' {DMLivroFiscal: TDataModule},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  ULivroFiscalCad in 'ULivroFiscalCad.pas' {FLivroFiscalCad},
  ULivroFiscalCons in 'ULivroFiscalCons.pas' {FLivroFiscalCons},
  USplash in '..\Banco\USplash.pas' {FSplash},
  URelPreview in '..\Template\URelPreview.pas' {FRelPreview},
  UGia_cl in 'UGia_cl.pas' {DMGia: TDataModule},
  UGiaCad in 'UGiaCad.pas' {FGiaCad},
  UGiaCons in 'UGiaCons.pas' {FGiaCons},
  URGia in 'URGia.pas' {FRGia},
  URNotasOperacao in 'URNotasOperacao.pas' {FRNotasOperacao},
  ULivroFiscalParam in 'ULivroFiscalParam.pas' {FLivroFiscalParam},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UOperacaoCons in '..\Compras\UOperacaoCons.pas' {FOperacaoCons},
  URNotasOperacaoResumo in 'URNotasOperacaoResumo.pas' {FRNotasOperacaoResumo},
  URLivroFResumoOp in 'URLivroFResumoOp.pas' {FRLivroFResumoOpA},
  URLivroFResumoOpS in 'URLivroFResumoOpS.pas' {FRLivroFResumoOpS},
  FResumoApuracaoParam in 'FResumoApuracaoParam.pas' {FApuracaoResumoParam},
  URLivroFiscalNotaImposto in 'URLivroFiscalNotaImposto.pas' {FrLivroFiscalNotasImposto},
  UFRLivroNEPrefeitura in 'UFRLivroNEPrefeitura.pas' {FRLivroNEPrefeitura},
  URegiao_cl in '..\Cadastro\URegiao_cl.pas' {DMRegiao: TDataModule},
  URegiaoCons in '..\Cadastro\URegiaoCons.pas' {FRegiaoCons},
  URLivroRel_NF_Periodo in 'URLivroRel_NF_Periodo.pas' {FRLivroRel_NF_Periodo},
  UEstado_cl in '..\Cadastro\UEstado_cl.pas' {DMEstado: TDataModule},
  UEstadoCons in '..\Cadastro\UEstadoCons.pas' {FEstadoCons},
  URLivro_DFC in 'URLivro_DFC.pas' {FRLivro_DFC},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  URNFEmitidas in 'URNFEmitidas.pas' {FRNF_Emitidas},
  URegINSS in 'URegINSS.pas' {FRegINSSParam},
  URegINSS_cl in 'URegINSS_cl.pas' {DMRegINSS: TDataModule},
  URRegINSS in 'URRegINSS.pas' {FRRegINSS},
  URegServPrestadosParam in 'URegServPrestadosParam.pas' {FRegServPrestadosParam},
  URegServPrestados_cl in 'URegServPrestados_cl.pas' {DMRegServPrestados: TDataModule},
  UTRelSimples in '\\SERVIDOR\TRABALHO\DELPHI_NEW\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URRegServPrestados in 'URRegServPrestados.pas' {FRRegServPrestados},
  URNotasOperacao2 in 'URNotasOperacao2.pas' {FRNotasOperacao2},
  UCidadeCons in '..\Cadastro\UCidadeCons.pas' {FCidadeCons},
  UCidade_cl in '..\Cadastro\UCidade_cl.pas' {DMCidade: TDataModule},
  UCidadeCad in '..\Cadastro\UCidadeCad.pas' {FCidadeCad},
  URCidade_Cidade in '..\Cadastro\URCidade_Cidade.pas' {FRCidade_Cidade},
  UCadastroParam in '..\Cadastro\UCadastroParam.pas' {FCadastroParam},
  URamo_cl in '..\Cadastro\URamo_cl.pas' {DMRamo: TDataModule},
  URamoCons in '..\Cadastro\URamoCons.pas' {FRamoCons},
  UMotivo_cl in '..\Cadastro\UMotivo_cl.pas' {DMMotivo: TDataModule},
  UMotivoCons in '..\Cadastro\UMotivoCons.pas' {FMotivoCons},
  UClassCadastroCons in '..\Cadastro\UClassCadastroCons.pas' {FClassCadastroCons},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UPraca_cl in '..\Cadastro\UPraca_cl.pas' {DMPraca: TDataModule},
  UPracaCons in '..\Cadastro\UPracaCons.pas' {FPracaCons};

{$R *.RES}

begin
  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.HelpFile := 'F:\Executaveis\Manual\P_LIVROS FISCAIS.HLP';
  Application.Title := 'Projeto Livros Fiscais';
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TFMenuLivroFiscal, FMenuLivroFiscal);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMRegEntrada, DMRegEntrada);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMRegSaida, DMRegSaida);
  Application.CreateForm(TDMLivroFiscal, DMLivroFiscal);
  Application.CreateForm(TDMGia, DMGia);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TFRegINSSParam, FRegINSSParam);
  Application.CreateForm(TDMRegINSS, DMRegINSS);
  Application.CreateForm(TFRRegINSS, FRRegINSS);
  Application.CreateForm(TDMRegServPrestados, DMRegServPrestados);
  Application.CreateForm(TFRNotasOperacao2, FRNotasOperacao2);
  Application.CreateForm(TFCidadeCons, FCidadeCons);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TFCidadeCad, FCidadeCad);
  Application.CreateForm(TFRCidade_Cidade, FRCidade_Cidade);
  Application.CreateForm(TFCadastroParam, FCadastroParam);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TFRamoCons, FRamoCons);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TFMotivoCons, FMotivoCons);
  Application.CreateForm(TFClassCadastroCons, FClassCadastroCons);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TFVendedorCons, FVendedorCons);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TFPracaCons, FPracaCons);
  FSplash.Hide;
  FSplash.Free;
  Application.Run;
end.
