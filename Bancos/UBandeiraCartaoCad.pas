unit UBandeiraCartaoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, DBCtrls;

type
  TFBandeiraCartaoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    ListagemdasBandeirasCadastradas1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure ListagemdasBandeirasCadastradas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBandeiraCartaoCad: TFBandeiraCartaoCad;

implementation
uses UOracle_cl, UBandeiraCartao_cl, UBandeiraCartaoCons, URBandeiraCartao;

{$R *.dfm}

procedure TFBandeiraCartaoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMBandeiraCartao.QBandeiraCartaoCad.Close;
  DMBandeiraCartao.QBandeiraCartaoCad.Open;
end;

procedure TFBandeiraCartaoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FBandeiraCartaoCons = nil then
    FBandeiraCartaoCons := TFBandeiraCartaoCons.Create(Application);
  if FBandeiraCartaoCons.ShowModal=mrOk then
  begin
    DMBandeiraCartao.QBandeiraCartaoCad.Close;
    DMBandeiraCartao.QBandeiraCartaoCad.SetVariable('PK',DMBandeiraCartao.QBandeiraCartaoConsCOD_BANDEIRA_CARTAO.Value);
    DMBandeiraCartao.QBandeiraCartaoCad.Open;
  end;
end;

procedure TFBandeiraCartaoCad.ListagemdasBandeirasCadastradas1Click(
  Sender: TObject);
begin
  inherited;
  with DMBandeiraCartao do
  begin
    QRBandeiraCartao.Open;
    if FRBandeiraCartao = Nil then
      FRBandeiraCartao := TFRBandeiraCartao.Create(Application);
    FRBandeiraCartao.QRPrimario.Preview;
    QRBandeiraCartao.Close;
  end;
end;

end.
 