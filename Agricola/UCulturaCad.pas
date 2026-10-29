unit UCulturaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBPanel, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFCulturaCad = class(TFTCadSimples)
    RelatriodeCulturas1: TMenuItem;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelatriodeCulturas1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCulturaCad: TFCulturaCad;

implementation

uses UCultura_cl, UCulturaCons, URCultura;

{$R *.DFM}

procedure TFCulturaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMCultura.QCultura.Open;
end;

procedure TFCulturaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FCulturaCons = nil then
     FCulturaCons := TFCulturaCons.Create(Application);
  If FCulturaCons.ShowModal = mrOK then
     with DMCultura do
     begin
        QCultura.Close;
        QCultura.SetVariable('PK',QCulturaConsCod_Cultura.Value);
        QCultura.Open;
     end;

end;

procedure TFCulturaCad.RelatriodeCulturas1Click(Sender: TObject);
begin
  inherited;
  with DmCultura do
  begin
    QCulturaCons.Close;
    QCulturaCons.Open;
    If FRCultura = Nil then
       FRCultura := TFRCultura.Create(Application);
    FRCultura.QRPrimario.Preview;
    QCulturaCons.Close;
  end;

end;

procedure TFCulturaCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext (22);
end;

procedure TFCulturaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMCultura.QCultura.Close;
  Action := CaFree;
  FCulturaCad := Nil;
end;

end.
