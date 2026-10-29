unit UObservacao_Cons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, DBCtrls;

type
  TFObservacao_Cons = class(TForm)
    DsConsultaObservacao: TDataSource;
    DBMemo1: TDBMemo;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FObservacao_Cons: TFObservacao_Cons;

implementation

uses UProduto_cl;

{$R *.dfm}

end.
