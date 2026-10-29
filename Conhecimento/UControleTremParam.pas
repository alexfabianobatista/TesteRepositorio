unit UControleTremParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask,
  DBCtrls, DBDirceu;

type
  TFControleTremParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Me1Remetente: TMaskEdit;
    Label1: TLabel;
    Me1Destinatario: TMaskEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Me1Data_I: TMaskEdit;
    Me1Data_F: TMaskEdit;
    Label3: TLabel;
    BtRemetente: TBitBtn;
    Ed1Remetente: TEdit;
    BtDestinatario: TBitBtn;
    Ed1Destinatario: TEdit;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Me2Data_I: TMaskEdit;
    Me2Data_F: TMaskEdit;
    MeFluxoTrem: TMaskEdit;
    SbBuscaFluxoTrem: TSpeedButton;
    lblFluxoTrem: TLabel;
    MeDescFluxo: TMaskEdit;
    Label5: TLabel;
    procedure BtRemetenteClick(Sender: TObject);
    procedure Me1RemetenteExit(Sender: TObject);
    procedure BtDestinatarioClick(Sender: TObject);
    procedure Me1DestinatarioExit(Sender: TObject);
    procedure SbBuscaFluxoTremClick(Sender: TObject);
    procedure MeFluxoTremExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FControleTremParam: TFControleTremParam;

implementation

uses UCadastroCons, UCadastro_cl, UOracle_cl, UControleTremCons,
  UControleTrem_cl;

{$R *.dfm}

procedure TFControleTremParam.BtRemetenteClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = MrOk then
  begin
    Me1Remetente.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    Me1RemetenteExit(Self);
  end;
end;

procedure TFControleTremParam.Me1RemetenteExit(Sender: TObject);
begin
  inherited;
  if Trim(Me1Remetente.Text) <> '' then
    Ed1Remetente.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + Me1Remetente.Text, true);

end;

procedure TFControleTremParam.BtDestinatarioClick(Sender: TObject);
begin
  inherited;
   if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = MrOk then
  begin
    Me1Destinatario.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    Me1DestinatarioExit(Self);
  end;
end;

procedure TFControleTremParam.Me1DestinatarioExit(Sender: TObject);
begin
  inherited;
  if Trim(Me1Destinatario.Text) <> '' then
    Ed1Destinatario.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + Me1Destinatario.Text, true);
end;

procedure TFControleTremParam.SbBuscaFluxoTremClick(Sender: TObject);
begin
  inherited;
  if FControleTremCons = Nil then
    FControleTremCons := TFControleTremCons.Create(Application);
  if FControleTremCons.ShowModal = MrOk then
  begin
    MeFluxoTrem.Text  := DMControleTrem.QControleTremConsCOD_FLUXO_TREM.Text;
    MeDescFluxo.Text  := DMControleTrem.QControleTremConsDESC_FLUXO.Text;
  end;
end;

procedure TFControleTremParam.MeFluxoTremExit(Sender: TObject);
begin
  inherited;
  if Trim(MeFluxoTrem.Text) <> '' then
    MeDescFluxo.Text := DMOracle.BuscaNome('SELECT DESC_FLUXO FROM TB_FLUXO_TREM', 'COD_FLUXO_TREM = ' + Trim(MeFluxoTrem.Text))
  else
    MeDescFluxo.Text := '';

end;

end.
