unit ULivroFiscalArquivoMagnetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, Db, DBCtrls, Grids, DBGrids;

type
  TFLFiscalArqMagnetico = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ME0Filial: TMaskEdit;
    Bt0ConsFilial: TBitBtn;
    Ed0Filial: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    ME0DataI: TMaskEdit;
    ME0DataF: TMaskEdit;
    Panel2: TPanel;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLFiscalArqMagnetico: TFLFiscalArqMagnetico;

implementation

uses UFilialCons, UFilial_cl, ULivroFiscalParam, ULivroFiscal_Cl;

{$R *.DFM}


end.
