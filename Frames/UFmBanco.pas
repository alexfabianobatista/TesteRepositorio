unit UFmBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFMBanco = class(TFrame)
    Label1: TLabel;
    MeBanco: TMaskEdit;
    BtBanco: TBitBtn;
    EdBanco: TEdit;
    procedure BtBancoClick(Sender: TObject);
    procedure MeBancoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UBancosCons, UBancoAgencia_cl, UOracle_cl;

{$R *.dfm}

procedure TFMBanco.BtBancoClick(Sender: TObject);
begin
  if FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal = MrOk then
    MeBanco.Text := DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Text;
  MeBancoExit(Self);
end;

procedure TFMBanco.MeBancoExit(Sender: TObject);
begin
  if trim(MEBanco.Text) <> '' then
    EDBanco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = ' +
                           MEBanco.Text, true)
  else
    EDBanco.Text := 'Todos';
end;

end.
