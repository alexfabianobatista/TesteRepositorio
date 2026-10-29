unit UTecnicoSeguranca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFTecnicoSegurancaCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    SBFilial: TSpeedButton;
    TcnicosSegurana1: TMenuItem;
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure TcnicosSegurana1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTecnicoSegurancaCad: TFTecnicoSegurancaCad;

implementation

uses UTecnicoSeguranca_cl, UFilialCons, UFilial_cl, UTecnicoSegurancaCons,
  URTecnicoSeguranca;

{$R *.DFM}

procedure TFTecnicoSegurancaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBFilial.Enabled := SBConfirmar.Enabled;
end;

procedure TFTecnicoSegurancaCad.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.showModal = mrOk then
    DMTecnicoSeguranca.QTecnicoSegurancaCOD_FILIAL.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
end;

procedure TFTecnicoSegurancaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMTecnicoSeguranca.QTecnicoSeguranca.Open;
end;

procedure TFTecnicoSegurancaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
 if FTecnicoSegurancaCons = nil then
    FTecnicoSegurancaCons := TFTecnicoSegurancaCons.Create(Application);
  if FTecnicoSegurancaCons.showModal = mrOk then
  begin
    with DMTecnicoSeguranca do
    begin
      QTecnicoSeguranca.Close;
      QTecnicoSeguranca.SetVariable('PK',QTecnicoSegConsCOD_FILIAL.Value);
      QTecnicoSeguranca.Open;
    end;
  end;
end;

procedure TFTecnicoSegurancaCad.TcnicosSegurana1Click(Sender: TObject);
begin
  inherited;
    With DMTecnicoSeguranca do
  Begin
    QRTecnicoSeguranca.Open;
    If FRTecnicoSeguranca = Nil then
    FRTecnicoSeguranca := TFRTecnicoSeguranca.Create(Application);
    FRTecnicoSeguranca.QRPrimario.Preview;
    QRTecnicoSeguranca.close;
  End;

end;

procedure TFTecnicoSegurancaCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(14);
end;

end.
