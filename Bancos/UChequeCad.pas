unit UChequeCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TFChequeCad = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    MEDT_BomPara: TMaskEdit;
    MEVal_Cheque: TMaskEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    MECGC_CPF: TMaskEdit;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FChequeCad: TFChequeCad;

implementation

{$R *.DFM}

end.
