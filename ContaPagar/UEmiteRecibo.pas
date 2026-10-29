unit UEmiteRecibo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask;

type
  TFEmiteRecibo = class(TForm)
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    LCadastro: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    MECodConta: TMaskEdit;
    MENrTitulo: TMaskEdit;
    MEFornecedor: TMaskEdit;
    MEValor: TMaskEdit;
    MEDescricao: TMaskEdit;
    MEData: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    MEParcela: TMaskEdit;
    MECodFilial: TMaskEdit;
    Label3: TLabel;
    MeJuros: TMaskEdit;
    Label4: TLabel;
    MeDesconto: TMaskEdit;
    Label9: TLabel;
    MeSaldoTitulo: TMaskEdit;
    Label10: TLabel;
    MeFormaPagamento: TMaskEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmiteRecibo: TFEmiteRecibo;

implementation

uses UContasPagarCons, UContasPagar_cl, URRecibo, UBiblioteca, UFilial_cl,
  UContasReceberCons, UContasReceber_cl, UParamSistema_cl, URecibo_Dos,
  UOracle_cl, UHistorico_cl, UFinalidade_cl;

{$R *.DFM}

Procedure TFEmiteRecibo.SpeedButton1Click(Sender: TObject);
Begin
  If LCadastro.Caption='Fornecedor' then
   begin
     If FContasPagarCons=Nil then
        FContasPagarCons:=TFContasPagarCons.Create(Application);
     If FContasPagarCons.ShowModal=mrOk then
      Begin
        MECodConta.Text:=FloatToStr(DMContasPagar.QContasPagar_CabConsCod_Conta_Pagar_Cab.Value);
        MENrTitulo.Text:=FloatToStr(DMContasPagar.QContasPagar_CabConsNum_Titulo.Value);
        MEParcela.Text:=FloatToStr(DMContasPagar.QContasPagar_CabConsNum_Parcela.Value);
        MEFornecedor.Text:=DMContasPagar.QContasPagar_CabConsNome.Value;
        MECodFilial.Text:=FloatToStr(DMContasPagar.QContasPagar_CabConsCod_Filial.Value);
        DMFilial.QFilial.Close;
        DMFilial.QFilial.SetVariable('PK',StrToInt(Trim(MECodFilial.Text)));
        DMFilial.QFilial.Open;
      End;
   End
  Else
   Begin
     If FContasReceberCons=Nil then
        FContasReceberCons:=TFContasReceberCons.Create(Application);
     If FContasReceberCons.ShowModal=mrOk then
      Begin
        MECodConta.Text:=FloatToStr(DMContasReceber.QContasReceber_CabConsCod_Conta_Receber_Cab.Value);
        MENrTitulo.Text:=FloatToStr(DMContasReceber.QContasReceber_CabConsNum_Titulo.Value);
        MEParcela.Text:=FloatToStr(DMContasReceber.QContasReceber_CabConsNum_Parcela.Value);
        MEFornecedor.Text:=DMContasReceber.QContasReceber_CabConsNome.Value;
        MECodFilial.Text:=FloatToStr(DMContasReceber.QContasReceber_CabConsCod_Filial.Value);
        DMFilial.QFilial.Close;
        DMFilial.QFilial.SetVariable('PK',StrToInt(Trim(MECodFilial.Text)));
        DMFilial.QFilial.Open;
      End;
   End;
End;

Procedure TFEmiteRecibo.BitBtn1Click(Sender: TObject);
var wTipoRecibo, wNrParcelas : string;
Begin
  // Pegar IND_TIPO_RECIBO para saber se emite recibo na Matricial - Djeison A. Selzlein - 20/08/2013

  DMFinalidade.QFinalidade.Close;
  if LCadastro.Caption = 'Fornecedor' then
    DMFinalidade.QFinalidade.SetVariable('PK', DMContasPagar.QContasPagarBaixaCOD_FINALIDADE.Value)
  else
    DMFinalidade.QFinalidade.SetVariable('PK', DMContasReceber.QContasReceberBaixaCOD_FINALIDADE.Value);
  DMFinalidade.QFinalidade.Open;

  DMHistorico.QHistorico.Close;
  DMHistorico.QHistorico.SetVariable('PK', DMFinalidade.QFinalidadeCOD_HISTORICO_BAIXA.Value);
  DMHistorico.QHistorico.Open;

  wTipoRecibo := DMHistorico.QHistoricoIND_TIPO_RECIBO.Text;

  if wTipoRecibo = 'R' then
  begin
    If FRRecibo = Nil then
       FRRecibo := TFRRecibo.Create(Application);
    If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL')  Or
       (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') Or
       (DMParamSistema.QParamSistemaCod_Empresa.Value = 'RETIFOZ') Then
       FRRecibo.QRBand2.Enabled := True
    Else
     Begin
//       FRRecibo.QuickRep1.page.PaperSize := Custom;
       FRRecibo.QRBand2.Height := 0;
       //FRRecibo.QuickRep1.page.Length := 140; //estava imprimindo em modo paissagem para algumas impressoras(M127MF. Junior-14/09/2015
     End;
    FRRecibo.QRLFormaPagto1.Caption := FEmiteRecibo.MeFormaPagamento.Text;
    FRRecibo.QRLFormaPagto.Caption  := FEmiteRecibo.MeFormaPagamento.Text;
    If LCadastro.Caption = 'Fornecedor' then   //Contas Pagar
     Begin
       FRRecibo.QRLRecebido.Caption:=DMFilial.QFilialDesc_Filial.Value;
       FRRecibo.QRLDataEmissao.Caption:=MEData.Text;
       FRRecibo.QRLValor.Caption:=FormatFloat('#,##0.00',StrToFloat(MEValor.text));
       FRRecibo.QRLValor_Juros.Caption:=FormatFloat('#,##0.00',StrToFloat(MEJuros.text));
       FRRecibo.QRLDesconto.Caption:=FormatFloat('#,##0.00',StrToFloat(MEDesconto.text));
       FRRecibo.QRLSaldo.Caption:= FormatFloat('###0.00',StrToFloat(Bib.LimpaString(Trim(MeSaldoTitulo.text),'.')));
       //FRRecibo.QRLValor_Baixa.Caption:=FormatFloat('#,##0.00',StrToFloat(MEValor.text)+StrToFloat(MeJuros.Text)+StrToFloat(MEDesconto.text));
       FRRecibo.QRLValor_Baixa.Caption:=FormatFloat('#,##0.00',StrToFloat(MEValor.text)+StrToFloat(MEDesconto.text)- StrToFloat(MeJuros.Text));
       FRRecibo.QRLValorExtenso.Caption:=Bib.Extenso(StrToFloat(MEValor.text),'REAL');
       //FRRecibo.QRLValorExtenso.Caption:=Bib.Extenso(StrToFloat(MEValor.text)+StrToFloat(MeJuros.Text)-StrToFloat(MeDesconto.Text),'REAL');
       FRRecibo.QRLDescricao.Caption:=MEDescricao.Text;
       FRRecibo.QRLData.Caption:=FormatDateTime(', dd "de" mmmm "de" yyyy',strToDate(MEData.Text));
       FRRecibo.QRLResponsavel.Caption:=MEFornecedor.Text;
       FRRecibo.QRDBTitulo.DataSet:=DMContasPagar.QContasPagarBaixa;
       FRRecibo.QRDBTitulo.DataField:='NUM_TITULO';
       FRRecibo.QRDBParcela.DataSet:=DMContasPagar.QContasPagarBaixa;
       FRRecibo.QRDBParcela.DataField:='NUM_PARCELA';
       FRRecibo.QRDBVenc.DataSet:=DMContasPagar.QContasPagarBaixa;
       FRRecibo.QRDBVenc.DataField:='DT_VENCIMENTO';
       FRRecibo.QRDBCod_Conta.DataSet:=DMContasPagar.QContasPagarBaixa;
       FRRecibo.QRDBCod_Conta.DataField:='COD_CONTA_PAGAR_CAB';
       FRRecibo.QRLabel15.Caption := 'Pago....:';
   // esta duplicacao é para emitir dois recibos para o grasel
       FRRecibo.QRLRecebido1.Caption:=DMFilial.QFilialDesc_Filial.Value;
       FRRecibo.QRLDataEmissao1.Caption:=MEData.Text;
       FRRecibo.QRLValor1.Caption:=FormatFloat('#,##0.00',StrToFloat(MEValor.text));
       FRRecibo.QRLValor_Juros1.Caption:=FormatFloat('#,##0.00',StrToFloat(MEJuros.text));
       FRRecibo.QRLDesconto1.Caption:=FormatFloat('#,##0.00',StrToFloat(MEDesconto.text));
       FRRecibo.QRLSaldo1.Caption:=FormatFloat('#,##0.00',StrToFloat(Bib.LimpaString(Trim(MeSaldoTitulo.text),'.')));
       //FRRecibo.QRLValor_Baixa.Caption:=FormatFloat('#,##0.00',StrToFloat(MEValor.text)+StrToFloat(MeJuros.Text)+StrToFloat(MEDesconto.text));
       FRRecibo.QRLValor_Baixa1.Caption:=FormatFloat('#,##0.00',StrToFloat(MEValor.text)+StrToFloat(MEDesconto.text)- StrToFloat(MeJuros.Text));
       FRRecibo.QRLValorExtenso1.Caption:=Bib.Extenso(StrToFloat(MEValor.text),'REAL');
       //FRRecibo.QRLValorExtenso.Caption:=Bib.Extenso(StrToFloat(MEValor.text)+StrToFloat(MeJuros.Text)-StrToFloat(MeDesconto.Text),'REAL');
       FRRecibo.QRLDescricao1.Caption:=MEDescricao.Text;
       FRRecibo.QRLData1.Caption:=FormatDateTime(', dd "de" mmmm "de" yyyy',strToDate(MEData.Text));
       FRRecibo.QRLResponsavel1.Caption:=MEFornecedor.Text;
       FRRecibo.QRDBTitulo1.DataSet:=DMContasPagar.QContasPagarBaixa;
       FRRecibo.QRDBTitulo1.DataField:='NUM_TITULO';
       FRRecibo.QRDBParcela1.DataSet:=DMContasPagar.QContasPagarBaixa;
       FRRecibo.QRDBParcela1.DataField:='NUM_PARCELA';
       FRRecibo.QRDBVenc1.DataSet:=DMContasPagar.QContasPagarBaixa;
       FRRecibo.QRDBVenc1.DataField:='DT_VENCIMENTO';
       FRRecibo.QRDBCod_Conta1.DataSet:=DMContasPagar.QContasPagarBaixa;
       FRRecibo.QRDBCod_Conta1.DataField:='COD_CONTA_PAGAR_CAB';
       FRRecibo.QRLabel40.Caption := 'Pago....:';

       FRRecibo.QuickRep1.Preview;
     End;

    If LCadastro.Caption='Cliente' then    // Contas Receber
     Begin
       FRRecibo.QRLRecebido.Caption:=MEFornecedor.Text;
       FRRecibo.QRLDataEmissao.Caption:=MEData.Text;
       FRRecibo.QRLValor.Caption:=FormatFloat('#,##0.00',StrToFloat(MEValor.text)+StrToFloat(MeJuros.Text));
       FRRecibo.QRLValor_Juros.Caption:=FormatFloat('#,##0.00',StrToFloat(MEJuros.text));
       FRRecibo.QRLDesconto.Caption:=FormatFloat('#,##0.00',StrToFloat(MEDesconto.text));
       FRRecibo.QRLValor_Baixa.Caption:=FormatFloat('#,##0.00',StrToFloat(MEValor.text) + StrToFloat(MeDesconto.Text));
       FRRecibo.QRLSaldo.Caption:=FormatFloat('#,##0.00',StrToFloat(Bib.LimpaString(Trim(MeSaldoTitulo.text),'.')));
       FRRecibo.QRLValorExtenso.Caption:=Bib.Extenso(StrToFloat(MEValor.text)+StrToFloat(MeJuros.Text),'REAL');
       FRRecibo.QRLDescricao.Caption:=MEDescricao.Text;
       FRRecibo.QRLData.Caption:=FormatDateTime(', dd "de" mmmm "de" yyyy',strToDate(MEData.Text));
       FRRecibo.QRLResponsavel.Caption:=DMFilial.QFilialDesc_Filial.Value;
       FRRecibo.QRDBTitulo.DataSet:=DMContasReceber.QContasReceberBaixa;
       FRRecibo.QRDBTitulo.DataField:='NUM_TITULO';
       FRRecibo.QRDBParcela.DataSet:=DMContasReceber.QContasReceberBaixa;
       FRRecibo.QRDBParcela.DataField:='NUM_PARCELA';
       FRRecibo.QRDBVenc.DataSet:=DMContasReceber.QContasReceberBaixa;
       FRRecibo.QRDBVenc.DataField:='DT_VENCIMENTO';
       FRRecibo.QRDBCod_Conta.DataSet:=DMContasReceber.QContasReceberBaixa;
       FRRecibo.QRDBCod_Conta.DataField:='COD_CONTA_RECEBER_CAB';
// PARA GRASEL
       FRRecibo.QRLRecebido1.Caption:=MEFornecedor.Text;
       FRRecibo.QRLDataEmissao1.Caption:=MEData.Text;
       FRRecibo.QRLValor1.Caption:=FormatFloat('#,##0.00',StrToFloat(MEValor.text)+StrToFloat(MeJuros.Text));
       FRRecibo.QRLValor_Juros1.Caption:=FormatFloat('#,##0.00',StrToFloat(MEJuros.text));
       FRRecibo.QRLDesconto1.Caption:=FormatFloat('#,##0.00',StrToFloat(MEDesconto.text));
       FRRecibo.QRLValor_Baixa1.Caption:=FormatFloat('#,##0.00',StrToFloat(MEValor.text) + StrToFloat(MeDesconto.Text));
       FRRecibo.QRLSaldo1.Caption:=FormatFloat('#,##0.00',StrToFloat(Bib.LimpaString(Trim(MeSaldoTitulo.text),'.')));
       FRRecibo.QRLValorExtenso1.Caption:=Bib.Extenso(StrToFloat(MEValor.text)+StrToFloat(MeJuros.Text),'REAL');
       FRRecibo.QRLDescricao1.Caption:=MEDescricao.Text;
       FRRecibo.QRLData1.Caption:=FormatDateTime(', dd "de" mmmm "de" yyyy',strToDate(MEData.Text));
       FRRecibo.QRLResponsavel1.Caption:=DMFilial.QFilialDesc_Filial.Value;
       FRRecibo.QRDBTitulo1.DataSet:=DMContasReceber.QContasReceberBaixa;
       FRRecibo.QRDBTitulo1.DataField:='NUM_TITULO';
       FRRecibo.QRDBParcela1.DataSet:=DMContasReceber.QContasReceberBaixa;
       FRRecibo.QRDBParcela1.DataField:='NUM_PARCELA';
       FRRecibo.QRDBVenc1.DataSet:=DMContasReceber.QContasReceberBaixa;
       FRRecibo.QRDBVenc1.DataField:='DT_VENCIMENTO';
       FRRecibo.QRDBCod_Conta1.DataSet:=DMContasReceber.QContasReceberBaixa;
       FRRecibo.QRDBCod_Conta1.DataField:='COD_CONTA_RECEBER_CAB';

//       if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDIBENS') then
//        FRRecibo.QRLValor_Baixa.Caption:=FormatFloat('#,##0.00',StrToFloat(Bib.LimpaString(Trim(MEValor.text),'.'))+ StrToFloat(Bib.LimpaString(Trim(MeSaldoTitulo.text),'.')) + StrToFloat(Bib.LimpaString(Trim(MeJuros.Text),'.')) - StrToFloat(Bib.LimpaString(Trim(MeDesconto.Text),'.')));

       FRRecibo.QuickRep1.Preview;
     End;
  end
  else
  begin
    if LCadastro.Caption = 'Fornecedor' then
    begin
      with DMContasPagar do
      begin
        wNrParcelas := DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_CONTA_PAGAR_CAB', 'COD_FILIAL =' + QContasPagarBaixaCOD_FILIAL.Text + ' And COD_CADASTRO='+
             QContasPagarBaixaCOD_CADASTRO.Text + ' And NUM_TITULO = '+QContasPagarBaixaNUM_TITULO.Text,True );
        FRecibo_Dos.EmiteRecibo_Dos( MEFornecedor.Text,
                              MENrTitulo.Text + '/' + MEParcela.Text+' De '+wNrParcelas,
                              QContasPagarBaixaDt_Vencimento.Value,
                              StrToDate(MEData.Text),
                              strtofloat(MEValor.Text), strtofloat(MeJuros.Text), strtofloat(MeDesconto.Text), QContasPagarBaixaCOD_FILIAL.Value,
                              QContasPagarBaixaDESC_FILIAL.Value, QContasPagarBaixaDESC_OBSERVACAO.Value,
                              Qcontaspagarbaixadesc_endereco.text, qcontaspagarbaixadesc_cidade.text);
      end;
    end
    else
    begin
      with DMContasReceber do
      begin
        wNrParcelas := DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_CONTA_RECEBER_CAB', 'COD_FILIAL =' + QContasReceberBaixaCOD_FILIAL.Text + ' And COD_CADASTRO='+
             QContasReceberBaixaCOD_CADASTRO.Text + ' And NUM_TITULO = '+QContasReceberBaixaNUM_TITULO.Text,True );
        FRecibo_Dos.EmiteRecibo_Dos( MEFornecedor.Text,
                              MENrTitulo.Text + '/' + MEParcela.Text+' De '+wNrParcelas,
                              QContasReceberBaixaDt_Vencimento.Value,
                              StrToDate(MEData.Text),
                              strtofloat(MEValor.Text), strtofloat(MeJuros.Text), strtofloat(MeDesconto.Text), QContasReceberBaixaCOD_FILIAL.Value,
                              QContasReceberBaixaDESC_FILIAL.Value, QContasReceberBaixaDESC_OBSERVACAO.Value,
                              QContasReceberBaixaDESC_ENDERECO.Text, QContasReceberBaixaDESC_CIDADE.Text);
      end;
    end;

  end;
End;
End.
