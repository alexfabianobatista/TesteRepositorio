unit UOrdemProducaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants,
  UFmProduto;

type
  TFOrdemProducaoCons = class(TFTConsulta)
    MEDtInicialCons: TMaskEdit;
    MEDtFinalCons: TMaskEdit;
    Label2: TLabel;
    RGSituacaoCons: TRadioGroup;
    FmProduto1: TFmProduto;
    RGTipoOrdemCons: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOrdemProducaoCons: TFOrdemProducaoCons;

implementation

uses UOrdemProducao_cl;

{$R *.DFM}

procedure TFOrdemProducaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMOrdemProducao do
  Begin
    QOrdemProducaoCons.Close;

    If Trim(FmProduto1.MeProduto.Text) = '' then
      QOrdemProducaoCons.SetVariable('PRODUTO',Null)
    Else
      QOrdemProducaoCons.SetVariable('PRODUTO',Trim(FmProduto1.MeProduto.Text));

    If Trim(MEDtInicialCons.Text) = '' then
      QOrdemProducaoCons.SetVariable('DT_INICIAL',Null)
    Else
      QOrdemProducaoCons.SetVariable('DT_INICIAL',MEDtInicialCons.Text);

    If Trim(MEDtFinalCons.Text) = '' then
      QOrdemProducaoCons.SetVariable('DT_FINAL',Null)
    Else
      QOrdemProducaoCons.SetVariable('DT_FINAL',MEDtFinalCons.Text);
      
    IF FOrdemProducaoCons.RGSituacaoCons.ItemIndex = 0 then
      QOrdemProducaoCons.SetVariable('SITUACAO',NULL)
    else
      QOrdemProducaoCons.SetVariable('SITUACAO',FloatToStr(RGSituacaoCons.ItemIndex));

    Case FOrdemProducaoCons.RGTipoOrdemCons.ItemIndex of
      0:QOrdemProducaoCons.SetVariable('TIPO_ORDEM',NULL);
      1:QOrdemProducaoCons.SetVariable('TIPO_ORDEM','PRODUCAO');
      2:QOrdemProducaoCons.SetVariable('TIPO_ORDEM','PINTURA');
    end;

    QOrdemProducaoCons.Open;
  End;

end;

end.
