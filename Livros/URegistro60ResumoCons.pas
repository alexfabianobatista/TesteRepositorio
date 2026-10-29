unit URegistro60ResumoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus;

type
  TFRegistro60ResumoCons = class(TFTConsulta)
    Label2: TLabel;
    MeMes: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegistro60ResumoCons: TFRegistro60ResumoCons;

implementation

uses ULivroFiscal_Cl;

{$R *.dfm}

procedure TFRegistro60ResumoCons.FormCreate(Sender: TObject);
var ano, mes, dia: Word;
begin
  inherited;
  if DSConsulta.DataSet = nil then
    DSConsulta.DataSet := DMLivroFiscal.QTipo60ResumoCons;

  DecodeDate(date, ano, mes, dia);

  METexto.Text := IntToStr(ano);
end;

procedure TFRegistro60ResumoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMLivroFiscal do
  Begin
    QTipo60ResumoCons.Close;
    If Trim(METexto.Text) = '' Then
       Raise exception.Create('Informar ano');
    QTipo60ResumoCons.SetVariable('NUM_ANO', Trim(METexto.Text));
    If Trim(MeMes.Text) <> '' Then
       QTipo60ResumoCons.SetVariable('NUM_MES', Trim(MeMes.Text))
    Else
       QTipo60ResumoCons.SetVariable('NUM_MES', Null);
    QTipo60ResumoCons.Open;
  End;
end;

end.
