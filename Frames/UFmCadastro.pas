unit UFmCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmCadastro = class(TFrame)
    Label1: TLabel;
    MeCadastro: TMaskEdit;
    BtCadastro: TBitBtn;
    EdCadastro: TEdit;
    procedure BtCadastroClick(Sender: TObject);
    procedure MeCadastroExit(Sender: TObject);
    procedure MeCadastroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function GetCodigo: Integer;
    procedure SetCodigo(const Value: Integer);
  public
  published
    property Codigo: Integer read GetCodigo write SetCodigo;
  end;

implementation

uses UCadastroCons, UCadastro_cl, UOracle_cl;

{$R *.dfm}

procedure TFmCadastro.BtCadastroClick(Sender: TObject);
begin
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = MrOk then
  begin
    MeCadastro.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    MeCadastroExit(Self);
  end;
end;

function TFmCadastro.GetCodigo: Integer;
begin
  Result := StrToInt('0' + Trim(MeCadastro.Text));
end;

procedure TFmCadastro.MeCadastroExit(Sender: TObject);
begin
  if Trim(MeCadastro.Text) <> '' then
    EdCadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + MeCadastro.Text, true)
  else
    EdCadastro.Text := 'Todos';
end;

procedure TFmCadastro.MeCadastroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtCadastro.Click;
end;

procedure TFmCadastro.SetCodigo(const Value: Integer);
begin
  //Do nothing
end;

end.
