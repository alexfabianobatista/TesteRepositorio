unit UPercPisCofinsCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Wwdatsrc, DB, Wwdbigrd, Wwdbgrid, Grids, DBGrids,
  StdCtrls, Mask, Buttons, UFmOperacao, Menus;

type
  TFPercPisCofinsCons = class(TFTConsulta)
    MeAno: TMaskEdit;
    Label231: TLabel;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPercPisCofinsCons: TFPercPisCofinsCons;

implementation

uses ULivroFiscal_Cl;

{$R *.dfm}

procedure TFPercPisCofinsCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMLivroFiscal.QPercPisCofinsCons.Close;
  if Trim(METexto.Text) = '' then
    DMLivroFiscal.QPercPisCofinsCons.SetVariable('NUM_MES', Null)
  else
    DMLivroFiscal.QPercPisCofinsCons.SetVariable('NUM_MES', Trim(METexto.Text));
  if Trim(MeAno.Text) = '' then
    DMLivroFiscal.QPercPisCofinsCons.SetVariable('NUM_ANO', Null)
  else
    DMLivroFiscal.QPercPisCofinsCons.SetVariable('NUM_ANO', Trim(MeAno.Text));
  DMLivroFiscal.QPercPisCofinsCons.Open;
end;

end.
