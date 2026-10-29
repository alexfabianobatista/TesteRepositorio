unit UFArquivoTexto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TFMostraTexto = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMostraTexto: TFMostraTexto;
             i: integer;
        CC,Tit: String;
implementation

uses UContasReceberParam, UOracle_cl, UFinalidade_cl, UBiblioteca,
  UBancoAgencia_cl, UUsuario_cl, UContasReceber_cl, UParamSistema_cl,
  UPlanilha_cl;

{$R *.DFM}


end.
