unit URamoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, DBPanel, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFRamoCad = class(TFTCadSimples)
    Ramos1: TMenuItem;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Ramos1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRamoCad: TFRamoCad;

implementation

uses URamo_cl, URamoCons, URRamo_Ramo;

{$R *.DFM}

procedure TFRamoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FRamoCons = Nil then
    FRamoCons := TFRamoCons.Create(Application);
  If FRamoCons.ShowModal = mrOk then
  With DMRamo do
  Begin
    QRamo.Close;
    QRamo.SetVariable('PK',QRamoConsCod_Ramo.Value);
    QRamo.Open;
  End;
end;

procedure TFRamoCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMRamo do
    QRamo.Open;
end;

procedure TFRamoCad.Ramos1Click(Sender: TObject);
begin
  inherited;
  DMRamo.QRRamo.Open;
  If FRRamo_Ramo = Nil then
    FRRamo_Ramo := TFRRamo_Ramo.Create(Application);
  FRRamo_Ramo.QRPrimario.Preview;
  DMRamo.QRRamo.Close;
end;

procedure TFRamoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(12);
end;

procedure TFRamoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  With DMRamo do
    QRamo.Close;
  Action := CaFree;
  FRamoCad := Nil;
end;

end.
