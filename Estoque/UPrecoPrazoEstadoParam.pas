unit UPrecoPrazoEstadoParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, UFmEstado,
  UFmProduto, UFmPrazoVencimento, Mask;

type
  TFPrecoPrazoEstadoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    FmProduto1: TFmProduto;
    FmEstado1: TFmEstado;
    FMPrazoVencimento1: TFMPrazoVencimento;
    RGReajuste: TRadioGroup;
    MePercentual: TMaskEdit;
    Label1: TLabel;
    procedure MePercentualExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrecoPrazoEstadoParam: TFPrecoPrazoEstadoParam;

implementation

{$R *.dfm}

procedure TFPrecoPrazoEstadoParam.MePercentualExit(Sender: TObject);
var res: double;
begin
  inherited;
  try
    res := StrToFloat(MePercentual.Text);
  except
    MessageDlg('Percentual Inválido', mtError, [mbOk], 0);
    MePercentual.SetFocus;
  end;
end;

end.
