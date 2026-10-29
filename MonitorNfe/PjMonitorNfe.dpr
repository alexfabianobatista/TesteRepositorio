program PjMonitorNfe;

uses
  Forms,
  UNfe_cl in 'UNfe_cl.pas' {DMNfe: TDataModule},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  UTConsulta in '..\Template\UTConsulta.pas' {FTConsulta},
  UNfeCons in 'UNfeCons.pas' {FNfeCons},
  ULogin in '..\Seguranca\ULOGIN.pas' {FLogin},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  UTParametro in '..\Template\UTPARAMETRO.pas' {FTParametro},
  UNFeParam in 'UNFeParam.pas' {FNFeParam},
  UFmFilial in '..\Frames\UFmFilial.pas' {FmFilial: TFrame},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UFmEstado in '..\Frames\UFmEstado.pas' {FmEstado: TFrame},
  UEstado_cl in '..\Cadastro\UEstado_cl.pas' {DMEstado: TDataModule},
  UEstadoCons in '..\Cadastro\UEstadoCons.pas' {FEstadoCons},
  UInutilizacaoCons in 'UInutilizacaoCons.pas' {FInutilizacaoCons},
  UMensagemUsuario_cl in '..\Cadastro\UMensagemUsuario_cl.pas' {DmMensagemUsuario: TDataModule},
  UCodEstadoIBGE in 'UCodEstadoIBGE.pas',
  UStatusXML in 'UStatusXML.pas',
  UStatusNfeCons in 'UStatusNfeCons.pas' {FStatusNfeCons},
  UFmNfeLote in '..\Frames\UFmNfeLote.pas' {FmNfeLote: TFrame},
  UNfEletronicaLote_cl in '..\Vendas\UNfEletronicaLote_cl.pas' {DMNfEletronicaLote: TDataModule},
  ConexaoRPC in '..\MyLib\ConexaoRPC.pas',
  UNFeRetorno in '..\MyLib\UNFeRetorno.pas' {FNFeRetorno},
  UFmCadastro in '..\Frames\UFmCadastro.pas' {FmCadastro: TFrame},
  UFmCidade in '..\Frames\UFmCidade.pas' {FmCidade: TFrame},
  UFmClassificacao in '..\Frames\UFmClassificacao.pas' {FmClassificacao: TFrame},
  UFmMotivo in '..\Frames\UFmMotivo.pas' {FmMotivo: TFrame},
  UFmRegiao in '..\Frames\UFmRegiao.pas' {FmRegiao: TFrame},
  UFmTipoCadastro in '..\Frames\UFmTipoCadastro.pas' {FmTipoCadastro: TFrame},
  UFmVendedor in '..\Frames\UFmVendedor.pas' {FmVendedor: TFrame},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOficinaPassword},
  UTRelSimples in '..\Template\UTRELSIMPLES.pas' {FTRelSimples},
  UNotaSaida_cl in '..\Vendas\UNotaSaida_cl.pas' {DMNotaSaida: TDataModule},
  UCteLote_cl in '..\Conhecimento\UCteLote_cl.pas' {DMCteLote: TDataModule},
  UConhecimento_cl in '..\Conhecimento\UConhecimento_cl.pas' {DMConhecimento: TDataModule},
  URBloqueto_CEF in '..\ContaReceber\URBloqueto_CEF.pas' {FRBloqueto_CEF},
  URBloqueto_HSBC in '..\ContaReceber\URBloqueto_HSBC.pas' {FRBloqueto_HSBC},
  URBloqueto_Rural in '..\ContaReceber\URBloqueto_Rural.pas' {FRBloqueto_Rural},
  URBloqueto_Santander in '..\ContaReceber\URBloqueto_Santander.pas' {FRBloqueto_Santander},
  URBloqueto_Sicoob in '..\ContaReceber\URBloqueto_Sicoob.pas' {FRBloqueto_Sicoob},
  URBloqueto_Sicredi in '..\ContaReceber\URBloqueto_Sicredi.pas' {FRBloqueto_Sicredi},
  URBloqueto_Sudameris in '..\ContaReceber\URBloqueto_Sudameris.pas' {FRBloqueto_Sudameris},
  URBloqueto_Unibanco in '..\ContaReceber\URBloqueto_Unibanco.pas' {FRBloqueto_Unibanco},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UProdutos_UltimasCompras in '..\Estoque\UProdutos_UltimasCompras.pas' {FProdutos_UltimasCompras},
  UProdutos_UltimasVendas in '..\Estoque\UProdutos_UltimasVendas.pas' {FProdutos_UltimasVendas},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  UPedido_cl in '..\Vendas\UPedido_cl.pas' {DMPedido: TDataModule},
  UMensagemSMS in '..\Template\UMensagemSMS.pas' {FMensagemSMS},
  UContasReceber_cl in '..\ContaReceber\UContasReceber_cl.pas' {DMContasReceber: TDataModule},
  UContasReceberParam in '..\ContaReceber\UContasReceberParam.pas',
  URBloqueto_Bradesco in '..\ContaReceber\URBloqueto_Bradesco.pas' {FRBloqueto_Bradesco},
  URBloquetoSafra in '..\ContaReceber\URBloquetoSafra.pas' {FRBloqueto_Safra},
  URBoletaBB in '..\ContaReceber\URBoletaBB.pas',
  UFmContaCorrente in '..\Frames\UFmContaCorrente.pas' {FmContaCorrente: TFrame},
  UFmObra in '..\Frames\UFmObra.pas' {FmObra: TFrame},
  UFmTitulo in '..\Frames\UFmTitulo.pas' {FmTitulo: TFrame},
  UFmBanco in '..\Frames\UFmBanco.pas' {FMBanco: TFrame},
  UFmContrato in '..\Frames\UFmContrato.pas' {FmContrato: TFrame},
  UFmDatas in '..\Frames\UFmDatas.pas' {FmDatas: TFrame},
  UFmDepartamento in '..\Frames\UFmDepartamento.pas' {FmDepartamento: TFrame},
  UFmFinalidade in '..\Frames\UFmFinalidade.pas' {FmFinalidade: TFrame},
  UFmRamo in '..\Frames\UFmRamo.pas' {FmRamo: TFrame},
  UCaixaLanc_Cont in '..\Caixa\UCaixaLanc_Cont.pas' {FCaixa_Lanc_Cont},
  UNotaSaidaCons in '..\Vendas\UNotaSaidaCons.pas' {FNotaSaidaCons},
  UObraContrato_cl in '..\Obra\UObraContrato_cl.pas' {DMObraContrato: TDataModule},
  UContasReceberCons in '..\ContaReceber\UContasReceberCons.pas' {FContasReceberCons},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  UObra_cl in '..\Obra\UObra_cl.pas' {DMObra: TDataModule},
  UMensagem_cl in '..\Compras\UMensagem_cl.pas' {DMMensagem: TDataModule},
  UImpressoraFiscal_cl in '..\Vendas\UImpressoraFiscal_cl.pas' {DMImpressoraFiscal: TDataModule},
  UEmbarque_cl in '..\Vendas\UEmbarque_cl.pas' {DMEmbarque: TDataModule},
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  UPadraoProduto_cl in '..\Agricola\UPadraoProduto_cl.pas' {DMPadraoProduto: TDataModule},
  UEnviaEmail in '..\Agricola\UEnviaEmail.pas' {FEnviaEmail},
  Ucontrato_cl in '..\Agricola\Ucontrato_cl.pas' {DMContrato: TDataModule},
  USenha in '..\Vendas\USenha.pas' {FSenha},
  UVendaPerdidaCad in '..\Estoque\UVendaPerdidaCad.pas' {FVendaPerdidaCad},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  UClasseCons in '..\Estoque\UClasseCons.pas' {FClasseCons},
  UBancoAgencia_cl in '..\ContaPagar\UBancoAgencia_cl.pas' {DMBancoAgencia: TDataModule},
  UBancosCons in '..\ContaPagar\UBancosCons.pas' {FBancosCons},
  UContaCorrenteCons in '..\ContaPagar\UContaCorrenteCons.pas' {FContaCorrenteCons},
  UContratoVenda_Cons in '..\Agricola\UContratoVenda_Cons.pas' {FContrato_VendaCons},
  UFinalidadeCons in '..\ContaPagar\UFinalidadeCons.pas' {FFinalidadeCons},
  UObraCons in '..\Obra\UObraCons.pas' {FObraCons},
  UThreadAction in '..\MyLib\UThreadAction.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'PjMonitorNfe';
  Application.CreateForm(TDMNfe, DMNfe);
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDmMensagemUsuario, DmMensagemUsuario);
  Application.CreateForm(TDMNfEletronicaLote, DMNfEletronicaLote);
  Application.CreateForm(TFNfeCons, FNfeCons);
  Application.CreateForm(TFOficinaPassword, FOficinaPassword);
  Application.CreateForm(TFTRelSimples, FTRelSimples);
  Application.CreateForm(TDMNotaSaida, DMNotaSaida);
  Application.CreateForm(TDMCteLote, DMCteLote);
  Application.CreateForm(TDMConhecimento, DMConhecimento);
  Application.CreateForm(TFRBloqueto_CEF, FRBloqueto_CEF);
  Application.CreateForm(TFRBloqueto_HSBC, FRBloqueto_HSBC);
  Application.CreateForm(TFRBloqueto_Rural, FRBloqueto_Rural);
  Application.CreateForm(TFRBloqueto_Santander, FRBloqueto_Santander);
  Application.CreateForm(TFRBloqueto_Sicoob, FRBloqueto_Sicoob);
  Application.CreateForm(TFRBloqueto_Sicredi, FRBloqueto_Sicredi);
  Application.CreateForm(TFRBloqueto_Sudameris, FRBloqueto_Sudameris);
  Application.CreateForm(TFRBloqueto_Unibanco, FRBloqueto_Unibanco);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TFProdutos_UltimasCompras, FProdutos_UltimasCompras);
  Application.CreateForm(TFProdutos_UltimasVendas, FProdutos_UltimasVendas);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TFProdutoCons, FProdutoCons);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TDMPedido, DMPedido);
  Application.CreateForm(TFMensagemSMS, FMensagemSMS);
  Application.CreateForm(TDMContasReceber, DMContasReceber);
  Application.CreateForm(TFRBloqueto_Bradesco, FRBloqueto_Bradesco);
  Application.CreateForm(TFRBloqueto_Safra, FRBloqueto_Safra);
  Application.CreateForm(TFCaixa_Lanc_Cont, FCaixa_Lanc_Cont);
  Application.CreateForm(TFNotaSaidaCons, FNotaSaidaCons);
  Application.CreateForm(TDMObraContrato, DMObraContrato);
  Application.CreateForm(TFContasReceberCons, FContasReceberCons);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMObra, DMObra);
  Application.CreateForm(TDMMensagem, DMMensagem);
  Application.CreateForm(TDMImpressoraFiscal, DMImpressoraFiscal);
  Application.CreateForm(TDMEmbarque, DMEmbarque);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TDMPadraoProduto, DMPadraoProduto);
  Application.CreateForm(TFEnviaEmail, FEnviaEmail);
  Application.CreateForm(TDMContrato, DMContrato);
  Application.CreateForm(TFSenha, FSenha);
  Application.CreateForm(TFVendaPerdidaCad, FVendaPerdidaCad);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TFClasseCons, FClasseCons);
  Application.CreateForm(TDMBancoAgencia, DMBancoAgencia);
  Application.CreateForm(TFBancosCons, FBancosCons);
  Application.CreateForm(TFContaCorrenteCons, FContaCorrenteCons);
  Application.CreateForm(TFContrato_VendaCons, FContrato_VendaCons);
  Application.CreateForm(TFFinalidadeCons, FFinalidadeCons);
  Application.CreateForm(TFObraCons, FObraCons);
  Application.Run;
end.
