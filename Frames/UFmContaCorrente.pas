unit UFmContaCorrente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmContaCorrente = class(TFrame)
    Label1: TLabel;
    MeContaCorrente: TMaskEdit;
    BtContaCorrente: TBitBtn;
    EdContaCorrente: TEdit;
    procedure MeContaCorrenteExit(Sender: TObject);
    procedure BtContaCorrenteClick(Sender: TObject);
    procedure MeContaCorrenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UOracle_cl, UContaCorrenteCons, UBancoAgencia_cl;

{$R *.dfm}

procedure TFmContaCorrente.MeContaCorrenteExit(Sender: TObject);
begin
  if Trim(MeContaCorrente.Text) <> '' then
    EdContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+Trim(MeContaCorrente.Text))
  else
    EdContaCorrente.Text := 'Todas';

end;

procedure TFmContaCorrente.BtContaCorrenteClick(Sender: TObject);
begin
  If FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  If FContaCorrenteCons.ShowModal = mrOk then
    MEContaCorrente.Text := DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Text;
  MEContaCorrenteExit(Self);

end;

procedure TFmContaCorrente.MeContaCorrenteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtContaCorrente.Click;
end;

end.
