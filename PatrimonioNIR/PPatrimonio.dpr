program PPatrimonio;





uses
  Forms,
  UTMenuPrincipal in '..\TEMPLATE\UTMENUPRINCIPAL.pas' {FTMenuPrincipal},
  UMenuPatrimonio in 'UMenuPatrimonio.pas' {FMenuPatrimonio},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  ULogin in '..\Seguranca\ULogin.pas' {FLogin},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UTrocaSenha in '..\Seguranca\UTrocaSenha.pas' {FTrocaSenha},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UParamCadFuncao in '..\Seguranca\UParamCadFuncao.pas' {FParamCadFuncao},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UMonitorSistema in '..\Banco\UMonitorSistema.pas' {FMonitorSistema},
  Upatrimonio_cl in 'Upatrimonio_cl.pas' {DMPatrimonio: TDataModule},
  UPatrimonioCad in 'UPatrimonioCad.pas' {FPatrimonioCad},
  UFilialCons in '..\Cadastro\UFilialCons.pas',
  UpatrimonioCons in 'UpatrimonioCons.pas' {FPatrimonioCons},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  UUsuarioCons in '..\Seguranca\UUsuarioCons.pas' {FUsuarioCons},
  UDepartamento_cl in '..\Cadastro\UDepartamento_cl.pas' {DMDepartamento: TDataModule},
  UDepartamentoCons in '..\Cadastro\UDepartamentoCons.pas' {FDepartamentoCons},
  URPatrimonio in 'URPatrimonio.pas' {FRPatrimonio},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UPatrimonio_Param in 'UPatrimonio_Param.pas' {FPatrimonio_Param},
  UrPatrimonioFicha in 'UrPatrimonioFicha.pas' {FrPatrimonioFicha},
  UTipoEquipamento_cl in 'UTipoEquipamento_cl.pas' {DMTipoEquipamento: TDataModule},
  UTipoEquipamentoCad in 'UTipoEquipamentoCad.pas' {FTipoEquipamentoCad},
  UTipoEquipamentoCons in 'UTipoEquipamentoCons.pas' {FTipoEquipamentoCons},
  URTipoEquipamento in 'URTipoEquipamento.pas' {FrTipoEquipamento},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UTipoEquipamentoCarac_Cad in 'UTipoEquipamentoCarac_Cad.pas' {FTipoEquipamentoCarac_Cad},
  UTipoEquipamentoCarac_Cons in 'UTipoEquipamentoCarac_Cons.pas' {FTipoEquipamentoCarac_Cons},
  UCategoriaProfissional_cl in 'UCategoriaProfissional_cl.pas' {DMCategoriaProfissional: TDataModule},
  UCategoriaCad in 'UCategoriaCad.pas' {FCategoriaCad},
  UCategoriaCons in 'UCategoriaCons.pas' {FCategoriaCons},
  UrCategoria in 'UrCategoria.pas' {FRCategoria},
  UFuncionario_cl in 'UFuncionario_cl.pas' {DMFuncionario: TDataModule},
  UFuncionarioCad in 'UFuncionarioCad.pas' {FFuncionarioCad},
  UFFuncionarioCons in 'UFFuncionarioCons.pas' {FFuncionarioCons},
  UrFuncionario in 'UrFuncionario.pas' {FRFuncionario},
  UPrioridade_cl in 'UPrioridade_cl.pas' {DMPrioridade: TDataModule},
  UPrioridadeCad in 'UPrioridadeCad.pas' {FPrioridadeCad},
  UPrioridadeCons in 'UPrioridadeCons.pas' {FPrioridadeCons},
  URPrioridade in 'URPrioridade.pas' {FRPrioridade},
  UTipoServico_cl in 'UTipoServico_cl.pas' {DMTipoServico: TDataModule},
  U_TipoServicoCad in 'U_TipoServicoCad.pas' {FTipoServicoCad},
  UTipoServicoCons in 'UTipoServicoCons.pas' {FTipoServicoCons},
  URTipoServico in 'URTipoServico.pas' {FRTipoServico},
  U_AtividadeCad in 'U_AtividadeCad.pas' {FAtividadeCad},
  UAtividade_cl in 'UAtividade_cl.pas' {DMAtividade: TDataModule},
  UAtividadeCons in 'UAtividadeCons.pas' {FAtividadeCons},
  UProcedimentoCad in 'UProcedimentoCad.pas' {FProcedimentoCad},
  UProcedimento_cl in 'UProcedimento_cl.pas' {DMProcedimento: TDataModule},
  UProcedimentoCons in 'UProcedimentoCons.pas' {FProcedimentoCons},
  URAtividade in 'URAtividade.pas' {FRAtividade},
  URProcedimento in 'URProcedimento.pas' {FRProcedimento},
  UPatrimonioItemCons in 'UPatrimonioItemCons.pas' {FPatrimonioItemCons},
  UOSPatrimonio in 'UOSPatrimonio.pas' {FOSPatrimonio},
  UOSPatrimonio_cl in 'UOSPatrimonio_cl.pas' {DMOSPatrimonio: TDataModule},
  UOSPatrimonioCons in 'UOSPatrimonioCons.pas' {FOSPatrimonioCons},
  UROSPatrimonio in 'UROSPatrimonio.pas' {FROSPatrimonio},
  URHistoricoEquipamento in 'URHistoricoEquipamento.pas' {FRHistoricoEquipamento},
  UROSAberto in 'UROSAberto.pas' {FROSAberto},
  UEncerramentoDescAtividade in 'UEncerramentoDescAtividade.pas' {FEncerramentoDescAtividade},
  URFormularioOS in 'URFormularioOS.pas' {FRFormularioOS},
  UOSdoDia in 'UOSdoDia.pas' {FOSdoDia},
  URTipoEquipamentoCarac in 'URTipoEquipamentoCarac.pas' {FRTipoEquipamentoCarac},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UApontamentoCad in 'UApontamentoCad.pas' {FApontamentoCad},
  UApontamento_cl in 'UApontamento_cl.pas' {DMApontamento: TDataModule},
  UTConsulta in '..\TEMPLATE\UTConsulta.pas' {FTConsulta},
  UApontamentoCons in 'UApontamentoCons.pas' {FApontamentoCons},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URApontamento in 'URApontamento.pas' {FRApontamento},
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
  UFuncaoFuncionario_cl in '..\SegurancaTrabalho\UFuncaoFuncionario_cl.pas' {DMFuncaoFuncionario: TDataModule},
  UFuncaoFuncionarioCons in '..\SegurancaTrabalho\UFuncaoFuncionarioCons.pas' {FFuncaoFuncionarioCons},
  URelatorioConsulta_cl in '..\Template\URelatorioConsulta_cl.pas' {DmRelatorioConsulta: TDataModule},
  URConsulta in '..\Template\URConsulta.pas' {FRConsulta},
  UPersonalizaRelatorio in '..\Template\UPersonalizaRelatorio.pas' {FPersonalizaRelatorio},
  UOficinaPassword in '..\Oficina\UOficinaPassword.pas' {FOficinaPassword},
  UCidade_cl in '..\Cadastro\UCidade_cl.pas' {DMCidade: TDataModule},
  UCidadeCons in '..\Cadastro\UCidadeCons.pas' {FCidadeCons},
  UCidadeCad in '..\Cadastro\UCidadeCad.pas' {FCidadeCad},
  UEstado_cl in '..\Cadastro\UEstado_cl.pas' {DMEstado: TDataModule},
  UEstadoCons in '..\Cadastro\UEstadoCons.pas' {FEstadoCons},
  URCidade_Cidade in '..\Cadastro\URCidade_Cidade.pas' {FRCidade_Cidade},
  UCadastroParam in '..\Cadastro\UCadastroParam.pas' {FCadastroParam},
  URegiao_cl in '..\Cadastro\URegiao_cl.pas' {DMRegiao: TDataModule},
  URegiaoCons in '..\Cadastro\URegiaoCons.pas' {FRegiaoCons},
  URamo_cl in '..\Cadastro\URamo_cl.pas' {DMRamo: TDataModule},
  URamoCons in '..\Cadastro\URamoCons.pas' {FRamoCons},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UClassCadastroCons in '..\Cadastro\UClassCadastroCons.pas' {FClassCadastroCons},
  UMotivo_cl in '..\Cadastro\UMotivo_cl.pas' {DMMotivo: TDataModule},
  UMotivoCons in '..\Cadastro\UMotivoCons.pas' {FMotivoCons},
  UPraca_cl in '..\Cadastro\UPraca_cl.pas' {DMPraca: TDataModule},
  UPracaCons in '..\Cadastro\UPracaCons.pas' {FPracaCons},
  UScpc_cl in '..\Cadastro\UScpc_cl.pas' {DMScpc: TDataModule},
  UScpcCons in '..\Cadastro\UScpcCons.pas' {FScpcCons},
  UMensagemUsuario_cl in '..\Cadastro\UMensagemUsuario_cl.pas' {DmMensagemUsuario: TDataModule},
  UEscolheTela in '..\Template\UEscolheTela.pas' {FEscolheTela},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UMensagemSMS in '..\Template\UMensagemSMS.pas' {FMensagemSMS},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UFinalidade_cl in '..\ContaPagar\UFinalidade_cl.pas' {DMFinalidade: TDataModule},
  UPlanoConta_cl in '..\Contabil\UPlanoConta_cl.pas' {DMPlanoConta: TDataModule},
  UPlanilha_cl in '..\Contabil\UPlanilha_cl.pas' {DMPlanilha: TDataModule},
  UTributacao_cl in '..\Estoque\UTributacao_cl.pas' {DMTributacao: TDataModule},
  URadioDialog in '..\Vendas\URadioDialog.pas' {FRadioDialog},
  UTef_cl in '..\Vendas\UTef_cl.pas' {DMTEF: TDataModule},
  UTefInputBoxCheque in '..\Vendas\UTefInputBoxCheque.pas' {FTefInputBoxCheque},
  UProdutoAgricola_cl in '..\Agricola\UProdutoAgricola_cl.pas' {DMProdutoAgricola: TDataModule},
  USerie_cl in '..\Compras\USerie_cl.pas' {DMSerie: TDataModule},
  UDesconto_Produtor_cl in '..\Agricola\UDesconto_Produtor_cl.pas' {DMDescontoProdutor: TDataModule},
  UTefInputBox in '..\Vendas\UTefInputBox.pas' {FTefInputBox},
  UPadraoProduto_cl in '..\Agricola\UPadraoProduto_cl.pas' {DMPadraoProduto: TDataModule},
  URomaneioAgricola_cl in '..\Agricola\URomaneioAgricola_cl.pas' {DMRomaneioAgricola: TDataModule},
  UEnviaEmail in '..\Agricola\UEnviaEmail.pas' {FEnviaEmail},
  UFmDepartamento in '..\Frames\UFmDepartamento.pas' {FmDepartamento: TFrame},
  Ucontrato_cl in '..\Agricola\Ucontrato_cl.pas' {DMContrato: TDataModule},
  UVendaPerdidaCad in '..\Estoque\UVendaPerdidaCad.pas' {FVendaPerdidaCad},
  UProdutos_UltimasCompras in '..\Estoque\UProdutos_UltimasCompras.pas' {FProdutos_UltimasCompras},
  UClasse_cl in '..\Estoque\UClasse_cl.pas' {DMClasse: TDataModule},
  UClasseCons in '..\Estoque\UClasseCons.pas' {FClasseCons},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UProdutos_UltimasVendas in '..\Estoque\UProdutos_UltimasVendas.pas' {FProdutos_UltimasVendas};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Patrimônio';
  Application.HelpFile := 'F:\Executaveis\Manual\P_Patrimonio.hlp';
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMPatrimonio, DMPatrimonio);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMDepartamento, DMDepartamento);
  Application.CreateForm(TDMTipoEquipamento, DMTipoEquipamento);
  Application.CreateForm(TDMCategoriaProfissional, DMCategoriaProfissional);
  Application.CreateForm(TDMFuncionario, DMFuncionario);
  Application.CreateForm(TDMPrioridade, DMPrioridade);
  Application.CreateForm(TDMTipoServico, DMTipoServico);
  Application.CreateForm(TDMAtividade, DMAtividade);
  Application.CreateForm(TDMProcedimento, DMProcedimento);
  Application.CreateForm(TDMOSPatrimonio, DMOSPatrimonio);
  Application.CreateForm(TDMApontamento, DMApontamento);
  Application.CreateForm(TDMFuncaoFuncionario, DMFuncaoFuncionario);
  Application.CreateForm(TDmRelatorioConsulta, DmRelatorioConsulta);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TDMScpc, DMScpc);
  Application.CreateForm(TDmMensagemUsuario, DmMensagemUsuario);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TFMenuPatrimonio, FMenuPatrimonio);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMFinalidade, DMFinalidade);
  Application.CreateForm(TDMPlanoConta, DMPlanoConta);
  Application.CreateForm(TDMPlanilha, DMPlanilha);
  Application.CreateForm(TDMTributacao, DMTributacao);
  Application.CreateForm(TFRadioDialog, FRadioDialog);
  Application.CreateForm(TDMTEF, DMTEF);
  Application.CreateForm(TFTefInputBoxCheque, FTefInputBoxCheque);
  Application.CreateForm(TDMProdutoAgricola, DMProdutoAgricola);
  Application.CreateForm(TDMSerie, DMSerie);
  Application.CreateForm(TDMDescontoProdutor, DMDescontoProdutor);
  Application.CreateForm(TFTefInputBox, FTefInputBox);
  Application.CreateForm(TDMPadraoProduto, DMPadraoProduto);
  Application.CreateForm(TDMRomaneioAgricola, DMRomaneioAgricola);
  Application.CreateForm(TFEnviaEmail, FEnviaEmail);
  Application.CreateForm(TDMContrato, DMContrato);
  Application.CreateForm(TFVendaPerdidaCad, FVendaPerdidaCad);
  Application.CreateForm(TFProdutos_UltimasCompras, FProdutos_UltimasCompras);
  Application.CreateForm(TDMClasse, DMClasse);
  Application.CreateForm(TFClasseCons, FClasseCons);
  Application.CreateForm(TFProdutoCons, FProdutoCons);
  Application.CreateForm(TFProdutos_UltimasVendas, FProdutos_UltimasVendas);
  Application.Run;
end.
