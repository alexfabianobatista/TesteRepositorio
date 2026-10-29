unit ULivroFParamOp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, Mask, ExtCtrls, Buttons, ComCtrls, Db, Grids,
  DBGrids;

type
  TFLivroFParamOp = class(TFTParametro)
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses UFilial_cl, UOperacaoCons, UOperacao_cl, UFilialCons, ULivroFiscal_cl;

{$R *.DFM}

end.
