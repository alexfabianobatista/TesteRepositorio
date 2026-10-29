program PjMedico;
//Criação: 15/01/2008 por Camila.
uses
  Forms,
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UTMenuPrincipal in '..\Template\UTMenuPrincipal.pas' {FTMenuPrincipal},
  UMenuMedico in 'UMenuMedico.pas' {FMenuMedico},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UMedico_cl in 'UMedico_cl.pas' {DMMedico: TDataModule},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UMedicoCad in 'UMedicoCad.pas' {FMedicoCad},
  UTConsulta in '\\servidor\trabalho\Delphi_New\Template\UTConsulta.pas' {FTConsulta},
  UMedicoCons in 'UMedicoCons.pas' {FMedicoCons},
  UConvenio_cl in 'UConvenio_cl.pas' {DMConvenio: TDataModule},
  UConvenioCad in 'UConvenioCad.pas' {FConvenioCad},
  UConvenioCons in 'UConvenioCons.pas' {FConvenioCons},
  UBaseCalculoIRF_cl in '..\Conhecimento\UBaseCalculoIRF_cl.pas' {DMIRF: TDataModule},
  UIRFCad in '..\Conhecimento\UIRFCad.pas' {FBaseCalcIRFCad},
  UTRelSimples in '\\servidor\trabalho\Delphi_New\Template\UTRELSIMPLES.pas' {FTRelSimples},
  URMedico in 'URMedico.pas' {FRMedico},
  URConvenio in 'URConvenio.pas' {FRConvenio},
  ULancamento_cl in 'ULancamento_cl.pas' {DMLancamento: TDataModule},
  ULancamentoCad in 'ULancamentoCad.pas' {FLancamentoCad},
  ULancamentoCons in 'ULancamentoCons.pas' {FLancamentoCons},
  UFmMedico in '..\Frames\UFmMedico.pas' {FmMedico: TFrame},
  UFmDatas in '..\Frames\UFmDatas.pas' {FmDatas: TFrame},
  UFmConvenio in '..\Frames\UFmConvenio.pas' {FmConvenio: TFrame},
  UTParametro in '\\Servidor\trabalho\Delphi_new\Template\UTPARAMETRO.pas' {FTParametro},
  ULancamentoParam in 'ULancamentoParam.pas' {FLancamentoParam},
  URLancamento in 'URLancamento.pas' {FRLancamento},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  URReciboMedico in 'URReciboMedico.pas' {FRReciboMedico},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  URLancamentoSintetico in 'URLancamentoSintetico.pas' {FRLancamentoSintetico},
  USequencia_cl in '..\Cadastro\USequencia_cl.pas' {DMSequencia: TDataModule},
  URequisicaoTransfusaoCad in 'URequisicaoTransfusaoCad.pas' {FRequisicaoTransfusaoCad},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
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
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  URequisicaoTransfusaoParam in 'URequisicaoTransfusaoParam.pas' {FRequisicaoTransfusaoParam},
  URRequisicaoTransfusao in 'URRequisicaoTransfusao.pas' {FRRequisicaoTransfusao},
  URequisicaoTransfusaoCons in 'URequisicaoTransfusaoCons.pas' {FRequisicaoTransfusaoCons},
  URequisicaoTransfusao_cl in 'URequisicaoTransfusao_cl.pas' {DMRequisicaoTransfusao: TDataModule},
  UCadastroCad in '..\Cadastro\UCadastroCad.pas' {FCadastroCad},
  UBancosCons in '..\ContaPagar\UBancosCons.pas' {FBancosCons},
  UBancoAgencia_cl in '..\ContaPagar\UBancoAgencia_cl.pas' {DMBancoAgencia: TDataModule},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UEtiquetas in '..\Estoque\UEtiquetas.pas',
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UProdutoRelatorio_cl in '..\Estoque\UProdutoRelatorio_cl.pas' {DMProdutoRelatorio: TDataModule},
  UPrazoVencimentoCons in '..\ContaReceber\UPrazoVencimentoCons.pas' {FPrazoVencimentoCons},
  UPrazoVencimento_cl in '..\ContaReceber\UPrazoVencimento_cl.pas' {DMPrazoVencimento: TDataModule},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  UContaCorrenteCons in '..\ContaPagar\UContaCorrenteCons.pas' {FContaCorrenteCons};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMMedico, DMMedico);
  Application.CreateForm(TDMConvenio, DMConvenio);
  Application.CreateForm(TDMIRF, DMIRF);
  Application.CreateForm(TDMLancamento, DMLancamento);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TFMenuMedico, FMenuMedico);
  Application.CreateForm(TDMSequencia, DMSequencia);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMRequisicaoTransfusao, DMRequisicaoTransfusao);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMProdutoRelatorio, DMProdutoRelatorio);
  Application.CreateForm(TDMPrazoVencimento, DMPrazoVencimento);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.Run;
end.
