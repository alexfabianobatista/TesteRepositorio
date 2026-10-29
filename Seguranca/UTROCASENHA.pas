unit UTrocaSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls;

type
  TFTrocaSenha = class(TForm)
    Label2: TLabel;
    DBLCBUsuario: TDBLookupComboBox;
    MESenhaAntiga: TMaskEdit;
    MESenhaNova: TMaskEdit;
    MEConfirmaSenha: TMaskEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BtOk: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTrocaSenha: TFTrocaSenha;

implementation

uses UUsuario_cl;

{$R *.DFM}


procedure TFTrocaSenha.FormActivate(Sender: TObject);
begin
  MESenhaAntiga.Text := '';
  MESenhaNova.Text := '';
  MEConfirmaSenha.Text := '';
end;

procedure TFTrocaSenha.BtOkClick(Sender: TObject);
begin
  Try
    If UpperCase(Trim(MESenhaNova.Text)) = UpperCase(Trim(MEConfirmaSenha.Text)) then
      DMUsuario.TrocaSenha(DBLCBUsuario.KeyValue,MESenhaAntiga.Text,MESenhaNova.Text);
    //ShowMessage('Senha trocada com sucesso!');  
  Except
    ModalResult := mrNone;
    Raise;
  End;
end;

end.
