unit UOficinaCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  UFmDatas, UFmCadastro, UFmFilial, ExtCtrls, Menus;

type
  TFOficinaCons = class(TFTConsulta)
    DBGItens: TDBGrid;
    FmFilial: TFmFilial;
    FmCadastro: TFmCadastro;
    FmDatasE: TFmDatas;
    FmDatasS: TFmDatas;
    DSItens: TDataSource;
    RGSituacao: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOficinaCons: TFOficinaCons;

implementation

uses UOracle_cl, UOficina_cl;

{$R *.dfm}

procedure TFOficinaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMOficina do
  begin
    QOficinaCons.Close;
    if Trim(FmFilial.MeFilial.Text) <> '' then
      QOficinaCons.SetVariable('COD_FILIAL', FmFilial.MeFilial.Text)
    else
      QOficinaCons.SetVariable('COD_FILIAL', null);
    if Trim(FmCadastro.MeCadastro.Text) <> '' then
      QOficinaCons.SetVariable('COD_CADASTRO', FmCadastro.MECadastro.Text)
    else
      QOficinaCons.SetVariable('COD_CADASTRO', null);
    if Trim(FmDatasE.MeDtInicial.Text) <> '' then
      QOficinaCons.SetVariable('DT_E_INICIO', FmDatasE.MeDtInicial.Text)
    else
      QOficinaCons.SetVariable('DT_E_INICIO', null);
    if Trim(FmDatasE.MeDtFinal.Text) <> '' then
      QOficinaCons.SetVariable('DT_E_FIM', FmDatasE.MeDtFinal.Text)
    else
      QOficinaCons.SetVariable('DT_E_FIM', null);
    if Trim(FmDatasS.MeDtInicial.Text) <> '' then
      QOficinaCons.SetVariable('DT_S_INICIO', FmDatasS.MeDtInicial.Text)
    else
      QOficinaCons.SetVariable('DT_S_INICIO', null);
    if Trim(FmDatasS.MeDtFinal.Text) <> '' then
      QOficinaCons.SetVariable('DT_S_FIM', FmDatasS.MeDtFinal.Text)
    else
      QOficinaCons.SetVariable('DT_S_FIM', null);
    if Trim(METexto.Text) <> '' then
      QOficinaCons.SetVariable('NUM_OFICINA_CAB', StrToInt(METexto.Text))
    else
      QOficinaCons.SetVariable('NUM_OFICINA_CAB', null);
    case RGSituacao.ItemIndex of
      0: QOficinaCons.SetVariable('IND_SITUACAO', 'A');
      1: QOficinaCons.SetVariable('IND_SITUACAO', 'F');
      2: QOficinaCons.SetVariable('IND_SITUACAO', 'C');
      3: QOficinaCons.SetVariable('IND_SITUACAO', null);
    end;
    QOficinaCons.open;
  end;
end;

procedure TFOficinaCons.FormCreate(Sender: TObject);
begin
  inherited;
  FmDatasE.MeDtInicial.Text := DateToStr(Date);
  FmDatasE.MeDtFinal.Text := DateToStr(Date);
end;

end.
