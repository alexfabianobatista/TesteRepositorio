unit UDoencaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls;

type
  TFDoencaCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    RelatriodeDoenas1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelatriodeDoenas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDoencaCad: TFDoencaCad;

implementation

uses UDoenca_cl, UDoencaCons, UOracle_cl, URDoenca;

{$R *.DFM}

procedure TFDoencaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMDoenca.QDoenca.open;
end;

procedure TFDoencaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FDoencaCons = nil then
    FDoencaCons := TFDoencaCons.Create(Application);
  if FDoencaCons.showmodal = mrOk then
  Begin
    DMDoenca.QDoenca.Close;
    DMDoenca.QDoenca.SetVariable('PK', DMDoenca.QDoencaConsCOD_DOENCA.Value);
    DMDoenca.QDoenca.Open;
  End;
end;

procedure TFDoencaCad.RelatriodeDoenas1Click(Sender: TObject);
begin
  inherited;
      with DMDoenca do
      begin
        QRDoenca.Close;
        QRDoenca.Open;
      end;
      if FRDoenca = nil then
         FRDoenca := TFRDoenca.Create(Application);
      FRDoenca.QRPrimario.Preview;

end;

end.
