unit URNotaExplicativaAux;

{
  Relatório desenvolvido para poder ser salvo no formato .RTF.
  Obrigatório para o Sped Contábil.
  O relatório FRNotaExplicativa possui o componente QRRichText para exibir
  o texto referente à nota explicativa, porém o mesmo não aparece quando exportado
  para o formato richText.
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRNotaExplicativaAux = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRMemo1: TQRMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNotaExplicativaAux: TFRNotaExplicativaAux;

implementation

uses UPlanilha_cl;

{$R *.dfm}

end.
