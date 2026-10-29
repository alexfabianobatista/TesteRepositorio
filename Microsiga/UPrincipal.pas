unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TFPrincipal = class(TForm)
    StBLongHint: TStatusBar;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses UImporta_cl, UOracle_cl, UParamSistema_cl, UCadastro_cl;

{$R *.DFM}

procedure TFPrincipal.FormActivate(Sender: TObject);
var
  wContInt, wContAlt: integer;
  SR: TSearchRec;
  I: integer;
  Origem, Destino: string;
  caminho: string;
  wErrosCad, wErrosPed, xx, yy : integer;
  wMensagem : string;
begin

  StBLongHint.SimpleText := DMParamSistema.QParamSistemaCOD_EMPRESA.Value;
  Application.ProcessMessages;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FAVILLE' then
    caminho :='C:\FAVILLE\TO-HOST\';
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZADIMEL' then
    caminho :='C:\ZADIMEL\TO-HOST\';
    
  wErrosCad := 0;
  wErrosPed := 0;


  //importa os cadastros
  DMCadastro.QCadastro.CommitOnPost := False;
  I := FindFirst(caminho + 'PDAC*.TXT', faAnyFile, SR);
  While I = 0 do
  Begin
    If (SR.Attr and faDirectory) <> faDirectory then
    Begin
      try
        DMOracle.DBCemapa.StartTransaction;
        DMImporta.importaCadastro(caminho + sr.name, xx, yy); //as duas ultimas variaveis nao sao usadas aqui
        DMOracle.DBCemapa.Commit;
      except
        //On E : Exception Do
        //Begin
        DMOracle.DBCemapa.Rollback;
        //  Raise exception.Create(e.Message + Chr(13) + ' Erro na Importação');
        //End;
        inc(wErrosCad);
      End;
    End;
    I := FindNext(SR);
  end;
  DMCadastro.QCadastro.CommitOnPost := true;

  //importa os pedidos
  I := FindFirst(caminho + 'PED*.TXT', faAnyFile, SR);
  While I = 0 do
  Begin
    If (SR.Attr and faDirectory) <> faDirectory then
    Begin
      try
        DMOracle.DBCemapa.StartTransaction;
        DMImporta.importaPedido(caminho + sr.name, xx, yy); //as duas ultimas variaveis nao sao usadas aqui
        DMOracle.DBCemapa.Commit;
      except
        //On E : Exception Do
        //Begin
        DMOracle.DBCemapa.Rollback;
        //  Raise exception.Create(e.Message + Chr(13) + ' Erro na Importação');
        //End;
        inc(wErrosPed);
      End;
    End;
    I := FindNext(SR);
  end;

  wMensagem := 'Importação terminada com ';
  if (wErrosCad + wErrosPed) > 0 then
  begin
    wMensagem := wMensagem + 'erros. ' + chr(13) + chr(13);
    wMensagem := wMensagem + 'Arquivos de Cadastros com erros: ' + inttostr(wErrosCad) + chr(13);
    wMensagem := wMensagem + 'Arquivos de Pedidos com erros: '   + inttostr(wErrosPed);
  end
  else
    wMensagem := wMensagem + 'sucesso';

  if (wErrosCad + wErrosPed) > 0 then
    MessageDlg(wMensagem, mtWarning, [mbok], 0);
//  else
//    MessageDlg(wMensagem, mtInformation, [mbok], 0);

  Application.Terminate;
end;

end.
