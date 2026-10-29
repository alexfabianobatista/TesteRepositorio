unit UPaisCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, DBPanel, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFPaisCad = class(TFTCadSimples)
    Pais1: TMenuItem;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Pais1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPaisCad: TFPaisCad;

implementation

uses UPais_cl, UPaisCons, URPais_Pais;

{$R *.DFM}

procedure TFPaisCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FPaisCons = Nil then
    FPaisCons := TFPaisCons.Create(Application);
  If FPaisCons.ShowModal = mrOk then
  With DMPais do
  Begin
    QPais.Close;
    QPais.SetVariable('PK',QPaisConsCod_Pais.Value);
    QPais.Open;
  End;
  
end;

procedure TFPaisCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMPais do
    QPais.Open;
end;

procedure TFPaisCad.Pais1Click(Sender: TObject);
begin
  inherited;
  DMPais.QRPais.Open;
  If FRPais_Pais = Nil then
    FRPais_Pais := TFRPais_Pais.Create(Application);
  FRPais_Pais.QRPrimario.Preview;
  DMPais.QRPais.Close;
end;

procedure TFPaisCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(10);
end;

procedure TFPaisCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  With DMPais do
    QPais.Close;
  Action := CaFree;
  FPaisCad := Nil;
end;

end.
