unit URContasReceber_TitulosAbertos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRContasReceber_TitulosAberto = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand4: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand5: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr2: TQRExpr;
    QRBand6: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr3: TQRExpr;
    QRLPeriodo: TQRLabel;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRBand7: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText10: TQRDBText;
    QRLDepartamento: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText12: TQRDBText;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRChildBand1: TQRChildBand;
    QRDBText13: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText15: TQRDBText;
    QRExpr10: TQRExpr;
    QRLabel6: TQRLabel;
    QRDBText7: TQRDBText;
    QRCompositeReport1: TQRCompositeReport;
    QRLabel5: TQRLabel;
    QRLNome: TQRLabel;
    QRLOutros: TQRLabel;
    QRLEndereco: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText14: TQRDBText;
    QRLPagina: TQRLabel;
    QRDBText16: TQRDBText;
    QRLCidade: TQRLabel;
    QRLabel9: TQRLabel;
    QRSysData3: TQRSysData;
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand6AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand7BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    wPagina : Integer;
  end;

var
  FRContasReceber_TitulosAberto: TFRContasReceber_TitulosAberto;

implementation

uses UContasReceber_cl, URContrato, UParamSistema_cl, DB, UOracle_cl;

{$R *.DFM}

procedure TFRContasReceber_TitulosAberto.QRBand3AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  wAux: String;
begin
  inherited;
  {
    Gian 15/10/2018 somente para Vetro, solicitado por Marcos
    Trazer Complemento da observação da nota.
    (não tem problema buscar pelo numero da nota no caso da Vetro)
    Nova alteração 23/10/2018 somente para Vetro
    Mostrar primeiro a OBS do titulo, caso não exista trazer da observação da nota,
  }
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'VETRO' then
  begin
    If Trim(DMContasReceber.QRContasReceber_TitulosAbertoDesc_Observacao.Text) = '' Then
    begin
      wAux := DMOracle.BuscaNome('SELECT OBS_COMPLEMENTO FROM TB_NOTA_CAB','NUM_NOTA = '+DMContasReceber.QRContasReceber_TitulosAbertoNUM_TITULO.Text);
      if wAux <> '' then
      begin
        QRChildBand1.Enabled := True;
        DMContasReceber.QRContasReceber_TitulosAbertoDESC_OBSERVACAO.Text := wAux;
      end
      else
      begin
         QRChildBand1.Enabled := False;
        DMContasReceber.QRContasReceber_TitulosAbertoDESC_OBSERVACAO.Text := '';
      end;
    end
    else
    begin
      QRChildBand1.Enabled := True
    end;
  end
  else
  begin
    If Trim(DMContasReceber.QRContasReceber_TitulosAbertoDesc_Observacao.Text) <> '' Then
       QRChildBand1.Enabled := True
    Else
       QRChildBand1.Enabled := False;
  end;


  // Adicionado por Djeison em 12/09/2012
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TRENTO' then
    QRChildBand1.Enabled := false;
end;

procedure TFRContasReceber_TitulosAberto.QRCompositeReport1AddReports(
  Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FRContasReceber_TitulosAberto.QRPrimario);
  QRCompositeReport1.Reports.Add(FRContrato.QRPrimario);

end;

procedure TFRContasReceber_TitulosAberto.QRGroup2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  With DMContasReceber Do
  Begin
    QRLEndereco.Caption := QRContasReceber_TitulosAbertoDesc_Endereco.Value + ' - ' +
                           QRContasReceber_TitulosAbertoDesc_Cidade.Value + '-' +
                           QRContasReceber_TitulosAbertoDesc_Bairro.Value + '-' +
                           QRContasReceber_TitulosAbertoCod_Estado.Value + '-' +
                           QRContasReceber_TitulosAbertoDesc_Cep.Value + ' - ' +
                           QRContasReceber_TitulosAbertoNum_Cgc_Cpf.Value + ' - ' +
                           QRContasReceber_TitulosAbertoNUM_INSCRICAO.Value + ' - '+
                           QRContasReceber_TitulosAbertoDT_NASCIMENTO.AsString;
    QRLNome.Caption := QRContasReceber_TitulosAbertoNome.Value + ' - ' +
                       QRContasReceber_TitulosAbertoDESC_TELEFONE.Value + ' - ' +
                       QRContasReceber_TitulosAbertoDESC_CELULAR.Value;
     If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' Then
       QRLNome.Caption := QRLNome.Caption + ' - ' + QRContasReceber_TitulosAbertoDesc_Fone_Empresa.Value
     Else
     begin
       if DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' Then
         QRLNome.Caption := QRLNome.Caption + ' - ' +
                            QRContasReceber_TitulosAbertoNOME_VENDEDOR.Value
       else
       begin
         // Solicitação Código suporte: 2561
          if DMParamSistema.QParamSistemaCod_Empresa.Value = 'VETRO' Then
            QRLNome.Caption := QRLNome.Caption + ' - ' +
                            QRContasReceber_TitulosAbertoNOME_VENDEDOR.Value
          else
            QRLNome.Caption := QRLNome.Caption + ' - ' +
                            QRContasReceber_TitulosAbertoDESC_CLASSIFICACAO.Value + ' - ' +
                            QRContasReceber_TitulosAbertoNOME_VENDEDOR.Value;
       end;
     end;
  end;
  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'RUDI') or
     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ABATE') or
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINGLIS') then
    FRContasReceber_TitulosAberto.QrGroup2.Height := 35
  else
  Begin
    FRContasReceber_TitulosAberto.QrGroup2.Height := 19;
    QRLEndereco.Enabled := False;
  end;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
  begin
    //Por Gian 16/11/2018 a pedido deles, precisam da borda, ligou varias vezes pra Vanessa
    QRGroup2.Frame.DrawTop := True;
  end;
end;

procedure TFRContasReceber_TitulosAberto.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO' then
  Begin
    QRDBText14.Enabled := True;
    QRDBText14.Width := 60;
    QRDBText5.Enabled := False;
  end;
  
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DALLMOVEIS' then
  Begin
    QRDBText15.Enabled := False;
    QRDBText16.Enabled := True;
    QRDBText16.Top := 0;
  end;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
  begin
    //Por Gian 16/11/2018 a pedido deles, estavam reclamando por aparecer esta coluna, ligou varias vezes pra Vanessa
    QRDBText7.Enabled := False;
  end;
end;

procedure TFRContasReceber_TitulosAberto.QRBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  // Comentado por Gian 19/11/2018
  //Não faço ideia do por que desabilitaram o controle do numero da pagina do template
  // e fizeram esse controle por variavel, mas não esta funcionando,
  // depois que imprime, fica tudo errado a numeração das paginas
  //QRLPagina.Caption := IntToStr(wPagina);
end;

procedure TFRContasReceber_TitulosAberto.QRBand1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  // Comentado por Gian 19/11/2018
  //Não faço ideia do por que desabilitaram o controle do numero da pagina do template
  // e fizeram esse controle por variavel, mas não esta funcionando,
  // depois que imprime, fica tudo errado a numeração das paginas
  //Inc(wPagina);
end;

procedure TFRContasReceber_TitulosAberto.QRBand6AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  //Comentado por Gian 16/11/2018 estava zoando o numero da pagina, ficando sempre 1
  //wPagina := DMContasReceber.pNrPagina;
end;

procedure TFRContasReceber_TitulosAberto.QRBand7BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DALLMOVEIS' then
  Begin
    QRLabel4.Caption := 'Vencido';
    QRLabel4.Font.Size := 8;
    QRLabel4.Top := 2;
  end;

end;

procedure TFRContasReceber_TitulosAberto.QRBand6BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  //Gian 16/11/2018 - Não mostrar tais campos a pedido da Andressa da Nani
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
  begin
    QRLabel9.Enabled := False;
    QRSysData3.Enabled := False;
  end;
end;

end.

