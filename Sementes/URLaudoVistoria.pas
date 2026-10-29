unit URLaudoVistoria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, QRExport, StdCtrls;

type
  TFRLaudoVistoria = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRLTitulo: TQRLabel;
    QRLEmpresa: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRGroup1: TQRGroup;
    QRLabel23: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    Label1: TLabel;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRShape12: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRLVia: TQRLabel;
    QRDBText66: TQRDBText;
    QRLabel58: TQRLabel;
    QRShape41: TQRShape;
    QRShape22: TQRShape;
    QRLNocProibida: TQRLabel;
    QRLOutros: TQRLabel;
    QRLAtipica: TQRLabel;
    QRLOutraCultivar: TQRLabel;
    QRLNocTolerada: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText71: TQRDBText;
    QRDBText72: TQRDBText;
    QRDBText73: TQRDBText;
    QRDBText74: TQRDBText;
    QRDBText75: TQRDBText;
    QRShape39: TQRShape;
    QRLabel44: TQRLabel;
    QRDBText55: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText56: TQRDBText;
    QRLDtEmissao: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    fCod_Filial : Real;
  public
    { Public declarations }
    Property pCod_Filial : Real Read fCod_Filial Write fCod_Filial;
  end;

var
  FRLaudoVistoria: TFRLaudoVistoria;

implementation

uses UOracle_cl, ULaudo_cl;

{$R *.DFM}


procedure TFRLaudoVistoria.FormCreate(Sender: TObject);
begin
  QRLEmpresa.Caption := 'Empresa: '+DMOracle.BuscaNome('SELECT DESC_EMPRESA FROM TB_PARAM_SISTEMA ',
                                                       'COD_FILIAL >= 0');
  //QRLNomeRel.Caption := Self.Name;
end;

procedure TFRLaudoVistoria.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  (*
  If (QRPrimario.QRPrinter.PaperWidth < QRPrimario.Page.Width)
     or
     (QRPrimario.QRPrinter.PaperLength < QRPrimario.Page.Length) Then
  Begin
    If MessageDlg('Dimensões do relatório diferente da Conf. da Impressora.'
               +#13+'Largura: Relatório='+ FloatToStr(QRPrimario.Page.Width)
               +' Drive='+FloatToStr(QRPrimario.QRPrinter.PaperWidth)
               +#13+'Comprimento: Relatório='+FloatToStr(QRPrimario.Page.Length)
               +' Drive='+FloatToStr( QRPrimario.QRPrinter.PaperLength ), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
    End;
  End;
  *)
//  QRPrimario.QRPrinter.PaperLength := Round(QRPrimario.Page.Length);
//  QRPrimario.QRPrinter.PaperWidth := Round(QRPrimario.Page.Width);

(*
  If FRelPreview = Nil Then
    FRelPreview := TFRelPreview.Create(Application);
  FRelPreview.QRPreview.QRPrinter := QRPrimario.QRPrinter;
  FRelPreview.pLarguraPagina := QRPrimario.Page.
  FRelPreview.Show;
*)
end;

procedure TFRLaudoVistoria.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with DMLaudo do
  Begin
    QRLNocProibida.Caption := IntToStr(QRLaudoVistoriaQT_NOCIVAS_PROIBIDA_A.Value +  QRLaudoVistoriaQT_NOCIVAS_PROIBIDA_B.Value +
                              QRLaudoVistoriaQT_NOCIVAS_PROIBIDA_C.Value +  QRLaudoVistoriaQT_NOCIVAS_PROIBIDA_D.Value +
                              QRLaudoVistoriaQT_NOCIVAS_PROIBIDA_E.Value +  QRLaudoVistoriaQT_NOCIVAS_PROIBIDA_F.Value);

    QRLOutros.Caption := IntToStr(QRLaudoVistoriaQT_OUTROS_A.Value + QRLaudoVistoriaQT_OUTROS_B.Value +
                          QRLaudoVistoriaQT_OUTROS_C.Value + QRLaudoVistoriaQT_OUTROS_D.Value +
                          QRLaudoVistoriaQT_OUTROS_E.Value + QRLaudoVistoriaQT_OUTROS_F.Value);

    QRLOutraCultivar.Caption := IntToStr(QRLaudoVistoriaQT_OUTRAS_ESPECIES_A.Value + QRLaudoVistoriaQT_OUTRAS_ESPECIES_B.Value +
                                QRLaudoVistoriaQT_OUTRAS_ESPECIES_C.Value + QRLaudoVistoriaQT_OUTRAS_ESPECIES_D.Value +
                                QRLaudoVistoriaQT_OUTRAS_ESPECIES_E.Value + QRLaudoVistoriaQT_OUTRAS_ESPECIES_F.Value);

    QRLNocTolerada.Caption := IntToStr(QRLaudoVistoriaQT_NOCIVAS_TOLERADAS_A.Value + QRLaudoVistoriaQT_NOCIVAS_TOLERADAS_B.Value +
                              QRLaudoVistoriaQT_NOCIVAS_TOLERADAS_C.Value + QRLaudoVistoriaQT_NOCIVAS_TOLERADAS_D.Value +
                              QRLaudoVistoriaQT_NOCIVAS_TOLERADAS_E.Value + QRLaudoVistoriaQT_NOCIVAS_TOLERADAS_F.Value);

    QRLAtipica.Caption := IntToStr(QRLaudoVistoriaQT_PLANTA_ATIPICA_A.Value + QRLaudoVistoriaQT_PLANTA_ATIPICA_B.Value +
                          QRLaudoVistoriaQT_PLANTA_ATIPICA_C.Value + QRLaudoVistoriaQT_PLANTA_ATIPICA_D.Value +
                          QRLaudoVistoriaQT_PLANTA_ATIPICA_E.Value + QRLaudoVistoriaQT_PLANTA_ATIPICA_F.Value);

  end;
end;

procedure TFRLaudoVistoria.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLDtEmissao.Caption := FormatDateTime(', dd "de" MMMM "de" yyyy.',DMLaudo.QRLaudoVistoriaDT_EMISSAO.Value);   
end;

end.
