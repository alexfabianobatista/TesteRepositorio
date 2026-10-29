unit UContasReceberBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Grids, DBGrids, Buttons, ComCtrls, Db,
  DBTables, UBiblioteca, DBDirceu, ActnList, OracleData, ImgList,
  UFmDepartamento;

type
  TFContasReceberBaixa = class(TForm)
    PCBaixa: TPageControl;
    TS0Localiza: TTabSheet;
    GroupBox1: TGroupBox;
    SBProcura: TSpeedButton;
    Fornecedor: TLabel;
    DBGrid1: TDBGrid;
    METexto: TMaskEdit;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    MEDataVencInicial: TMaskEdit;
    MEDataVencFinal: TMaskEdit;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    MEDataEmissaoInicial: TMaskEdit;
    MEDataEmissaoFinal: TMaskEdit;
    CBMostraBaixaTotal: TCheckBox;
    TS1Baixa: TTabSheet;
    DBText1: TDBText;
    DBText2: TDBText;
    Label7: TLabel;
    Label8: TLabel;
    DBText3: TDBText;
    Label9: TLabel;
    DBText4: TDBText;
    DBText5: TDBText;
    Label10: TLabel;
    Label11: TLabel;
    GroupBox2: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    SBBaixa: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    SBConsContaCorrente: TSpeedButton;
    MEDataBaixa: TMaskEdit;
    MEValorBaixa: TMaskEdit;
    MEValorDesconto: TMaskEdit;
    MEValorJuro: TMaskEdit;
    MEObservacao: TMaskEdit;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    RGFormaPagto: TRadioGroup;
    MECodContaCorrente: TMaskEdit;
    MENumCheque: TMaskEdit;
    MEBanco: TMaskEdit;
    SpeedButton1: TSpeedButton;
    DBText6: TDBText;
    Label12: TLabel;
    Label13: TLabel;
    DBText7: TDBText;
    MECodCliente: TMaskEdit;
    Label14: TLabel;
    Label15: TLabel;
    MeVariacaoPos: TMaskEdit;
    Label16: TLabel;
    MeVariacaoNeg: TMaskEdit;
    MECodFilial: TMaskEdit;
    Label17: TLabel;
    SpeedButton8: TSpeedButton;
    Label18: TLabel;
    MeNumTitulo: TMaskEdit;
    Label19: TLabel;
    MeCodNota: TMaskEdit;
    SBNotaEntradaCons: TSpeedButton;
    Label20: TLabel;
    MeNossoNumero: TMaskEdit;
    Label21: TLabel;
    MeValor: TMaskEdit;
    ChDevolucao: TCheckBox;
    Label22: TLabel;
    MeDevolucao: TMaskEdit;
    Label160: TLabel;
    Sb1Finalidade: TSpeedButton;
    MeFinalidade: TMaskEdit;
    MeHistoricoDesconto: TMaskEdit;
    LblHistoricoDesconto: TLabel;
    SbHistoricoDesconto: TSpeedButton;
    MeContrato: TMaskEdit;
    Label23: TLabel;
    DBText9: TDBText;
    Label27: TLabel;
    Label28: TLabel;
    MeTotal: TMaskEdit;
    DBDirceu1: TDBDirceu;
    Label29: TLabel;
    MeDtBaixa: TMaskEdit;
    MeAtualizado: TMaskEdit;
    TsBaixaLote: TTabSheet;
    SB2Baixa: TBitBtn;
    RG2FormaPagto: TRadioGroup;
    ME2Banco: TMaskEdit;
    ME2CodContaCorrente: TMaskEdit;
    ME2NumCheque: TMaskEdit;
    SB2ConsContaCorrente: TSpeedButton;
    ME2DataBaixa: TMaskEdit;
    Label30: TLabel;
    Label31: TLabel;
    MeBanco_Baixa: TMaskEdit;
    SbBancoCons: TSpeedButton;
    CbOrdem: TComboBox;
    Label32: TLabel;
    Label33: TLabel;
    AcConsultaCadastro: TActionList;
    AcCadastro: TAction;
    AcVoltaBaixa: TAction;
    AcPosicionCadastro: TAction;
    SbProcuraNota: TBitBtn;
    Label34: TLabel;
    SbAlteraObs: TBitBtn;
    ChTroca: TCheckBox;
    MECodContaReceber: TMaskEdit;
    Label35: TLabel;
    Label36: TLabel;
    MeBaixaJuro: TMaskEdit;
    CbCalculoJuros: TCheckBox;
    MECodAdiantamento: TMaskEdit;
    SBAdiantamento: TSpeedButton;
    MEAdiantamento: TMaskEdit;
    Label38: TLabel;
    DSContasReceberBaixa: TDataSource;
    DBGrid3: TDBGrid;
    ImageList1: TImageList;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    MeSemJuros: TMaskEdit;
    MeComJuros: TMaskEdit;
    DsVariacao: TDataSource;
    Label37: TLabel;
    DBEdit1: TDBEdit;
    Label39: TLabel;
    DBEdit2: TDBEdit;
    Label40: TLabel;
    DBEdit3: TDBEdit;
    Label41: TLabel;
    MEValorCheque: TMaskEdit;
    SBHistoricoCheque: TSpeedButton;
    MEHistoricoCheque: TMaskEdit;
    EdHistoricoCheque: TEdit;
    Label42: TLabel;
    FmDepartamento1: TFmDepartamento;
    procedure SBProcuraClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PCBaixaChange(Sender: TObject);
    procedure PCBaixaChanging(Sender: TObject; var AllowChange: Boolean);
    procedure CBMostraBaixaTotalClick(Sender: TObject);
    procedure RGFormaPagtoClick(Sender: TObject);
    procedure SBConsContaCorrenteClick(Sender: TObject);
    procedure SBBaixaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SBNotaEntradaConsClick(Sender: TObject);
    procedure MECodClienteExit(Sender: TObject);
    procedure MeValorKeyPress(Sender: TObject; var Key: Char);
    procedure Sb1FinalidadeClick(Sender: TObject);
    procedure SbHistoricoDescontoClick(Sender: TObject);
    procedure MECodClienteChange(Sender: TObject);
    procedure RG2FormaPagtoClick(Sender: TObject);
    procedure SB2ConsContaCorrenteClick(Sender: TObject);
    procedure SB2BaixaClick(Sender: TObject);
    procedure TsBaixaLoteEnter(Sender: TObject);
    procedure SbBancoConsClick(Sender: TObject);
    procedure MEDataVencFinalExit(Sender: TObject);
    procedure AcCadastroExecute(Sender: TObject);
    procedure AcVoltaBaixaExecute(Sender: TObject);
    procedure AcPosicionCadastroExecute(Sender: TObject);
    procedure SbProcuraNotaClick(Sender: TObject);
    procedure SbAlteraObsClick(Sender: TObject);
    procedure SBAdiantamentoClick(Sender: TObject);
    procedure MECodAdiantamentoExit(Sender: TObject);
    procedure MeDtBaixaExit(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SBHistoricoChequeClick(Sender: TObject);
    procedure MEHistoricoChequeExit(Sender: TObject);
  private
    { Private declarations }
    procedure EmiteReciboLote(logo:String);
    procedure AddDadosReciboLote(nomeCliente: String;
                                 numDuplicata, numParcela: integer;
                                 valPrincipal, valJuros, valPrincipalRecebido, valJurosRecebido, valDesconto, valRecebido, valPendente: double);
    Procedure Atualiza_Baixa_Lote(wMarcado_SN : String);
  public
    { Public declarations }
  end;

var
  FContasReceberBaixa: TFContasReceberBaixa;
  wSomaSelecionados,wSomaJuros : real;  //utilizado para colocar o total na tela
  wSelecionaTodos : boolean;
implementation

uses UOracle_cl, UBancoAgencia_cl, UCaixa_cl,
  UContaCorrenteCons, UUsuario_cl, UPlanilha_cl, UContasReceberJuro,
  UFilial_cl, UEmiteRecibo, UCadastroCons, UCadastro_cl, UParamSistema_cl,
  UFilialCons, UNotaEntradaConsulta, UFinalidadeCons, UFinalidade_cl,
  UHistoricoCons, UHistorico_cl,URecibo_Dos, UBancosCons, UNotaSaida_cl,
  UNotaItensCons, UContasReceberVoltaBaixa, URReciboLote,
  UContasReceber_Rel_cl, USequencia_cl, UAdiantamentoCons,
  UAdiantamento_cl, UContasReceber_cl;

{$R *.DFM}

procedure TFContasReceberBaixa.SBProcuraClick(Sender: TObject);
var wdata_teste:TDate;
    wValor_Total,wValor_Atualizado : Real;
    li : TListItem;
    i : integer;
    sqlBaixa: TStringList;
begin
    DmUsuario.Checar_Filial_Usuario( Trim(MECodFilial.Text),'CONTAS A RECEBER');
    With DMContasReceber do
      Begin
        QContasReceberBaixa.Close;
        QContasReceberBaixa.SQL.Clear;
        QContasReceberBaixaLote.SQL.Clear;
        sqlBaixa := TStringList.Create;
        sqlBaixa.Clear;
        sqlBaixa.Add('SELECT TB_CADASTRO."NOME" ,TB_CONTA_RECEBER_CAB."COD_CONTA_RECEBER_CAB" , TB_CONTA_RECEBER_CAB."COD_ORDEM_COMPRA_CAB" ,TB_CONTA_RECEBER_CAB."COD_FINALIDADE" ,');
        sqlBaixa.Add('TB_CONTA_RECEBER_CAB."COD_BANCO_AGENCIA" ,TB_CONTA_RECEBER_CAB."COD_CADASTRO" , TB_CONTA_RECEBER_CAB."COD_FILIAL" , TB_FILIAL."DESC_FILIAL" ,');
        sqlBaixa.Add('TB_CONTA_RECEBER_CAB."COD_DEPARTAMENTO" ,TB_CONTA_RECEBER_CAB."NUM_TITULO" ,TB_CONTA_RECEBER_CAB."NUM_PARCELA" ,');
        sqlBaixa.Add('TB_CONTA_RECEBER_CAB."DESC_TIPO_DOCUMENTO" ,TB_CONTA_RECEBER_CAB."DT_MOVIMENTO" ,TB_CONTA_RECEBER_CAB."DT_BAIXA" ,');
        sqlBaixa.Add('TB_CONTA_RECEBER_CAB."DT_VENCIMENTO" ,TB_CONTA_RECEBER_CAB."DT_CAPITALIZACAO" ,');
        If DMParamsistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' Then
           sqlBaixa.Add('Trunc(TB_CONTA_RECEBER_CAB.DT_MOVIMENTO) AS DT_EMISSAO,')
        Else
           sqlBaixa.Add('TB_CONTA_RECEBER_CAB."DT_EMISSAO" AS DT_EMISSAO,');
        sqlBaixa.Add('TB_CONTA_RECEBER_CAB."DT_CAPITALIZACAO_MOEDA" ,TB_CONTA_RECEBER_CAB."VAL_TITULO" ,TB_CONTA_RECEBER_CAB."COD_NOTA_CAB" ,');
        sqlBaixa.Add('TB_CONTA_RECEBER_CAB."DESC_OBSERVACAO" ,TB_CONTA_RECEBER_CAB."IND_ACEITE" ,TB_CONTA_RECEBER_CAB."IND_SITUACAO" ,');
        sqlBaixa.Add('TB_CONTA_RECEBER_CAB."VAL_ORIGINAL",TB_CONTA_RECEBER_CAB."VAL_JUROS", TB_CLASS_CADASTRO.DESC_CLASSIFICACAO,TB_FINALIDADE.PERC_JURO_MORA,');
        sqlBaixa.Add('TB_FINALIDADE.NUM_TIPO_JURO,TB_FINALIDADE.PERC_TAXA,TB_FINALIDADE.COD_MOEDA,TB_FINALIDADE.COD_HISTORICO_DESC,TB_FINALIDADE.DESC_FINALIDADE, ');
        sqlBaixa.Add('DECODE(TB_CONTA_RECEBER_CAB.IND_SITUACAO,'+Chr(39)+'ABERTO'+Chr(39)+',TB_FINALIDADE.NUM_DIAS_CARENCIA,0) AS NUM_DIAS_CARENCIA');
        QContasReceberBaixa.Sql.AddStrings(sqlBaixa);

        QContasReceberBaixaLote.Sql.AddStrings(sqlBaixa);
        QContasReceberBaixaLote.Sql.Add(', ' + QuotedStr('N') + ' as BAIXAR, 0 as VAL_JURO_ALTERAR, 0 as VAL_DESCONTO_ALTERAR ');
        sqlBaixa.Clear;

        sqlBaixa.Add(' FROM TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_CLASS_CADASTRO,TB_FINALIDADE, TB_FILIAL');
        sqlBaixa.Add(' WHERE TB_CONTA_RECEBER_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO');
        sqlBaixa.Add(' AND TB_CADASTRO.COD_CLASS_CADASTRO = TB_CLASS_CADASTRO.COD_CLASS_CADASTRO(+)');
        sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE = TB_FINALIDADE.COD_FINALIDADE');
        sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL');
        if CBMostraBaixatotal.Checked = True then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.VAL_TITULO  > -1 ')
        else
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.VAL_TITULO  > 0 ');
        If Trim(MECodCliente.Text) <> '' then
           sqlBaixa.Add(' AND TB_CADASTRO.COD_CADASTRO = ' + Trim(MECodCliente.Text));
        If Trim(MECodFilial.Text) <> '' then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.COD_FILIAL = ' + Trim(MECodFilial.Text));
        If Trim(MeNumTitulo.Text) <> '' then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.NUM_TITULO = ' + Trim(MeNumTitulo.Text));
        If Trim(MeFinalidade.Text) <> '' then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE = ' + Trim(MeFinalidade.Text));
        If Trim(MeNossoNumero.Text) <> '' then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO = ' + Chr(39) + Trim(MeNossoNumero.Text)+ Chr(39));
        If Trim(MeContrato.Text) <> '' then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.COD_CONTRATO_VEND = ' + chr(39) + Trim(MeContrato.text) + chr(39));
        If Trim(MEDataEmissaoInicial.Text) <> '' then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.DT_EMISSAO >= ' + 'To_Date('''+Trim(MEDataEmissaoInicial.Text)+''',''dd/mm/yyyy'')');
        If Trim(MEDataEmissaoFinal.Text) <> '' then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.DT_EMISSAO <= ' + 'To_Date('''+Trim(MEDataEmissaoFinal.Text)+''',''dd/mm/yyyy'')');
        If Trim(MEBanco_Baixa.Text) <> '' then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA = ' + chr(39) + Trim(MEBanco_Baixa.text) + chr(39));
        If Trim(MEDataVencInicial.Text) <> '' then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO >= ' + 'To_Date('''+Trim(MEDataVencInicial.Text)+''',''dd/mm/yyyy'')');
        If Trim(MEDataVencFinal.Text) <> '' then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO <= ' + 'To_Date('''+Trim(MEDataVencFinal.Text)+''',''dd/mm/yyyy'')');
        if Trim(MeValor.text) <> '' Then
           sqlBaixa.Add(' AND VAL_TITULO =' + Trim(MeValor.Text));
        if Trim(MeCodContaReceber.text) <> '' Then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.COD_CONTA_RECEBER_CAB ='+Trim(MeCodContaReceber.text));
        Case CbOrdem.ItemIndex of
          0 : sqlBaixa.Add(' ORDER BY TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
          1 : sqlBaixa.Add(' ORDER BY TB_CONTA_RECEBER_CAB.DT_EMISSAO');
          2 : sqlBaixa.Add(' ORDER BY TB_CONTA_RECEBER_CAB.COD_CADASTRO');
          3 : sqlBaixa.Add(' ORDER BY TB_CADASTRO.NOME');
          4 : sqlBaixa.Add(' ORDER BY TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO');
          5 : sqlBaixa.Add(' ORDER BY TB_CONTA_RECEBER_CAB.NUM_TITULO');
        End;

        QContasReceberBaixa.SQL.AddStrings(sqlBaixa);
        QContasReceberBaixaLote.SQL.AddStrings(sqlBaixa);

        PCalculaJuros := CbCalculoJuros.Checked;
        pDataBase := StrToDate(MeDtBaixa.Text);  // este campo esta passando para nao usar o formulario no data modulo
        QContasReceberBaixa.Open;                // passa a data de baixa para calcular os juros no calcfield
        QContasReceberBaixa.First;
        wValor_Total := 0;
        wValor_Atualizado := 0;

        wSomaSelecionados := 0.00; //guarda a soma dos itens selecionados na aba de baixa em lote.
        wSomaJuros := 0;
        while Not QContasReceberBaixa.Eof Do
        begin
          wValor_Total := wValor_Total + QContasReceberBaixaVal_Titulo.Value;
          wValor_Atualizado := wValor_Atualizado + QContasReceberBaixaVal_Juros_Calculado.Value;
          QContasReceberBaixa.next;
        end;
        MeTotal.text := FormatFloat('#,##0.00',wValor_Total);
        MeAtualizado.text := FormatFloat('#,##0.00',wValor_Atualizado);
      End;

  DMContasReceber.cdContasReceberBaixaLote.Close;
  DMContasReceber.cdContasReceberBaixaLote.Open;
  DMContasReceber.cdContasReceberBaixaLote.First;
  DMContasReceber.QContasReceberBaixa.First;

//  while not DMContasReceber.cdContasReceberBaixaLote.Eof do
//  Begin
//    DMContasReceber.cdContasReceberBaixaLoteVAL_JURO_ALTERAR.Value := DMContasReceber.cdContasReceberBaixaLoteval_juros_calculado.Value;
//    DMContasReceber.cdContasReceberBaixaLote.Next;
//  End;
//  DMContasReceber.cdContasReceberBaixaLote.First;

  DBGrid3.SelectedIndex := 1;
  If Self.Tag <> 1 Then
     DBGrid1.SetFocus;
end;

procedure TFContasReceberBaixa.FormActivate(Sender: TObject);
begin
  PCBaixa.ActivePage:=TS0Localiza;
  MeFinalidade.Clear;
  MeBanco_Baixa.Clear;
  CbOrdem.ItemIndex := 0;
  MeDtBaixa.Text := DateToStr(Date);
  With DMContasReceber do
    Begin
      QContasReceberBaixaMov.Close;
      QContasReceberBaixaMov.Open;
    End;
  With DMCaixa do
    Begin
      QCaixa_mov.Close;
      QCaixa_mov.Open;
    End;
  With DMBancoAgencia do
   Begin
     QBancoMovimento.Close;
     QBancoMovimento.Open;
   End;
  If (DmParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES') Then
     MEDataBaixa.Enabled := False
  else
     DbGrid1.Columns[12].Visible := True;
  If (DmParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO') Then
   Begin
     Label36.Visible := True;
     MeBaixaJuro.Visible := True;
     MeValorJuro.Enabled := False;
     MeValorJuro.Color := clBtnFace;
     MeBaixaJuro.TabOrder := 3;
     Label37.Visible := False;
     Label39.Visible := False;
     Label40.Visible := False;
     DBEdit1.Visible := False;
     DBEdit2.Visible := False;
     DBEdit3.Visible := False;
   End
  Else
   Begin
     Label15.Visible := True;
     Label16.Visible := True;
     MeVariacaoPos.Visible := True;
     MeVariacaoNeg.Visible := True;
   End;
  If (DmParamSistema.QParamSistemaCod_Empresa.Value = 'NIR') Then
   Begin
     RGFormaPagto.Items.Clear;
     RGFormaPagto.Items.add('Caixa');
     RGFormaPagto.Items.add('Bancos (Depósito)');
   End;
   if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED' Then
   Begin
     MeValorCheque.Enabled := True;
     MeHistoricoCHeque.Enabled := True;
     SBHistoricoCheque.Enabled := True;
     EdHistoricoCheque.Enabled:= True;
     Label42.Enabled:= True;
     Label41.Enabled := True;
   end
   else
   Begin
     MeValorCheque.Enabled := False;
     MeHistoricoCHeque.Enabled := False;
     SBHistoricoCheque.Enabled := False;
     EdHistoricoCheque.Enabled:= False;
     Label42.Enabled:= False;
     Label41.Enabled := False;
   end;
   If Self.Tag = 1 Then  // chamado a partir do contrato garantia de preco
   Begin
     SbProcura.Enabled := False;
     RGFormaPagto.ItemIndex := 2;
     RGFormaPagto.Enabled := False;
     RG2FormaPagto.Enabled := False;
   End;

end;

procedure TFContasReceberBaixa.PCBaixaChange(Sender: TObject);
var wDataCapitalizacao,wTipoJuro,wDiasCarencia:String;
    wTaxa,wMoeda,wVl_Capitalizacao: Real;
begin
  wVl_Capitalizacao := 0;
//  SE MODIFICAR AQUI MODIFICAR TAMBEM CALCFIELDS DA QUERY QContasReceberBaixa //
  If PCBaixa.ActivePage=TS1Baixa then
    Begin       // Coloca os Valores default
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
       Begin
         DMContasReceber.QContasReceberSomaVariacao.Close;
         DMContasReceber.QContasReceberSomaVariacao.Open;
       End;
{      wValor_Capitalizacao:=0;
      wDataCapitalizacao:=DateToStr(DMContasReceber.QContasReceberBaixaDt_Capitalizacao.Value);
      with DMContasReceber do
        begin
          If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO') And (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'AB') Then
          Begin
            wTipoJuro:=QContasReceberBaixaNUM_TIPO_JURO.Text;
            wDiasCarencia:=QContasReceberBaixaNUM_DIAS_CARENCIA.Text;
            If wDiasCarencia = '' Then
               wDiasCarencia := '0';
            wTaxa := 0;
            if QContasReceberBaixaPerc_Taxa.Text <> '' Then
              wTaxa  := QContasReceberBaixaPerc_Taxa.value;
            wMoeda:=QContasReceberBaixaCOD_MOEDA.Value;
            If wTipoJuro<>'SEM JURO' then
              Begin
                wValor_Capitalizacao:=CalculaJuros(QContasReceberBaixaVal_Titulo.Value+QContasReceberBaixaVal_Juros.Value,wTaxa,wMoeda,
                     StrToDate(wDataCapitalizacao),StrToDate(MeDtBaixa.Text),QContasReceberBaixaDt_Capitalizacao_Moeda.Value,wTipoJuro,wDiasCarencia);
                wValor_Capitalizacao:=(Round(wValor_Capitalizacao*100)/100);

                if wValor_Capitalizacao > 0.001 then
                   MEValorJuro.Text:=FloatToStr(wValor_Capitalizacao)
                Else
                   MEValorJuro.Text:='';
              End; //if sem juro
          End;
        End;
}
        If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO')  Then
         Begin
           wVl_Capitalizacao := DMContasReceber.QContasReceberBaixaVal_Juros_Calculado.Value - DMContasReceber.QContasReceberBaixaVal_Titulo.Value;
           MeValorJuro.Text := FormatFloat('##0.00',wVl_Capitalizacao);  // valor dos juros calculado no calcfield + juro acumulado anteriores
           MeBaixaJuro.Text := MeValorJuro.Text;
         End;
        MeDataBaixa.Text:=MeDtBaixa.Text;    //DateToStr(DMOracle.DataServ);
        Me2DataBaixa.Text:=MeDtBaixa.Text;    //DateToStr(DMOracle.DataServ);

      if (wVl_Capitalizacao > 0.001) then
         MeValorBaixa.Text := FloatToStr(DMContasReceber.QContasReceberBaixaVal_Titulo.Value + wVl_Capitalizacao)
      else
         MeValorBaixa.Text := FloatToStr(DMContasReceber.QContasReceberBaixaVal_Titulo.Value);
      MeHistoricoDesconto.Text := DMContasReceber.QContasReceberBaixaCOD_HISTORICO_DESC.Text;
    End;
   LblHistoricoDesconto.Visible := False;
   MeHistoricoDesconto.Visible := False;
   SbHistoricoDesconto.Visible := False;
  If DMContasReceber.QContasReceberBaixaInd_Situacao.Value='BAIXA TOTAL' then
    Begin
     MEDataBaixa.Clear;
     MEValorBaixa.Clear;
     MEValorDesconto.Clear;
     MEValorJuro.Clear;
     MEObservacao.Clear;
     MeContrato.Clear;
     MEDataBaixa.ReadOnly:=True;
     MEValorBaixa.ReadOnly:=True;
     MEValorDesconto.ReadOnly:=True;
//     MEValorJuro.ReadOnly:=True;
     MEObservacao.ReadOnly:=True;
     SBBaixa.Enabled:=False;
    End
  Else
    Begin
     MEDataBaixa.ReadOnly:=False;
     MEValorBaixa.ReadOnly:=False;
     MEValorDesconto.ReadOnly:=False;
//     MEValorJuro.ReadOnly:=True;
     MEObservacao.ReadOnly:=False;
     SBBaixa.Enabled:=True;
    End;
  //Atualiza a data da baixa da aba baixa em lotes
  if PCBaixa.ActivePage = TsBaixaLote then
   Begin
     if MeDtBaixa.Text <> '' then
        ME2DataBaixa.Text := MeDtBaixa.Text;
     MeComJuros.Text := '0';
     MeSemJuros.Text := '0';
   End;
  If Self.Tag = 0 Then  // estará 1 quando foi baixa contabil do contrato de venda
     RGFormaPagto.ItemIndex:=0;
  MeCodNota.Text := '';
end;

procedure TFContasReceberBaixa.PCBaixaChanging(Sender: TObject;
  var AllowChange: Boolean);
Var wCancelado : String;
begin
  If DMOracle.BuscaNome('SELECT IND_ACEITE_CR FROM TB_PARAM_SISTEMA','IND_ACEITE_CR IS NOT NULL')='S' Then
    Begin
     If (DMContasReceber.QContasReceberBaixaInd_Aceite.value='NAO') or (DMContasReceber.QContasReceberBaixaCod_Conta_Receber_Cab.Value=0) Then
       Begin
         ShowMessage('Não é Possível dar baixa neste título sem que seja dado o Aceite.');
         AllowChange:=False;
       End;
    End
  Else
    Begin
      If (DMContasReceber.QContasReceberBaixaCod_Conta_Receber_Cab.Value=0) Then
        Begin
          ShowMessage('Não é Possível dar baixa neste título.');
          AllowChange:=False;
        End;
    End;
  
end;

procedure TFContasReceberBaixa.CBMostraBaixaTotalClick(Sender: TObject);
begin
  If CbMostraBaixaTotal.Checked Then
   Begin
//     DbGrid1.Columns[9].Visible := True;
     If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' Then
      Begin
        DbGrid1.Columns[11].Visible := True;
        DbGrid1.Columns[10].Visible := True;
      End
   End
  Else
   Begin
//     DbGrid1.Columns[9].Visible := False;
     DbGrid1.Columns[11].Visible := False;
     DbGrid1.Columns[10].Visible := False;
   End;
  SBProcura.Click;
end;

procedure TFContasReceberBaixa.RGFormaPagtoClick(Sender: TObject);
Var wHistoricoCheque : String;
begin
  If (RGFormaPagto.ItemIndex=0) Or    // Pgto. em Dinheiro
     (RGFormaPagto.ItemIndex=2) then  // Pgto. outros so contabil
    Begin
      SBConsContaCorrente.Enabled:=False;
      MEBanco.Clear;
      MECodContaCorrente.Clear;
      MENumCheque.Clear;
      SBBaixa.Enabled:=True;
    End
  Else                              // Pagto. em Cheque
    Begin
      wHistoricoCheque:=DMOracle.BuscaNome('SELECT COD_HISTORICO_CHEQUE FROM TB_FINALIDADE','COD_FINALIDADE = '+FloatToStr(DMContasReceber.QContasReceberBaixaCod_Finalidade.Value));
      If wHistoricoCheque = '' then
        Begin                        // caso cod_historico_cheque estiver vazio não será
          RGFormaPagto.ItemIndex:=0; // permitido efetuar o pgto. com cheque
          raise Exception.create('Erro! Cod. do Histórico do Cheque deste Título em Branco !');
        End
      Else
        Begin
          If MEBanco.Text='' then
            SBBaixa.Enabled:=False
          Else
            SBBaixa.Enabled:=True;
          SBConsContaCorrente.Enabled:=True;
        End;
    End;
end;

procedure TFContasReceberBaixa.SBConsContaCorrenteClick(Sender: TObject);
begin
  If FContaCorrenteCons=Nil Then
    FContaCorrenteCons:=TFContaCorrenteCons.Create(Application);
  If FContaCorrenteCons.ShowModal=MrOk then
   Begin
     MEBanco.Text:=DMBancoAgencia.QContaCorrenteConsDesc_Banco_Agencia.Value;
     MECodContaCorrente.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value);
     MENumCheque.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Value);
     SBBaixa.Enabled:=True;
   End;
End;

procedure TFContasReceberBaixa.SBBaixaClick(Sender: TObject);
Var
  wValor_Juro,wValor_Desconto,wValor_Baixa,wPagto_Juro,wValor_Teste,wVlrLancto,wVlrDevolucao,wValorCheque:Currency;
  wCodigo,wFilial_Contabil,wFilial,wCodDoc,wCodCompl,wCodHistorico:Integer;
  wNumDoc,wRecibo,wHistoricoContabil,wHistoricoBaixa,wHistoricoDev,wHistoricoDesc,wHistoricoJuro,wHistoricoCheque,wContaCred,wContaDeb,wHistoricoVar_Pos,wHistoricoVar_Neg,wHistoricoCredito:String;
  wDtLancto:TDateTime;
  wBaixaEmLote : boolean;
  wGuardaJuro : String; // varivel wguardaJuro é para aristides guardar valor juro calculado
  wDepartamento :Integer; //variável usada para fazer baixa de título usando departamento diferente do informado no cadastro da C.R.
begin
  //----veririfica se foi chamado pelo botão de baixa em lote-------
  wBaixaEmLote := false;
  if TComponent(Sender).Name = 'SB2Baixa' then
    wBaixaEmLote := true;
  //------fim verificacao baixa em lote--------

  If DMParamSistema.QParamSistemaDt_Fechamento_Financeiro.Value >= StrToDate(MEDataBaixa.Text) Then
     Raise Exception.Create('Não é Permitido Baixar Este Título - Fechamento Contabil');
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MOINHO' Then
   Begin        // isso para aristides fica acumulando o juro calculado menos a diferenca do juro cobrado - vai fazer isso na rotina mais abaixo
     wGuardaJuro := MeValorJuro.Text;
     MeValorJuro.Text := MeBaixaJuro.Text;
   End;
  wValor_Juro:=0;
  DMCaixa.pCalcFields_Caixa := False;  // serve para nao calcular os campos do calcfields na query QCaixaMov - somente na baixa de titulos
  wValor_Desconto:=0;
  wValor_Baixa:=0;
  wPagto_Juro:=0;
  wVlrDevolucao:=0;
  DMCaixa.QCaixa_Mov.AutoCalcFields:=False;
  DMBancoAgencia.QBancoMovimento.AutoCalcFields:=False;
  DMContasReceber.QContasReceberBaixaMov.DisableControls;
  if RGFormaPagto.ItemIndex=1 then  // Para acessar banco para buscar código contas contábeis
  begin                            // quando ocorre uma baixa por bancos
     DMBancoAGencia.QBancoAgencia.Close;
     DMBancoAgencia.QBancoAgencia.SetVariable('PK',DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Value);
     DMBancoAGencia.QBancoAgencia.Open;
     If DMBancoAGencia.QBancoAgencia.Eof Then
        Raise exception.Create('Banco não cadastrado');
  end;
  with DMContasReceber do
    begin          // Begin With
      If (StrToDate(MeDataBaixa.Text) <  QContasReceberBaixaDt_Emissao.Value) then
         Raise Exception.Create('Data da baixa não deve ser menor que data da emissão do título');
      DMFinalidade.QFinalidade.Close;
      DMFinalidade.QFinalidade.SetVariable('Pk',QContasReceberBaixaCod_Finalidade.Value);
      DMFinalidade.QFinalidade.Open;
      If DMFinalidade.QFinalidade.Eof Then
         Raise Exception.Create('Finalidade do titulo inexistente');

      wHistoricoBaixa := DMFinalidade.QFinalidadeCOD_HISTORICO_BAIXA.Text;

      wHistoricoDesc := Trim(MeHistoricoDesconto.Text);

      // DMOracle.BuscaNome('SELECT COD_HISTORICO_DESC FROM TB_FINALIDADE','COD_FINALIDADE = '+FloatToStr(QContasReceberBaixaCod_Finalidade.Value));

      wHistoricoJuro := DMFinalidade.QFinalidadeCOD_HISTORICO_JURO.Text;

      wHistoricoCheque := DMFinalidade.QFinalidadeCOD_HISTORICO_CHEQUE.Text;

      wHistoricoContabil := DMFinalidade.QFinalidadeCOD_HISTORICO_CONTABIL.Text;

      wRecibo := DMFinalidade.QFinalidadeIND_RECIBO.Value;

      If (Trim(MEValorJuro.Text) <> '') and (Trim(MEValorJuro.Text) <> '0') then
       Begin
         wValor_Juro:=StrToFloat(MEValorJuro.Text);
         wPagto_Juro:=StrToFloat(MEValorJuro.Text);
         If (DmParamSistema.QParamSistemaCOD_EMPRESA.value='MOINHO') Then
             MEValorBaixa.Text := FloatToStr(StrToFloat(MEValorBaixa.Text) + StrToFloat(MEValorJuro.Text));
       End;
      if (Trim(MEValorBaixa.Text)<>'') and (Trim(MEValorBaixa.Text)<>'0') then
        wValor_Baixa:=StrToFloat(MEValorBaixa.Text);
      if (Trim(MEValorDesconto.Text)<>'') and (Trim(MEValorDesconto.Text)<>'0') then
        wValor_Desconto:=StrToFloat(MEValorDesconto.Text);
      if (Trim(MEDevolucao.Text)<>'') and (Trim(MEDevolucao.Text)<>'0') then
        wVlrDevolucao:=StrToFloat(MEDevolucao.Text);
      if Trim(MeValorCheque.Text)<> '' then
        wValorCheque := StrToFloat(MEValorCheque.Text);  

      wValor_Teste := Trunc((QContasReceberBaixaVal_Titulo.Value+wValor_Juro-wValor_Baixa+wVlrDevolucao)*100)/100;
//era isso      wValor_Teste := Trunc((QContasReceberBaixaVal_Titulo.Value+QContasReceberBaixaVal_Juros.Value+wValor_Juro-wValor_Baixa+wVlrDevolucao)*100)/100;
      if (wValor_Teste >= 0) and ((wValor_Baixa<>0) or (wValor_Juro<>0) or (wVlrDevolucao<>0) or (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED')) then
        begin   // Se o Lançamento não vai gerar um valor negativo.
          try
            if not wBaixaEmLote then
              DMOracle.DBCemapa.StartTransaction; // Inicia a transação

            // Cálculo do Juros
            if (wValor_Juro >= wValor_Baixa) Then
             Begin
               wPagto_Juro:=wValor_Baixa;
               wValor_Baixa:=0;
               wValor_Desconto:=0;
             End
            else
             Begin
               wPagto_Juro:=wValor_Juro;
               wValor_Baixa:=wValor_Baixa - wPagto_Juro;
             End;

            // Inclusão de Movimentos

            //Inclui no Movimento o Juro no movimento contas a receber
            If wValor_Juro>0 then
              Begin
                QContasReceberBaixaMov.Insert;
                QContasReceberBaixaMovVal_Movimento.Value:=wValor_Juro;
                QContasReceberBaixaMovDt_Movimento.Value:=StrToDate(MEDataBaixa.Text);
                QContasReceberBaixaMovInd_Tipo_Movimento.Value:='JUROS';
                If ChDevolucao.Checked then
                   QContasReceberBaixaMovInd_Devolucao.Value:='SIM';
                If ChTroca.Checked then
                   QContasReceberBaixaMovInd_Troca.Value:='SIM';
                QContasReceberBaixaMov.Post;
              End;

             // Inclui no Movimento o Pagamento do Juro
             If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED' Then
             Begin
               wPagto_Juro := StrToFLoat(MeBaixaJuro.Text);
             end;
             If wPagto_Juro>0 then
               begin
                 QContasReceberBaixaMov.Insert;
                 QContasReceberBaixaMovVal_Movimento.Value:=wPagto_Juro;
                 QContasReceberBaixaMovDt_Movimento.Value:=StrToDate(MEDataBaixa.Text);
                 QContasReceberBaixaMovDesc_Observacao.Value:=MEObservacao.Text;
                 QContasReceberBaixaMovInd_Tipo_Movimento.Value:='RECEBTO. JUROS';
                 QContasReceberBaixaMovInd_Forma_Pagamento.Value:=RGFormaPagto.Items[RGFormaPagto.ItemIndex];
                 if trim(MECodAdiantamento.text) <> '' then  // solicitado pelo Odirlei - acrescentar juros nos adiantamentos
                   QContasReceberBaixaMovCOD_ADIANTAMENTO.Value    := strtoint(trim(MECodAdiantamento.text))
                 else
                   QContasReceberBaixaMovCOD_ADIANTAMENTO.text    := '';
                 If ChDevolucao.Checked then
                    QContasReceberBaixaMovInd_Devolucao.Value:='SIM';
                 If ChTroca.Checked then
                    QContasReceberBaixaMovInd_Troca.Value:='SIM';
                 if RGFormaPagto.ItemIndex = 0 then  // Caixa
                   Begin
                    If wHistoricoJuro <> '' then
                    Begin
                      DMCaixa.IncluiCaixa(QContasReceberBaixaCod_Filial.Value,QContasReceberBaixaCod_Departamento.Value,
                                          StrToInt(wHistoricoJuro),wPagto_Juro,QContasReceberBaixaNum_Titulo.Value,
                                          QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaNome.Value,
                                          StrToDate(MEDataBaixa.Text),'',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'');
                       QContasReceberBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
                    End;
                   End
                 else
                   if RGFormaPagto.ItemIndex = 1 then  // Banco
                    Begin
                     If wHistoricoJuro <> '' then
                      Begin
                        DMBancoAgencia.IncluiBanco(StrToInt(wHistoricoJuro),StrToInt(MECodContaCorrente.Text),StrToInt(MENumCheque.Text),
                            QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaCod_Departamento.Value,StrToDate(MEDataBaixa.Text),
                            wPagto_Juro,QContasReceberBaixaNome.Value,'Título :'+FloatToStr(QContasReceberBaixaNum_Titulo.Value)+' Parcela: '+FloatToStr(QContasReceberBaixaNum_Parcela.Value),
                            '',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'N','');
                        QContasReceberBaixaMovCod_Bco_Movimento.Value:=DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
                      end;
                    End;
                 If DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' Then
                   Begin
                     wCodDoc:=QContasReceberBaixaCod_Conta_Receber_Cab.Value;
                     wNumDoc:=FloatToStr(QContasReceberBaixaNum_Titulo.Value)+'-'+Trim(QContasReceberBaixaNome.Value);
                     wFilial:=QContasReceberBaixaCod_Filial.Value;
                     wFilial_Contabil:=QContasReceberBaixaCod_Filial.Value;
                     wContaCred:=DMFinalidade.QFinalidadeCOD_CONTABIL_VL_JURO_CRED.Value;
                     If RGFormaPagto.ItemIndex=0 then  // Caixa
                        wContaDeb:=DMFinalidade.QFinalidadeCOD_CONTABIL_VL_JURO_DEB.Value
                     Else
                      Begin
                        If RGFormaPagto.ItemIndex = 2 then  //contabil
                         Begin
                           if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') And
                              (DMParamSistema.QParamSistemaDesc_Empresa.Value <> 'GRUPO CAVALCA') And
                              (QContasReceberBaixaCod_Filial.Value <> 9) Then
                              wFilial_Contabil := 1;
                           wContaDeb:=DMFinalidade.QFinalidadeCOD_CONTABIL_JURO_CONT_DEB.Value;
                         End
                        Else
                         Begin       // bancos
                           wFilial_Contabil  := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value; // acessado no botao da tela
                           wContaDeb:=DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Juro_Bco_Deb.Value;
                         End;
                      End;
                     wCodCompl:=QContasReceberBaixaCod_Cadastro.Value;
                     wVlrLancto:=wPagto_Juro;
                     wDtLancto:=StrToDate(MEDataBaixa.Text);
                     If (wContaCred <> '') And
                        (wContaDeb  <> '') Then
                     Begin
                       wCodHistorico:=StrToInt(wHistoricoContabil);
                       DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
                       QContasReceberBaixaMovCOD_LANCTO_CONTABIL_CRED.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                       DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial_Contabil,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
                       QContasReceberBaixaMovCOD_LANCTO_CONTABIL_DEB.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                     End;
                   End;
                  QContasReceberBaixaMov.Post;
               end;  // FINAL BEGIN JUROS

            //Inclui no Movimento a Baixa
            If wValor_Baixa > 0 then
              Begin
                QContasReceberBaixaMov.Insert;
                QContasReceberBaixaMovVal_Movimento.Value:=wValor_Baixa - wValor_Desconto;
                QContasReceberBaixaMovDt_Movimento.Value:=StrToDate(MEDataBaixa.Text);
                QContasReceberBaixaMovDesc_Observacao.Value:=MEObservacao.Text;
                QContasReceberBaixaMovInd_Tipo_Movimento.Value:='RECEBTO. PRINCIPAL';
                QContasReceberBaixaMovInd_Forma_Pagamento.Value:=RGFormaPagto.Items[RGFormaPagto.ItemIndex];
                if trim(MECodAdiantamento.text) <> '' then  // solicitado pelo Odirlei - acrescentar juros nos adiantamentos
                  QContasReceberBaixaMovCOD_ADIANTAMENTO.Value    := strtoint(trim(MECodAdiantamento.text))
                else
                  QContasReceberBaixaMovCOD_ADIANTAMENTO.text    := '';
                If ChDevolucao.Checked then
                   QContasReceberBaixaMovInd_Devolucao.Value:='SIM';
                If ChTroca.Checked then
                   QContasReceberBaixaMovInd_Troca.Value:='SIM';
                If Trim(MeCodNota.Text) <> '' Then
                   QContasReceberBaixaMovCod_Nota_Cab.Value:=StrToInt(Trim(MeCodNota.Text));
                // Inclusão do Movimento de Caixa
                if RGFormaPagto.ItemIndex=0 then
                 Begin
                  If wHistoricoBaixa <> '' then
                    Begin
                      If DmParamSistema.QParamSistemaInd_Tipo_Integracao.Value='C' Then  // INTEGRAÇÃO CONTABIL VIA CAIXA
                         wVlrLancto:=wValor_Baixa
                      Else
                         wVlrLancto:=wValor_Baixa - wValor_Desconto;
                      wDepartamento := 0;
                      if trim(FmDepartamento1.MeDepartamento.Text) <> '' then
                        wDepartamento := StrToInt(Trim(FmDepartamento1.MeDepartamento.Text))
                      else
                        wDepartamento := QContasReceberBaixaCod_Departamento.Value;
                      DMCaixa.IncluiCaixa(QContasReceberBaixaCod_Filial.Value,wDepartamento,
                                          StrToInt(wHistoricoBaixa),wVlrLancto,QContasReceberBaixaNum_Titulo.Value,
                                          QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaNome.Value,
                                          StrToDate(MEDataBaixa.Text),'',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'');
                      QContasReceberBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
                    end;
                 end
                else
                  if RGFormaPagto.ItemIndex = 1 then  // PAGTO POR BANCOS
                   Begin
                    If wHistoricocheque <> '' then
                      begin
                        DMBancoAgencia.IncluiBanco(StrToInt(wHistoricoCheque),StrToInt(MECodContaCorrente.Text),StrToInt(MENumCheque.Text),
                            QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaCod_Departamento.Value,StrToDate(MEDataBaixa.Text),
                            wValor_Baixa - wValor_Desconto,QContasReceberBaixaNome.Value,'Título :'+FloatToStr(QContasReceberBaixaNum_Titulo.Value)+' Parcela: '+FloatToStr(QContasReceberBaixaNum_Parcela.Value),
                            '',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'N','');
                        QContasReceberBaixaMovCod_Bco_Movimento.Value:=DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;

                        DMFinalidade.QFinalidade.Close;
                        DMFinalidade.QFinalidade.SetVariable('PK', QContasReceberBaixaCOD_FINALIDADE.Value);
                        DMFinalidade.QFinalidade.Open;

                        DMHistorico.QHistorico.Close;
                        DMHistorico.QHistorico.SetVariable('PK', DMFinalidade.QFinalidadeCOD_HISTORICO_BAIXA.Value);
                        DMHistorico.QHistorico.open;
// foi colocado em uma trigger
//                        if(DMHistorico.QHistoricoCOD_HISTORICO_CAIXA.Value > 0) and (DMHistorico.QHistoricoCOD_DEPARTAMENTO.Value > 0) then
                          //CHAMA PROCEDURE NO BANCO QUE GERA UM LANÇAMENTO NO CAIXA
//                          DMContasReceber.OPBanco.CallProcedure('PROC_ATUALIZA_MOV_CAIXA',[DMUsuario.CodUsuarioCorrente,0,DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value,'',0]);

                      end;
                   End;
                // Inclusão do Lançamento Contábil
                If DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' Then
                  Begin
                    wCodDoc:=QContasReceberBaixaCod_Conta_Receber_Cab.Value;
                    wNumDoc:=FloatToStr(QContasReceberBaixaNum_Titulo.Value)+'-'+Trim(QContasReceberBaixaNome.Value);
                    wFilial:=              QContasReceberBaixaCod_Filial.Value;
                    wFilial_Contabil:=     QContasReceberBaixaCod_Filial.Value;
                    wContaCred:=DMFinalidade.QFinalidadeCOD_CONTABIL_VL_BAIXA_CRED.Value;
                    If RGFormaPagto.ItemIndex = 0 then
                       wContaDeb:=DMFinalidade.QFinalidadeCOD_CONTABIL_VL_BAIXA_DEB.Value
                    Else
                     Begin
                       If RGFormaPagto.ItemIndex = 2 then
                        Begin
                          if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') And
                             (DMParamSistema.QParamSistemaDesc_Empresa.Value <> 'GRUPO CAVALCA') And
                             (QContasReceberBaixaCod_Filial.Value <> 9) Then
                             wFilial_Contabil := 1;
                          wContaDeb :=DMFinalidade.QFinalidadeCOD_CONTABIL_BAIXA_CONT_DEB.Value;
                          wContaCred:=DMFinalidade.QFinalidadeCOD_CONTABIL_BAIXA_CONT_CRED.Value;
                        End
                       Else
                        Begin
                          wFilial_Contabil  := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value; // acessado no botao da tela
                          wContaDeb:=DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Prin_Bco_Deb.Value;
                        End;
                     End;
                    wCodCompl:=QContasReceberBaixaCod_Cadastro.Value;
                    wVlrLancto:=wValor_Baixa;
                    wDtLancto:=StrToDate(MEDataBaixa.Text);
                    If (wContaCred <> '') And (wContaDeb  <> '') Then
                    Begin
                      wCodHistorico:=StrToInt(wHistoricoContabil);
                      DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
                      QContasReceberBaixaMovCod_lancto_contabil_Cred.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                      DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial_Contabil,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
                      QContasReceberBaixaMovCod_lancto_contabil_Deb.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                    End;
                  End;
                //------alterado César: 24/01/2008.
                if trim(MECodAdiantamento.text) <> '' then
                  QContasReceberBaixaMovCOD_ADIANTAMENTO.Value    := strtoint(trim(MECodAdiantamento.text))
                else
                  QContasReceberBaixaMovCOD_ADIANTAMENTO.text    := '';

                //--------------------------
                QContasReceberBaixaMov.Post;
              End; // Termino da Inclusão dos Movimentos de Baixa    

               //inicio movimemto de baixa recceb.cheque tempermed
              if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED') AND (Trim(MeValorCheque.Text) <> '')) then
              Begin
                if (Trim(MEValorDesconto.Text) <> '') and ((Trim(MeValorBaixa.Text) = '') or (Trim(MEValorBaixa.Text) = '0')) then
                  wValor_Desconto := StrToFloat(MEValorDesconto.Text) + 0;
                QContasReceberBaixaMov.Insert;
                //if StrToFloat(MeValorCheque.Text) > StrToFloat(QContasReceberBaixaVAL_TITULO.Text) then
                //  Raise Exception.Create('Valor do Cheque não pode ser maior que o valor do título');
                if wValor_Baixa = 0 then
                  QContasReceberBaixaMovVal_Movimento.Value:=StrToFloat(MeValorCheque.Text) - wValor_Desconto
                else
                  QContasReceberBaixaMovVal_Movimento.Value:=StrToFloat(MeValorCheque.Text);
                QContasReceberBaixaMovDt_Movimento.Value:=StrToDate(MEDataBaixa.Text);
                QContasReceberBaixaMovDesc_Observacao.Value:=MEObservacao.Text;
                QContasReceberBaixaMovInd_Tipo_Movimento.Value:='RECEBTO. PRINCIPAL';
                QContasReceberBaixaMovInd_Forma_Pagamento.Value:=RGFormaPagto.Items[RGFormaPagto.ItemIndex];
                if trim(MECodAdiantamento.text) <> '' then  // solicitado pelo Odirlei - acrescentar juros nos adiantamentos
                  QContasReceberBaixaMovCOD_ADIANTAMENTO.Value    := strtoint(trim(MECodAdiantamento.text))
                else
                  QContasReceberBaixaMovCOD_ADIANTAMENTO.text    := '';
                If ChDevolucao.Checked then
                   QContasReceberBaixaMovInd_Devolucao.Value:='SIM';
                If ChTroca.Checked then
                   QContasReceberBaixaMovInd_Troca.Value:='SIM';
                If Trim(MeCodNota.Text) <> '' Then
                   QContasReceberBaixaMovCod_Nota_Cab.Value:=StrToInt(Trim(MeCodNota.Text));
                // Inclusão do Movimento de Caixa
                if RGFormaPagto.ItemIndex=0 then
                 Begin
                  If wHistoricoBaixa <> '' then
                    Begin
                      if ((Trim(MeValorBaixa.Text) = '') or (Trim(MEValorBaixa.Text) = '0') or (Trim(MEValorBaixa.Text) = '0,00')) then
                        wVlrLancto:=StrToFLoat(MeValorCheque.Text) - wValor_Desconto
                      Else
                        wVlrLancto:=STrToFloat(MeValorCheque.Text);
                      DMCaixa.IncluiCaixa(QContasReceberBaixaCod_Filial.Value,QContasReceberBaixaCod_Departamento.Value,
                                          StrToInt(MeHistoricoCheque.Text),wVLrLancto,QContasReceberBaixaNum_Titulo.Value,
                                          QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaNome.Value,
                                          StrToDate(MEDataBaixa.Text),'',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'');
                      QContasReceberBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
                    end;
                 end
                else
                  if RGFormaPagto.ItemIndex = 1 then  // PAGTO POR BANCOS
                   Begin
                    If wHistoricocheque <> '' then
                      begin
                        DMBancoAgencia.IncluiBanco(StrToInt(wHistoricoCheque),StrToInt(MECodContaCorrente.Text),StrToInt(MENumCheque.Text),
                            QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaCod_Departamento.Value,StrToDate(MEDataBaixa.Text),
                            wValor_Baixa - wValor_Desconto,QContasReceberBaixaNome.Value,'Título :'+FloatToStr(QContasReceberBaixaNum_Titulo.Value)+' Parcela: '+FloatToStr(QContasReceberBaixaNum_Parcela.Value),
                            '',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'N','');
                        QContasReceberBaixaMovCod_Bco_Movimento.Value:=DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;

                        DMFinalidade.QFinalidade.Close;
                        DMFinalidade.QFinalidade.SetVariable('PK', QContasReceberBaixaCOD_FINALIDADE.Value);
                        DMFinalidade.QFinalidade.Open;

                        DMHistorico.QHistorico.Close;
                        DMHistorico.QHistorico.SetVariable('PK', DMFinalidade.QFinalidadeCOD_HISTORICO_BAIXA.Value);
                        DMHistorico.QHistorico.open;
// foi colocado em uma trigger
//                        if(DMHistorico.QHistoricoCOD_HISTORICO_CAIXA.Value > 0) and (DMHistorico.QHistoricoCOD_DEPARTAMENTO.Value > 0) then
                          //CHAMA PROCEDURE NO BANCO QUE GERA UM LANÇAMENTO NO CAIXA
//                          DMContasReceber.OPBanco.CallProcedure('PROC_ATUALIZA_MOV_CAIXA',[DMUsuario.CodUsuarioCorrente,0,DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value,'',0]);

                      end;
                   End;
                // Inclusão do Lançamento Contábil
                If DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' Then
                  Begin
                    wCodDoc:=QContasReceberBaixaCod_Conta_Receber_Cab.Value;
                    wNumDoc:=FloatToStr(QContasReceberBaixaNum_Titulo.Value)+'-'+Trim(QContasReceberBaixaNome.Value);
                    wFilial:=              QContasReceberBaixaCod_Filial.Value;
                    wFilial_Contabil:=     QContasReceberBaixaCod_Filial.Value;
                    wContaCred:=DMFinalidade.QFinalidadeCOD_CONTABIL_VL_BAIXA_CRED.Value;
                    If RGFormaPagto.ItemIndex = 0 then
                       wContaDeb:=DMFinalidade.QFinalidadeCOD_CONTABIL_VL_BAIXA_DEB.Value
                    Else
                     Begin
                       If RGFormaPagto.ItemIndex = 2 then
                        Begin
                          if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') And
                             (DMParamSistema.QParamSistemaDesc_Empresa.Value <> 'GRUPO CAVALCA') And
                             (QContasReceberBaixaCod_Filial.Value <> 9) Then
                             wFilial_Contabil := 1;
                          wContaDeb :=DMFinalidade.QFinalidadeCOD_CONTABIL_BAIXA_CONT_DEB.Value;
                          wContaCred:=DMFinalidade.QFinalidadeCOD_CONTABIL_BAIXA_CONT_CRED.Value;
                        End
                       Else
                        Begin
                          wFilial_Contabil  := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value; // acessado no botao da tela
                          wContaDeb:=DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Prin_Bco_Deb.Value;
                        End;
                     End;
                    wCodCompl:=QContasReceberBaixaCod_Cadastro.Value;
                    wVlrLancto:=wValor_Baixa;
                    wDtLancto:=StrToDate(MEDataBaixa.Text);
                    If (wContaCred <> '') And (wContaDeb  <> '') Then
                    Begin
                      wCodHistorico:=StrToInt(wHistoricoContabil);
                      DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
                      QContasReceberBaixaMovCod_lancto_contabil_Cred.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                      DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial_Contabil,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
                      QContasReceberBaixaMovCod_lancto_contabil_Deb.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                    End;
                  End;
                //------alterado César: 24/01/2008.
                if trim(MECodAdiantamento.text) <> '' then
                  QContasReceberBaixaMovCOD_ADIANTAMENTO.Value    := strtoint(trim(MECodAdiantamento.text))
                else
                  QContasReceberBaixaMovCOD_ADIANTAMENTO.text    := '';

                //--------------------------
                QContasReceberBaixaMov.Post;

              End; // Termino da Inclusão dos Movimentos de Baixa de cheque tempermed

            If wValor_Desconto>0 then
              Begin     //Inclui no Movimento o Desconto
                QContasReceberBaixaMov.Insert;
                QContasReceberBaixaMovVal_Movimento.Value:=wValor_Desconto;
                QContasReceberBaixaMovDt_Movimento.Value:=StrToDate(MEDataBaixa.Text);
                QContasReceberBaixaMovDesc_Observacao.Value:=MEObservacao.Text;
                QContasReceberBaixaMovInd_Tipo_Movimento.Value:='DESC. CONCEDIDO';
                QContasReceberBaixaMovInd_Forma_Pagamento.Value:=RGFormaPagto.Items[RGFormaPagto.ItemIndex];
                if trim(MECodAdiantamento.text) <> '' then  // odirlei brasperon pediu para acrescentar os descontos no adiantamento
                  QContasReceberBaixaMovCOD_ADIANTAMENTO.Value    := strtoint(trim(MECodAdiantamento.text))
                else
                  QContasReceberBaixaMovCOD_ADIANTAMENTO.text    := '';
                If ChDevolucao.Checked then
                   QContasReceberBaixaMovInd_Devolucao.Value:='SIM';
                If ChTroca.Checked then
                   QContasReceberBaixaMovInd_Troca.Value:='SIM';
                If RGFormaPagto.ItemIndex=1 then // Pagto em Cheque
                   QContasReceberBaixaMovCod_Bco_Movimento.Value:=DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
                If RGFormaPagto.ItemIndex=0 then // Pagto em dinheiro
                  If wHistoricoDesc <> '' then
                    Begin
                      DMCaixa.IncluiCaixa(QContasReceberBaixaCod_Filial.Value,QContasReceberBaixaCod_Departamento.Value,
                                          StrToInt(wHistoricoDesc),wValor_Desconto,QContasReceberBaixaNum_Titulo.Value,
                                          QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaNome.Value,
                                          StrToDate(MEDataBaixa.Text),'',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'');
                      QContasReceberBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
                    End;
                If DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' Then
                  Begin
                    wCodDoc:=QContasReceberBaixaCod_Conta_Receber_Cab.Value;
                    wNumDoc:=FloatToStr(QContasReceberBaixaNum_Titulo.Value)+'-'+Trim(QContasReceberBaixaNome.Value);
                    wFilial:=QContasReceberBaixaCod_Filial.Value;
                    wFilial_Contabil:=QContasReceberBaixaCod_Filial.Value;
                    If RGFormaPagto.ItemIndex=0 then // Pagto em dinheiro
                       wContaCred:=DMFinalidade.QFinalidadeCOD_CONTABIL_VL_DESC_CRED.Value
                    Else
                     Begin
                       If RGFormaPagto.ItemIndex = 2 then
                        Begin
                          if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') And
                             (DMParamSistema.QParamSistemaDesc_Empresa.Value <> 'GRUPO CAVALCA') And
                             (QContasReceberBaixaCod_Filial.Value <> 9) Then
                             wFilial_Contabil := 1;
                          wContaCred:=DMFinalidade.QFinalidadeCOD_CONTABIL_DESC_CONT_CRED.Value;
                        End
                       Else
                        Begin
                          wContaCred:=DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Desc_Bco_Cred.Value;
                          wFilial_Contabil  := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value; // acessado no botao da tela
                        End;
                     End;
                    wContaDeb:=DMFinalidade.QFinalidadeCOD_CONTABIL_VL_DESC_DEB.Value;
                    wCodCompl:=QContasReceberBaixaCod_Cadastro.Value;
                    wVlrLancto:=wValor_Desconto;;
                    wDtLancto:=StrToDate(MEDataBaixa.Text);
                    If (wContaCred <> '') And
                       (wContaDeb  <> '') Then
                    Begin
                      wCodHistorico:=StrToInt(wHistoricoContabil);
                      DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial_Contabil,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
                      QContasReceberBaixaMovCod_lancto_contabil_Cred.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                      DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
                      QContasReceberBaixaMovCod_lancto_contabil_Deb.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                    End;
                  End;
                QContasReceberBaixaMov.Post;
              End; // Término da Inclusao do Movimento de Desconto

            If Trim(MeVariacaoPos.Text) <> '' then
              Begin     //Inclui no Movimento Variação Cambial Positiva
                QContasReceberBaixaMov.Insert;
                QContasReceberBaixaMovVal_Movimento.Value:=StrToFloat(Trim(MeVariacaoPos.Text));
                QContasReceberBaixaMovDt_Movimento.Value:=StrToDate(MEDataBaixa.Text);
                QContasReceberBaixaMovDesc_Observacao.Value:=MEObservacao.Text;
                QContasReceberBaixaMovInd_Tipo_Movimento.Value:='VARIACAO POS';
                QContasReceberBaixaMovInd_Forma_Pagamento.Value:=RGFormaPagto.Items[RGFormaPagto.ItemIndex];
                If ChDevolucao.Checked then
                   QContasReceberBaixaMovInd_Devolucao.Value:='SIM';
                If ChTroca.Checked then
                   QContasReceberBaixaMovInd_Troca.Value:='SIM';
                wHistoricoVar_Pos:=DMFinalidade.QFinalidadeCOD_HISTORICO_VARIACAO_POS.Text;
                If RGFormaPagto.ItemIndex=0 then // Pagto em dinheiro
                 Begin
                   If wHistoricoVar_Pos <> '' then
                    Begin
                      DMCaixa.IncluiCaixa(QContasReceberBaixaCod_Filial.Value,QContasReceberBaixaCod_Departamento.Value,
                                          StrToInt(wHistoricoVar_Pos),StrToFloat(Trim(MeVariacaoPos.Text)),QContasReceberBaixaNum_Titulo.Value,
                                          QContasReceberBaixaCod_Cadastro.Value,'Variacao Cambial +',
                                          StrToDate(MEDataBaixa.Text),'',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'');
                      QContasReceberBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
                    End;
                 end
                else
                 If wHistoricoVar_Pos <> '' then
                  begin
                    DMBancoAgencia.IncluiBanco(StrToInt(wHistoricoVar_Pos),StrToInt(MECodContaCorrente.Text),StrToInt(MENumCheque.Text),
                        QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaCod_Departamento.Value,StrToDate(MEDataBaixa.Text),
                        StrToFloat(Trim(MeVariacaoPos.Text)),QContasReceberBaixaNome.Value,'Título :'+FloatToStr(QContasReceberBaixaNum_Titulo.Value)+' Parcela: '+FloatToStr(QContasReceberBaixaNum_Parcela.Value),
                        '',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'N','');
                    QContasReceberBaixaMovCod_Bco_Movimento.Value:=DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
                  end;
                If DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' Then
                  Begin
                    wCodDoc:=QContasReceberBaixaCod_Conta_Receber_Cab.Value;
                    wNumDoc:=FloatToStr(QContasReceberBaixaNum_Titulo.Value)+'-'+Trim(QContasReceberBaixaNome.Value);
                    wFilial:=QContasReceberBaixaCod_Filial.Value;
                    wFilial_Contabil:=QContasReceberBaixaCod_Filial.Value;
                    wContaCred:=DMFinalidade.QFinalidadeCOD_CONTABIL_VARIACAO_POS_CRED.Value;
                    wContaDeb:=DMFinalidade.QFinalidadeCOD_CONTABIL_VARIACAO_POS_DEB.Value;
                    wCodCompl:=QContasReceberBaixaCod_Cadastro.Value;
                    wVlrLancto:=StrToFloat(Trim(MeVariacaoPos.Text));
                    wDtLancto:=StrToDate(MEDataBaixa.Text);
                    If (wContaCred <> '') And
                       (wContaDeb  <> '') Then
                    Begin
                      wCodHistorico:=StrToInt(wHistoricoContabil);
                      DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial_Contabil,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
                      QContasReceberBaixaMovCod_lancto_contabil_Cred.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                      DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
                      QContasReceberBaixaMovCod_lancto_contabil_Deb.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                    End;
                  End;
                QContasReceberBaixaMov.Post;
              End; // Término da Inclusao do Movimento de Variação Cambial Positiva

            If Trim(MeVariacaoNeg.Text) <> '' then
             Begin     //Inclui no Movimento Variação Cambial Negativa
               QContasReceberBaixaMov.Insert;
               QContasReceberBaixaMovVal_Movimento.Value:=StrToFloat(Trim(MeVariacaoNeg.Text));
               QContasReceberBaixaMovDt_Movimento.Value:=StrToDate(MEDataBaixa.Text);
               QContasReceberBaixaMovDesc_Observacao.Value:=MEObservacao.Text;
               QContasReceberBaixaMovInd_Tipo_Movimento.Value:='VARIACAO NEG';
               QContasReceberBaixaMovInd_Forma_Pagamento.Value:=RGFormaPagto.Items[RGFormaPagto.ItemIndex];
               If ChDevolucao.Checked then
                  QContasReceberBaixaMovInd_Devolucao.Value:='SIM';
                If ChTroca.Checked then
                   QContasReceberBaixaMovInd_Troca.Value:='SIM';
               wHistoricoVar_Neg:=DMFinalidade.QFinalidadeCOD_HISTORICO_VARIACAO_NEG.Text;
               If RGFormaPagto.ItemIndex=0 then // Pagto em dinheiro
                Begin
                  If wHistoricoVar_Neg <> '' then
                   Begin
                      DMCaixa.IncluiCaixa(QContasReceberBaixaCod_Filial.Value,QContasReceberBaixaCod_Departamento.Value,
                                          StrToInt(wHistoricoVar_Neg),StrToFloat(Trim(MeVariacaoNeg.Text)),QContasReceberBaixaNum_Titulo.Value,
                                          QContasReceberBaixaCod_Cadastro.Value,'Variacao Cambial -',
                                          StrToDate(MEDataBaixa.Text),'',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'');
                     QContasReceberBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
                   End;
                 end
                else
                 If wHistoricoVar_Neg <> '' then
                  begin
                    DMBancoAgencia.IncluiBanco(StrToInt(wHistoricoVar_Neg),StrToInt(MECodContaCorrente.Text),StrToInt(MENumCheque.Text),
                        QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaCod_Departamento.Value,StrToDate(MEDataBaixa.Text),
                        StrToFloat(Trim(MeVariacaoNeg.Text)),QContasReceberBaixaNome.Value,'Título :'+FloatToStr(QContasReceberBaixaNum_Titulo.Value)+' Parcela: '+FloatToStr(QContasReceberBaixaNum_Parcela.Value),
                        '',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'N','');
                    QContasReceberBaixaMovCod_Bco_Movimento.Value:=DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
                  end;
                If DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' Then
                  Begin
                    wCodDoc:=QContasReceberBaixaCod_Conta_Receber_Cab.Value;
                    wNumDoc:=FloatToStr(QContasReceberBaixaNum_Titulo.Value)+'-'+Trim(QContasReceberBaixaNome.Value);
                    wFilial:=QContasReceberBaixaCod_Filial.Value;
                    wFilial_Contabil:=QContasReceberBaixaCod_Filial.Value;
                    wContaCred:=DMFinalidade.QFinalidadeCOD_CONTABIL_VARIACAO_NEG_CRED.Value;
                    wContaDeb:=DMFinalidade.QFinalidadeCOD_CONTABIL_VARIACAO_NEG_DEB.Value;
                    wCodCompl:=QContasReceberBaixaCod_Cadastro.Value;
                    wVlrLancto:=StrToFloat(Trim(MeVariacaoNeg.Text));
                    wDtLancto:=StrToDate(MEDataBaixa.Text);
                    If (wContaCred <> '') And
                       (wContaDeb  <> '') Then
                    Begin
                      wCodHistorico:=StrToInt(wHistoricoContabil);
                      DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial_Contabil,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
                      QContasReceberBaixaMovCod_lancto_contabil_Cred.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                      DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
                      QContasReceberBaixaMovCod_lancto_contabil_Deb.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                    End;
                  End;
                QContasReceberBaixaMov.Post;
              End; // Término da Inclusao do Movimento de Variação Cambial Negativa
            If wVlrDevolucao>0 then
              Begin     //Inclui no Movimento o devolucao
                wHistoricoDev:=DMFinalidade.QFinalidadeCOD_HISTORICO_CAIXA_DEVOLUCAO.Text;
                QContasReceberBaixaMov.Insert;
                QContasReceberBaixaMovVal_Movimento.Value:=wVlrDevolucao;
                QContasReceberBaixaMovDt_Movimento.Value:=StrToDate(MEDataBaixa.Text);
                QContasReceberBaixaMovDesc_Observacao.Value:=MEObservacao.Text;
                QContasReceberBaixaMovInd_Tipo_Movimento.Value:='DEVOLUCAO';
                QContasReceberBaixaMovInd_Forma_Pagamento.Value:=RGFormaPagto.Items[RGFormaPagto.ItemIndex];
                If ChDevolucao.Checked then
                   QContasReceberBaixaMovInd_Devolucao.Value:='SIM';
                If ChTroca.Checked then
                   QContasReceberBaixaMovInd_Troca.Value:='SIM';
                If RGFormaPagto.ItemIndex = 1 then // Pagto em Cheque
                   QContasReceberBaixaMovCod_Bco_Movimento.Value:=DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
                If RGFormaPagto.ItemIndex = 0 then // Pagto em dinheiro
                  If wHistoricoDev <> '' then
                    Begin
                      DMCaixa.IncluiCaixa(QContasReceberBaixaCod_Filial.Value,QContasReceberBaixaCod_Departamento.Value,
                                          StrToInt(wHistoricoDev),wVlrDevolucao,QContasReceberBaixaNum_Titulo.Value,
                                          QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaNome.Value,
                                          StrToDate(MEDataBaixa.Text),'',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'');
                      QContasReceberBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
                    End;
                QContasReceberBaixaMov.Post;
              End; // Término da Inclusao do Movimento de Desconto


            // Término da Inclusão de Movimentos
            QContasReceber_Cab.AutoCalcFields:=False;
            QContasReceber_Cab.Close;
            QContasReceber_Cab.SetVariable('PK',QContasReceberBaixaCod_Conta_Receber_Cab.Value);
            QContasReceber_Cab.Open;
            QContasReceber_Cab.Edit;
            If wVlrDevolucao > 0 Then
               QContasReceber_CabVal_Titulo.Value:=QContasReceber_CabVal_Titulo.Value - wVlrDevolucao;
{            If (wValor_Baixa+wPagto_Juro > QContasReceber_CabVal_Juros.Value + wValor_Juro) then
               begin
                 QContasReceber_CabVal_Juros.Value:=0;
                 QContasReceber_CabVal_Titulo.Value:=QContasReceber_CabVal_Titulo.Value+(QContasReceber_CabVal_Juros.Value-(Trunc(wValor_Baixa*100)/100));
               end
            Else
               QContasReceber_CabVal_Juros.Value:=QContasReceber_CabVal_Juros.Value+Trunc(wValor_Juro*100)/100-(Trunc(wValor_Baixa*100)/100+Trunc(wPagto_Juro*100)/100);
}
            If Trim(MeHistoricoCheque.Text) <> '' Then
              QContasReceber_CabVAL_TITULO.Value := QContasReceber_CabVAL_TITULO.Value-(Trunc(wValor_Baixa*100)/100)-StrToFloat(Trim(MevalorCheque.Text))
            else  
              QContasReceber_CabVal_Titulo.Value:=QContasReceber_CabVal_Titulo.Value-(Trunc(wValor_Baixa*100)/100);
            If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO' Then
             Begin
               If wGuardaJuro <> '' Then
                  QContasReceber_CabVal_Juros.Value := StrToFloat(wGuardaJuro) - wPagto_Juro;
             End;
            // Muda a Situção do Título
            QContasReceber_CabVal_Titulo.Value := Trunc(QContasReceber_CabVal_Titulo.Value * 1000);
            QContasReceber_CabVal_Titulo.Value := QContasReceber_CabVal_Titulo.Value / 1000;
            If QContasReceber_CabVal_Titulo.Value = 0 then
             Begin
               If StrToDate(MEDataBaixa.Text) > QContasReceber_CabDT_Baixa.Value Then
                  QContasReceber_CabDT_Baixa.Value:=StrToDate(MEDataBaixa.Text);
               QContasReceber_CabInd_Situacao.Value:='BAIXA TOTAL';
               QContasReceber_CabVal_Juros.Value := 0;  // para não ficar residuos de juros no sistema
               QContasReceber_CabDT_Capitalizacao_Moeda.Value:=StrToDate(MEDataBaixa.Text);
               If DmParamSistema.QParamSistemaCOD_EMPRESA.value <> 'MOINHO' Then
                  QContasReceber_CabDT_Capitalizacao.Value:=StrToDate(MEDataBaixa.Text);
             End
            Else
              Begin
                If (wValor_Juro > 0) And (DmParamSistema.QParamSistemaCOD_EMPRESA.value <> 'MOINHO') Then
                  If StrToDate(MEDataBaixa.Text) > QContasReceber_CabDT_Capitalizacao.Value Then
                   Begin
                     QContasReceber_CabDT_Capitalizacao.Value := StrToDate(MEDataBaixa.Text);
                     QContasReceber_CabDT_Capitalizacao_Moeda.Value := StrToDate(MEDataBaixa.Text);
                   End;
                QContasReceber_CabInd_Situacao.Value:='BAIXA PARCIAL';
                If StrToDate(MEDataBaixa.Text) > QContasReceber_CabDT_Baixa.Value Then
                   QContasReceber_CabDT_Baixa.Value := StrToDate(MEDataBaixa.Text);
              End;
            QContasReceber_Cab.Post;
            QContasReceber_Cab.AutoCalcFields:=True;

            if not wBaixaEmLote then //quando for baixa em lote o commit é dado apenas ao fim de todas as baixas
              DMOracle.DBCemapa.Commit; // Fim da transação
          except
            If QContasReceberBaixaMov.State in [DsInsert,DsEdit] Then
               QContasReceberBaixaMov.Cancel;

            if not wBaixaEmLote then
              DMOracle.DBCemapa.RollBack;

            DMCaixa.QCaixa_Mov.AutoCalcFields:=True;
            DMBancoAgencia.QBancoMovimento.AutoCalcFields:=True;
            DMContasReceber.QContasReceberBaixaMov.EnableControls;
            QContasReceberBaixaMov.Close;
            QContasReceberBaixaMov.Open;
            raise;
          End;
          If  (
               (not wBaixaEmLote) or //se for baixa em lote nao emite o recibo,
               (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES') //apenas a aristides emite o recibo quando for baixa em lote
              )and
              (wRecibo='S') and
              (wValor_Baixa+wPagto_Juro>0) then
            Begin
              If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES')  Then
              Begin
                 FRecibo_Dos.EmiteRecibo_Dos(Trim(DMContasReceber.QContasReceberBaixaCod_Cadastro.Text) + ' - ' + Trim(DMContasReceber.QContasReceberBaixaNome.Value),
                          DMContasReceber.QContasReceberBaixaNum_Titulo.Text + '/' + DMContasReceber.QContasReceberBaixaNum_Parcela.Text,
                          DMContasReceber.QContasReceberBaixaDt_Vencimento.Value,StrToDate(FContasReceberBaixa.MEDataBaixa.Text),
                          wValor_Baixa,wPagto_Juro,wValor_Desconto, DMContasReceber.QContasReceberBaixaCOD_FILIAL.Value,
                          DMContasReceber.QContasReceberBaixaDESC_FILIAL.Value);
              End
              Else
               Begin
                 If FEmiteRecibo=Nil then
                   FEmiteRecibo:=TFEmiteRecibo.Create(Application);
                 FEmiteRecibo.LCadastro.Caption:='Cliente';
                 FEmiteRecibo.MECodConta.Text:=FloatToStr(DMContasReceber.QContasReceberBaixaCod_Conta_Receber_Cab.Value);
                 FEmiteRecibo.MENrTitulo.Text:=FloatToStr(DMContasReceber.QContasReceberBaixaNum_Titulo.Value);
                 FEmiteRecibo.MEParcela.Text:=FloatToStr(DMContasReceber.QContasReceberBaixaNum_Parcela.Value);
                 FEmiteRecibo.MEFornecedor.Text:=DMContasReceber.QContasReceberBaixaNome.Value;
                 FEmiteRecibo.MEValor.Text:=FloatTostr(wValor_Baixa - wValor_Desconto);
                 FEmiteRecibo.MEJuros.Text:=FloatTostr(wPagto_Juro);
                 FEmiteRecibo.MEDesconto.Text:=FloatTostr(wValor_Desconto);
                 FEmiteRecibo.MEData.Text:=FContasReceberBaixa.MEDataBaixa.Text;
                 FEmiteRecibo.MECodFilial.Text:=FloatToStr(DMContasReceber.QContasReceberBaixaCod_Filial.Value);
                 FEmiteRecibo.MeSaldoTitulo.Text:=DMContasReceber.QContasReceber_CabVal_Titulo.Text;
                 FEmiteRecibo.MeDescricao.Text := DMContasReceber.QContasReceber_CabInd_Situacao.Value + ' - '+Trim(MeObservacao.Text);
                 DMFilial.QFilial.Close;
                 DMFilial.QFilial.SetVariable('PK',DMContasReceber.QContasReceberBaixaCod_Filial.Value);
                 DMFilial.QFilial.Open;
                 FEmiteRecibo.ShowModal;
               End;
            End;
          If DmParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL' Then
            If (not wBaixaEmLote) and //quando é baixa em lote nao emite autenticacao.
               (MessageDlg('Fazer Autenticação em Documento?',
                           mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
             Begin
               if Imp = Nil Then
                  Imp := TImp.Create;
               Imp.AbreImpressora;
               Imp.WriteXY(0,1,DateToStr(Date) + ' - ' + Bib.NumToTexto(wValor_Baixa - wValor_Desconto,2,7) + ' - '+IntToStr(DmUsuario.CodUsuarioCorrente));
               Imp.FechaImpressora;
             End;

            // dar um refresh na tabela de ContasReceberBaixa
            wCodigo:=QContasReceberBaixaCod_Conta_Receber_Cab.Value;
            QContasReceberBaixa.DisableControls;
            QContasReceberBaixa.Close;
            QContasReceberBaixa.Open;
            QContasReceberBaixa.Locate('COD_CONTA_RECEBER_Cab',wCodigo,[]);
            QContasReceberBaixa.EnableControls;
            // Limpa os Campos Mask Edit
            QContasReceberBaixaMov.Close;
            QContasReceberBaixaMov.Open;
            MEValorBaixa.Clear;
            MEValorDesconto.Clear;
            MEValorJuro.Clear;
            MeBaixaJuro.Clear;
            MEObservacao.Clear;
            MEBanco.Clear;
            MECodContaCorrente.Clear;
            MENumCheque.Clear;
            MEVariacaoPos.Clear;
            MEVariacaoNeg.Clear;
            MeDevolucao.Clear;
            MECodAdiantamento.Clear;
            MEAdiantamento.Clear;
            ChDevolucao.Checked := False;
            ChTroca.Checked := False;
            MeValorCheque.Text := '';
            MeHistoricoCheque.Text :='';
          
          If not wBaixaEmLote then
          Begin
            PCBaixa.ActivePage:=TS0Localiza;
            MeDtBaixa.SetFocus;
          End;
        End //  End If
      Else
        if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED') AND (Trim(MeValorCheque.Text) <> '') AND
           (Trim(MeValorBaixa.Text) = '0' )) then
          ShowMessage('Valores Recebidos Somente em Cheques')
        else
          ShowMessage('Erro! Valores incorretos na Baixa. Valores Negativos não podem ser gerados, favor verificar.');
    End; // End With
    DMCaixa.QCaixa_Mov.AutoCalcFields:=True;
    DMBancoAgencia.QBancoMovimento.AutoCalcFields:=True;
    DMContasReceber.QContasReceberBaixaMov.EnableControls;
    If StrToDate(MeDtBaixa.Text) <> Date Then
     Begin
       MeDtBaixa.Text := DateToStr(Date);
       If not wBaixaEmLote then
          MeDtBaixaExit(Self);
     End; 
end;

procedure TFContasReceberBaixa.SpeedButton1Click(Sender: TObject);
begin
  if FCadastrocons = Nil then
    FCadastrocons:=TFCadastrocons.Create(Application);
  If FCadastrocons.ShowModal=MrOk then
     MECodCliente.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
  MECodClienteExit(Self);   
end;

procedure TFContasReceberBaixa.FormCreate(Sender: TObject);
var
  i : integer;
begin
  If DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'ARISTIDES' Then
  Begin
    //DEIXA INVISÍVEL OS COMPONENTES QUE NÃO SERÃO NECESSÁRIOS
    Label17.Visible            := false;
    MECodFilial.Visible        := false;
    SpeedButton8.Visible       := false;
    GroupBox5.Visible          := false;
    Label160.Visible           := false;
    MeFinalidade.Visible       := false;
    Sb1Finalidade.Visible      := false;
    Label31.Visible            := false;
    MeBanco_Baixa.Visible      := false;
    SbBancoCons.Visible        := false;
    Label18.Visible            := false;
    MeNumTitulo.Visible        := false;
    Label20.Visible            := false;
    MeNossoNumero.Visible      := false;
    Label21.Visible            := false;
    MeValor.Visible            := false;
    Label23.Visible            := false;
    MeContrato.Visible         := false;
    MeCodContaReceber.Visible  := False;
    Label35.Visible            := False; 
    //CBMostraBaixaTotal.Visible := false;
    //Label28.Visible            := false;
    //MeTotal.Visible            := false;
    //MeAtualizado.Visible       := false;
//    TabSheet1.TabVisible       := false;

    //ARRUMA OS COMPONENTES QUE FICARAM NA TELA
    MeDtBaixa.Left := 7;
    Label29.Left   := 7;
    GroupBox4.Left := 107;
    GroupBox4.Top  := 15;
    CbOrdem.Left   := 421;
    SBProcura.Left := 576;
    SbProcuraNota.Left := 576;
    SBProcura.Top := 68;
    SbProcuraNota.Top := 42;
    SbAlteraObs.Visible:= True;
    SbAlteraObs.Top := 16;
    SbAlteraObs.Left := 576;
  End;

{  PCBaixa.ActivePage:=TS0Localiza;
  With DMContasReceber do
    Begin}
//  MEDataVencInicial.Text:=DateToStr(DMOracle.DataServ-10);
//  MEDataVencFinal.Text:=DateToStr(DMOracle.DataServ+4);
 {     QContasReceberBaixa.Close;
      QContasReceberBaixa.ParamByName('DT_VENC_INI').AsDate:=DMOracle.DataServ-10;
      QContasReceberBaixa.ParamByName('DT_VENC_FINAL').AsDate:=DMOracle.DataServ+4;
      QContasReceberBaixa.ParamByName('VAL_TITULO').AsFloat:=0;
      QContasReceberBaixa.Open;
      QContasReceberBaixaMov.Close;
      QContasReceberBaixaMov.Open;
    End;
  With DMCaixa do
    Begin
      QCaixa_mov.Close;
      QCaixa_mov.Open;
    End;
  With DMBancoAgencia do
    Begin
      QBancoMovimento.Close;
      QBancoMovimento.Open;
    End;}

end;

procedure TFContasReceberBaixa.SpeedButton8Click(Sender: TObject);
begin
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    MECodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFContasReceberBaixa.SBNotaEntradaConsClick(Sender: TObject);
begin
  If FNotaEntradaConsulta = Nil Then
    FNotaEntradaConsulta:=TFNotaEntradaConsulta.Create(Application);
  With DMContasReceber Do
  Begin
    FNotaEntradaConsulta.MeTexto.Text := QContasReceberBaixaCod_Cadastro.Text;
    FNotaEntradaConsulta.EdOrdemCompra.Text := QContasReceberBaixaCod_Ordem_Compra_Cab.Text;
    QNotaEntradaCons.Close;
    QNotaEntradaCons.SetVariable('COD_ORDEM_COMPRA_CAB',QContasReceberBaixaCod_Ordem_Compra_Cab.Value);
    QNotaEntradaCons.Open;
  End;
  If FNotaEntradaConsulta.ShowModal=MrOk then
     MECodNota.Text:=IntToStr(DMContasReceber.QNotaEntradaConsCod_Nota_Cab.Value);
  DMContasReceber.QNotaEntradaCons.Close;
end;

procedure TFContasReceberBaixa.MECodClienteExit(Sender: TObject);
Var wValor : String;
begin
  If Trim(MECodCliente.Text) <> '' then
   Begin
     MeDataVencInicial.Clear;
     MeDataVencFinal.Clear;
     Metexto.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECodCliente.text);
     wValor:=DMOracle.BuscaNome('SELECT SUM(VAL_TITULO) FROM TB_CONTA_PAGAR_CAB','IND_SITUACAO <> ' + CHR(39) + 'BAIXA TOTAL' + CHR(39) + ' AND COD_CADASTRO = '+MECodCliente.text);
     If wValor <> '' then
        showMessage ('Cliente Possui Titulos a Pagar em Aberto  R$ ' + wValor);
   End
  Else
    MEtexto.Clear;
  If Trim(MECodCliente.Text) <> '' Then
     SBProcuraClick(Self);

end;

procedure TFContasReceberBaixa.MeValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = ',' Then
     Key := '.';
end;

procedure TFContasReceberBaixa.Sb1FinalidadeClick(Sender: TObject);
begin
  If FFinalidadeCons=Nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.ShowModal=mrOk then
    MeFinalidade.Text:=FloatToStr(DMFinalidade.QFinalidadeConsCod_Finalidade.Value);

end;

procedure TFContasReceberBaixa.SbHistoricoDescontoClick(Sender: TObject);
begin
  If FHistoricoCons = Nil Then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=MrOk then
     MeHistoricoDesconto.Text:=DMHistorico.QHistoricoConsCod_Historico.Text;
end;

procedure TFContasReceberBaixa.MECodClienteChange(Sender: TObject);
begin
  If Trim(MECodCliente.Text) <> '' then
    MEDtBaixa.Text := DateToStr(DMOracle.DataServ);
  CbCalculoJuros.Checked := True;  
end;

procedure TFContasReceberBaixa.RG2FormaPagtoClick(Sender: TObject);
begin
  If (RG2FormaPagto.ItemIndex = 0) Or    // Pgto. em Dinheiro
     (RG2FormaPagto.ItemIndex = 2) then  // Pgto. outros so contabil
  Begin
    SB2ConsContaCorrente.Enabled := False;
    ME2Banco.Clear;
    ME2CodContaCorrente.Clear;
    ME2NumCheque.Clear;
    SB2Baixa.Enabled := True;
  End
  Else                              // Pagto. em Cheque
  Begin
    If ME2Banco.Text = '' then
      SB2Baixa.Enabled := False
    Else
      SB2Baixa.Enabled := True;
    SB2ConsContaCorrente.Enabled := True;
  End;
end;

procedure TFContasReceberBaixa.SB2ConsContaCorrenteClick(Sender: TObject);
begin
  If FContaCorrenteCons = Nil Then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  If FContaCorrenteCons.ShowModal = MrOk then
  Begin
    ME2Banco.Text := DMBancoAgencia.QContaCorrenteConsDesc_Banco_Agencia.Value;
    ME2CodContaCorrente.Text := FloatToStr(DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value);
    ME2NumCheque.Text := FloatToStr(DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Value);
    SB2Baixa.Enabled := True;
  End;
end;

procedure TFContasReceberBaixa.SB2BaixaClick(Sender: TObject);
var
  i, cont : integer;
  wRecibo : String;
begin
  if MessageDlg('Deseja realmente baixar todos os itens selecionados', mtConfirmation, [mbyes, mbNo], 0 ) = mryes then
  begin
    cont := 0;
    DMContasReceber_Rel.cdsRContasReceberBaixaLote.Open; //Abre a Query em Memória para inserção de Dados.
    try
      DMOracle.DBCemapa.StartTransaction;

      DMContasReceber.cdContasReceberBaixaLote.First;
      while not DMContasReceber.cdContasReceberBaixaLote.Eof do
//      for i:=0 to ListView1.Items.Count-1 do
      begin
        if DMContasReceber.cdContasReceberBaixaLoteBAIXAR.Value = 'S' then
//        if ListView1.Items.Item[i].Checked then
        begin
          cont := cont + 1;

          if DMContasReceber.QContasReceberBaixa.Locate('COD_CONTA_RECEBER_CAB',DMContasReceber.cdContasReceberBaixaLoteCOD_CONTA_RECEBER_CAB.Value,[]) then
//          if DMContasReceber.QContasReceberBaixa.Locate('COD_CONTA_RECEBER_CAB',StrToInt(ListView1.Items.Item[i].Caption),[]) then
          begin
            if trim(ME2DataBaixa.Text) = '' then
              ME2DataBaixa.Text := dateToStr(DMOracle.DataServ);

            if DMContasReceber.QContasReceberBaixaDT_EMISSAO.Value > StrToDate(Me2DataBaixa.Text) then
              Raise Exception.Create('A data da baixa é menor que a data da emissão do titulo ' +
                                     DMContasReceber.QContasReceberBaixaCOD_CONTA_RECEBER_CAB.Text);

            RGFormaPagto.ItemIndex  := RG2FormaPagto.ItemIndex;
            //MECodBanco.Text         := ME2CodBanco.Text;
            MEBanco.Text            := ME2Banco.Text;
            MECodContaCorrente.Text := ME2CodContaCorrente.Text;
            MENumCheque.Text        := ME2NumCheque.Text;
            DMContasReceber.QContasReceberBaixaMov.Close;
            DMContasReceber.QContasReceberBaixaMov.SetVariable('COD_CONTA_RECEBER_CAB', DMContasReceber.cdContasReceberBaixaLoteCOD_CONTA_RECEBER_CAB.Value);
            DMContasReceber.QContasReceberBaixaMov.Open;

            MEDataBaixa.Text := ME2DataBaixa.Text;
            MeValorJuro.Text := '0';
            MEValorBaixa.Text := FloatToStr(DMContasReceber.QContasReceberBaixaVal_Titulo.Value);
            MeValorDesconto.Text := DMContasReceber.cdContasReceberBaixaLoteVAL_DESCONTO_ALTERAR.Text;
{            if (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ARISTIDES') and
               (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'GRASEL') then // Juros são desconsiderados na baixa em lote. para baixar titulos que tenham juros, usar o modo tradicional de baixa do titulo
               MeValorBaixa.Text := FloatToStr(dmcontasReceber.QContasReceberBaixaVal_Titulo.Value)
            Else
             Begin
}
            MeValorBaixa.Text := FloatToStr(dmcontasReceber.QContasReceberBaixaVal_Titulo.Value + DMContasReceber.cdContasReceberBaixaLoteVAL_JURO_ALTERAR.Value);
            If DMContasReceber.cdContasReceberBaixaLoteVAL_JURO_ALTERAR.Value > 0 Then
             Begin
               MeValorJuro.Text := FloatToStr(DMContasReceber.cdContasReceberBaixaLoteVAL_JURO_ALTERAR.Value);
               MeBaixaJuro.Text := MeValorJuro.Text;
             End;
//            End;

             If (DMContasReceber.cdContasReceberBaixaLoteVAL_DESCONTO_ALTERAR.Value > 0)  then
             begin
               MeValorBaixa.Text := FloatToStr(dmcontasReceber.QContasReceberBaixaVal_Titulo.Value {- DMContasReceber.cdContasReceberBaixaLoteVAL_DESCONTO_ALTERAR.Value});
               if DMContasReceber.cdContasReceberBaixaLoteVAL_DESCONTO_ALTERAR.Value > 0 then
               begin
                 MEValorDesconto.Text := FloatToStr(DMContasReceber.cdContasReceberBaixaLoteVAL_DESCONTO_ALTERAR.Value);
               end;
             end;

            if DMOracle.BuscaNome('SELECT IND_RECIBO FROM TB_FINALIDADE','COD_FINALIDADE = '+FloatToStr(DMContasReceber.QContasReceberBaixaCOD_FINALIDADE.Value)) = 'S' then
            begin
              wRecibo := 'S';

              //Eliminar o Juro do Recibo de Baixa em Lote - 12/03/2008 - Camila.
              If MEValorDesconto.Text = '' Then
                 MEValorDesconto.Text := '0';

              If MeBaixaJuro.Text = '' Then
              begin
                MeBaixaJuro.Text     := '0';
                MEValorJuro.Text     := '0';
              end;


              //Adiciona na Query em Memória a Conta a Receber para Gerar o Recibo em Lote - 14/01/2008 - Camila.
              AddDadosReciboLote(DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ DMContasReceber.QContasReceberBaixaCOD_CADASTRO.Text), //nomeCliente
                                 DMContasReceber.QContasReceberBaixaNUM_TITULO.Value,  //numDuplicata
                                 DMContasReceber.QContasReceberBaixaNUM_PARCELA.Value, //numParcela
                                 DMContasReceber.QContasReceberBaixaVAL_TITULO.Value,  //valPrincipal
                                 StrToFloat(MEValorJuro.Text),                         //valJuros
                                 StrToFloat(MEValorBaixa.Text) - StrToFloat(MeBaixaJuro.Text) - StrToFloat(MEValorDesconto.Text),   //valPrincipalRecebido
                                 StrToFloat(MeBaixaJuro.Text),                         //valJurosRecebido
                                 StrToFloat(MEValorDesconto.Text),                     //valDesconto
                                 StrToFloat(MEValorBaixa.Text) - StrToFloat(MEValorDesconto.Text), //valRecebido = valPrincipalRecebido + valJurosRecebido - valDesconto
                                 ((DMContasReceber.QContasReceberBaixaVAL_TITULO.Value + StrToFloat(MEValorJuro.Text)) - (StrToFloat(MEValorBaixa.Text) ))); //valPendente  = (valPrincipal + valJuros) - (valPrincipalRecebido + valJurosRecebido - valDesconto)
            end;
            MeHistoricoDesconto.Text := DMContasReceber.QContasReceberBaixaCOD_HISTORICO_DESC.Text;
            SBBaixaClick(Sender); //executa o codigo responsavel pela baixa de cada item
          end;
        end;

        DMContasReceber.cdContasReceberBaixaLote.Next;
      end;

      If wRecibo = 'S' then
      begin
        //colocar aqui a chamada dos recibos.
        if DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL' then
          EmiteReciboLote('Cerealista Grasel')
        Else
          if DMParamSistema.QParamSistemaCod_Empresa.Value = 'INSIDE' then
             EmiteReciboLote('Inside')
          Else
            if DMParamSistema.QParamSistemaCod_Empresa.Value = 'NIR' then
               EmiteReciboLote('Cemapa Informatica')
            Else
               EmiteReciboLote(DMParamSistema.QParamSistemaDesc_Empresa.Value);
      end;

      DMContasReceber_Rel.cdsRContasReceberBaixaLote.EmptyDataSet; //Limpa os Dados da Baixa Anterior.
      DMContasReceber_Rel.cdsRContasReceberBaixaLote.Close; //Fecha a Query em Memória.
      DMOracle.DBCemapa.Commit;

      if (cont > 0 ) then
        MessageDlg('Baixa feita com sucesso', mtInformation, [mbok], 0 )
      else
        MessageDlg('Selecione um ou mais títulos', mtInformation, [mbok], 0 );

      RG2FormaPagto.ItemIndex := 0;
      ME2Banco.Clear;
      ME2CodContaCorrente.Clear;
      ME2NumCheque.Clear;

      PCBaixa.ActivePage := TS0Localiza;
      SbProcura.Click;
    except
      DMOracle.DBCemapa.Rollback;
      raise;
    end;
  end;
end;
//------------------------------------------------------------
procedure TFContasReceberBaixa.AddDadosReciboLote(nomeCliente:String;
                                                  numDuplicata, numParcela:integer;
                                                  valPrincipal, valJuros, valPrincipalRecebido, valJurosRecebido, valDesconto, valRecebido, valPendente:double);
begin
  with DMContasReceber_Rel do
  begin
    cdsRContasReceberBaixaLote.Insert;
    cdsRContasReceberBaixaLotenome_cliente.Value           := nomeCliente;
    cdsRContasReceberBaixaLotenum_duplicata.Value          := numDuplicata;
    cdsRContasReceberBaixaLotenum_parcela.Value            := numParcela;
    cdsRContasReceberBaixaLoteval_principal.Value          := valPrincipal;
    cdsRContasReceberBaixaLoteval_juros.Value              := valJuros;
    cdsRContasReceberBaixaLoteval_principal_recebido.Value := valPrincipalRecebido;
    cdsRContasReceberBaixaLoteval_juros_recebido.Value     := valJurosRecebido;
    cdsRContasReceberBaixaLoteval_desconto.Value           := valDesconto;
    cdsRContasReceberBaixaLoteval_recebido.Value           := valRecebido;
    cdsRContasReceberBaixaLoteval_pendente.Value           := valPendente;
    cdsRContasReceberBaixaLote.Post;
  end;
end;
//------------------------------------------------------------
procedure TFContasReceberBaixa.EmiteReciboLote(logo:String);
begin
  if FRReciboLote = Nil then
   FRReciboLote := TFRReciboLote.Create(Application);

  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK', DMParamSistema.QParamSistemaCOD_FILIAL.Value);
  DMFilial.QFilial.Open;

  //Dados Recibo
  //-----------------------------------
  FRReciboLote.QRLLogo.Caption                  := logo;
  FRReciboLote.QRLRazaoSocial.Caption           := DMFilial.QFilialDESC_FILIAL.Text;
//  FRReciboLote.QRLRazaoSocialAssinatura.Caption := DMFilial.QFilialDESC_FILIAL.Text;
  FRReciboLote.QRLEndereco.Caption              := DMFilial.QFilialDESC_ENDERECO.Text;
  FRReciboLote.QRLFoneFax.Caption               := 'FONE: ' + DMFilial.QFilialDESC_TELEFONE.Text + ' FAX: ' + DMFilial.QFilialDESC_FAX.Text;
  FRReciboLote.QRLCepCidadeEstado.Caption       := DMFilial.QFilialDESC_CEP.Text + ' ' + DMFilial.QFilialDESC_CIDADE.Text + ' - ' + DMFilial.QFilialCOD_ESTADO.Text;
  FRReciboLote.QRLCnpjIe.Caption                := 'CNPJ: ' + DMFilial.QFilialNUM_CGC.Text + ' IE: ' + DMFilial.QFilialDESC_INSCRICAO.Text;
  FRReciboLote.QRLDataCidade.Caption            := FormatDateTime('dd "de" mmmm "de" yyyy', StrToDateTime(MEDataBaixa.Text)) + ' , ' + DMFilial.QFilialDESC_CIDADE.Text;
  //-----------------------------------

  //Mostra o Relatório
  //-----------------------------------
  FRReciboLote.QRPrimario.Preview;
  //-----------------------------------
end;
//------------------------------------------------------------
procedure TFContasReceberBaixa.TsBaixaLoteEnter(Sender: TObject);
begin
//  if trim(ME2DataBaixa.Text) = '' then
//    ME2DataBaixa.Text := datetostr(DMOracle.DataServ);
end;

procedure TFContasReceberBaixa.SbBancoConsClick(Sender: TObject);
begin
  If FBancosCons=Nil then
    FBancosCons:=TFBancosCons.Create(Application);
  If FBancosCons.ShowModal=mrOk then
    MEBanco_Baixa.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Value);

end;

procedure TFContasReceberBaixa.MEDataVencFinalExit(Sender: TObject);
begin
  If Trim(MECodCliente.Text) <> '' Then
    SBProcuraClick(Self);
end;

procedure TFContasReceberBaixa.AcCadastroExecute(Sender: TObject);
begin
  SpeedButton1.Click;
end;

procedure TFContasReceberBaixa.AcVoltaBaixaExecute(Sender: TObject);
begin
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' Then
   Begin
     if FContasReceberVoltaBaixa = Nil then
       FContasReceberVoltaBaixa := TFContasReceberVoltaBaixa.Create(Application);
     FContasReceberVoltaBaixa.ShowModal;
   End;
end;

procedure TFContasReceberBaixa.AcPosicionCadastroExecute(Sender: TObject);
begin
  MeCodCliente.SetFocus;
end;

procedure TFContasReceberBaixa.SbProcuraNotaClick(Sender: TObject);
var
 x, y: array of string;
begin

  If DMContasReceber.QContasReceberBaixaCod_Nota_Cab.Text <> '' Then
   Begin
     setLength(x, 3); //4 sql diferentes
     setLength(y, 3);

     x[0] := 'SELECT COD_VENDEDOR FROM TB_NOTA_CAB WHERE COD_NOTA_CAB =  '+DMContasReceber.QContasReceberBaixaCod_Nota_Cab.Text;
     x[1] := 'SELECT DT_EMISSAO FROM TB_NOTA_CAB WHERE COD_NOTA_CAB =  '+DMContasReceber.QContasReceberBaixaCod_Nota_Cab.Text;
     x[2] := 'SELECT COD_PRAZO_VENCIMENTO FROM TB_NOTA_CAB WHERE COD_NOTA_CAB =  '+DMContasReceber.QContasReceberBaixaCod_Nota_Cab.Text;

     DMOracle.BuscaNomes(x, y);
     DMNotaSaida.QItemNfCons.Close;
     DMNotaSaida.QItemNfCons.SetVariable('Cod_Nota_Cab',DMContasReceber.QContasReceberBaixaCod_Nota_Cab.Value);
     DMNotaSaida.QItemNfCons.Open;
     If FNotaItensCons = Nil Then
        FNotaItensCons := TFNotaItensCons.Create(application);
     FNotaItensCons.MeTexto.Text := Y[1];
     FNotaItensCons.MeVendedor.Text := Y[0];
     FNotaItensCons.MePagto.Text := Y[2];
     FNotaItensCons.ShowModal;
   End;
end;

procedure TFContasReceberBaixa.SbAlteraObsClick(Sender: TObject);
var wObs,wComando : string;
    wClickedOK: Boolean;
begin
  wobs := DMContasReceber.QContasReceberBaixaDesc_Observacao.Value;
  wClickedOK := InputQuery('Entre C/Msg', 'Prompt', wObs);
  if wClickedOK then
   Begin
     With DMOracle do
     Begin
       QExecSQL.Close;
       QExecSQL.SQL.Clear;
       wComando := 'UPDATE TB_CONTA_RECEBER_CAB SET DESC_OBSERVACAO=' + Chr(39) + wObs + Chr(39);
       wComando := wComando + ' WHERE COD_CONTA_RECEBER_CAB = '+FloatToStr(DMContasReceber.QContasReceberBaixaCOD_CONTA_RECEBER_CAB.Value);
       QExecSQL.SQL.Add(wComando);
       QExecSQL.ExecSQL;
     End;
     DMOracle.DBCemapa.Commit;
   End;         
end;


procedure TFContasReceberBaixa.SBAdiantamentoClick(Sender: TObject);
begin
  if FAdiantamentoCons = nil then
    FAdiantamentoCons := TFAdiantamentoCons.create(application);

  FAdiantamentoCons.MECadastro.Text := DMContasReceber.QContasReceberBaixaCOD_CADASTRO.Text;
  FAdiantamentoCons.MECadastroExit(Sender);
  FAdiantamentoCons.MeDtInicial.Text := DateToStr(Date - 30);
  FAdiantamentoCons.MeDtFinal.Text := DateToStr(Date);
  FAdiantamentoCons.BtProcurar.Click;

  if FAdiantamentoCons.showmodal = mrok then
  begin
    MECodAdiantamento.text := DMAdiantamento.QAdiantamentoConsCOD_ADIANTAMENTO.Text;
    MECodAdiantamentoExit(Sender);
  end;

end;

procedure TFContasReceberBaixa.MECodAdiantamentoExit(Sender: TObject);
begin

  //somente um dos busca_nome vai retornar alguma coisa, o outro sempre trará ''
  if Trim(MECodAdiantamento.Text) <> '' then
    MEAdiantamento.Text := DMOracle.BuscaNome('SELECT NUM_DOCUMENTO FROM TB_CAIXA_MOV T1, TB_ADIANTAMENTO T2',
                                              'T1.COD_CAIXA_MOV = T2.COD_CAIXA_MOV AND '+
                                              'T2.COD_ADIANTAMENTO = ' + trim(MECodAdiantamento.Text))+
                           DMOracle.BuscaNome('SELECT NUM_CHEQUE FROM TB_BCO_MOVIMENTO T1, TB_ADIANTAMENTO T2',
                                              'T1.COD_BCO_MOVIMENTO = T2.COD_BCO_MOVIMENTO AND '+
                                              'T2.COD_ADIANTAMENTO = ' + trim(MECodAdiantamento.Text))
  else
    MEAdiantamento.Text := '';                                              

end;

procedure TFContasReceberBaixa.MeDtBaixaExit(Sender: TObject);
begin
  If (Trim(MeCodCliente.Text) <> '') Or
     ((Trim(MEDataVencInicial.Text) <> '/  /') And (Trim(MEDataVencInicial.Text) <> '')) Then
     SBProcuraClick(Self);

end;

procedure TFContasReceberBaixa.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (Column.Title.Caption = 'X') then
  begin DBGrid3.Canvas.FillRect(Rect);
    if DMContasReceber.cdContasReceberBaixaLoteBAIXAR.Value = 'S' then
      ImageList1.Draw(DBGrid3.Canvas, Rect.Left + 5, Rect.Top + 1, 1)
     else
      ImageList1.Draw(DBGrid3.Canvas, Rect.Left + 5, Rect.Top + 1, 0);
    end;
end;

procedure TFContasReceberBaixa.DBGrid3CellClick(Column: TColumn);
begin
  if Column.Title.Caption = 'X' then
  Begin
    Atualiza_Baixa_Lote(DMContasReceber.cdContasReceberBaixaLoteBAIXAR.Value);  // procedure
    DBGrid3.SelectedIndex := DBGrid3.SelectedIndex + 1;
  End;
end;

procedure TFContasReceberBaixa.DBGrid3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_space then
  Begin
    Atualiza_Baixa_Lote(DMContasReceber.cdContasReceberBaixaLoteBAIXAR.Value);  // procedure
    Abort;
  End;
end;

procedure TFContasReceberBaixa.SpeedButton2Click(Sender: TObject);
begin
  MeComJuros.Text := '0';
  MeSemJuros.Text := '0';
  DMContasReceber.cdContasReceberBaixaLote.First;
  while not DMContasReceber.cdContasReceberBaixaLote.Eof do
  Begin
    Atualiza_Baixa_Lote('N');  // procedure
    DMContasReceber.cdContasReceberBaixaLote.Next;
  End;

  DMContasReceber.cdContasReceberBaixaLote.First;
end;

procedure TFContasReceberBaixa.SpeedButton3Click(Sender: TObject);
begin
  DMContasReceber.cdContasReceberBaixaLote.First;
  while not DMContasReceber.cdContasReceberBaixaLote.Eof do
  Begin
    Atualiza_Baixa_Lote('S');  // procedure
    DMContasReceber.cdContasReceberBaixaLote.Next;
  End;

  DMContasReceber.cdContasReceberBaixaLote.First;
  MeComJuros.Text := '0';
  MeSemJuros.Text := '0';
end;

procedure TFContasReceberBaixa.SpeedButton4Click(Sender: TObject);
begin
  DMContasReceber.cdContasReceberBaixaLote.First;
  while not DMContasReceber.cdContasReceberBaixaLote.Eof do
  Begin
    Atualiza_Baixa_Lote(DMContasReceber.cdContasReceberBaixaLoteBAIXAR.Value);  // procedure
    DMContasReceber.cdContasReceberBaixaLote.Next;
  End;

  DMContasReceber.cdContasReceberBaixaLote.First;
end;

Procedure TFContasReceberBaixa.Atualiza_Baixa_Lote(wMarcado_SN : String);
Begin
  DMContasReceber.cdContasReceberBaixaLote.Edit;
  if wMarcado_SN = 'S' then
   Begin
     DMContasReceber.cdContasReceberBaixaLoteBAIXAR.Value := 'N';
     MeComJuros.Text := FormatFloat('##0.00',StrToFloat(MeComJuros.Text) - DMContasReceber.cdContasReceberBaixaLoteval_juros_calculado.Value);
     MeSemJuros.Text := FormatFloat('##0.00',StrToFloat(MeSemJuros.Text) - DMContasReceber.cdContasReceberBaixaLoteval_titulo.Value);
   End
  else
   Begin
     DMContasReceber.cdContasReceberBaixaLoteBAIXAR.Value := 'S';
     MeComJuros.Text := FormatFloat('##0.00',StrToFloat(MeComJuros.Text) + DMContasReceber.cdContasReceberBaixaLoteval_juros_calculado.Value);
     MeSemJuros.Text := FormatFloat('##0.00',StrToFloat(MeSemJuros.Text) + DMContasReceber.cdContasReceberBaixaLoteval_titulo.Value);
   End;
  DMContasReceber.cdContasReceberBaixaLote.Post;

End;

procedure TFContasReceberBaixa.SBHistoricoChequeClick(Sender: TObject);
Var
wVlrCheque : Real;
begin
  If FHistoricoCons=Nil then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOk then
    MEHistoricoCheque.Text:=FloatToStr(DMHistorico.QHistoricoConsCod_Historico.Value);
    MEHistoricoChequeExit(Self);
end;

procedure TFContasReceberBaixa.MEHistoricoChequeExit(Sender: TObject);
begin
  if Trim(MEHistoricoCheque.Text) <> '' Then
  Begin
    EdHistoricoCheque.Text := DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO='+Trim(MeHistoricoCheque.Text));
    //wvlrCheque := DMContasReceber.QContasReceberBaixaVAL_TITULO.Value - StrToFloat(MeValorBaixa.Text) ;
    //MEValorCheque.Text := FloatToStr(wVlrCheque);
    if ((Trim(MeValorBaixa.Text) = '') or (Trim(MEValorBaixa.Text) = '0') and (Trim(MeBaixaJuro.Text)<>'0,00')) then
      MEValorCheque.Text := FloatToStr(DMContasReceber.QContasReceberBaixaVAL_TITULO.Value - StrToFloat(MeValorBaixa.Text))

    else
      MEValorCheque.Text := FloatToStr(DMContasReceber.QContasReceberBaixaVAL_TITULO.Value - (StrToFloat(MeValorBaixa.Text)-StrToFloat(MeBaixaJuro.Text)))
  end;
end;

end.
