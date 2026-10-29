unit UTransporteCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFTransporteCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Transporte1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Transporte1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTransporteCad: TFTransporteCad;

implementation

uses UTransporte_cl, UTransporteCons, URTransporte;

{$R *.DFM}

procedure TFTransporteCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMTransporte do
    QTransporte.Open;
end;

procedure TFTransporteCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FTransporteCons = Nil then
    FTransporteCons := TFTransporteCons.Create(Application);
  If FTransporteCons.ShowModal = mrOk then
  With DMTransporte do
  Begin
    QTransporte.Close;
    QTransporte.SetVariable('PK',QTransporteConsCod_Transporte.Value);
    QTransporte.Open;
  End;
end;

procedure TFTransporteCad.Transporte1Click(Sender: TObject);
begin
  inherited;
  With DMTransporte do
  Begin
    QTransporteAll.Open;
    If FRTransporte = Nil then
      FRTransporte := TFRTransporte.Create(Application);
    FRTransporte.QRPrimario.Preview;
    QTransporteAll.Close;
  End;
end;

procedure TFTransporteCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(35);
end;

procedure TFTransporteCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DMTransporte do
    QTransporte.Close;
  Action := CaFree;
  FTransporteCad := Nil;
end;

end.
