unit UConhecimento_CR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFmBanco, UFmFinalidade, UFmContaCorrente, UFmDepartamento,
  StdCtrls, Mask, Buttons;

type
  TFConhecimento_CR = class(TForm)
    FmFinalidade: TFmFinalidade;
    FMBanco: TFMBanco;
    FmDepartamento: TFmDepartamento;
    FmContaCorrente: TFmContaCorrente;
    LBDtVencimento: TLabel;
    MEDtVencimento: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConhecimento_CR: TFConhecimento_CR;

implementation

{$R *.dfm}

end.
