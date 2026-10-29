unit UClassePlantioCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls;

type
  TFClassePlantioCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    RelatriodeClassesdePlantio1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelatriodeClassesdePlantio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClassePlantioCad: TFClassePlantioCad;

implementation

uses UClassePlantio_cl, UClassePlantioCons, URClassePlantio;

{$R *.DFM}

procedure TFClassePlantioCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMClassePlantio.QClassePlantio.Open;
end;

procedure TFClassePlantioCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMClassePlantio do
  begin
    QClassePlantio.Close;
  end;
  Action:=CaFree;
  FClassePlantioCad:=nil;
end;

procedure TFClassePlantioCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FClassePlantioCons = nil then
     FClassePlantioCons:= TFClassePlantioCons.Create(Application);
   if FClassePlantioCons.ShowModal = mrOk then
   begin
   with  DMClassePlantio do
   begin
     QClassePlantio.Close;
     QClassePlantio.setVariable('PK',QClassePlantioConsCod_Classe_Plantio.Value);
     QClassePlantio.Open;
   end;
   end;
end;

procedure TFClassePlantioCad.RelatriodeClassesdePlantio1Click(
  Sender: TObject);
begin
  inherited;
  DMClassePlantio.QRClassePlantio.Open;
  If FRClassePlantio = Nil then
    FRClassePlantio := TFRClassePlantio.Create(Application);
  FRClassePlantio.QRPrimario.Preview;
  DMClassePlantio.QRClassePlantio.Close;
end;

end.
