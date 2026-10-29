unit UPesagemAgricola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WTReadWeight_TLB, OleServer;

type
  TFPesagem = class(TForm)
    tmrBalanca: TTimer;
    lblPeso: TLabel;
    btnOk: TButton;
    Label1: TLabel;
    lblConfirmado: TLabel;
    rdBal: TReadWeight;
    btnPesar: TButton;
    procedure btnPesarClick(Sender: TObject);
    procedure tmrBalancaTimer(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    vPortaCom : integer;
    { Public declarations }
  end;

var
  FPesagem: TFPesagem;
  TM_OUT: integer;
  intTm: integer;


implementation

{$R *.dfm}

procedure TFPesagem.btnPesarClick(Sender: TObject);
var
  resultado: boolean;
  vIndicador, vBaudRate, vParidade, vDataBits, vStopBits: integer;
  rdBal: TReadWeight;
begin
  resultado := false;

    WinExec( 'regasm WTReadWeight.dll /tlb:WTReadWeight.tlb',SW_HIDE);
    rdBal := TReadWeight.Create(Application);

    vIndicador := 6;
    vBaudRate := 9600;
    vParidade := 0;
    vDataBits := 8;
    vStopBits := 1;

    if not resultado then
      resultado := rdBal.ComunicarSerial(vIndicador, vPortaCom, vBaudRate, vParidade, vDataBits, vStopBits);

    if not Resultado Then
      MessageBox(Self.Handle, 'Erro ao acessar a balança', 'Balança',MB_OK)
    else
    begin
      TM_OUT := 5000;
      btnOk.Enabled := true;
      tmrBalanca.Enabled := true;
    end;

end;

procedure TFPesagem.tmrBalancaTimer(Sender: TObject);
begin
  if rdBal.LePeso() then
  begin
     if rdBal.SobreCarga = 0 then //'Peso ok
     begin
       lblPeso.Caption := rdBal.PesoFormatado;
       lblConfirmado.Visible := rdBal.Estavel;
     end
     else
     begin
      lblConfirmado.Visible := true;
      lblConfirmado.Caption := 'Peso não coletado, aguarde.';
     end;                                                    
     intTm := 0;
  end
  else
  begin
    intTm := intTm + 1;

    if intTm * tmrBalanca.Interval > TM_OUT then
    begin
      intTm := 0;
      lblPeso.Caption := 'Falha';
    end;
  end;
end;

procedure TFPesagem.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
  Close;
end;

end.
