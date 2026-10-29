unit UAtualizaPreco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask;

type
  TFAtualizaPreco = class(TForm)
    Label1: TLabel;
    MePerc_Varejo: TMaskEdit;
    Label2: TLabel;
    MePerc_Atacado: TMaskEdit;
    BtConfirma: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAtualizaPreco: TFAtualizaPreco;

implementation

{$R *.DFM}

end.
