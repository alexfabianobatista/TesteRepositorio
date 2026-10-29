unit UMenuCadastro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, ExtCtrls, StdCtrls, Buttons, ImgList, ComCtrls;

type
  TFMenuCadasto = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    Moeda1: TMenuItem;
    Cotaes1: TMenuItem;
    Estado1: TMenuItem;
    EstadoCivil1: TMenuItem;
    TipoCadastro1: TMenuItem;
    Motivo1: TMenuItem;
    Pais1: TMenuItem;
    Regio1: TMenuItem;
    Ramo1: TMenuItem;
    Cadastro1: TMenuItem;
    Filial1: TMenuItem;
    Departamento1: TMenuItem;
    TipoPropriedade1: TMenuItem;
    Vendedor1: TMenuItem;
    ClassifioCadastro1: TMenuItem;
    Parmetros1: TMenuItem;
    Gerncia1: TMenuItem;
    Operao1: TMenuItem;
    Transporte1: TMenuItem;
    Mensagem1: TMenuItem;
    Series1: TMenuItem;
    Sequencia1: TMenuItem;
    Cidade1: TMenuItem;
    D1: TMenuItem;
    MensagemPocket1: TMenuItem;
    CDA1: TMenuItem;
    Imposto1: TMenuItem;
    ValorReferencia1: TMenuItem;
    ConfiguraEmail1: TMenuItem;
    ClientesSCPC1: TMenuItem;
    PreoPCadastro1: TMenuItem;
    Comisso1: TMenuItem;
    MensagensparaUsurios1: TMenuItem;
    Agendamento1: TMenuItem;
    Marketplace1: TMenuItem;
    MalaDireta1: TMenuItem;
    MalaDireta2: TMenuItem;
    SMTP2: TMenuItem;
    MensagemEletrnica2: TMenuItem;
    procedure Moeda1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Cotaes1Click(Sender: TObject);
    procedure Estado1Click(Sender: TObject);
    procedure EstadoCivil1Click(Sender: TObject);
    procedure TipoCadastro1Click(Sender: TObject);
    procedure Motivo1Click(Sender: TObject);
    procedure Pais1Click(Sender: TObject);
    procedure Regio1Click(Sender: TObject);
    procedure Ramo1Click(Sender: TObject);
    procedure Cadastro1Click(Sender: TObject);
    procedure Filial1Click(Sender: TObject);
    procedure Departamento1Click(Sender: TObject);
    procedure TipoPropriedade1Click(Sender: TObject);
    procedure Vendedor1Click(Sender: TObject);
    procedure ClassifioCadastro1Click(Sender: TObject);
    procedure Parmetros1Click(Sender: TObject);
    procedure Gerncia1Click(Sender: TObject);
    procedure Operao1Click(Sender: TObject);
    procedure Transporte1Click(Sender: TObject);
    procedure Mensagem1Click(Sender: TObject);
    procedure Series1Click(Sender: TObject);
    procedure Sequencia1Click(Sender: TObject);
    procedure Cidade1Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure MensagemPocket1Click(Sender: TObject);
    procedure CDA1Click(Sender: TObject);
    procedure Imposto1Click(Sender: TObject);
    procedure ValorReferencia1Click(Sender: TObject);
    procedure ConfiguraEmail1Click(Sender: TObject);
    procedure ClientesSCPC1Click(Sender: TObject);
    procedure PreoPCadastro1Click(Sender: TObject);
    procedure Comisso1Click(Sender: TObject);
    procedure MensagensparaUsurios1Click(Sender: TObject);
    procedure Agendamento1Click(Sender: TObject);
    procedure Marketplace1Click(Sender: TObject);
    procedure MalaDireta2Click(Sender: TObject);
    procedure SMTP2Click(Sender: TObject);
    procedure MensagemEletrnica2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuCadasto: TFMenuCadasto;

implementation

uses UMoedaCad, UTela_cl, UMoedaCotacao, UEstadoCad, UEstadoCivilCad,
  UTipoCadastroCad, UMotivoCad, UPaisCad, URegiaoCad, URamoCad,
  UCadastroCad, UFilialCad, UDepartamentoCad, UTipoPropriedadeCad,
  UVendedorCad, UClassCadastroCad, UParamSistema,
  UGCadastro, UOperacaoCad, UTransporteCad, UMensagemCad, USerieCad,
  USequenciaCad, UCidadeCad, UDiasUteis, UMensagemPocket_Cad, UCDACad,
  UImpostoCad, UValorReferenciaCad, UEmailConfig, UClienteSCPC,
  UCadastro_Preco_Cad, UComissaoCad, UMensagemUsuarioCad, UAgendamento,
  UConfiguracaoMarketplaceCad, UMalaDiretaCad, USMTPCad, UMensagemEletronicaCad,
  UCadastroParam;

{$R *.DFM}

procedure TFMenuCadasto.Moeda1Click(Sender: TObject);
begin
  inherited;
  if FMoedaCad = nil then
    FMoedaCad := TFMoedaCad.Create(Application);
  DMTela.VerificaTela(pModulo, FMoedaCad.Caption, FMoedaCad.Name);
  FMoedaCad.ShowModal;
end;

procedure TFMenuCadasto.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'CADASTRO';
end;

procedure TFMenuCadasto.Cotaes1Click(Sender: TObject);
begin
  inherited;
//  if FMoedaCotacao = nil then
//    FMoedaCotacao := TFMoedaCotacao.Create(Application);
//  DMTela.VerificaTela(pModulo, FMoedaCotacao.Caption, FMoedaCotacao.Name);
//  FMoedaCotacao.ShowModal;

  if FMoedaCad = nil then
    FMoedaCad := TFMoedaCad.Create(Application);
  DMTela.VerificaTela(pModulo, FMoedaCad.Caption, FMoedaCad.Name);
  FMoedaCad.ShowModal;

//  if FMoedaCotacao = nil then
//    FMoedaCotacao := TFMoedaCotacao.Create(Application);
//  DMTela.VerificaTela(pModulo, FMoedaCotacao.Caption, FMoedaCotacao.Name);
//  FMoedaCotacao.ShowModal;
end;

procedure TFMenuCadasto.Estado1Click(Sender: TObject);
begin
  inherited;
  if FEstadoCad = nil then
    FEstadoCad := TFEstadoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FEstadoCad.Caption, FEstadoCad.Name);
  FEstadoCad.ShowModal;
end;

procedure TFMenuCadasto.EstadoCivil1Click(Sender: TObject);
begin
  inherited;
  if FEstadoCivilCad = nil then
    FEstadoCivilCad := TFEstadoCivilCad.Create(Application);
  DMTela.VerificaTela(pModulo, FEstadoCivilCad.Caption, FEstadoCivilCad.Name);
  FEstadoCivilCad.ShowModal;
end;

procedure TFMenuCadasto.TipoCadastro1Click(Sender: TObject);
begin
  inherited;
  if FTipoCadastroCad = nil then
    FTipoCadastroCad := TFTipoCadastroCad.Create(Application);
  DMTela.VerificaTela(pModulo, FTipoCadastroCad.Caption, FTipoCadastroCad.Name);
  FTipoCadastroCad.ShowModal;
end;

procedure TFMenuCadasto.Motivo1Click(Sender: TObject);
begin
  inherited;
  if FMotivoCad = nil then
    FMotivoCad := TFMotivoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FMotivoCad.Caption, FMotivoCad.Name);
  FMotivoCad.ShowModal;
end;

procedure TFMenuCadasto.Pais1Click(Sender: TObject);
begin
  inherited;
  if FPaisCad = nil then
    FPaisCad := TFPaisCad.Create(Application);
  DMTela.VerificaTela(pModulo, FPaisCad.Caption, FPaisCad.Name);
  FPaisCad.ShowModal;
end;

procedure TFMenuCadasto.Regio1Click(Sender: TObject);
begin
  inherited;
  if FRegiaoCad = nil then
    FRegiaoCad := TFRegiaoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FRegiaoCad.Caption, FRegiaoCad.Name);
  FRegiaoCad.ShowModal;
end;

procedure TFMenuCadasto.Ramo1Click(Sender: TObject);
begin
  inherited;
  if FRamoCad = nil then
    FRamoCad := TFRamoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FRamoCad.Caption, FRamoCad.Name);
  FRamoCad.ShowModal;
end;

procedure TFMenuCadasto.Cadastro1Click(Sender: TObject);
begin
  inherited;
  if FCadastroCad = nil then
    FCadastroCad := TFCadastroCad.Create(Application);
  DMTela.VerificaTela(pModulo, FCadastroCad.Caption, FCadastroCad.Name);
  FCadastroCad.ShowModal;
end;

procedure TFMenuCadasto.Filial1Click(Sender: TObject);
begin
  inherited;
  if FFilialCad = nil then
    FFilialCad := TFFilialCad.Create(Application);
  DMTela.VerificaTela(pModulo, FFilialCad.Caption, FFilialCad.Name);
  FFilialCad.ShowModal;
end;

procedure TFMenuCadasto.Departamento1Click(Sender: TObject);
begin
  inherited;
  if FDepartamentoCad = nil then
    FDepartamentoCad := TFDepartamentoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FDepartamentoCad.Caption, FDepartamentoCad.Name);
  FDepartamentoCad.ShowModal;
  FDepartamentoCad := nil;
end;

procedure TFMenuCadasto.TipoPropriedade1Click(Sender: TObject);
begin
  inherited;
  if FTipoPropriedadeCad = nil then
    FTipoPropriedadeCad := TFTipoPropriedadeCad.Create(Application);
  DMTela.VerificaTela(pModulo, FTipoPropriedadeCad.Caption, FTipoPropriedadeCad.Name);
  FTipoPropriedadeCad.ShowModal;
end;

procedure TFMenuCadasto.Vendedor1Click(Sender: TObject);
begin
  inherited;
  if FVendedorCad = nil then
    FVendedorCad := TFVendedorCad.Create(Application);
  DMTela.VerificaTela(pModulo, FVendedorCad.Caption, FVendedorCad.Name);
  FVendedorCad.ShowModal;
end;

procedure TFMenuCadasto.ClassifioCadastro1Click(Sender: TObject);
begin
  inherited;
  if FClassCadastroCad = nil then
    FClassCadastroCad := TFClassCadastroCad.Create(Application);
  DMTela.VerificaTela(pModulo, FClassCadastroCad.Caption, FClassCadastroCad.Name);
  FClassCadastroCad.ShowModal;
end;

procedure TFMenuCadasto.Parmetros1Click(Sender: TObject);
begin
  inherited;
  if FParamSistema = nil then
    FParamSistema := TFParamSistema.Create(Application);
  DMTela.VerificaTela(pModulo, FParamSistema.Caption, FParamSistema.Name);
  FParamSistema.ShowModal;
end;

procedure TFMenuCadasto.Gerncia1Click(Sender: TObject);
begin
  inherited;
{  If FGCadastro = Nil then
    FGCadastro := TFGCadastro.Create(Application);
  DMTela.VerificaTela(pModulo,FGCadastro.Caption,FGCadastro.Name);
  FGCadastro.ShowModal; }
end;

procedure TFMenuCadasto.Operao1Click(Sender: TObject);
begin
  inherited;
  if FOperacaoCad = nil then
    FOperacaoCad := TFOperacaoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FOperacaoCad.Caption, FOperacaoCad.Name);
  FOperacaoCad.ShowModal;
end;

procedure TFMenuCadasto.Transporte1Click(Sender: TObject);
begin
  inherited;
  if FTransporteCad = nil then
    FTransporteCad := TFTransporteCad.Create(Application);
  DMTela.VerificaTela(pModulo, FTransporteCad.Caption, FTransporteCad.Name);
  FTransporteCad.ShowModal;
end;

procedure TFMenuCadasto.Mensagem1Click(Sender: TObject);
begin
  inherited;
  if FMensagemCad = nil then
    FMensagemCad := TFMensagemCad.Create(Application);
  DMTela.VerificaTela(pModulo, FMensagemCad.Caption, FMensagemCad.Name);
  FMensagemCad.ShowModal;
end;

procedure TFMenuCadasto.Series1Click(Sender: TObject);
begin
  inherited;
  if FSerieCad = nil then
    FSerieCad := TFSerieCad.Create(Application);
  DMTela.VerificaTela(pModulo, FSerieCad.Caption, FSerieCad.Name);
  FSerieCad.ShowModal;
end;

procedure TFMenuCadasto.Sequencia1Click(Sender: TObject);
begin
  inherited;
  if FSequenciaCad = nil then
    FSequenciaCad := TFSequenciaCad.Create(Application);
  DMTela.VerificaTela(pModulo, FSequenciaCad.Caption, FSequenciaCad.Name);
  FSequenciaCad.ShowModal;
end;

procedure TFMenuCadasto.Cidade1Click(Sender: TObject);
begin
  inherited;
  if FCidadeCad = nil then
    FCidadeCad := TFCidadeCad.Create(Application);
  DMTela.VerificaTela(pModulo, FCidadeCad.Caption, FCidadeCad.Name);
  FCidadeCad.ShowModal;

end;

procedure TFMenuCadasto.D1Click(Sender: TObject);
begin
  inherited;
  if FDiasUteis = nil then
    FDiasUteis := TFDiasUteis.Create(Application);
  DMTela.VerificaTela(pModulo, FDiasUteis.Caption, FDiasUteis.Name);
  FDiasUteis.ShowModal;

end;

procedure TFMenuCadasto.MensagemPocket1Click(Sender: TObject);
begin
  inherited;
  if FMensagemPocket_Cad = nil then
    FMensagemPocket_Cad := TFMensagemPocket_Cad.Create(Application);
  DMTela.VerificaTela(pModulo, FMensagemPocket_Cad.Caption, FMensagemPocket_Cad.Name);
  FMensagemPocket_Cad.ShowModal;

end;

procedure TFMenuCadasto.CDA1Click(Sender: TObject);
begin
  inherited;
  if FCDACad = nil then
    FCDACad := TFCDACad.Create(Application);
  DMTela.VerificaTela(pModulo, FCDACad.Caption, FCDACad.Name);
  FCDACad.ShowModal;
end;

procedure TFMenuCadasto.Imposto1Click(Sender: TObject);
begin
  inherited;
  if FImpostoCad = nil then
    FImpostoCad := TFImpostoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FImpostoCad.Caption, FImpostoCad.Name);
  FImpostoCad.ShowModal;
end;

procedure TFMenuCadasto.ValorReferencia1Click(Sender: TObject);
begin
  inherited;
  if FValorReferenciaCad = nil then
    FValorReferenciaCad := TFValorReferenciaCad.Create(Application);
  DMTela.VerificaTela(pModulo, FValorReferenciaCad.Caption, FValorReferenciaCad.Name);
  FValorReferenciaCad.ShowModal;
end;

procedure TFMenuCadasto.ConfiguraEmail1Click(Sender: TObject);
begin
  inherited;
  if FEmailConfig = nil then
    FEmailConfig := TFEmailConfig.Create(Application);
  DMTela.VerificaTela(pModulo, FEmailConfig.Caption, FEmailConfig.Name);
  FEmailConfig.ShowModal();
end;

procedure TFMenuCadasto.ClientesSCPC1Click(Sender: TObject);
begin
  inherited;
  if FClienteSCPC = nil then
    FClienteSCPC := TFClienteSCPC.Create(Application);
  FClienteSCPC.ShowModal;
end;

procedure TFMenuCadasto.PreoPCadastro1Click(Sender: TObject);
begin
  inherited;
  if FCadastro_Preco_Cad = nil then
    FCadastro_Preco_Cad := TFCadastro_Preco_Cad.Create(Application);
  DMTela.VerificaTela(pModulo, FCadastro_Preco_Cad.Caption, FCadastro_Preco_Cad.Name);
  FCadastro_Preco_Cad.ShowModal;
end;

procedure TFMenuCadasto.Comisso1Click(Sender: TObject);
begin
  inherited;
  if FComissaoCad = nil then
    FComissaoCad := TFComissaoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FComissaoCad.Caption, FComissaoCad.Name);
  FComissaoCad.ShowModal;
end;

procedure TFMenuCadasto.MensagensparaUsurios1Click(Sender: TObject);
begin
  inherited;
  if FMensagemUsuarioCad = nil then
    FMensagemUsuarioCad := TFMensagemUsuarioCad.Create(Application);
  DMTela.VerificaTela(pModulo, FMensagemUsuarioCad.Caption, FMensagemUsuarioCad.Name);
  FMensagemUsuarioCad.ShowModal;
end;

procedure TFMenuCadasto.Agendamento1Click(Sender: TObject);
begin
  inherited;
  if FAgendamento = nil then
    FAgendamento := TFAgendamento.Create(Application);
  DMTela.VerificaTela(pModulo, FAgendamento.Caption, FAgendamento.Name);
  FAgendamento.ShowModal;
end;

procedure TFMenuCadasto.Marketplace1Click(Sender: TObject);
begin
  inherited;
  if FConfiguracaoMarketplaceCad = nil then
    FConfiguracaoMarketplaceCad := TFConfiguracaoMarketplaceCad.Create(Application);
  DMTela.VerificaTela(pModulo, FConfiguracaoMarketplaceCad.Caption, FConfiguracaoMarketplaceCad.Name);
  FConfiguracaoMarketplaceCad.ShowModal;
end;

procedure TFMenuCadasto.MalaDireta2Click(Sender: TObject);
begin
  inherited;
  if FMalaDiretaCad = nil then
    FMalaDiretaCad := TFMalaDiretaCad.Create(Application);
  DMTela.VerificaTela(pModulo, FMalaDiretaCad.Caption, FMalaDiretaCad.Name);
  FMalaDiretaCad.ShowModal;
end;

procedure TFMenuCadasto.SMTP2Click(Sender: TObject);
begin
  inherited;
  if FSMTPCad = nil then
    FSMTPCad := TFSMTPCad.Create(Application);
  DMTela.VerificaTela(pModulo, FSMTPCad.Caption, FSMTPCad.Name);
  FSMTPCad.ShowModal;
end;

procedure TFMenuCadasto.MensagemEletrnica2Click(Sender: TObject);
begin
  inherited;
  if FMensagemEletronicaCad = nil then
    FMensagemEletronicaCad := TFMensagemEletronicaCad.Create(Application);
  DMTela.VerificaTela(pModulo, FMensagemEletronicaCad.Caption, FMensagemEletronicaCad.Name);
  FMensagemEletronicaCad.ShowModal;
end;

end.

