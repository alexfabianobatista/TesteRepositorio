unit URNotaPromissoriaExtra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  TFRNotaPromissoriaExtra = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel1: TQRLabel;
    QRLNumero: TQRLabel;
    QRLabel2: TQRLabel;
    QRLVencimento: TQRLabel;
    QRLDescPromissoria: TQRLabel;
    QRLabel5: TQRLabel;
    QRLPagavelEm: TQRLabel;
    QRLValor: TQRLabel;
    QRLabel7: TQRLabel;
    QRLEmitente: TQRLabel;
    QRLabel8: TQRLabel;
    QRLCPFCNPJEmitente: TQRLabel;
    QRLabel9: TQRLabel;
    QRLEnderecoEmitente: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLLocalData: TQRLabel;
    QRLabel12: TQRLabel;
    QRLEmitenteAssinatura: TQRLabel;
    QRLCPFCNPJEmitenteAssinatura: TQRLabel;
    QRLAvalista: TQRLabel;
    QRLCidadeEmitente: TQRLabel;
    QRLabel6: TQRLabel;
    procedure setDados(valor:real; dtVencimento: TDate; descCliente : string; descPagavelEm : string;
                       descEmitente : string; descCPFCGCEmitente : string; descEnderecoEmitente : string;
                       descCidadeEmitente : string; descLocal : string; dtLocal : TDate; descAvalista : string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNotaPromissoriaExtra: TFRNotaPromissoriaExtra;

implementation

uses UBiblioteca, USequencia_cl;

{$R *.DFM}

procedure TFRNotaPromissoriaExtra.setDados(valor:real; dtVencimento: TDate; descCliente : string; descPagavelEm : string;
                   descEmitente : string; descCPFCGCEmitente : string; descEnderecoEmitente : string;
                   descCidadeEmitente : string; descLocal : string; dtLocal : TDate; descAvalista : string);
var
  dia, mes, ano : word;
begin
  QRLVencimento.Caption                := DateToStr(dtVencimento);
  QRLValor.Caption                     := FormatFloat('R$#,##0.00', valor);
  QRLPagavelEm.Caption                 := descPagavelEm;
  QRLEmitente.Caption                  := descEmitente;
  QRLCPFCNPJEmitente.Caption           := descCPFCGCEmitente;
  QRLCidadeEmitente.Caption            := descCidadeEmitente;
  QRLEnderecoEmitente.Caption          := descEnderecoEmitente;
  QRLEmitenteAssinatura.Caption        := descEmitente;
  QRLCPFCNPJEmitenteAssinatura.Caption := descCPFCGCEmitente;
  QRLAvalista.Caption                  := descAvalista;

  DecodeDate(dtLocal, ano, mes,dia);
  
  QRLLocalData.Caption := descLocal + ', ' + inttostr(dia) + ' de ' + bib.NomeMes(mes) + ' de ' + inttostr(ano);

  DecodeDate(dtVencimento, ano, mes,dia);

  QRLDescPromissoria.Caption :=
    'Na data de ' + inttostr(dia) + ' de ' + bib.NomeMes(mes) + ' de ' + inttostr(ano) + ', pagarei por esta única via de NOTA PROMISSÓRIA a ' +
    descCliente + ' ou a sua ordem a quantia de: (' + Bib.extenso(valor,'REAL') + ') em moeda corrente ' +
    'deste país.';

  QRLNumero.Caption := FormatFloat('0000', DMSequencia.Sequencia(1, 'NOTA_PROMISSORIA_EXT'));
end;

end.
