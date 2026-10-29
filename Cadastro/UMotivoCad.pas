unit UMotivoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, DBPanel, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFMotivoCad = class(TFTCadSimples)
    Motivo1: TMenuItem;
    DBRadioGroup1: TDBRadioGroup;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Motivo1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMotivoCad: TFMotivoCad;

implementation

uses UMotivo_cl, UMotivoCons, URMotivo_Motivo;

{$R *.DFM}

procedure TFMotivoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FMotivoCons = Nil then
    FMotivoCons := TFMotivoCons.Create(Application);
  If FMotivoCons.ShowModal = mrOk then
  With DMMotivo do
  Begin
    QMotivo.Close;
    QMotivo.SetVariable('PK',QMotivoConsCod_Motivo.Value);
    QMotivo.Open;
  End;
end;

procedure TFMotivoCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMMotivo do
    QMotivo.Open;
end;

procedure TFMotivoCad.Motivo1Click(Sender: TObject);
begin
  inherited;
  DMMotivo.QRMotivo.Open;
  If FRMotivo_Motivo = Nil then
    FRMotivo_Motivo := TFRMotivo_Motivo.Create(Application);
  FRMotivo_Motivo.QRPrimario.Preview;
  DMMotivo.QRMotivo.Close;
end;


procedure TFMotivoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(9);
end;

procedure TFMotivoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  With DMMotivo do
    QMotivo.Close;
  Action := CaFree;
  FMotivoCad := Nil;
end;

end.
