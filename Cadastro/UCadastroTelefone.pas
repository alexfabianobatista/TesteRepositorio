unit UCadastroTelefone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, StrUtils;

type
  TFCadastroTelefone = class(TForm)
    LBCadastroTelefone: TListBox;
    BtOk: TBitBtn;
    BtCancel: TBitBtn;
    procedure LBCadastroTelefoneDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FCadastros: Array of String;
    function GetCadastro: String;
    function GetTelefone: String;
  public
    function Mostra(Cadastros: Array of String): TModalResult;
    property Cadastro: String read GetCadastro;
    property Telefone: String read GetTelefone;
  end;

var
  FCadastroTelefone: TFCadastroTelefone;

implementation

uses UOracle_cl;

{$R *.dfm}

{ TFCadastroTelefone }

function TFCadastroTelefone.GetCadastro: String;
begin
  Result := FCadastros[LBCadastroTelefone.ItemIndex];
end;

function TFCadastroTelefone.GetTelefone: String;
var
  S: String;
begin
  S := LBCadastroTelefone.Items[LBCadastroTelefone.ItemIndex];
  S := Copy(S, PosEx(' - ', S) + 3, Length(S));
  Result := S;
end;

function TFCadastroTelefone.Mostra(
  Cadastros: Array of String): TModalResult;
var
  i: Integer;
begin
  SetLength(FCadastros, 0);
  Buscador.Limpa;
  for i := 0 to Length(Cadastros) - 1 do
  begin
    SetLength(FCadastros, i + 1);
    FCadastros[i] := Cadastros[i];
    Buscador.Adiciona(QuotedStr(Cadastros[i] + ' - ') + ' || NOME || ' +
      QuotedStr(' (') + ' || NVL(DESC_FAX, DESC_TELEFONE) || ' + QuotedStr(')'),
      'TB_CADASTRO', 'COD_CADASTRO = ' + Cadastros[i]);
  end;
  Buscador.Buscar();
  with LBCadastroTelefone.Items do
  begin
    Clear;
    while Buscador.TemProximo do
      Add(Buscador.Proximo);
  end;
  LBCadastroTelefone.ItemIndex := 0;

  Result := ShowModal;
end;

procedure TFCadastroTelefone.LBCadastroTelefoneDblClick(Sender: TObject);
begin
  BtOk.Click;
end;

procedure TFCadastroTelefone.FormCreate(Sender: TObject);
begin
  Constraints.MinHeight := Height;
  Constraints.MinWidth := Width;
end;

procedure TFCadastroTelefone.FormActivate(Sender: TObject);
begin
  BtOk.SetFocus;
end;

end.
