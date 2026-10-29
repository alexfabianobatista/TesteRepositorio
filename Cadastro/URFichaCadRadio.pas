unit URFichaCadRadio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, variants, QRWebFilt,
  QRPDFFilt, StdCtrls, jpeg;

type
  TFRFichaCadRadio = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRShape3: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBText33: TQRDBText;
    QRDBText35: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel78: TQRLabel;
    QRDBText36: TQRDBText;
    QRDBText29: TQRDBText;
    QRLabel33: TQRLabel;
    QRShape7: TQRShape;
    QRLabel80: TQRLabel;
    QRDBText70: TQRDBText;
    QRDBText81: TQRDBText;
    QRDBText76: TQRDBText;
    QRLabel82: TQRLabel;
    QRDBText82: TQRDBText;
    QRDBText83: TQRDBText;
    QRDBText84: TQRDBText;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel50: TQRLabel;
    QRDBText44: TQRDBText;
    QRLabel57: TQRLabel;
    QRDBText51: TQRDBText;
    QRLabel55: TQRLabel;
    QRDBText49: TQRDBText;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRDBText56: TQRDBText;
    QRLabel65: TQRLabel;
    QRDBText57: TQRDBText;
    QRLabel53: TQRLabel;
    QRDBText47: TQRDBText;
    QRLabel54: TQRLabel;
    QRDBText48: TQRDBText;
    QRLabel51: TQRLabel;
    QRDBText46: TQRDBText;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRDBText53: TQRDBText;
    QRLabel62: TQRLabel;
    QRDBText55: TQRDBText;
    QRLabel61: TQRLabel;
    QRDBText54: TQRDBText;
    QRShape4: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape6: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape8: TQRShape;
    QRDBText16: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText17: TQRDBText;
    QRBand4: TQRBand;
    QRLabel93: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel81: TQRLabel;
    QRShape5: TQRShape;
    QRLabel89: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText72: TQRDBText;
    QRDBText77: TQRDBText;
    QRDBText69: TQRDBText;
    QRDBText73: TQRDBText;
    QRDBText71: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText21: TQRDBText;
    QRShape1: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel42: TQRLabel;
    QRShape9: TQRShape;
    QRLabel27: TQRLabel;
    QrImagemPropria1: TQRImage;
    QRImagemAluguel1: TQRImage;
    QRImagemAluguel2: TQRImage;
    QRImagemPropria2: TQRImage;
    QRLabel26: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText22: TQRDBText;
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRFichaCadRadio: TFRFichaCadRadio;

implementation

uses UCadastro_Rel_cl, UOracle_cl, UCadastro_cl;

{$R *.DFM}

procedure TFRFichaCadRadio.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  QRLabel29.Caption := 'Paga Aluguel';
  DMCadastro_Rel.QRProprCadastro.Close;
  DMCadastro_Rel.QRProprCadastro.SetVariable('Cod_Cadastro',DMCadastro_Rel.QRCadastroCod_Cadastro.Value);
  DMCadastro_Rel.QRProprCadastro.SetVariable('Regiao',Null);
  DMCadastro_Rel.QRProprCadastro.SetVariable('Tipo_Cadastro',Null);
  DMCadastro_Rel.QRProprCadastro.SetVariable('Ramo',Null);
  DMCadastro_Rel.QRProprCadastro.SetVariable('Estado',Null);
  DMCadastro_Rel.QRProprCadastro.Open;

end;

procedure TFRFichaCadRadio.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  With DmOracle do
  Begin
    Buscador.Limpa;
//    Buscador.Adiciona('DESC_MOTIVO', 'TB_MOTIVO', // Comentado por Djeison
//        'COD_MOTIVO = 0' + DMCadastro.QCadastroCOD_MOTIVO.Text);
    Buscador.Adiciona('DESC_ESTADO_CIVIL', 'TB_ESTADO_CIVIL',
        'COD_ESTADO_CIVIL = 0' + DMCadastro_Rel.QRCadastroCOD_ESTADO_CIVIL.Text);

    { //Retirado para aparecer somente o código da classificacao JUNIOR - 09-AGO_2012
    Buscador.Adiciona('DESC_CLASSIFICACAO', 'TB_CLASS_CADASTRO',
        'COD_CLASS_CADASTRO = 0' + DMCadastro_Rel.QRCadastroCOD_CLASS_CADASTRO.Text)
    }

    Buscador.Adiciona('DESC_ESTADO_CIVIL', 'TB_ESTADO_CIVIL',                              // Adicionadas por Djeison.
        'COD_ESTADO_CIVIL = 0' + DMCadastro_Rel.QRCadastrocod_estado_civil_avalista.Text); //

    { //Retirado para aparecer somente o código da classificacao JUNIOR - 09-AGO_2012
    Buscador.Adiciona('DESC_CLASSIFICACAO', 'TB_CLASS_CADASTRO',
        'COD_CLASS_CADASTRO = 0' + DMCadastro_Rel.QRCadastrocod_class_cadastro_avalista.Text);
     }
    Buscador.Buscar;

     //Removido pq não usa mais esses campos no relatório. Solicitação Marcos. Junior - 13/03/2015.
    //QRLEstadoCivil.Caption := Buscador.Proximo;
    //QRLClassificacao.Caption := Buscador.Proximo; //Retirado para aparecer somente o código da classificacao
    //QRLEstadoCivilAvalista.Caption := Buscador.Proximo;
    //QRLClassificacaoAvalista.Caption := Buscador.Proximo; //Retirado para aparecer somente o código da classificacao

    Buscador.Fecha;

    if DMCadastro_Rel.QRCadastroind_tipo_imovel.Value = 'SIM' then
    begin
      QRImagemPropria2.Enabled := True;
      QRImagemAluguel1.Enabled := True;
      QrImagemPropria1.Enabled := False;
      QRImagemAluguel2.Enabled := False;
    end
    else
     if DMCadastro_Rel.QRCadastroind_tipo_imovel.Value = 'NAO' then
     begin
      QrImagemPropria1.Enabled := True;
      QRImagemAluguel2.Enabled := True;
      QrImagemPropria2.Enabled := False;
      QRImagemAluguel1.Enabled := False;
      if DMCadastro_Rel.QRCadastroval_aluguel.Text <> '' then
        QRLabel29.Caption := 'Paga Aluguel R$ ' + FormatFloat('###,##0.00',StrToFloat(DMCadastro_Rel.QRCadastroval_aluguel.Value));
     end
     else
     begin
      QrImagemPropria1.Enabled := True;
      QRImagemAluguel1.Enabled := True;
      QRImagemPropria2.Enabled := False;
      QRImagemAluguel2.Enabled := False;
     end;
  End;
end;

end.
