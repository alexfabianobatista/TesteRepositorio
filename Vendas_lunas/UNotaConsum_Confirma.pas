unit UNotaConsum_Confirma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, Db, DBTables, variants, maskutils;

type
  TFNotaConsum_Confirma = class(TForm)
    PCConfirma: TPageControl;
    BtAvancar: TBitBtn;
    BtCancelar: TBitBtn;
    TsConfirma: TTabSheet;
    RGTipoPgto: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdVenda: TEdit;
    EdRecebido: TEdit;
    EdTroco: TEdit;
    MEValorDesconto: TMaskEdit;
    MEPercDesconto: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    TSContaReceber: TTabSheet;
    GBCPNota: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MEDataCP: TMaskEdit;
    MEValorCP: TMaskEdit;
    BtApagaParcela: TBitBtn;
    LBContaReceber: TListBox;
    MEFinalidade: TMaskEdit;
    BtConsFinalidade: TBitBtn;
    EdFinalidade: TEdit;
    MEDiasCP: TMaskEdit;
    Label10: TLabel;
    Label16: TLabel;
    EdTotalNF: TEdit;
    Label31: TLabel;
    MEDepartamento: TMaskEdit;
    EdDepartamento: TEdit;
    BtConsDepartamento: TBitBtn;
    Label19: TLabel;
    MeBanco: TMaskEdit;
    BtConsBanco: TBitBtn;
    EdBanco: TEdit;
    Label11: TLabel;
    BtConsCadastro: TBitBtn;
    MeCadastro: TMaskEdit;
    EdCadastro: TEdit;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    EdDolar: TEdit;
    EdPesos: TEdit;
    EdGuarani: TEdit;
    Label15: TLabel;
    MeEntrada: TMaskEdit;
    Label23: TLabel;
    MePrazo: TMaskEdit;
    BtPrazo: TBitBtn;
    MeContaCorrente: TMaskEdit;
    Label25: TLabel;
    Label18: TLabel;
    MeContaCorrente_Cheque: TMaskEdit;
    Label20: TLabel;
    MeDepartamento_Cheque: TMaskEdit;
    MeHistorico: TMaskEdit;
    Label26: TLabel;
    Label27: TLabel;
    MeNrCheque: TMaskEdit;
    BtConsContaCorrente: TBitBtn;
    BtDepartamento: TBitBtn;
    BtConsHistorico: TBitBtn;
    Label28: TLabel;
    MeValorCheque: TMaskEdit;
    MeDtCheque: TMaskEdit;
    Label29: TLabel;
    Label30: TLabel;
    MeObservacao: TMaskEdit;
    MeObservacao1: TMaskEdit;
    BtInsertContaCorrente: TBitBtn;
    BtExcluiContaCorrente: TBitBtn;
    LbCheques: TListBox;
    Label21: TLabel;
    MeVendedor: TMaskEdit;
    procedure EdRecebidoExit(Sender: TObject);
    procedure MEPercDescontoExit(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtAvancarClick(Sender: TObject);
    procedure MEDiasCPExit(Sender: TObject);
    procedure MEValorCPExit(Sender: TObject);
    procedure BtConsFinalidadeClick(Sender: TObject);
    procedure BtApagaParcelaClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtConsDepartamentoClick(Sender: TObject);
    procedure BtConsBancoClick(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtPrazoClick(Sender: TObject);
    procedure MePrazoExit(Sender: TObject);
    procedure MeContaCorrenteExit(Sender: TObject);
    procedure BtConsContaCorrenteClick(Sender: TObject);
    procedure BtDepartamentoClick(Sender: TObject);
    procedure BtConsHistoricoClick(Sender: TObject);
    procedure BtInsertContaCorrenteClick(Sender: TObject);
    procedure BtExcluiContaCorrenteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MEFinalidadeChange(Sender: TObject);
    procedure MeCadastroChange(Sender: TObject);
    procedure MEDepartamentoChange(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure Finaliza;
    { Public declarations }
  end;

var
  FNotaConsum_Confirma: TFNotaConsum_Confirma;

implementation

uses UNotaSaida_cl, UParamSistema_cl,UBiblioteca, UOracle_cl, USerie_cl,
  UNotaEntrada_cl, UOperacao_cl, URBloqueto, UNotaSaidaCad, UFinalidadeCons,
  UFinalidade_cl, UDepartamentoCons, UDepartamento_cl, UCadastro_cl,
  UBancosCons, UBancoAgencia_cl, UCadastroCons, UUsuario_cl,
  UImpressoraFiscal, UNotaConsumidor, UNotaComprovanteEntrega,
  UPrazoVencimentoCons, UPrazoVencimento_cl, UContaCorrenteCons, URRecibo,
  UFilial_cl,URecibo_Dos, UFidelidade_cl, UPromissoria, UContasReceber_cl,
  USenha, UHistoricoCons, UHistorico_cl ,
  URContasReceber_Duplicatas_MEDIBENS;

{$R *.DFM}

procedure TFNotaConsum_Confirma.EdRecebidoExit(Sender: TObject);
Var Perc_aplicar, wTotalVenda : Real;
    wVlMoeda : String;
begin
  Perc_Aplicar := 1;
  Case RGTipoPgto.ItemIndex of
    0 : Perc_Aplicar := 1-DMParamSistema.QParamSistemaPerc_Desconto_Vista.Value/100;
    1 : Perc_Aplicar := 1;
    2 : Perc_Aplicar := 1+DMParamSistema.QParamSistemaPerc_Acrescimo_Mes.Value/100;
  End;
  wTotalVenda := DMNotaSaida.QSomaItemNotaSVal_Total_Nota.Value*Perc_Aplicar;
  If Trim(MEValorDesconto.Text) <> '' then
    wTotalVenda := wTotalVenda - StrToFloat(MEValorDesconto.Text);
  wVlMoeda := DMOracle.BuscaNome('SELECT VLR_COTACAO FROM TB_COTACAO','COD_MOEDA = 2  AND  DT_COTACAO='+CHR(39)+DMNotaSaida.QNotaSaidaDt_Emissao.Text+CHR(39));
  EdDolar.Text := '';
  If (Trim(wVlMoeda) <> '') And (Trim(wVlMoeda) <> '0') then   // Dólar
     EdDolar.Text := FormatFloat('###,###,##0.00',wTotalVenda / StrToFloat(wVlMoeda));
  wVlMoeda := DMOracle.BuscaNome('SELECT VLR_COTACAO FROM TB_COTACAO','COD_MOEDA = 3  AND  DT_COTACAO='+CHR(39)+DMNotaSaida.QNotaSaidaDt_Emissao.Text+CHR(39));
  EdPesos.Text := '';
  If (Trim(wVlMoeda) <> '') And (Trim(wVlMoeda) <> '0') then   // Pesos
     EdPesos.Text := FormatFloat('###,###,##0.00',wTotalVenda / StrToFloat(wVlMoeda));
  wVlMoeda := DMOracle.BuscaNome('SELECT VLR_COTACAO FROM TB_COTACAO','COD_MOEDA = 4  AND  DT_COTACAO='+CHR(39)+DMNotaSaida.QNotaSaidaDt_Emissao.Text+CHR(39));
  EdGuarani.Text := '';
  If (Trim(wVlMoeda) <> '') And (Trim(wVlMoeda) <> '0') then   // Guarani
     EdGuarani.Text := FormatFloat('###,###,##0.00',wTotalVenda * StrToFloat(wVlMoeda));

  EdVenda.Text := FormatFloat('###,###,##0.00',wTotalVenda);
  EdTroco.Text := FormatFloat('###,###,##0.00', StrToFloat(Bib.LimpaString(EdRecebido.Text,'.'))-wTotalVenda);
  If DMParamSistema.QparamSistemaCod_Empresa.Value = 'MINIMART' Then
     BtAvancar.SetFocus;
end;

procedure TFNotaConsum_Confirma.MEPercDescontoExit(Sender: TObject);
begin
  If Trim(MEPercDesconto.Text) <> '' then
  Begin
    MEValorDesconto.Text := FloatToStr( DMNotaSaida.QSomaItemNotaSVal_Total_Nota.Value
                                        *StrToFloat(MEPercDesconto.Text)/100  );
    MEPercDesconto.Text := '';
  End;
  EdRecebidoExit(Self);
end;

procedure TFNotaConsum_Confirma.FormDeactivate(Sender: TObject);
Var wQtdePagina : Integer;
begin
  For wQtdePagina := 0 to PCConfirma.PageCount-1 do
  Begin
    PCConfirma.Pages[wQtdePagina].TabVisible := False;
  End;
end;

procedure TFNotaConsum_Confirma.FormActivate(Sender: TObject);
begin
  With DMNotaSaida do
  Begin
    If QSomaItemNotaCod_Nota_Cab.Value <> QNotaSaidaCod_Nota_Cab.Value Then
    Begin
      QSomaItemNota.Close;
      QSomaItemNota.SetVariable('COD_NOTA_CAB',QNotaSaidaCod_Nota_Cab.Value);
      QSomaItemNota.Open;
    End;
  End;
  If DMParamSistema.QparamSistemaCod_Empresa.Value <> 'ARISTIDES' Then
   Begin
    LBContaReceber.Items.Clear;
    LBCheques.Items.Clear;
    MeContaCorrente_Cheque.Clear;
    MeDepartamento_Cheque.Clear;
    MeHistorico.Clear;
    MeNrCheque.Clear;
    MeValorCheque.Clear;
    MeDtCheque.Clear;
    MeObservacao.Clear;
    MeObservacao1.Clear;
  //  MEValorDesconto.Text :='0';
  //  MeEntrada.Text :='0';
    EdRecebido.Text := '0';
    RGTipoPgto.ItemIndex := 1;
    EdRecebidoExit(Self);
    PCConfirma.Pages[0].TabVisible := True;
    If DMParamSistema.QparamSistemaCod_Empresa.Value = 'MINIMART' Then
       FNotaConsum_Confirma.EdRecebido.SetFocus;
   End
  Else
   Begin
     BtApagaParcela.Visible := false;
     Label9.Visible := false;
     MEDiasCP.Visible := false;
     Label23.Visible := false;
     MePrazo.Visible := false;
     BtPrazo.Visible := false;
     Label6.Visible := false;
     MEDataCP.Visible := false;
     Label7.Visible := false;
     MEValorCP.Visible := false;
     MeCadastro.Enabled := False;
     BtConsCadastro.Enabled := False;
     MeFinalidade.Enabled := False;
     BtConsFinalidade.Enabled := False;
     MeDepartamento.Enabled := False;
     BtConsDepartamento.Enabled := False;
   End;

end;

Procedure TFNotaConsum_Confirma.Finaliza;
Var wDescontoAcrescimo,wTotal_Desconto,wEntrada : Real;
    wNome_Recibo : String;
    x, y: array of string;
begin
  If StrToFloat(MEValorDesconto.Text) > DMNotaSaida.QSomaItemNotaSVal_Total_Nota.Value Then
     Raise Exception.Create('Valor de Desconto maior que o valor da nota!');

  wTotal_Desconto := 0;  // INICIALIZA VALOR DA VARIAVEL - Robson 26/06/2000
  wDescontoAcrescimo := DMNotaSaida.QSomaItemNotaSVal_Total_Nota.Value - StrToFloat(Bib.LimpaString(EdVenda.Text,'.'));
  wEntrada := StrToFloat(Bib.LimpaString(MeEntrada.Text,'.'));
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' then
    wEntrada := DMNotaSaida.QNotaSaidaVal_AVista.Value;
  Try
    With DMNotaSaida do
    Begin
      QItemNF.AutoCalcFields       := False;
      QSomaItemNota.AutoCalcFields := False;
      QNotaSaida.AutoCalcFields    := False;

      QItemNF.DisableControls;
      Try
        QNotaSaida.Edit;
        If QNotaSaidaNum_Nota.Value = 0 then
           QNotaSaidaNum_Nota.Value := DMSerie.NumeroSerie(QNotaSaidaCod_Filial.Value, QNotaSaidaCod_Serie.Value);
        If wDescontoAcrescimo > 0 then
           QNotaSaidaVal_Desconto.Value := wDescontoAcrescimo
        Else
          If wDescontoAcrescimo < -0.01 Then
             QNotaSaidaVal_Despesas.Value := Abs(wDescontoAcrescimo);
        If wEntrada > 0 then
         Begin
           QNotaSaidaVal_AVista.Value := wEntrada;
           AtuCaixa(QNotaSaidaVal_AVista.Value, 'ENTRADA');
         End;
        QSomaItemNota.close;
        QSomaItemNota.Open;
        If DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '1' then // A Vista
           DMNotaSaida.AtuCaixa(QSomaItemNotaSVal_Total_Nota.Value, 'A VISTA');  // - wDescontoAcrescimo retirado pelo cesar esta no query QSOMAITEMNOTA
        If (DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '2')  or    // A Prazo
           (DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '4')  then // Cartão de Crédito
        Begin
           DMNotaSaida.PCadastro := StrToInt(Trim(MECadastro.Text));
           DMNotaSaida.GeraContaReceber(LBContaReceber.Items, StrToInt(MEFinalidade.Text), MEBanco.Text,MEDepartamento.Text,Trim(MeContaCorrente.Text));
           DMNotaSaida.PCadastro := 0;
        End;
        QNotaSaidaInd_Situacao.Value := '2';
  //      DMNotaSaida.Contabiliza;   // RETIRADO PELO CÉSAR PARA PERFORMANCE
          DMNotaSaida.AtualizaEstoque(-1);
  //      DMNotaSaida.AtuPedido(1);  // RETIRADO PELO CÉSAR PARA PERFORMANCE
  //      Else
  //       Begin
            QItemNF.First;
            While not QItemNF.Eof do
            Begin
              QItemNF.Edit;
  //            CalculaItem;
              CalculaICM;
              QItemNF.Post;
              wTotal_Desconto := wTotal_Desconto + trunc(QItemNFVal_Desconto.Value * 100) / 100;
              //wTotal_Desconto := wTotal_Desconto + strtofloat(formatFloat('#,##0.00', QItemNFVal_Desconto.Value));
              QItemNF.Next;
            End;
  //         End;           //  fim
          // esta rotina é apenas para acertar a diferença que pode ser causada no rateio do desconto
          if wTotal_Desconto  <> QNotaSaidaVal_Desconto.Value  Then
          Begin
            QItemNF.First;
            QItemNF.Edit;

            wTotal_Desconto           := QNotaSaidaVal_Desconto.Value - wTotal_Desconto;
            //wTotal_Desconto           := strtofloat(formatFloat('#,##0.00', QItemNFVal_Desconto.Value + wTotal_Desconto));
            wTotal_Desconto           := trunc(QItemNFVal_Desconto.Value * 100) / 100 + wTotal_Desconto;
            QItemNFVal_Desconto.Value := wTotal_Desconto;

            QItemNF.Post;
          End;
// vai gerar o movimento bancario dos cheques lançados
        DMBancoAgencia.GeraMovBancario(LBCheques.Items, QNotaSaidaCod_Nota_Cab.Value,QNotaSaidaNum_Nota.Value,QNotaSaidaCod_Cadastro.Value,QNotaSaidaCod_Vendedor.Value,QNotaSaidaCod_Serie.Value);
        QItemNF.AutoCalcFields       := True;
        QSomaItemNota.AutoCalcFields := True;
        QNotaSaida.AutoCalcFields    := True;
        QItemNF.EnableControls;
        DMNotaSaida.QNotaSaida.Post;
        DMOracle.DBCemapa.Commit;

        with DMOperacao do
        begin
          QOperacao.Close;
          QOperacao.SetVariable('PK',FNotaConsumidor.DBEdit6.Text);
          QOperacao.open;
        end;

        if DMOperacao.QOperacaoInd_Cupom_Fiscal.Value = 'S' Then
         begin
          if FImpressoraFiscal = nil Then
             FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
          FimpressoraFiscal.EmiteCF_Yanco(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
         end
        else
           FNotaSaidaCad.Emisso1Click(Self);

        If (QNotaSaidaVal_AVista.Value > 0) And
           (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES') then
        begin
          wNome_Recibo := DMOracle.BuscaNome('SELECT NOME FROM TB_NOME_NOTA','COD_NOTA_CAB = '+FloatToStr(QNotaSaidaCod_Nota_Cab.Value));
          If Trim(wNome_Recibo) = '' Then
             wNome_Recibo := DMCadastro.QCadastroNome.Value;
          FRecibo_Dos.EmiteRecibo_DOS(wNome_Recibo, 'ENTRADA', QNotaSaidaDt_Emissao.Value,QNotaSaidaDt_Emissao.Value,QNotaSaidaVal_AVista.Value,0,0,0,'');
        End;
        If (DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value <> '1') and
           (DMOperacao.QOperacaoInd_Duplicata.Value = 'S') Then
        begin
          with DMContasReceber do
          begin
            QRContasReceber_Duplicatas.Close;
            QRContasReceber_Duplicatas.SetVariable('COD_NOTA_CAB',DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
            QRContasReceber_Duplicatas.SetVariable('COD_FILIAL',DMNotaSaida.QNotaSaidaCod_Filial.Value);
            QRContasReceber_Duplicatas.SetVariable('COD_DEPARTAMENTO',Null);
            QRContasReceber_Duplicatas.SetVariable('COD_CONTA_RECEBER_CAB',Null);
            QRContasReceber_Duplicatas.Open;
          end;
          if DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'FORTE' then
            if MessageDlg('Emitir Duplicata?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
             Begin
               if FRContasReceberDuplicatas_MEDIBENS=nil then
                  FRContasReceberDuplicatas_MEDIBENS:=TFRContasReceberDuplicatas_MEDIBENS.Create(Application);
               setLength(x, 8); //8 sql diferentes
               setLength(y, 8);
               x[0] := 'SELECT DESC_FILIAL FROM TB_FILIAL WHERE COD_FILIAL= '+DMNotaSaida.QNotaSaidaCod_Filial.Text;
               x[1] := 'SELECT DESC_ENDERECO FROM TB_FILIAL WHERE COD_FILIAL= '+DMNotaSaida.QNotaSaidaCod_Filial.Text;
               x[2] := 'SELECT DESC_CIDADE FROM TB_FILIAL WHERE COD_FILIAL= '+DMNotaSaida.QNotaSaidaCod_Filial.Text;
               x[3] := 'SELECT NUM_CGC FROM TB_FILIAL WHERE COD_FILIAL= '+DMNotaSaida.QNotaSaidaCod_Filial.Text;
               x[4] := 'SELECT DESC_INSCRICAO FROM TB_FILIAL WHERE COD_FILIAL= '+DMNotaSaida.QNotaSaidaCod_Filial.Text;
               x[5] := 'SELECT COD_ESTADO FROM TB_FILIAL WHERE COD_FILIAL= '+DMNotaSaida.QNotaSaidaCod_Filial.Text;
               x[6] := 'SELECT DESC_CEP FROM TB_FILIAL WHERE COD_FILIAL= '+DMNotaSaida.QNotaSaidaCod_Filial.Text;
               x[7] := 'SELECT DESC_TELEFONE FROM TB_FILIAL WHERE COD_FILIAL= '+DMNotaSaida.QNotaSaidaCod_Filial.Text;
               DMOracle.BuscaNomes(x, y);
               FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa.caption := Y[0];
               FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa2.caption:= Y[0];
               FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa3.caption := Y[0];
               FRContasReceberDuplicatas_MEDIBENS.QRLEndereco.caption:= Y[1];
               FRContasReceberDuplicatas_MEDIBENS.QRLCidade.caption:= Y[2];
               FRContasReceberDuplicatas_MEDIBENS.QRLCGC.caption:= Y[3];
               FRContasReceberDuplicatas_MEDIBENS.QRLInscricao.caption:= Y[4];
               FRContasReceberDuplicatas_MEDIBENS.QRLEstado.caption:= Y[5];
               FRContasReceberDuplicatas_MEDIBENS.QRLCEP.caption:= Y[6];
               FRContasReceberDuplicatas_MEDIBENS.QRLfone.caption:= Y[7];
               FRContasReceberDuplicatas_MEDIBENS.QRPrimario.Preview
             end;
          if DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'COZER' then
            if MessageDlg('Emitir Nota Promissória?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              FPromissoria.Promissoria_Dos;
        End;
      except
        if QNotaSaida.State in [dsEdit,dsInsert] Then
           QNotaSaida.Cancel;  // RollBack
        raise;
      end;
    end;
  except
    DmNotaSaida.QItemNF.AutoCalcFields       := True;
    DmNotaSaida.QSomaItemNota.AutoCalcFields := True;
    DmNotaSaida.QNotaSaida.AutoCalcFields    := True;
    DmNotaSaida.QItemNF.EnableControls;
    Raise;
  End;
  ModalResult := mrOk;
End;

procedure TFNotaConsum_Confirma.BtAvancarClick(Sender: TObject);
Var wMes,wAno,wDia : Word;
begin
  If ((DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '2') or
     ( DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '4')) and
     (PCConfirma.ActivePage <> TSContaReceber) then
  Begin
    MeCadastro.Text := FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value);
    EdTotalNF.Text := FloatToStr(StrToFloat(Bib.LimpaString(EdVenda.Text,'.')) - StrToFloat(Bib.LimpaString(MeEntrada.Text,'.')));
    PCConfirma.Pages[0].TabVisible := False;
    PCConfirma.Pages[1].TabVisible := True;
    StrToFloat(Bib.LimpaString(EdRecebido.Text,'.'));
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'COZER' Then
    Begin
      MeDepartamento.Text := '1';
      MeFinalidade.Text := '4';
    End;
    If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'DINIZ') Or
       (DMParamSistema.QParamSistemaCod_Empresa.Value = 'NIR') Then
    Begin
      MeDepartamento.Text := '1';
      MeFinalidade.Text := '1';
    End;

    MeContaCorrenteExit(sender);

    If DMCadastro.QCadastroNum_Dia_Vencto.Text <> '' Then  // esta rotina é quando foi colocado um dia para vencimento
     Begin                                                 // das contas do cliente no cadastro
       DecodeDate(Date, wAno, wMes, wDia);                 // o sistema gera automaticamente para o proximo mes o C.R.
       Inc(wMes);
       If wMes > 12 Then
       Begin
         wMes := 1;
         Inc(wAno);
       End;
       If DMOracle.DiasNoMes(StrToDate('01/'+IntToStr(wMes)+'/'+IntToStr(wAno))) < DMCadastro.QCadastroNum_Dia_Vencto.Value Then  // isto serve para o caso de informar 31 e o mes so tem 30 dias
          wDia := DMOracle.DiasNoMes(StrToDate('01/'+IntToStr(wMes)+'/'+IntToStr(wAno)))
       Else
          wDia := DMCadastro.QCadastroNum_Dia_Vencto.Value;
       MEDataCP.Text := IntToStr(wDia)+'/'+IntToStr(wMes)+'/'+IntToStr(wAno);
       MeValorCp.Text := EdTotalNF.Text;
       MEValorCPExit(Self);
     End;
  End
  Else
    Finaliza;
end;

procedure TFNotaConsum_Confirma.MEDiasCPExit(Sender: TObject);
begin
  If Trim(MEDiasCP.Text) <> '' then
  Begin
    MEDataCP.Text := DateToStr(DMNotaSaida.QNotaSaidaDt_Emissao.Value+StrToFloat(MEDiasCP.Text));
    MEDiasCP.Text := '';
  End;
End;

procedure TFNotaConsum_Confirma.MEValorCPExit(Sender: TObject);
Var wLinha, wAux : String;
Const wBranco : String = '                            ';
begin
  If (MEDataCP.Text <> '') and
     (MEValorCP.Text <> '') then
  Begin
    If StrToDate(MEDataCp.Text) < Date Then
       Raise Exception.Create('Data de Vencimento Menor que Data Atual!');
    
    wLinha := DateToStr(StrToDate(MEDataCP.Text));
    wAux   := FormatFloat('###,###,##0.00', StrToFloat(MEValorCP.Text));
    wAux   := Copy(wBranco,1,15-Length(waux)) + wAux;
    wLinha := wLinha + wAux;

    LBContaReceber.Items.Add(wLinha);

    MEDataCP.Text  := '';
    MEValorCP.Text := '';

    if MEDiasCP.visible then
      MEDiasCP.SetFocus;
  End;

end;

procedure TFNotaConsum_Confirma.BtConsFinalidadeClick(Sender: TObject);
begin
  If FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.showModal = mrOk then
    MEFinalidade.Text := DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
end;

procedure TFNotaConsum_Confirma.BtApagaParcelaClick(Sender: TObject);
begin
  LBContaReceber.Items.Delete(LBContaReceber.ItemIndex);
end;

procedure TFNotaConsum_Confirma.BtCancelarClick(Sender: TObject);
begin
  If DMNotaSaida.QNotaSaida.State <> dsBrowse then
    DMNotaSaida.QNotaSaida.Cancel;
  If DMOracle.DBCemapa.InTransaction then
  Begin
    DMOracle.DBCemapa.RollBack;
    DMNotaSaida.QNotaSaida.Close;
    DMNotaSaida.QNotaSaida.Open;
  End;
end;

procedure TFNotaConsum_Confirma.BtConsDepartamentoClick(Sender: TObject);
begin
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
    MEDepartamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
end;

procedure TFNotaConsum_Confirma.BtConsBancoClick(Sender: TObject);
begin
  If FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  If FContaCorrenteCons.showModal = mrOk then
  Begin
    MeBanco.Text := DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Text;
    MeContaCorrente.Text := DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Text;
    MeContaCorrenteExit(Self);
  End;

end;

procedure TFNotaConsum_Confirma.BtConsCadastroClick(Sender: TObject);
begin
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.showModal = mrOk then
    MECadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
End;

procedure TFNotaConsum_Confirma.BtPrazoClick(Sender: TObject);
begin
  If FPrazoVencimentoCons = Nil then
    FPrazoVencimentoCons := TFPrazoVencimentoCons.Create(Application);
  If FPrazoVencimentoCons.showModal = mrOk then
  Begin
    MePrazo.Text := DMPrazoVencimento.QPrazoVencimento_ConsCod_Prazo_Vencimento.Text;
    MePrazoExit(Self);
  End;
End;

procedure TFNotaConsum_Confirma.MePrazoExit(Sender: TObject);
Var wLinha, wAux, wParc : String;
    wParcela,wSoma,wDiferenca : Real;
    wCont : Integer;
Const wBranco : String = '                            ';
begin
  If Trim(MePrazo.Text) <> '' Then
   Begin
    wParc := DMOracle.BuscaNome('SELECT NUM_PARCELAS FROM TB_PRAZO_VENCIMENTO','COD_PRAZO_VENCIMENTO = '+Trim(MePrazo.Text));
    If wParc = '' Then
       Raise Exception.Create('Código de parcelas inexistente');
    DMPrazoVencimento.QPrazoVencimentoDias.Close;
    DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('COD_PRAZO_VENCIMENTO',Trim(MePrazo.Text));
    DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('NUM_DIAS',Null);
    DMPrazoVencimento.QPrazoVencimentoDias.Open;
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' Then
      wParcela := Trunc(StrToFloat(EdTotalNF.Text) / StrToFloat(wParc) + 0.50)
    Else
      wParcela := Trunc(StrToFloat(EdTotalNF.Text) / StrToFloat(wParc) * 100) / 100;
    wCont := 0;
    wSoma := 0;
    While Not (DMPrazoVencimento.QPrazoVencimentoDias.Eof) Do
     Begin
       Inc(wCont);
       wSoma := wSoma + wParcela;
       if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
       begin
         //aplica a diferenca na primeira parcela
         If wCont = 1 Then
         Begin
           wDiferenca := StrToFloat(EdTotalNF.Text) - wParcela * strtoint(wParc);
           wParcela := wParcela + wDiferenca;
         End;
       end
       else
       begin
         //aplica a diferenca na ultima parcela
         If wCont = StrToInt(wParc) Then
         Begin
           wDiferenca := StrToFloat(EdTotalNF.Text) - wSoma;
           wParcela := wParcela + wDiferenca;
         End;
       end;
       wLinha := DateToStr(DMNotaSaida.QNotaSaidaDt_Emissao.Value + DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value);
       wAux := FormatFloat('###,###,##0.00',wParcela);
       wAux := Copy(wBranco, 1, 15 - Length(waux)) + wAux;
       wLinha := wLinha + wAux;
       LBContaReceber.Items.Add(wLinha);

       //desconta o valor da difenrenca pra nao ter problema nas demais parcelas - somente para a aristides, que deve ter a primeira parcela com o valor diferente.
       if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
         If wCont = 1 Then
           wParcela := wParcela - wDiferenca;

       DMPrazoVencimento.QPrazoVencimentoDias.Next;
     End;
    MEDataCP.Text := '';
    MEValorCP.Text := '';
    If DMParamSistema.QParamSistemaCod_Empresa .Value <> 'ARISTIDES' Then
    Begin
      if MeDiasCP.visible then
        MeDiasCP.SetFocus;
      MePrazo.Text := '';
      BtAvancarClick(Self);
    End;
  End;
end;

procedure TFNotaConsum_Confirma.MeContaCorrenteExit(Sender: TObject);
begin
  If Trim(MeContaCorrente.Text) <> '' Then
   Begin
    MeBanco.Text := DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+Trim(MeContaCorrente.Text));
    EdBanco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MEBanco.Text);
   End
  Else
    EdBanco.Text := '';
end;

procedure TFNotaConsum_Confirma.BtConsContaCorrenteClick(Sender: TObject);
begin
  If FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  If FContaCorrenteCons.showModal = mrOk then
    MeContaCorrente_Cheque.Text := DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Text;

end;

procedure TFNotaConsum_Confirma.BtDepartamentoClick(Sender: TObject);
begin
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
    MEDepartamento_Cheque.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;

end;

procedure TFNotaConsum_Confirma.BtConsHistoricoClick(Sender: TObject);
begin
  If FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  If FHistoricoCons.showModal = mrOk then
    MEHistorico.Text := DMHistorico.QHistoricoConsCod_Historico.Text;

end;

procedure TFNotaConsum_Confirma.BtInsertContaCorrenteClick(
  Sender: TObject);
Var wLinha, wAux : String;
Const wBranco : String = '                            ';
begin
  If StrToDate(MeDtCheque.Text) < Date Then
     Raise Exception.Create('Data do Cheque Menor que Data Atual!');
  wLinha := FormatMaskText('CCCCCC',Trim(MeContaCorrente_Cheque.Text)) + ' - ';
  wLinha := wLinha + FormatMaskText('CCCCCC',Trim(MeDepartamento_Cheque.Text)) + ' - ';
  wLinha := wLinha + FormatMaskText('CCCCCC',Trim(MeHistorico.Text)) + ' - ';
  wLinha := wLinha + FormatMaskText('CCCCCC',Trim(MeNrCheque.Text)) + ' - ';
  wAux := FormatFloat('###,###,##0.00',StrToFloat(MeValorCheque.Text)) + ' - ';
  wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
  wLinha := wLinha + wAux;
  wLinha := wLinha + DateToStr( StrToDate(MeDtCheque.Text) )+ ' - ';
  wLinha := wLinha + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',MeObservacao.Text)+ ' - ';
  wLinha := wLinha + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',MeObservacao1.Text);
  LbCheques.Items.Add(wLinha);

end;

procedure TFNotaConsum_Confirma.BtExcluiContaCorrenteClick(
  Sender: TObject);
begin
  LBCheques.Items.Delete(LBCheques.ItemIndex);

end;

procedure TFNotaConsum_Confirma.FormCreate(Sender: TObject);
begin
  If DmParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' Then
    self.Top := 0;
end;

procedure TFNotaConsum_Confirma.MEFinalidadeChange(Sender: TObject);
begin
  If Trim(MEFinalidade.Text) <> '' Then
    EdFinalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = ' + MEFinalidade.Text);

end;

procedure TFNotaConsum_Confirma.MeCadastroChange(Sender: TObject);
begin
  If Trim(MECadastro.Text) <> '' Then
    EdCadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECadastro.Text);

end;

procedure TFNotaConsum_Confirma.MEDepartamentoChange(Sender: TObject);
begin
  If Trim(MEDepartamento.Text) <> '' Then
    EdDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MEDepartamento.Text)
  Else
    EdDepartamento.Text := '';
end;

end.






