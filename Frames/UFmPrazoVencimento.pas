unit UFmPrazoVencimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFMPrazoVencimento = class(TFrame)
    Label1: TLabel;
    MePrazoVencimento: TMaskEdit;
    BtPrazoVencimento: TBitBtn;
    EdPrazoVencimento: TEdit;
    procedure MePrazoVencimentoExit(Sender: TObject);
    procedure MePrazoVencimentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtPrazoVencimentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UOracle_cl, UPrazoVencimentoCons, UPrazoVencimento_cl;

{$R *.dfm}

procedure TFMPrazoVencimento.MePrazoVencimentoExit(Sender: TObject);
begin
  if Trim(MePrazoVencimento.Text) <> '' then
    EdPrazoVencimento.Text := DMOracle.BuscaNome('SELECT DESC_PRAZO_VENCIMENTO FROM TB_PRAZO_VENCIMENTO'
      ,'COD_PRAZO_VENCIMENTO = ' + MePrazoVencimento.Text, true)
  else
    EdPrazoVencimento.Text := 'Todos';

end;

procedure TFMPrazoVencimento.MePrazoVencimentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtPrazoVencimento.Click;  
end;

procedure TFMPrazoVencimento.BtPrazoVencimentoClick(Sender: TObject);
begin
  if FPrazoVencimentoCons = Nil then
    FPrazoVencimentoCons := TFPrazoVencimentoCons.Create(Application);
  if FPrazoVencimentoCons.ShowModal = MrOk then
  begin
    MePrazoVencimento.Text :=
      DMPrazoVencimento.QPrazoVencimento_ConsCOD_PRAZO_VENCIMENTO.Text;
    MePrazoVencimentoExit(Self);
  end;
end;

end.
