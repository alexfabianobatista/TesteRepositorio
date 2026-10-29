unit UNotaConsum_Confirma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, Db, DBTables, variants;

type
  TFNotaConsum_Confirma = class(TForm)
    PCConfirma: TPageControl;
    BtAvancar: TBitBtn;
    BtCancelar: TBitBtn;
    TabSheet1: TTabSheet;
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
    procedure EdRecebidoExit(Sender: TObject);
    procedure MEPercDescontoExit(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtAvancarClick(Sender: TObject);
    procedure MEDiasCPExit(Sender: TObject);
    procedure MEValorCPExit(Sender: TObject);
    procedure BtConsFinalidadeClick(Sender: TObject);
    procedure BtApagaParcelaClick(Sender: TObject);
    procedure MEFinalidadeExit(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure MEDepartamentoExit(Sender: TObject);
    procedure BtConsDepartamentoClick(Sender: TObject);
    procedure MeBancoExit(Sender: TObject);
    procedure BtConsBancoClick(Sender: TObject);
    procedure MeCadastroExit(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtPrazoClick(Sender: TObject);
    procedure MePrazoExit(Sender: TObject);
  private
    { Private declarations }
    Procedure Finaliza;
  public
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
  UPrazoVencimentoCons, UPrazoVencimento_cl ;

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
  LBContaReceber.Items.Clear;
  MEValorDesconto.Text :='0';
  MeEntrada.Text :='0';
  EdRecebido.Text := '0';
  RGTipoPgto.ItemIndex := 1;
  EdRecebidoExit(Self);
  PCConfirma.Pages[0].TabVisible := True;
end;

Procedure TFNotaConsum_Confirma.Finaliza;
Var wDescontoAcrescimo,wTotal_Desconto,wEntrada : Real;
begin
  If StrToFloat(MEValorDesconto.Text) > DMNotaSaida.QSomaItemNotaSVal_Total_Nota.Value Then
     Raise Exception.Create('Valor de Desconto maior que o valor da nota!');
  wTotal_Desconto := 0;  // INICIALIZA VALOR DA VARIAVEL - Robson 26/06/2000
  wDescontoAcrescimo := DMNotaSaida.QSomaItemNotaSVal_Total_Nota.Value
                        -StrToFloat(Bib.LimpaString(EdVenda.Text,'.'));
  wEntrada := StrToFloat(Bib.LimpaString(MeEntrada.Text,'.'));
  Try
    With DMNotaSaida do
    Begin
      QSomaItemNota.close;
      QSomaItemNota.Open;
      QItemNF.AutoCalcFields := False;
      QSomaItemNota.AutoCalcFields := False;
      QNotaSaida.AutoCalcFields := False;
      QItemNF.DisableControls;
      Try
        QNotaSaida.Edit;
        If QNotaSaidaNum_Nota.Value = 0 then
           QNotaSaidaNum_Nota.Value := DMSerie.NumeroSerie(QNotaSaidaCod_Filial.Value,QNotaSaidaCod_Serie.Value,
                                       QNotaSaidaCOD_SERIE_MODELO.Value);
        If wDescontoAcrescimo > 0 then
           QNotaSaidaVal_Desconto.Value := wDescontoAcrescimo
        Else
          If wDescontoAcrescimo < -0.01 Then
             QNotaSaidaVal_Despesas.Value := Abs(wDescontoAcrescimo);
        If wEntrada > 0 then
         Begin
           QNotaSaidaVal_AVista.Value := wEntrada;
           AtuCaixa(QNotaSaidaVal_AVista.Value);
         End;
        If DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '1' then // A Vista
           DMNotaSaida.AtuCaixa(QSomaItemNotaSVal_Total_Nota.Value - wDescontoAcrescimo);
        If (DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '2')  or    // A Prazo
           (DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '4')  then // Cartão de Crédito
        Begin
           DMNotaSaida.PCadastro := StrToInt(Trim(MECadastro.Text));
           DMNotaSaida.GeraContaReceber(LBContaReceber.Items, StrToInt(MEFinalidade.Text), MEBanco.Text,MEDepartamento.Text);
           DMNotaSaida.PCadastro := 0;
        End;
        QNotaSaidaInd_Situacao.Value := '2';

  //      DMNotaSaida.Contabiliza;   // RETIRADO PELO CÉSAR PARA PERFORMANCE
  //      If DMParamSistema.QParamSistemaCod_Empresa .Value <> 'ENCOPEL' Then
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
              wTotal_Desconto := wTotal_Desconto + QItemNFVal_Desconto.Value;
              QItemNF.Next;
            End;
  //         End;           //  fim
          // esta rotina é apenas para acertar a diferença que pode ser causada no rateio do desconto
          if wTotal_Desconto  <> QNotaSaidaVal_Desconto.Value  Then
          Begin
            QItemNF.First;
            QItemNF.Edit;
            wTotal_Desconto := QNotaSaidaVal_Desconto.Value - wTotal_Desconto;
            wTotal_Desconto := QItemNFVal_Desconto.Value + wTotal_Desconto;
            QItemNFVal_Desconto.Value := wTotal_Desconto;
            QItemNF.Post;
          End;
        QItemNF.AutoCalcFields := True;
        QSomaItemNota.AutoCalcFields := True;
        QNotaSaida.AutoCalcFields := True;
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
      except
        if QNotaSaida.State in [dsEdit,dsInsert] Then
           QNotaSaida.Cancel;  // RollBack
        raise;
      end;
    end;
  except
    DmNotaSaida.QItemNF.AutoCalcFields := True;
    DmNotaSaida.QSomaItemNota.AutoCalcFields := True;
    DmNotaSaida.QNotaSaida.AutoCalcFields := True;
    DmNotaSaida.QItemNF.EnableControls;
    Raise;
  End;
  ModalResult := mrOk;
End;

procedure TFNotaConsum_Confirma.BtAvancarClick(Sender: TObject);
begin
  If ((DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '2') or
     ( DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '4')) and
     (PCConfirma.ActivePage <> TSContaReceber) then
  Begin
    MeCadastro.Text := FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value);
    MECadastroExit(Self);
    PCConfirma.Pages[0].TabVisible := False;
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL' Then
     Begin
       MeDepartamento.Text := '3';
       MeFinalidade.Text := '1';
       MeBanco.Text := '1';
     End;
    PCConfirma.Pages[1].TabVisible := True;
    EdTotalNF.Text := FloatToStr(StrToFloat(Bib.LimpaString(EdVenda.Text,'.')) - StrToFloat(Bib.LimpaString(MeEntrada.Text,'.')));
    StrToFloat(Bib.LimpaString(EdRecebido.Text,'.'))
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
end;

procedure TFNotaConsum_Confirma.MEValorCPExit(Sender: TObject);
Var wLinha, wAux : String;
Const wBranco : String = '                            ';
begin
  If (MEDataCP.Text <> '') and
     (MEValorCP.Text <> '') then
  Begin
    If StrToDate(MEDataCp.Text) < Date Then
       Raise Exception.Create('Data de Vencimento Menor que Data Atual!');
    wLinha := DateToStr( StrToDate(MEDataCP.Text) );
    wAux := FormatFloat('###,###,##0.00',StrToFloat(MEValorCP.Text));
    wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
    wLinha := wLinha + wAux;
    LBContaReceber.Items.Add(wLinha);
    MEDataCP.Text := '';
    MEValorCP.Text := '';
    MEDiasCP.SetFocus;
  End;

end;

procedure TFNotaConsum_Confirma.BtConsFinalidadeClick(Sender: TObject);
begin
  If FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.showModal = mrOk then
  Begin
    MEFinalidade.Text := DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
    MEFinalidadeExit(Self);
  End;
end;

procedure TFNotaConsum_Confirma.BtApagaParcelaClick(Sender: TObject);
begin
  LBContaReceber.Items.Delete(LBContaReceber.ItemIndex);
end;

procedure TFNotaConsum_Confirma.MEFinalidadeExit(Sender: TObject);
begin
  If Trim(MEFinalidade.Text) <> '' Then
    EdFinalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+MEFinalidade.Text);

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

procedure TFNotaConsum_Confirma.MEDepartamentoExit(Sender: TObject);
begin
  If Trim(MEDepartamento.Text) <> '' Then
    EdDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MEDepartamento.Text)
  Else
    EdDepartamento.Text := '';

end;

procedure TFNotaConsum_Confirma.BtConsDepartamentoClick(Sender: TObject);
begin
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
  Begin
    MEDepartamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
    MEDepartamentoExit(Self);
  End;
end;

procedure TFNotaConsum_Confirma.MeBancoExit(Sender: TObject);
begin
  If Trim(MEBanco.Text) <> '' Then
    EdBanco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MEBanco.Text)
  Else
    EdBanco.Text := '';

end;

procedure TFNotaConsum_Confirma.BtConsBancoClick(Sender: TObject);
begin
  If FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  If FBancosCons.showModal = mrOk then
  Begin
    MEBanco.Text := DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Text;
    MEBancoExit(Self);
  End;

end;

procedure TFNotaConsum_Confirma.MeCadastroExit(Sender: TObject);
begin
  If Trim(MECadastro.Text) <> '' Then
    EdCadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECadastro.Text);
end;

procedure TFNotaConsum_Confirma.BtConsCadastroClick(Sender: TObject);
begin
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.showModal = mrOk then
  Begin
    MECadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    MECadastroExit(Self);
  End;
 end;
procedure TFNotaConsum_Confirma.BtPrazoClick(Sender: TObject);
begin
  If FPrazoVencimentoCons = Nil then
    FPrazoVencimentoCons := TFPrazoVencimentoCons.Create(Application);
  If FPrazoVencimentoCons.showModal = mrOk then
  Begin
    MePrazo.Text := DMPrazoVencimento.QPrazoVencimento_ConsCod_Prazo_Vencimento.Text;
    MePrazoExit(Self);
  End;

end;

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
    wParcela := Trunc(StrToFloat(EdTotalNF.Text) / StrToFloat(wParc) * 100) / 100;
    wCont := 0;
    wSoma := 0;
    While Not (DMPrazoVencimento.QPrazoVencimentoDias.Eof) Do
     Begin
       Inc(wCont);
       wSoma := wSoma + wParcela;
       If wCont = StrToInt(wParc) Then
        Begin
          wDiferenca := StrToFloat(EdTotalNF.Text) - wSoma;
          wParcela := wParcela + wDiferenca;
        End;
       wLinha := DateToStr( Date + DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value );
       wAux := FormatFloat('###,###,##0.00',wParcela);
       wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
       wLinha := wLinha + wAux;
       LBContaReceber.Items.Add(wLinha);
       DMPrazoVencimento.QPrazoVencimentoDias.Next;
     End;
    MEDataCP.Text := '';
    MEValorCP.Text := '';
    MEDiasCP.SetFocus;
    MePrazo.Text := '';
    BtAvancarClick(Self);
  End;
end;

end.






