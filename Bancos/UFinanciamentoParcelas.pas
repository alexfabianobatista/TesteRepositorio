unit UFinanciamentoParcelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, Grids, DBGrids, DB;

type
  TFFinanciamentoParcelas = class(TForm)
    MENumParcelas: TMaskEdit;
    Label3: TLabel;
    MEValParcelas: TMaskEdit;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    DSParcelas: TDataSource;
    Label2: TLabel;
    MEPrimeiroVencimento: TMaskEdit;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure SimulaParcelas(pNumParcelas: Integer; pValParcelas: Real; pPrimeiraParcela: TDateTime);
  public
    procedure LimpaParcelas;
  end;

var
  FFinanciamentoParcelas: TFFinanciamentoParcelas;

implementation

uses UFinanciamento_cl;

{$R *.dfm}

procedure TFFinanciamentoParcelas.LimpaParcelas;
begin
  with DMFinanciamento do
  begin
    CDSGerarParcelas.Close;
    CDSGerarParcelas.Open;
    CDSGerarParcelas.First;
    while not CDSGerarParcelas.Eof do
      CDSGerarParcelas.Delete;
  end;
end;

procedure TFFinanciamentoParcelas.SimulaParcelas(pNumParcelas: Integer; pValParcelas: Real; pPrimeiraParcela: TDateTime);
  var count: Integer;
begin
  LimpaParcelas;
  for count := 0 to pNumParcelas-1 do
  begin
    with DMFinanciamento do
    begin
      CDSGerarParcelas.Append;
      CDSGerarParcelasDT_VENCIMENTO.Value := IncMonth(pPrimeiraParcela, count);
      CDSGerarParcelasVL_PARCELA.Value := pValParcelas;
    end;
  end;
end;

procedure TFFinanciamentoParcelas.BitBtn1Click(Sender: TObject);
begin
  if (trim(MEPrimeiroVencimento.Text) = '') then
    raise Exception.Create('A data do primeiro vencimento deve ser preenchida!');
  if trim(MENumParcelas.Text) = '' then
    raise Exception.Create('O número de parcelas deve ser informado!');
  if Strtoint(trim(MENumParcelas.Text)) < 1 then
    raise Exception.Create('O número de parcelas deve ser maior que 0!');
  if trim(MEValParcelas.Text) = '' then
    raise Exception.Create('O valor das parcelas deve ser infomado!');
  SimulaParcelas(strtoint(trim(MENumParcelas.Text)), strtofloat(trim(MEValParcelas.Text)),
    strtodate(MEPrimeiroVencimento.Text));
end;

end.
