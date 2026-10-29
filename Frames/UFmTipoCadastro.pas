unit UFmTipoCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmTipoCadastro = class(TFrame)
    Label1: TLabel;
    MeTipoCadastro: TMaskEdit;
    BtTipoCadastro: TBitBtn;
    EdTipoCadastro: TEdit;
    procedure BtTipoCadastroClick(Sender: TObject);
    procedure MeTipoCadastroExit(Sender: TObject);
    procedure MeTipoCadastroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UTipoCadastroCons, UTipoCadastro_cl, UOracle_cl;

{$R *.dfm}

procedure TFmTipoCadastro.BtTipoCadastroClick(Sender: TObject);
begin
  if FTipoCadastroCons = Nil then
    FTipoCadastroCons := TFTipoCadastroCons.Create(Application);
  if FTipoCadastroCons.ShowModal = MrOk then
  begin
    MeTipoCadastro.Text := DMTipoCadastro.QTipoCadastroConsCOD_TIPO_CADASTRO.Text;
    MeTipoCadastroExit(Self);
  end;
end;

procedure TFmTipoCadastro.MeTipoCadastroExit(Sender: TObject);
begin
  if Trim(MeTipoCadastro.Text) <> '' then
    EdTipoCadastro.Text := DMOracle.BuscaNome('SELECT DESC_TIPO_CADASTRO FROM TB_TIPO_CADASTRO','COD_TIPO_CADASTRO = ' +
                           MeTipoCadastro.Text, true)
  else
    EdTipoCadastro.Text := 'Todos';
end;

procedure TFmTipoCadastro.MeTipoCadastroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtTipoCadastro.Click;
end;

end.
