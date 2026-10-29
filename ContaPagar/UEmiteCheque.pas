unit UEmiteCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ComCtrls, ExtCtrls;

type
  TFEmiteCheque = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    ProgressBar1: TProgressBar;
    MECodBanco: TMaskEdit;
    MEBanco: TMaskEdit;
    MEContaCorrente: TMaskEdit;
    MENrCheque: TMaskEdit;
    MEValor: TMaskEdit;
    MECidade: TMaskEdit;
    MEData: TMaskEdit;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label8: TLabel;
    MENominal: TMaskEdit;
    Label9: TLabel;
    RGImpressora: TRadioGroup;
    procedure MECodBancoChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    FCodFilial: Integer;
  public
    property CodFilial: Integer read FCodFilial write FCodFilial default 0;
  end;

var
  FEmiteCheque: TFEmiteCheque;

implementation

uses UOracle_cl, UContaCorrenteCons, UBancoAgencia_cl;

{$R *.DFM}

procedure TFEmiteCheque.MECodBancoChange(Sender: TObject);
begin
  if Trim(MECodBanco.text)<>'' then
     MEBanco.text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MECodBanco.text)
  else
     MEBanco.text:='';
end;

procedure TFEmiteCheque.SpeedButton1Click(Sender: TObject);
begin
  If FContaCorrenteCons=Nil Then
    FContaCorrenteCons:=TFContaCorrenteCons.Create(Application);
  If FContaCorrenteCons.ShowModal=MrOk then
    Begin
      MECodBanco.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Value);
      MEContaCorrente.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value);
      MENrCheque.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsNum_Cheque.Value + 1);
    End;
end;

procedure TFEmiteCheque.BitBtn1Click(Sender: TObject);
begin
  Try
    if RGImpressora.ItemIndex = 0 then
      DMBancoAgencia.EmiteCheque(StrToFloat(MECodBanco.text),
                                 StrToFloat(MEValor.text),
                                 StrToDate(MEData.text),
                                 MENominal.Text,
                                 MECidade.Text,
                                 FCodFilial)
    else if RGImpressora.ItemIndex = 1 then
      DMBancoAgencia.EmiteChequeChronos(
                                 MENominal.Text,
                                 MECidade.Text,
                                 MECodBanco.Text,
                                 StrToFloat(MEValor.Text),
                                 StrToDate(MEData.Text));
  except
    on e : exception do
      Raise Exception.create(e.Message + chr(13) + chr(13) + 'Erro na entrada de dados. Favor Corrigir.');
  end;
end;

procedure TFEmiteCheque.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
