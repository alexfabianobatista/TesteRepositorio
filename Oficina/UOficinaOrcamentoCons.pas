unit UOficinaOrcamentoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  UFmCadastro, UFmDatas, UFmFilial;

type
  TFOficinaOrcamentoCons = class(TFTConsulta)
    DBGrid2: TDBGrid;
    DSItens: TDataSource;
    FmCadastro: TFmCadastro;
    FmFilial: TFmFilial;
    FmDatas: TFmDatas;
    MEDescMarca: TMaskEdit;
    SBMarcaCons: TSpeedButton;
    procedure SBMarcaConsClick(Sender: TObject);
    procedure METextoExit(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure METextoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOficinaOrcamentoCons: TFOficinaOrcamentoCons;

implementation

uses UOficina_cl, UCadastro_cl, UCadastroCons, UMarca_cl, UMarcaCons,
  UOracle_cl;

{$R *.dfm}

procedure TFOficinaOrcamentoCons.SBMarcaConsClick(Sender: TObject);
begin
  inherited;
  if FMarca_Cons = nil then
    FMarca_Cons := TFMarca_Cons.Create(Application);
  if FMarca_Cons.ShowModal = MrOk then
  begin
    METexto.Text := DMMarca.QMarcaConsCOD_MARCA.Text;
    MEDescMarca.Text := DMMarca.QMarcaConsDESC_MARCA.Text;
  end;
end;

procedure TFOficinaOrcamentoCons.METextoExit(Sender: TObject);
begin
  inherited;
  if Trim(METexto.Text) <> '' then
    MEDescMarca.Text := DMOracle.BuscaNome('SELECT DESC_MARCA FROM TB_MARCA', 'COD_MARCA = ' + METexto.Text)
  else
    MEDescMarca.Text := '';
end;

procedure TFOficinaOrcamentoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMOficina.QOficinaOrcamentoCons.Close;
  if Trim(FmCadastro.MeCadastro.Text) <> '' then
    DMOficina.QOficinaOrcamentoCons.SetVariable('COD_CADASTRO', StrToInt(Trim(FmCadastro.MeCadastro.Text)))
  else
    DMOficina.QOficinaOrcamentoCons.SetVariable('COD_CADASTRO', null);
  if Trim(FmFilial.MeFilial.Text) <> '' then
    DMOficina.QOficinaOrcamentoCons.SetVariable('COD_FILIAL', StrToInt(Trim(FmFilial.MeFilial.Text)))
  else
    DMOficina.QOficinaOrcamentoCons.SetVariable('COD_FILIAL', null);
  if Trim(METexto.Text) <> '' then
    DMOficina.QOficinaOrcamentoCons.SetVariable('COD_MARCA', StrToInt(Trim(METexto.Text)))
  else
    DMOficina.QOficinaOrcamentoCons.SetVariable('COD_MARCA', null);
  try
    if FmDatas.MeDtInicial.Text <> '' then
      DMOficina.QOficinaOrcamentoCons.SetVariable('DT_INICIO', StrToDate(FmDatas.MeDtInicial.Text))
    else
      DMOficina.QOficinaOrcamentoCons.SetVariable('DT_INICIO', null);
    if FmDatas.MeDtFinal.Text <> '' then
      DMOficina.QOficinaOrcamentoCons.SetVariable('DT_FIM', StrToDate(FmDatas.MeDtFinal.Text))
    else
      DMOficina.QOficinaOrcamentoCons.SetVariable('DT_FIM', null);
  except
    Raise Exception.Create('Data invalida');
  end;
  DMOficina.QOficinaOrcamentoCons.open;
  DMOficina.QOficinaOrcamentoItemCons.Close;
  DMOficina.QOficinaOrcamentoItemCons.open;
end;

procedure TFOficinaOrcamentoCons.METextoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in ['0' .. '9', #8, #13]) then
    key := #0;
end;

procedure TFOficinaOrcamentoCons.FormCreate(Sender: TObject);
begin
  inherited;
  FmDatas.MeDtInicial.Text := DateToStr(Date);
  FmDatas.MeDtFinal.Text := DateToStr(Date);
end;

procedure TFOficinaOrcamentoCons.FormActivate(Sender: TObject);
begin
  inherited;
  FmCadastro.MeCadastro.SetFocus;
end;

end.
