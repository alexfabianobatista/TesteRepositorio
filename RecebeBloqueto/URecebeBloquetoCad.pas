unit URecebeBloquetoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls;

type
  TFRecebeBloquetoCad = class(TFTCadSimples)
    EdRecebeCod: TEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdRecebeCodExit(Sender: TObject);
  private
    { Private declarations }
    wstrAux, wstrNossoNumero : String;
    wintCodBanco, wintCodMoeda, wintDVCodBarras : Integer;
    wintCodAgencia, wintCodCedente, wintCarteira : Integer;
    wfloValor : Real;    
  public
    { Public declarations }
  end;

var
  FRecebeBloquetoCad: TFRecebeBloquetoCad;

implementation

uses URecebeBloqueto_cl;

{$R *.DFM}

procedure TFRecebeBloquetoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMRecebeBloqueto.QRecebeBloqueto.Open;
end;

procedure TFRecebeBloquetoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMRecebeBloqueto.QRecebeBloqueto.Close;
  Action := CaFree;
  FRecebeBloquetoCad := nil;
end;

procedure TFRecebeBloquetoCad.EdRecebeCodExit(Sender: TObject);
begin
  inherited;
  wstrAux := EdRecebeCod.Text;
  wintCodBanco := StrToInt( Copy(wstrAux,1,3) );
  wintCodMoeda := StrToInt( Copy(wstrAux,4,1) );
  wintDVCodBarras := StrToInt( Copy(wstrAux,5,1) );
  wfloValor := StrToFloat( Copy(wstrAux,6,14) );
  wstrNossoNumero := Copy(wstrAux,20,11);
  wintCodAgencia := StrToInt( Copy(wstrAux,31,4) );
  wintCodCedente := StrToInt( Copy(wstrAux,35,8) );
  wintCarteira := StrToInt( Copy(wstrAux,43,2) );

  With DMRecebeBloqueto Do
  Begin
    QRecebeBloqueto.Insert;
    QRecebeBloquetoCOD_BANCO.Value := wintCodBanco;
    QRecebeBloquetoCOD_MOEDA.Value := wintCodMoeda;
    QRecebeBloquetoVAL_TITULO.Value := wfloValor;
    QRecebeBloquetoNOSSO_NUMERO.Value := wstrNossoNumero;
    QRecebeBloquetoCOD_AGENCIA.Value := wintCodAgencia;
    QRecebeBloquetoNUM_CONTA.Value := wintCodCedente;
    QRecebeBloquetoCOD_CARTEIRA.Value := wintCarteira;
  End;
end;

end.
