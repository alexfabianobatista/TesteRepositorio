program PjPromotor;

uses
  Forms,
  UTrocaSenha in '..\Seguranca\UTROCASENHA.pas' {FTrocaSenha},
  UUsuario_cl in '..\Seguranca\UUsuario_cl.pas' {DMUsuario: TDataModule},
  UAditoria_cl in '..\Seguranca\UAditoria_cl.pas' {DMAuditoria: TDataModule},
  UControleInterno_cl in '..\Seguranca\UControleInterno_cl.pas' {DMControleInterno: TDataModule},
  UFuncao_cl in '..\Seguranca\UFuncao_cl.pas' {DMFuncao: TDataModule},
  UGrupo_cl in '..\Seguranca\UGrupo_cl.pas' {DMGrupo: TDataModule},
  ULogin in '..\Seguranca\ULOGIN.pas' {FLogin},
  UTela_cl in '..\Seguranca\UTela_cl.pas' {DMTela: TDataModule},
  UOracle_cl in '..\Banco\UOracle_cl.pas' {DMOracle: TDataModule},
  USplash in '..\Banco\USplash.pas' {FSplash},
  UParamSistema_cl in '..\Cadastro\UParamSistema_cl.pas' {DMParamSistema: TDataModule},
  UTMenuPrincipal in '..\TEMPLATE\UTMENUPRINCIPAL.pas' {FTMenuPrincipal},
  UMenuPromotor in 'UMenuPromotor.pas' {FMenuPromotor},
  UPromoto_cl in 'UPromoto_cl.pas' {DMPromotor: TDataModule},
  UPromotorCad in 'UPromotorCad.pas' {FPromotorCad},
  UCidadeCons in '..\Cadastro\UCidadeCons.pas' {FCidadeCons},
  UCidade_cl in '..\Cadastro\UCidade_cl.pas' {DMCidade: TDataModule},
  UCidadeCad in '..\Cadastro\UCidadeCad.pas' {FCidadeCad},
  UEstadoCons in '..\Cadastro\UEstadoCons.pas' {FEstadoCons},
  UEstado_cl in '..\Cadastro\UEstado_cl.pas' {DMEstado: TDataModule},
  URCidade_Cidade in '..\Cadastro\URCidade_Cidade.pas' {FRCidade_Cidade},
  UCadastroParam in '..\Cadastro\UCadastroParam.pas' {FCadastroParam},
  UTipoCadastroCons in '..\Cadastro\UTipoCadastroCons.pas' {FTipoCadastroCons},
  UTipoCadastro_cl in '..\Cadastro\UTipoCadastro_cl.pas' {DMTipoCadastro: TDataModule},
  URegiaoCons in '..\Cadastro\URegiaoCons.pas' {FRegiaoCons},
  URegiao_cl in '..\Cadastro\URegiao_cl.pas' {DMRegiao: TDataModule},
  URamoCons in '..\Cadastro\URamoCons.pas' {FRamoCons},
  URamo_cl in '..\Cadastro\URamo_cl.pas' {DMRamo: TDataModule},
  UMotivoCons in '..\Cadastro\UMotivoCons.pas' {FMotivoCons},
  UMotivo_cl in '..\Cadastro\UMotivo_cl.pas' {DMMotivo: TDataModule},
  UCadastro_cl in '..\Cadastro\UCadastro_cl.pas' {DMCadastro: TDataModule},
  UClassCadastro_cl in '..\Cadastro\UClassCadastro_cl.pas' {DMClassCadastro: TDataModule},
  UCadastroCons in '..\Cadastro\UCadastroCons.pas' {FCadastroCons},
  UClassCadastroCons in '..\Cadastro\UClassCadastroCons.pas' {FClassCadastroCons},
  UVendedorCons in '..\Cadastro\UVendedorCons.pas' {FVendedorCons},
  UVendedor_cl in '..\Cadastro\UVendedor_cl.pas' {DMVendedor: TDataModule},
  UFilialCons in '..\Cadastro\UFilialCons.pas' {FFilialCons},
  UFilial_cl in '..\Cadastro\UFilial_cl.pas' {DMFilial: TDataModule},
  UPracaCons in '..\Cadastro\UPracaCons.pas' {FPracaCons},
  UPraca_cl in '..\Cadastro\UPraca_cl.pas' {DMPraca: TDataModule},
  UPromotorCons in 'UPromotorCons.pas' {FPromotorCons},
  UTParametro in '..\TEMPLATE\UTPARAMETRO.pas' {FTParametro},
  UPromotorParam in 'UPromotorParam.pas' {FPromotorParam},
  URPromotor in 'URPromotor.pas' {FRPromotor},
  UReposicaoCad in 'UReposicaoCad.pas' {FReposicaoCad},
  UProduto_cl in '..\Estoque\UProduto_cl.pas' {DMProduto: TDataModule},
  UProdutoCons in '..\Estoque\UProdutoCons.pas' {FProdutoCons},
  UEstoque_cl in '..\Estoque\UEstoque_cl.pas' {DMEstoque: TDataModule},
  UMoeda_cl in '..\Cadastro\UMoeda_cl.pas' {DMMoeda: TDataModule},
  UOperacao_cl in '..\Compras\UOperacao_cl.pas' {DMOperacao: TDataModule},
  UReposicaoCons in 'UReposicaoCons.pas' {FReposicaoCons},
  URReposicao in 'URReposicao.pas' {FRReposicao},
  UHistoricoPromotor_cl in '..\Caixa\UHistoricoPromotor_cl.pas' {DMHistoricoPromotor: TDataModule},
  UHistoricoPromotorCad in '..\Caixa\UHistoricoPromotorCad.pas' {FHistoricoPromotorCad},
  UHistoricoPromotorCons in '..\Caixa\UHistoricoPromotorCons.pas' {FHistoricoPromotorCons},
  URHistoricoPromotor in '..\Caixa\URHistoricoPromotor.pas' {FRHistoricoPromotor},
  UTCadSimples in '..\TEMPLATE\UTCADSIMPLES.pas' {FTCadSimples},
  UReposicaoMov in '..\Caixa\UReposicaoMov.pas' {FReposicaoMov},
  UTConsulta in '..\TEMPLATE\UTCONSULTA.pas' {FTConsulta},
  UReposicaoMovCons in '..\Caixa\UReposicaoMovCons.pas' {FReposicaoMovCons},
  UTRelSimples in '..\TEMPLATE\UTRELSIMPLES.pas' {FTRelSimples},
  URReposicaoMov in '..\Caixa\URReposicaoMov.pas' {FRReposicaoMov};

{$R *.RES}

begin
  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.Title := 'Sistema de Promoção de Vendas';
//  Application.HelpFile := 'F:\Executaveis\Manual\P_ESTOQUE.HLP';
  Application.CreateForm(TFMenuPromotor, FMenuPromotor);
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TDMAuditoria, DMAuditoria);
  Application.CreateForm(TDMControleInterno, DMControleInterno);
  Application.CreateForm(TDMFuncao, DMFuncao);
  Application.CreateForm(TDMGrupo, DMGrupo);
  Application.CreateForm(TDMTela, DMTela);
  Application.CreateForm(TDMOracle, DMOracle);
  Application.CreateForm(TDMParamSistema, DMParamSistema);
  Application.CreateForm(TDMPromotor, DMPromotor);
  Application.CreateForm(TDMCidade, DMCidade);
  Application.CreateForm(TDMEstado, DMEstado);
  Application.CreateForm(TDMTipoCadastro, DMTipoCadastro);
  Application.CreateForm(TDMRegiao, DMRegiao);
  Application.CreateForm(TDMRamo, DMRamo);
  Application.CreateForm(TDMMotivo, DMMotivo);
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TDMClassCadastro, DMClassCadastro);
  Application.CreateForm(TDMVendedor, DMVendedor);
  Application.CreateForm(TDMFilial, DMFilial);
  Application.CreateForm(TDMPraca, DMPraca);
  Application.CreateForm(TDMProduto, DMProduto);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDMMoeda, DMMoeda);
  Application.CreateForm(TDMOperacao, DMOperacao);
  Application.CreateForm(TDMHistoricoPromotor, DMHistoricoPromotor);
  Application.CreateForm(TFHistoricoPromotorCad, FHistoricoPromotorCad);
  Application.CreateForm(TFHistoricoPromotorCons, FHistoricoPromotorCons);
  Application.CreateForm(TFRHistoricoPromotor, FRHistoricoPromotor);
  Application.CreateForm(TFReposicaoMov, FReposicaoMov);
  Application.CreateForm(TFReposicaoMovCons, FReposicaoMovCons);
  Application.CreateForm(TFRReposicaoMov, FRReposicaoMov);
  FSplash.Hide;
  FSplash.Free;
  Application.Run;
end.
