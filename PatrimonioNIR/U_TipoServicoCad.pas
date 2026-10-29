unit U_TipoServicoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls;

type
  TFTipoServicoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    RelaoTiposdeServio1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaoTiposdeServio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoServicoCad: TFTipoServicoCad;

implementation

uses UTipoServico_cl, UTipoServicoCons, URTipoServico;

{$R *.DFM}

procedure TFTipoServicoCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DmTipoServico do
  Begin
    QTipoServico.Close;
    QTipoServico.Open;
  End;
end;

procedure TFTipoServicoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DmTipoServico do
    QTipoServico.Close;
  Action := CaFree;
  FTipoServicoCad := Nil;
end;

procedure TFTipoServicoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
    If FTipoServicoCons = Nil then
    FTipoServicoCons := TFTipoServicoCons.Create(Application);
  If FTipoServicoCons.ShowModal = mrOk then
  With DMTipoServico do
  Begin
    QTipoServico.Close;
    QTipoServico.SetVariable('PK',QTipoServicoConsCod_Tipo_Servico.value);
    QTipoServico.Open;
  End;
end;

procedure TFTipoServicoCad.RelaoTiposdeServio1Click(Sender: TObject);
begin
  inherited;
  with DMTipoServico do
  begin
    QRTipoServico.Close;
    QRTipoServico.Open;

    if FRTipoServico = Nil then
      FRTipoServico := TFRTipoServico.Create(Application);
    FRTipoServico.QRPrimario.Preview;
    QRTipoServico.Close;
  End;
end;

end.
