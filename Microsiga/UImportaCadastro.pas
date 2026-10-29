unit UImportaCadastro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, StdCtrls, Buttons, ImgList, Db, Menus, ComCtrls, Mask,
  ExtCtrls;

type
  TFImportaCadastro = class(TFTCadSimples)
    Label1: TLabel;
    BitBtn13: TBitBtn;
    EdTotalIncluidos: TEdit;
    EdTotalAlterados: TEdit;
    OpenDialog1: TOpenDialog;
    Label2: TLabel;
    procedure BitBtn13Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImportaCadastro: TFImportaCadastro;

implementation

uses UCadastro_cl, UOracle_cl, UImporta_cl;

{$R *.DFM}

procedure TFImportaCadastro.BitBtn13Click(Sender: TObject);
var
  wCont_Inc,wCont_Alt : Integer;
begin
  inherited;
  OpenDialog1.InitialDir := 'c:\';
  OpenDialog1.Filter     := 'txt';
  if OpenDialog1.Execute then
  begin
    DMCadastro.QCadastro.CommitOnPost := False;
    DMOracle.DBCemapa.StartTransaction;
    try
      DMImporta.importaCadastro(OpenDialog1.FileName, wCont_Inc, wCont_Alt);

      DMOracle.DBCemapa.Commit;
      
      EdTotalIncluidos.Text := IntToStr(wCont_Inc);
      EdTotalAlterados.Text := IntToStr(wCont_Alt);
      showmessage('Importação encerrada com Sucesso');
    except
      DMOracle.DBCemapa.Rollback;
      Raise;
    End;
    DMCadastro.QCadastro.CommitOnPost := True;
  end;
end;

end.
