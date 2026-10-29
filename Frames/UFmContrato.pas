unit UFmContrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmContrato = class(TFrame)
    MeContrato: TMaskEdit;
    Label1: TLabel;
    BtContrato: TBitBtn;
    EdContrato: TEdit;
    procedure MeContratoExit(Sender: TObject);
    procedure BtContratoClick(Sender: TObject);
    procedure MeContratoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UOracle_cl, UContratoVenda_Cons, Ucontrato_cl;

{$R *.dfm}

procedure TFmContrato.MeContratoExit(Sender: TObject);
begin
  if Trim(MeContrato.Text) <> '' then
    EdContrato.text:=DMOracle.BuscaNome('SELECT TB_CONTRATO_VEND.OBS FROM TB_CONTRATO_VEND','COD_CONTRATO_VEND = '+Trim(MEContrato.text))
  else
    EdContrato.Text:='Todos';
end;

procedure TFmContrato.BtContratoClick(Sender: TObject);
begin
  if FContrato_VendaCons = Nil then
    FContrato_VendaCons := TFContrato_VendaCons.Create(Application);
  if FContrato_VendaCons.ShowModal=mrOk then
  begin
    MeContrato.Text :=DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Text;
    MeContratoExit(self);
  end;
end;

procedure TFmContrato.MeContratoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtContrato.Click;
end;

end.
