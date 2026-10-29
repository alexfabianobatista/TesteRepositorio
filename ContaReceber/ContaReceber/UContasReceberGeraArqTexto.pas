unit UContasReceberGeraArqTexto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons;

type
  TFContasReceberExportaArqTexto = class(TForm)
    SB_ConsultaFilial: TSpeedButton;
    Label5: TLabel;
    MECodFilial: TMaskEdit;
    MEFilial: TMaskEdit;
    Btn_GeraArquivo: TBitBtn;
    Edit1: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UFilialCons, UFilial_cl, UOracle_cl, UContasReceber_cl;

{$R *.DFM}




end.
