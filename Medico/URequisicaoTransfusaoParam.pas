unit URequisicaoTransfusaoParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask,
  UFmCadastro;

type
  TFRequisicaoTransfusaoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    FmCadastro1: TFmCadastro;
    RG0Tipo: TRadioGroup;
    GB0DataColeta: TGroupBox;
    ME0DtInicial: TMaskEdit;
    ME0DtFinal: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRequisicaoTransfusaoParam: TFRequisicaoTransfusaoParam;

implementation

{$R *.dfm}

end.
