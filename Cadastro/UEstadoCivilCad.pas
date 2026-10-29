unit UEstadoCivilCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, DBPanel, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFEstadoCivilCad = class(TFTCadSimples)
    Estados1: TMenuItem;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Estados1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstadoCivilCad: TFEstadoCivilCad;

implementation

uses UEstadoCivil_cl, UEstadoCivilCons, UREstadoCivil_Estado;

{$R *.DFM}

procedure TFEstadoCivilCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FEstadoCivilCons = Nil then
    FEstadoCivilCons := TFEstadoCivilCons.Create(Application);
  If FEstadoCivilCons.ShowModal = mrOk then
  With DMEstadoCivil do
  Begin
    QEstadoCivil.Close;
    QEstadoCivil.SetVariable('PK',QEstadoCivilConsCod_Estado_Civil.Value);
    QEstadoCivil.Open;
  End;

end;

procedure TFEstadoCivilCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMEstadoCivil do
    QEstadoCivil.Open;
end;

procedure TFEstadoCivilCad.Estados1Click(Sender: TObject);
begin
  inherited;
  DMEstadoCivil.QREstadoCivil.Open;
  If FREstadoCivil_Estado = Nil then
    FREstadoCivil_Estado := TFREstadoCivil_Estado.Create(Application);
  FREstadoCivil_Estado.QRPrimario.Preview;
  DMEstadoCivil.QREstadoCivil.Close;
end;

procedure TFEstadoCivilCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(7);
end;

procedure TFEstadoCivilCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DMEstadoCivil do
    QEstadoCivil.Close;
  Action := CaFree;  
  FEstadoCivilCad := Nil;
end;

end.
