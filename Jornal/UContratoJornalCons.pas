unit UContratoJornalCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  UFmCadastro, UFmFilial, UFmDatas, UFmVendedor, ExtCtrls;

type
  TFContratoJornalCons = class(TFTConsulta)
    DSItens: TDataSource;
    DBGItens: TDBGrid;
    FmFilial: TFmFilial;
    FmCadastro: TFmCadastro;
    FmDatas: TFmDatas;
    FmVendedor: TFmVendedor;
    RGSituacao: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure METextoKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Buscar;
  end;

var
  FContratoJornalCons: TFContratoJornalCons;

implementation

uses UContratoJornal_cl;

{$R *.dfm}

{ TFContratoJornalCons }

procedure TFContratoJornalCons.Buscar;
begin
  with DMContratoJornal do
  begin
    QContratoJornalCons.Close;
    QContratoJornalCons.ClearVariables;
    if Trim(FmFilial.MeFilial.Text) <> '' then
      QContratoJornalCons.SetVariable('FILIAL', Trim(FmFilial.MeFilial.Text));
    if Trim(FmCadastro.MeCadastro.Text) <> '' then
      QContratoJornalCons.SetVariable('CADASTRO', Trim(FmCadastro.MeCadastro.Text));
    if Trim(FmDatas.MeDtInicial.Text) <> '' then
      QContratoJornalCons.SetVariable('DT_INICIO', Trim(FmDatas.MeDtInicial.Text));
    if Trim(FmDatas.MeDtFinal.Text) <> '' then
      QContratoJornalCons.SetVariable('DT_FIM', Trim(FmDatas.MeDtFinal.Text));
    if Trim(FmVendedor.MeVendedor.Text) <> '' then
      QContratoJornalCons.SetVariable('VENDEDOR', Trim(FmVendedor.MeVendedor.Text));
    if Trim(METexto.Text) <> '' then
      QContratoJornalCons.SetVariable('EDICAO', Trim(METexto.Text));
    case RGSituacao.ItemIndex of
      0: QContratoJornalCons.SetVariable('SITUACAO', 1);
      1: QContratoJornalCons.SetVariable('SITUACAO', 2);
      2: QContratoJornalCons.SetVariable('SITUACAO', 3);
    end;
    QContratoJornalCons.Open;
  end;
end;

procedure TFContratoJornalCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  Buscar;
end;

procedure TFContratoJornalCons.METextoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', #8, #13, #9]) then
    Key := #0;
end;

procedure TFContratoJornalCons.FormActivate(Sender: TObject);
begin
  inherited;
  if FmFilial.MeFilial.CanFocus then
    FmFilial.MeFilial.SetFocus;
end;

end.
