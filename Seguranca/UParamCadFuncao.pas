unit UParamCadFuncao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls;

type
  TFParamCadFuncao = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLCBTela: TDBLookupComboBox;
    Label1: TLabel;
    Tela: TLabel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FParamCadFuncao: TFParamCadFuncao;

implementation

uses UFuncao_cl;

{$R *.DFM}

procedure TFParamCadFuncao.FormActivate(Sender: TObject);
begin
  With DMFuncao do
  Begin
    QModulo.Open;
    QTela.Open;
  End;
end;

end.
