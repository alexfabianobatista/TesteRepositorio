unit UOrdemCompraDadosAdicionais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons;

type
  TFOrdemCompraDadosAdicionais = class(TForm)
    Label1: TLabel;
    MeCondicao: TMaskEdit;
    Label2: TLabel;
    MeContato: TMaskEdit;
    BtCancela: TBitBtn;
    BtOk: TBitBtn;
    MePedido: TMaskEdit;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOrdemCompraDadosAdicionais: TFOrdemCompraDadosAdicionais;

implementation

{$R *.dfm}

end.
