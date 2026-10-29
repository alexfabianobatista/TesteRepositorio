unit UPeriodicidadeCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls;

type
  TFPeriodicidadeCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Periodicidade1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure Periodicidade1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPeriodicidadeCad: TFPeriodicidadeCad;

implementation

uses UPeriodicidade_cl, UPeriodicidadeCons, URPeriodicidade;

{$R *.DFM}

procedure TFPeriodicidadeCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMPeriodicidade.QPeriodicidade.Open;
end;

procedure TFPeriodicidadeCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMPeriodicidade.QPeriodicidade.close;
  action := caFree;
  FPeriodicidadeCad := nil;
end;

procedure TFPeriodicidadeCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FPeriodicidadeCons = Nil then
    FPeriodicidadeCons := TFPeriodicidadeCons.Create(Application);
  if FPeriodicidadeCons.ShowModal = mrOk then
  With DMPeriodicidade do
  Begin
    QPeriodicidade.Close;
    QPeriodicidade.SetVariable('PK',QPeriodicidadeConsCod_Periodicidade.Value);
    QPeriodicidade.Open;
  End;
end;

procedure TFPeriodicidadeCad.Periodicidade1Click(Sender: TObject);
begin
  inherited;
 with DMPeriodicidade do
  begin
    QRPeriodicidade.Close;
    QRPeriodicidade.Open;
    If FRPeriodicidade = Nil then
      FRPeriodicidade := TFRPeriodicidade.Create(Application);
      FRPeriodicidade.QRPrimario.Preview;
     QRPeriodicidade.Close;
  End;

end;

end.
