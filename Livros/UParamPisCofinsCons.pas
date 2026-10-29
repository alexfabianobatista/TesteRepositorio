unit UParamPisCofinsCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Wwdatsrc, DB, Wwdbigrd, Wwdbgrid, Grids, DBGrids,
  StdCtrls, Mask, Buttons, UFmOperacao, Menus;

type
  TFParamPisCofinsCons = class(TFTConsulta)
    FmOperacao: TFmOperacao;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FParamPisCofinsCons: TFParamPisCofinsCons;

implementation

uses ULivroFiscal_Cl;

{$R *.dfm}

procedure TFParamPisCofinsCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMLivroFiscal.QParamPisCofinsCons.Close;
  if Trim(FmOperacao.MeOperacao.Text) = '' then
    DMLivroFiscal.QParamPisCofinsCons.SetVariable('COD_OPERACAO', Null)
  else
    DMLivroFiscal.QParamPisCofinsCons.SetVariable('COD_OPERACAO', Trim(FmOperacao.MeOperacao.Text));
  DMLivroFiscal.QParamPisCofinsCons.Open;
end;

end.
