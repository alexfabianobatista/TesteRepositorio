unit UMarcacaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Buttons, StdCtrls, Db, Grids, DBGrids, Mask, ExtCtrls, variants,
  Menus;

type
  TFMarcacaoCons = class(TFTConsulta)
    Label2: TLabel;
    EdMecanicoCod: TEdit;
    EdMecanicoNome: TEdit;
    SBMecanicoCons: TSpeedButton;
    RGSituacao: TRadioGroup;
    procedure SBMecanicoConsClick(Sender: TObject);
    procedure EdMecanicoCodChange(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMarcacaoCons: TFMarcacaoCons;

implementation

uses UOficina_cl, UMecanicoCons, UOracle_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFMarcacaoCons.SBMecanicoConsClick(Sender: TObject);
begin
  inherited;
  if FMecanicoCons = nil then
    FMecanicoCons:= TFMecanicoCons.Create(Application);
  if FMecanicoCons.ShowModal = mrOk then
  begin
    EdMecanicoCod.Text := IntToStr(DMOFicina.QMecanicoConsCOD_MECANICO.Value);
    EdMecanicoNome.Text:= DMOFicina.QMecanicoConsNOME.Value;
  end
  else
  begin
    EdMecanicoNome.Clear;
    EdMecanicoCod.Clear;
  end;
end;

procedure TFMarcacaoCons.EdMecanicoCodChange(Sender: TObject);
begin
  inherited;
  if Trim(EdMecanicoCod.Text) <> '' then
     EdMecanicoNome.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_MECANICO','COD_MECANICO = '+EdMecanicoCod.Text);
end;

procedure TFMarcacaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMOficina do
  begin
    QOSMarcacaoCons.Close;
    if Trim(METexto.Text) <> '' then
       QOSMarcacaoCons.SetVariable('NUM_OS',METexto.Text)
    else
       QOSMarcacaoCons.SetVariable('NUM_OS',Null);

    if Trim(EdMecanicoCod.Text) <> '' then
       QOSMarcacaoCons.SetVariable('COD_MECANICO',EdMecanicoCod.Text)
    else
       QOSMarcacaoCons.SetVariable('COD_MECANICO',Null);
    case RGSituacao.ItemIndex of
      0: QOSMarcacaoCons.SetVariable('IND_SITUACAO', 'I');
      1: QOSMarcacaoCons.SetVariable('IND_SITUACAO', 'F');
      2: QOSMarcacaoCons.SetVariable('IND_SITUACAO', null);
    end;
    QOSMarcacaoCons.Open;
  end;
end;

procedure TFMarcacaoCons.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
  begin
    DBGrid1.Columns.Items[4].FieldName := 'DT_INICIO';
    DBGrid1.Columns.Items[4].Title.Caption := 'Início';
    DBGrid1.Columns.Items[4].Width := 60;
    DBGrid1.Columns.Items[5].FieldName := 'DT_FIM';
    DBGrid1.Columns.Items[5].Title.Caption := 'Fim';
    DBGrid1.Columns.Items[5].Width := 60;
    DBGrid1.Columns.Items[6].FieldName := 'desc_situacao';
    DBGrid1.Columns.Items[6].Title.Caption := 'Situação';
  end;
end;

end.
