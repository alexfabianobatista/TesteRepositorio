unit URFidelidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, variants;

type
  TFRFidelidade = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLFilial: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLVenda: TQRLabel;
    QRLPontos: TQRLabel;
    QRLPago: TQRLabel;
    QRLSaldo: TQRLabel;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    wValCompras:real;
    wValPagtoFidelidade:real;
  end;

var
  FRFidelidade: TFRFidelidade;

implementation

uses UFinalidade_cl, UFidelidade_cl, UFidelidadeCad;

{$R *.DFM}

procedure TFRFidelidade.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  wValCompras:=0;
  wValPagtoFidelidade:=0;

  with DMFidelidade do
  begin
    QRFidelidade.Close;
    if trim(FFidelidadeCad.MECadastro.Text) <> '' then
      QRFidelidade.setVariable('COD_CADASTRO',trim(FFidelidadeCad.MECadastro.Text))
    else
      QRFidelidade.setVariable('COD_CADASTRO',null);

    if trim(FFidelidadeCad.MEFilial.Text) <> '' then
      QRFidelidade.SetVariable('FILIAL',trim(FFidelidadeCad.MeFilial.Text))
    else
      QRFidelidade.SetVariable('FILIAL',null);

    QRFidelidade.Open;

    QRFidelidade.first;
    while not(QRFidelidade.eof) do
    begin
      wValCompras:=wValCompras+QRFidelidadeVAL_TOTAL.Value;
      QRFidelidade.next;
    end;
    FRFidelidade.QRLVenda.caption:=FormatFloat('#,##0.00',wValCompras);
    If wValCompras > 0 Then
       FRFidelidade.QRLPontos.Caption := FormatFloat('#,##0',wValCompras * 10 );  // o calculo é a cada 25 reais 250 pontos

    //-----------abre query q Lista pagamentos de premios
    QRBaixaFidelidade.Close;
    if trim(FFidelidadeCad.MECadastro.Text) <> '' then
      QRBaixaFidelidade.setVariable('COD_CADASTRO',trim(FFidelidadeCad.MECadastro.Text))
    else
      QRBaixaFidelidade.setVariable('COD_CADASTRO',null);

    if trim(FFidelidadeCad.MEFilial.Text) <> '' then
      QRBaixaFidelidade.SetVariable('FILIAL',trim(FFidelidadeCad.MeFilial.Text))
    else
      QRBaixaFidelidade.SetVariable('FILIAL',null);

    QRBaixaFidelidade.Open;
    QRBaixaFidelidade.first;
    while not(QRBaixaFidelidade.eof) do
    begin
      wValPagtoFidelidade:=wValPagtoFidelidade+QRBaixaFidelidadeVAL_BAIXA.Value;
      QRBaixaFidelidade.next;
    end;
    FRFidelidade.QRLPago.caption:=FormatFloat('#,##0',wValPagtoFidelidade);
    //----label do saldo a retirar
    FRFidelidade.QRLSaldo.Caption:=FormatFloat('#,##0',wValCompras * 10 -wValPagtoFidelidade);

    If FRFidelidade = Nil then
      FRFidelidade := TFRFidelidade.Create(Application);
      FRFidelidade.QRPrimario.Preview  
  end;


end;

end.
