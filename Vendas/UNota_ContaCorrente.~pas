unit UNota_ContaCorrente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Mask, Grids, DBGrids, Db, DBTables, DBCtrls, variants,
  ActnList, StrUtils;

type
  TFNota_ContaCorrente = class(TForm)
    PCContaCorrente: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MEDataI: TMaskEdit;
    MEDataF: TMaskEdit;
    Label19: TLabel;
    MECadastro: TMaskEdit;
    BtConsCadastro: TBitBtn;
    EdCadastro: TEdit;
    Label78: TLabel;
    MEFilial: TMaskEdit;
    MEConsFilial: TBitBtn;
    EdFilial: TEdit;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    BtAvancar: TBitBtn;
    BtCancelar: TBitBtn;
    Label3: TLabel;
    EdTotal: TEdit;
    TabSheet3: TTabSheet;
    Label6: TLabel;
    MEFinalidade: TMaskEdit;
    BtConsFinalidade: TBitBtn;
    EdFinalidade: TEdit;
    Label4: TLabel;
    BtConsBancoAgencia: TBitBtn;
    MeBanco: TMaskEdit;
    EdBanco: TEdit;
    Label31: TLabel;
    MEDepartamento: TMaskEdit;
    BtConsDepartamento: TBitBtn;
    EdDepartamento: TEdit;
    Label7: TLabel;
    MeNrNota: TMaskEdit;
    Label125: TLabel;
    MeValor: TMaskEdit;
    RBTodos: TRadioButton;
    LbConfirmados: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LbRollback: TLabel;
    MeContaCorrente: TMaskEdit;
    Label25: TLabel;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Action1: TAction;
    LBContaReceber: TListBox;
    cbEnviaEmail: TCheckBox;
    BtApagaParcela: TBitBtn;
    MEDiasCP: TMaskEdit;
    Label13: TLabel;
    MePrazo: TMaskEdit;
    Label23: TLabel;
    BtPrazo: TBitBtn;
    MEDataCP: TMaskEdit;
    Label10: TLabel;
    MEValorCP: TMaskEdit;
    Label11: TLabel;
    EdTotalNF: TEdit;
    Label17: TLabel;
    procedure MEConsFilialClick(Sender: TObject);
    procedure MEFilialExit(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure MECadastroExit(Sender: TObject);
    procedure BtAvancarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtConsFinalidadeClick(Sender: TObject);
    procedure MEFinalidadeExit(Sender: TObject);
    procedure BtConsBancoAgenciaClick(Sender: TObject);
    procedure MEDepartamentoExit(Sender: TObject);
    procedure BtConsDepartamentoClick(Sender: TObject);
    procedure MeValorChange(Sender: TObject);
    procedure RBTodosClick(Sender: TObject);
    procedure MeContaCorrenteExit(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure MEValorCPExit(Sender: TObject);
    procedure BtApagaParcelaClick(Sender: TObject);
    procedure MEDiasCPExit(Sender: TObject);
    procedure MePrazoExit(Sender: TObject);
    procedure BtPrazoClick(Sender: TObject);
  private
    wRegistrosSelecionados : String;
    procedure geraParcelas;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNota_ContaCorrente: TFNota_ContaCorrente;
  SomaParcelas: Double;

implementation

uses UFilialCons, UFilial_cl, UCadastro_cl, UCadastroCons, UNotaSaida_cl,
  UUsuario_cl, UOracle_cl, UParamSistema_cl, UFinalidadeCons,
  UFinalidade_cl, UBancosCons, UBancoAgencia_cl, UNotaEntrada_cl, USerie_cl,
  UOperacao_cl, URBloqueto, UNotaSaidaCad, UDepartamentoCons,
  UDepartamento_cl, URelatorioVenda_cl, UContaCorrenteCons,
  UImpressoraFiscal, UPagamentosNFe4, UContasReceber_cl,
  UDevolucaoTroca_cl, Math, UBiblioteca, UPrazoVencimentoCons,
  UPrazoVencimento_cl, UFiltroRelContaCorrente;

{$R *.DFM}

procedure TFNota_ContaCorrente.MEConsFilialClick(Sender: TObject);
begin
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    MEFilialExit(Self);
  End;

end;

procedure TFNota_ContaCorrente.MEFilialExit(Sender: TObject);
begin
  If Trim(MEFilial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',MEFilial.Text);
    QFilial.Open;
    EdFilial.Text := QFilialDesc_Filial.Value;
  End
  Else
    EdFilial.Text := 'Selecione uma Filial';
end;

procedure TFNota_ContaCorrente.BtConsCadastroClick(Sender: TObject);
begin
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    MECadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    MECadastroExit(Self);
  End;
end;

procedure TFNota_ContaCorrente.MECadastroExit(Sender: TObject);
begin
  If Trim(MECadastro.Text) <> '' Then
  With DMCadastro do
  Begin
    QCadastro.Close;
    QCadastro.SetVariable('PK',MECadastro.Text);
    QCadastro.Open;
    EdCadastro.Text := QCadastroNome.Value;
  End
  Else
    EdCadastro.Text := 'Todos';
end;

procedure TFNota_ContaCorrente.BtAvancarClick(Sender: TObject);
Var wTotal, wValor_Itens,wEntrada : Real;
    wTipoNota,wOperacao,wAux, wLinha, wBancoAgencia, wSql,wLibera_Bloqueto, wContaCorrente: String;
    wCadastro_Anterior,wConfirmados,wCancelados,wCodNotaCab : Integer;
Const wBranco : String = '                                      ';
begin
  wValor_Itens := 0;  // INICIALIZA VALOR DA VARIAVEL - Robson 26/06/2000
  wConfirmados := 0;
  wCancelados := 0;

  Case PCContaCorrente.ActivePage.PageIndex of
    0 : With DMNotaSaida do
        Begin
          with DMRelatorio_Venda do
          begin
            DmUsuario.Checar_Filial_Usuario(Trim(MeFilial.Text), 'VENDA');
            if FFiltroRelContaCorrente = nil then
              FFiltroRelContaCorrente := TFFiltroRelContaCorrente.Create(Application);
            FFiltroRelContaCorrente.CDSFiltroRelatorio.Close;
            if Trim(MeFilial.Text) = '' then
              FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('COD_FILIAL').Value := null
            else
              FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('COD_FILIAL').Value :=
                Trim(MeFilial.Text);
            if Trim(MeCadastro.Text) = '' then
              FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('COD_CADASTRO').Value := null
            else
              FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('COD_CADASTRO').Value :=
                Trim(MeCadastro.Text);

            FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('COD_VENDEDOR').Value := null;
            FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('COD_DEPARTAMENTO').Value := NULL;
            FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('SERIE').Value := NULL;
            FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('COD_CLASS_CADASTRO').Value := NULL;
            FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('COD_PRODUTO').Value := NULL;
            FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('DATA_I').Value :=
              StrToDate(Trim(MEDataI.Text));
            FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('DATA_F').Value :=
              StrToDate(Trim(MEDataF.Text));

            FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('NOTA_CAB').Value := NULL;
            FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('CONDICAO_PAGTO').Value := '3';
            FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('HISTORICO_CAIXA').Value := NULL;
            FFiltroRelContaCorrente.CDSFiltroRelatorio.Open;
            
            if FFiltroRelContaCorrente.ShowModal = mrOk then
            begin
              wRegistrosSelecionados := '';
              FFiltroRelContaCorrente.CDSFiltroRelatorio.First;
              while not FFiltroRelContaCorrente.CDSFiltroRelatorio.Eof do
              begin
                if FFiltroRelContaCorrente.CDSFiltroRelatorioIND_SELECIONADO.Value = 'S' then
                  wRegistrosSelecionados := wRegistrosSelecionados + FFiltroRelContaCorrente.CDSFiltroRelatorioCOD_NOTA_CAB.Text + ',';
                FFiltroRelContaCorrente.CDSFiltroRelatorio.Next;
              end;
            end;
          end;

          pTrazPedido := False;
          QSomaContaCorrente.Close;
          QSomaContaCorrente.Sql.Clear;
          wSql := wSql + 'Select SUM(Tb_nota_item.QT_QUANTIDADE - NVL(TB_VALE_PRODUTO_ITEM.QT_QUANTIDADE_DEVOLVIDA,0)) ';
          wSql := wSql + ' SQT_QUANTIDADE,TB_NOTA_CAB.VAL_AVISTA,';
          wSql := wSql + 'ROUND(SUM(Tb_nota_item.VAL_TOTAL - (NVL(TB_VALE_PRODUTO_ITEM.QT_QUANTIDADE_DEVOLVIDA,0) * TB_NOTA_ITEM.VAL_UNITARIO) - ';
          wSql := wSql + ' (PEGA_DESCONTO_ITEM(Tb_nota_item.COD_NOTA_ITEM) / Tb_nota_item.QT_QUANTIDADE) * ';
          wSql := wSql + ' (Tb_nota_item.QT_QUANTIDADE - NVL(TB_VALE_PRODUTO_ITEM.QT_QUANTIDADE_DEVOLVIDA,0))), 2) SVAL_TOTAL,';
          wSql := wSql + 'TB_NOTA_ITEM.PERC_IPI,TB_NOTA_ITEM.COD_TRIBUTACAO,TB_NOTA_CAB.COD_CADASTRO,';
          wSql := wSql + 'TB_NOTA_CAB.COD_NOTA_CAB,TB_PRODUTO.COD_PRODUTO,Tb_produto.DESC_PRODUTO,  ';
          wSql := wSql + 'SUM(TB_NOTA_ITEM.VAL_ICM_BASE) SVAL_ICM_BASE, SUM(TB_NOTA_ITEM.VAL_ICM) SVAL_ICMS, ';
          wSql := wSql + 'SUM(TB_NOTA_ITEM.VAL_DESPESAS) SVAL_DESPESAS, SUM(TB_NOTA_ITEM.VAL_DESCONTO) SVAL_DESCONTO, TB_NOTA_ITEM.PERC_DESCONTO ';
          wSql := wSql + ' FROM TB_PRODUTO,TB_NOTA_CAB,TB_NOTA_ITEM,TB_VALE_PRODUTO_ITEM ';
          wSql := wSql + ' WHERE Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB ';
          wSql := wSql + ' AND Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO ';
          wSql := wSql + ' AND TB_NOTA_ITEM.COD_NOTA_ITEM = TB_VALE_PRODUTO_ITEM.COD_NOTA_ITEM(+) ';
          wSql := wSql + ' AND TB_NOTA_ITEM.QT_QUANTIDADE - NVL(TB_VALE_PRODUTO_ITEM.QT_QUANTIDADE_DEVOLVIDA,0) > 0 ';
          wSql := wSql + ' AND TB_NOTA_CAB.IND_SITUACAO = '+ Chr(39) +  '2' + Chr(39);
          wSql := wSql + ' AND TB_NOTA_CAB.IND_ENTRADA_SAIDA = '+ Chr(39) +  'S' + Chr(39);
          wSql := wSql + ' AND TB_NOTA_CAB.IND_CONDICAO_PAGTO = '+ Chr(39) +  '3' + Chr(39);
          wSql := wSql + ' AND TB_NOTA_CAB.COD_NOTA_CONTA_CORRENTE IS NULL ';
          If Trim(MEFilial.Text) <> '' Then
             wSql := wSql + ' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(MeFilial.Text);
          If Trim(MECadastro.Text) <> '' then
             wSql := wSql + ' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(MECadastro.Text);
          If Trim(MENrNota.Text) <> '' then
             wSql := wSql + ' AND TB_NOTA_CAB.NUM_NOTA = ' + Trim(MENrNota.Text);
          wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + Chr(39) + Trim(MEDataI.Text) + Chr(39);
          wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + Chr(39) + Trim(MEDataF.Text) + Chr(39);
          if wRegistrosSelecionados <> '' then
          begin
            wRegistrosSelecionados := LeftStr(wRegistrosSelecionados, Length(wRegistrosSelecionados) - 1);
            wSql := wSql + ' AND TB_NOTA_CAB.COD_NOTA_CAB IN ('+wRegistrosSelecionados+')';
          end;
          If (Trim(MECadastro.Text) = '') And (Trim(MeValor.Text) <> '0') Then
           Begin
             wSql := wSql + ' AND TB_NOTA_CAB.COD_CADASTRO IN';
             wSql := wSql + ' (Select TB_NOTA_CAB.COD_CADASTRO FROM TB_NOTA_CAB,TB_NOTA_ITEM ';
             wSql := wSql + ' WHERE Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB ';
             wSql := wSql + ' AND TB_NOTA_CAB.IND_SITUACAO = '+ Chr(39) +  '2' + Chr(39);
             wSql := wSql + ' AND TB_NOTA_CAB.IND_ENTRADA_SAIDA = '+ Chr(39) +  'S' + Chr(39);
             wSql := wSql + ' AND TB_NOTA_CAB.IND_CONDICAO_PAGTO = '+ Chr(39) +  '3' + Chr(39);
             wSql := wSql + ' AND TB_NOTA_CAB.COD_NOTA_CONTA_CORRENTE IS NULL ';
             If Trim(MEFilial.Text) <> '' Then
                wSql := wSql + ' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(MeFilial.Text);
             wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + Chr(39) + Trim(MEDataI.Text) + Chr(39);
             wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + Chr(39) + Trim(MEDataF.Text) + Chr(39);

             wSql := wSql + ' GROUP BY TB_NOTA_CAB.COD_CADASTRO';
             wSql := wSql + ' having SUM(Tb_nota_item.VAL_TOTAL - tb_nota_item.VAL_DESCONTO) >= ' + MeValor.Text +')';
           End;
          wSql := wSql + ' GROUP BY TB_NOTA_CAB.COD_CADASTRO,TB_NOTA_CAB.COD_NOTA_CAB, TB_PRODUTO.COD_PRODUTO, TB_NOTA_CAB.VAL_AVISTA, TB_NOTA_ITEM.PERC_IPI, TB_NOTA_ITEM.PERC_DESCONTO, TB_NOTA_ITEM.COD_TRIBUTACAO, Tb_produto.DESC_PRODUTO';
          QSomaContaCorrente.Sql.Add(wSql);
          QSomaContaCorrente.Open;
          wTotal := 0;
          QSomaContaCorrente.First;
          While not QSomaContaCorrente.Eof do
          Begin
            wTotal := wTotal + QSomaContaCorrenteSVal_Total.Value;
            QSomaContaCorrente.Next;
          End;
          EdTotal.Text := FormatFloat('###,###,##0.00',wTotal);
          PCContaCorrente.Pages[0].TabVisible := False;
          PCContaCorrente.Pages[1].TabVisible := True;
        End;
    1 : Begin
          PCContaCorrente.Pages[1].TabVisible := False;
          PCContaCorrente.Pages[2].TabVisible := True;
          EdTotalNF.Text := EdTotal.Text;
          //MEFinalidade.SetFocus;
        End;
    2 : With DMNotaSaida do
        Try
          QSomaContaCorrente.First;
          wCadastro_Anterior := 0;
          wCodNotaCab := 0;
          wEntrada := 0;
{ Comentado para que a nota fique como digitada e após isto seja finalizada. Assim recalcula o ICMS quando o cliente é fora do estado. Alex/Junior 12/05/2023.
          if (Trim(MEDepartamento.Text) = '') then
          begin
            MEDepartamento.SetFocus;
            raise Exception.Create('Informe o Departamento.');
          end;
          if (Trim(MEFinalidade.Text) = '') then
          begin
            MEFinalidade.SetFocus;
            raise Exception.Create('Informe a Finalidade.');
          end;
          if RoundTo(SomaParcelas, -2) <> RoundTo(StrToFloat(bib.LimpaString(EdTotalNF.Text,'.')),-2) then
          begin
            MEDiasCP.SetFocus;
            raise Exception.Create('A soma das parcelas difere do valor da nota.');
          end;}
          While not QSomaContaCorrente.Eof do
          Begin
            If QSomaContaCorrenteVAL_AVISTA.Value <> 0 Then
               If wCodNotaCab <> QSomaContaCorrenteCod_Nota_Cab.Value Then
                 wEntrada := wEntrada + StrToFloat(DMOracle.BuscaNome('SELECT VAL_AVISTA FROM TB_NOTA_CAB',
                                        'COD_NOTA_CAB = '+FloatToStr(QSomaContaCorrenteCod_Nota_Cab.Value)));
            If wCadastro_Anterior = QSomaContaCorrenteCod_Cadastro.Value then
              QNotaSaida.Edit
            Else
            Begin
              pCC:=True;
              wValor_Itens := 0;
              QNotaSaida.Insert;
              QNotaSaidaCod_Cadastro.Value := QSomaContaCorrenteCod_Cadastro.Value;
              QNotaSaidaCod_Nota_Conta_Corrente.Value := QNotaSaidaCod_Nota_Cab.Value;
              QNotaSaidaInd_Condicao_Pagto.Value := '2';
              QNotaSaidaCod_Operacao.Text := DMOracle.BuscaNome('SELECT COD_OPERACAO_CC FROM TB_CADASTRO',
                                             'COD_CADASTRO = '+FloatToStr(QSomaContaCorrenteCod_Cadastro.Value)) ;
              If QNotaSaidaCod_Operacao.Text = '' Then
              begin
                QNotaSaida.Cancel;
                ShowMessage('Cliente '+ QNotaSaidaCod_Cadastro.Text +' sem código de operação de conta corrente no cadastro. Corrija o problema e gere, novamente, as notas.');
                QSomaContaCorrente.Next;
                Continue;
              end;
              QNotaSaidaCod_Filial.Value := StrToInt(Trim(MEFilial.Text));
              QNotaSaidaCod_Serie.Value := DMOracle.BuscaNome('SELECT COD_SERIE FROM TB_OPERACAO',
                'COD_OPERACAO = ' + QNotaSaidaCod_Operacao.Text);
              QNotaSaidaCOD_SERIE_MODELO.Value := DMOracle.BuscaNome('SELECT COD_SERIE_MODELO FROM TB_OPERACAO',
                'COD_OPERACAO = ' + QNotaSaidaCod_Operacao.Text);
            End;
            QItemNF.Insert;
            QItemNFCod_Produto.Value := QSomaContaCorrenteCod_Produto.Value;
            QItemNFQt_Quantidade.Value := QSomaContaCorrenteSQt_Quantidade.Value;
            QItemNFVal_Unitario.Value := QSomaContaCorrenteSVal_Total.Value / QItemNFQt_Quantidade.Value;
            QItemNFVal_Total.Value := QSomaContaCorrenteSVal_Total.Value;

            wValor_itens := wValor_Itens + QSomaContaCorrenteSVal_Total.Value;
            QItemNFPerc_Ipi.Value := QSomaContaCorrentePerc_Ipi.Value;
            QItemNFCod_Tributacao.Value := QSomaContaCorrenteCod_Tributacao.Value;
{comentado estas linhas pois estava calculando icms quando o produto era isento. Alterado para puxar os valores direto da nota original. Alex 04/05/2023
            QItemNFVal_ICM_Base.Value := 0;
            QItemNFVal_Desconto.Value := 0;
            QItemNFPerc_Desconto.Value := 0;
            QItemNFVal_Despesas.Value := 0;
            CalculaICM;}
            QItemNFVal_ICM_Base.Value := QSomaContaCorrenteSVAL_ICM_BASE.Value;
            QItemNFVAL_ICM.Value := QSomaContaCorrenteSVAL_ICMS.Value;
//para o desconto o valor deve ser passado 0 para que não seja descontado duas vezes. Alex 04/05/2023.
            QItemNFVal_Desconto.Value := 0;
            QItemNFPerc_Desconto.Value := 0;
            QItemNFVal_Despesas.Value := QSomaContaCorrenteSVAL_DESPESAS.Value;
            QItemNF.Post;
            wCadastro_Anterior := QSomaContaCorrenteCod_Cadastro.Value;
            wCodNotaCab := QSomaContaCorrenteCod_Nota_Cab.Value;
            QSomaContaCorrente.Next;
            If (wCadastro_Anterior <> QSomaContaCorrenteCod_Cadastro.Value)
              or (QSomaContaCorrente.Eof)  then
            Begin
              If wValor_Itens >= StrToFloat(MeValor.Text)  Then
              Begin
                If QNotaSaidaNum_Nota.Value = 0 then
                  QNotaSaidaNum_Nota.Value := DMSerie.NumeroSerie(QNotaSaidaCod_Filial.Value,QNotaSaidaCod_Serie.Value,
                    QNotaSaidaCOD_SERIE_MODELO.Value);
{ Comentado para que a nota fique como digitada e após isto seja finalizada. Assim recalcula o ICMS quando o cliente é fora do estado. Alex/Junior 12/05/2023.
                wLibera_Bloqueto := DMOracle.BuscaNome('SELECT IND_LIBERA_BLOQUETO FROM TB_CADASTRO',
                                          'COD_CADASTRO = '+IntToStr(wCadastro_Anterior)) ;
                If wLibera_Bloqueto = 'SIM' then
                 Begin
                   wContaCorrente := Trim(MeContaCorrente.Text);
                   wBancoAgencia := MeBanco.Text;
                 End
                Else
                 Begin
                   wBancoAgencia := '';
                   wContaCorrente := '';
                 End;}
                QNotaSaidaInd_Situacao.Value := '1'; // 2 Confirmada Alterado para 1
                QNotaSaidaVal_AVista.Value := wEntrada;
                QNotaSaida.Post;
                wEntrada := 0;
                //DMNotaSaida.GeraContaReceber(LBContaReceber.Items,StrToInt(Trim(MEFinalidade.Text)),wBancoAgencia,Trim(MEDepartamento.Text),wContaCorrente);
        //        DMNotaSaida.Contabiliza;
        //        DMNotaSaida.AtualizaEstoque(1);
                QAtzNFContaCorrente.Close;
                QAtzNFContaCorrente.SetVariable('FILIAL',StrToInt(Trim(MEFilial.Text)));
                QAtzNFContaCorrente.SetVariable('DATA_I',StrToDate(MEDataI.Text));
                QAtzNFContaCorrente.SetVariable('DATA_F',StrToDate(MEDataF.Text));
                QAtzNFContaCorrente.SetVariable('CADASTRO',wCadastro_Anterior);
                QAtzNFContaCorrente.SetVariable('COD_NOTA',QNotaSaidaCod_Nota_Cab.Value);
                if wRegistrosSelecionados = '' then
                  QAtzNFContaCorrente.SetVariable('NOTA_CAB','1=1')
                else
                  QAtzNFContaCorrente.SetVariable('NOTA_CAB',
                    'TB_NOTA_CAB.COD_NOTA_CAB IN (' + wRegistrosSelecionados + ')');
                If Trim(MENrNota.Text) = '' then
                  QAtzNFContaCorrente.SetVariable('NUM_NOTA',Null)
                Else
                  QAtzNFContaCorrente.SetVariable('NUM_NOTA',StrToInt(Trim(MENrNota.Text)));
                QAtzNFContaCorrente.ExecSQL;
                QSomaItemNota.Close;
                QSomaItemNota.Open;
                DMOracle.DBCemapa.Commit;
{ Comentado para que a nota fique como digitada e após isto seja finalizada. Assim recalcula o ICMS quando o cliente é fora do estado. Alex/Junior 12/05/2023.
                PagamentosNFe4.GeraPagamentos('S');
                FNotaSaidaCad.Emisso1Click(Self);
                FNotaSaidaCad.SBRefreshClick(Self);
                if (wLibera_Bloqueto = 'SIM') and (wContaCorrente <> '') then
                begin
                  // sempre vai solicitar a impressão dos boletos - mesmo quando for enviado por e_mail
                  if (MessageDlg('Deseja emitir o(s) boleto(s)?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
                  begin
                    with DMContasReceber do
                    begin
                      QRBloqueto.Close;
                      QRBloqueto.SetVariable('COD_NOTA_CAB_INICIAL', DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text);
                      QRBloqueto.SetVariable('COD_NOTA_CAB_FINAL', DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text);
                      QRBloqueto.SetVariable('COD_CONTA_CORRENTE', Trim(MeContaCorrente.Text));
                      QRBloqueto.SetVariable('NUMERO_TITULOS', '1 = 1');
                      Chama_Emissao_Bloqueto(2); //pImprime = 0, pEnviaEmail = 1, pImprimeEnviaEmail = 2
                    end;
                  end;
                end;}
                Inc(wConfirmados);
                LbConfirmados.Caption := IntToStr(wConfirmados);
                LbConfirmados.Refresh;
              End
            Else
              Begin
                If QNotaSaida.State in [dsEdit,dsInsert] then
                  QNotaSaida.Cancel;
                If DMOracle.DBCemapa.InTransaction then
                  DMOracle.DBCemapa.RollBack;
                Inc(wCancelados);
                LbRollback.Caption := IntToStr(wCancelados);
                LbRollback.Refresh;
                ModalResult := mrOk;
              End;
            End;
          End;
          pCC:=False;
          QSomaContaCorrente.First;
          wCodNotaCab := 0;
          while not QSomaContaCorrente.Eof do
          begin
            with DMDevolucaoTroca do
            begin
              if wCodNotaCab <> QSomaContaCorrenteCOD_NOTA_CAB.Value then
              begin
                wCodNotaCab := QSomaContaCorrenteCOD_NOTA_CAB.Value;
                QValeProduto.Close;
                QValeProduto.ClearVariables;
                QValeProduto.SetVariable('COD_NOTA_CAB', QSomaContaCorrenteCOD_NOTA_CAB.Value);
                QValeProduto.Open;

                if QValeProduto.RecordCount > 0 then
                begin
                  DMOracle.QExecSQL.close;
                  DMOracle.QExecSQL.SQL;
                  DMOracle.QExecSQL.SQL.Clear;
                  DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_VALE_PRODUTO_ITEM WHERE COD_VALE_PRODUTO = ' + QValeProdutoCOD_VALE_PRODUTO.Text);
                  DMOracle.QExecSQL.ExecSQL;
                  QValeProduto.Delete;
                end;
              end;
            end;
            QSomaContaCorrente.Next;
          end;
          If DMOracle.DBCemapa.InTransaction Then
            DMOracle.DBCemapa.Commit;
          ModalResult := mrOk;
        Except
          pCC:=False;
          If QNotaSaida.State in [dsEdit,dsInsert] then
            QNotaSaida.Cancel;
          If DMOracle.DBCemapa.InTransaction then
            DMOracle.DBCemapa.RollBack;
          Raise;
        End;
  End;  // Case
end;

procedure TFNota_ContaCorrente.FormActivate(Sender: TObject);
Var wQtdePagina : Integer;
begin
  For wQtdePagina := 0 to PCContaCorrente.PageCount-1 do
  begin
    PCContaCorrente.Pages[wQtdePagina].TabVisible := False;
  end;
  PCContaCorrente.Pages[0].TabVisible := True;
  LBContaReceber.Items.Clear;
  SomaParcelas := 0;
  MECadastro.SetFocus;
end;

procedure TFNota_ContaCorrente.FormCreate(Sender: TObject);
begin
  MEFilial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  MEDataI.Text := DateToStr(Date-30);
  MEDataF.Text := DateToStr(Date);
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

procedure TFNota_ContaCorrente.BtConsFinalidadeClick(Sender: TObject);
begin
  If FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.showModal = mrOk then
  Begin
    MEFinalidade.Text := DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
    MEFinalidadeExit(Self);
  End;

end;

procedure TFNota_ContaCorrente.MEFinalidadeExit(Sender: TObject);
begin
  If Trim(MEFinalidade.Text) <> '' Then
    EdFinalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+MEFinalidade.Text);
end;

procedure TFNota_ContaCorrente.BtConsBancoAgenciaClick(Sender: TObject);
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

procedure TFNota_ContaCorrente.MEDepartamentoExit(Sender: TObject);
begin
  If Trim(MEDepartamento.Text) <> '' Then
    EdDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MEDepartamento.Text)
  Else
    EdDepartamento.Text := '';
end;

procedure TFNota_ContaCorrente.BtConsDepartamentoClick(Sender: TObject);
begin
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
  Begin
    MEDepartamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
    MEDepartamentoExit(Self);
  End;

end;

procedure TFNota_ContaCorrente.MeValorChange(Sender: TObject);
begin
  if Trim(MEValor.Text) <> '' Then
     RBTodos.Checked  := False;

end;

procedure TFNota_ContaCorrente.RBTodosClick(Sender: TObject);
begin
  If RBTodos.Checked then
     MEValor.Text := '0';

end;

procedure TFNota_ContaCorrente.MeContaCorrenteExit(Sender: TObject);
begin
  If Trim(MeContaCorrente.Text) <> '' Then
   Begin
    MeBanco.Text := DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+Trim(MeContaCorrente.Text));
    EdBanco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MEBanco.Text);
   End
  Else
    EdBanco.Text := '';

end;

procedure TFNota_ContaCorrente.Action1Execute(Sender: TObject);
begin
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

procedure TFNota_ContaCorrente.MEValorCPExit(Sender: TObject);
var wLinha, wAux: string;
const wBranco: string = '                            ';
begin
  if (MEDataCP.Text <> '') and
    (MEValorCP.Text <> '') then
  begin
    if StrToDate(MEDataCp.Text) < Date then
      raise Exception.Create('Data de Vencimento Menor que Data Atual!');
    wLinha := DateToStr(StrToDate(MEDataCP.Text));
    wAux := FormatFloat('###,###,##0.00', StrToFloat(bib.LimpaString(MEValorCP.Text,'.')));
    wAux := Copy(wBranco, 1, 15 - Length(waux)) + wAux;
    wLinha := wLinha + wAux;
    LBContaReceber.Items.Add(wLinha);
    SomaParcelas := SomaParcelas + StrToFloat(bib.LimpaString(MEValorCP.Text,'.'));
    MEDataCP.Text := '';
    MEValorCP.Text := '';
    MEDiasCP.SetFocus;

  end;
end;

procedure TFNota_ContaCorrente.BtApagaParcelaClick(Sender: TObject);
begin
  SomaParcelas := SomaParcelas - StrToFloat(Copy(LBContaReceber.Items[LBContaReceber.ItemIndex],11, 15));
  LBContaReceber.Items.Delete(LBContaReceber.ItemIndex); 
end;

procedure TFNota_ContaCorrente.MEDiasCPExit(Sender: TObject);
begin
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'KREUZ' Then
     If Trim(MeDiasCp.Text) <> '' Then
        If StrToInt(Trim(MeDiasCp.Text)) = 10 Then
           MeFinalidade.Text := '100';
  if Trim(MEDiasCP.Text) <> '' then
  begin
    MEDataCP.Text := DateToStr(Date + StrToFloat(MEDiasCP.Text));
    MEDiasCP.Text := '';
  end;
end;

procedure TFNota_ContaCorrente.MePrazoExit(Sender: TObject);
begin
  if Trim(MePrazo.Text) <> '' then
  begin
    If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'KREUZ' Then
        If StrToInt(Trim(MePrazo.Text)) = 10 Then
           MeFinalidade.Text := '100';
    geraParcelas;
    MEDiasCP.SetFocus;
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'DEBONA' then
      BtAvancarClick(Self);
  end;
end;

procedure TFNota_ContaCorrente.BtPrazoClick(Sender: TObject);
begin
  if FPrazoVencimentoCons = nil then
    FPrazoVencimentoCons := TFPrazoVencimentoCons.Create(Application);
  if FPrazoVencimentoCons.showModal = mrOk then
  begin
    MePrazo.Text := DMPrazoVencimento.QPrazoVencimento_ConsCod_Prazo_Vencimento.Text;
    MePrazoExit(Self);
  end;
end;



procedure TFNota_ContaCorrente.geraParcelas;
  var wLinha, wAux, wParc: string;
    wParcela, wDiferenca, wCentavoFinal, wSomaCentavos, wSoma: Real;
    wCont : Integer;
    wComissao: Extended;
    X, Y : Array of String;
    const wBranco: string = '                            ';
begin
  if Trim(MePrazo.Text) <> '' then
  begin

    setLength(x, 3); //3 sql diferentes
    setLength(y, 3);

    x[0] := 'SELECT NUM_PARCELAS FROM TB_PRAZO_VENCIMENTO WHERE COD_PRAZO_VENCIMENTO = ' + Trim(MePrazo.Text);
    x[1] := 'SELECT VAL_MINIMO_VENDA FROM TB_PRAZO_VENCIMENTO WHERE COD_PRAZO_VENCIMENTO = ' + Trim(MePrazo.Text);
    x[2] := 'SELECT IND_SUBST_PRIMEIRA_PARC FROM TB_PRAZO_VENCIMENTO WHERE COD_PRAZO_VENCIMENTO = ' + Trim(MePrazo.Text);

    DMOracle.BuscaNomes(x, y);

    wParc := y[0];
    if wParc = '' then
       raise Exception.Create('Código de parcelas inexistente');
    wAux := y[1];
    if StrToFloat(wAux) <> 0 then
      if (StrToFloat(StringReplace(EdTotalNF.Text,'.','',[rfReplaceAll]))) < StrToFloat(wAux) then
      begin
        MePrazo.SetFocus;
        raise Exception.Create('Valor da nota menor que mínimo exigido para este prazo');
      end;
    DMPrazoVencimento.QPrazoVencimentoDias.Close;
    DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('COD_PRAZO_VENCIMENTO', Trim(MePrazo.Text));
    DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('NUM_DIAS', Null);
    DMPrazoVencimento.QPrazoVencimentoDias.Open;
    LBContaReceber.Items.Clear;

//  Código a seguir editado 01/08/2017 por Giancarlo Visentin
//  Alterado para jogar ST, diferença e centavos para primeira parcela
//
    if Y[2] = 'SIM' then  // VALOR DA SUBSTITUICAO NA PRIMEIRA PARCELA
      wParcela := Trunc((StrToFloat(StringReplace(EdTotalNF.Text,'.','',[rfReplaceAll])) - DMNotaSaida.QSomaItemNotaSVAL_ICMS_SUBST.Value) / StrToFloat(wParc) * 100) / 100
    else
      wParcela := Trunc(StrToFloat(StringReplace(EdTotalNF.Text,'.','',[rfReplaceAll])) / StrToFloat(wParc) * 100) / 100;

    wCont := 0;
    wSoma := 0;
    wCentavoFinal := wParcela - Trunc(wParcela*10)/10;//retornaSegundaCasaDecimal(wParcela);
    wSomaCentavos := StrToInt(wParc) * wCentavoFinal;

    while not (DMPrazoVencimento.QPrazoVencimentoDias.Eof) do
    begin
      Inc(wCont);

      if ((Y[2] = 'SIM') and (wCont = 1)) then
      begin
        wDiferenca := StrToFloat(StringReplace(EdTotalNF.Text,'.','',[rfReplaceAll])) - (wParcela*StrToInt(wParc)) - DMNotaSaida.QSomaItemNotaSVAL_ICMS_SUBST.Value
      end
      else if wCont = 1 then
      begin
        wDiferenca := StrToFloat(StringReplace(EdTotalNF.Text,'.','',[rfReplaceAll])) - (wParcela*StrToInt(wParc));
      end;

        // Alterado para contar vencimento a partir da data de saida da nota - Djeison A. S. 08/11/2013
      wLinha := DateToStr(Date + DMPrazoVencimento.QPrazoVencimentoDiasNUM_DIAS.Value);

      if ((Y[2] = 'SIM') and (wCont = 1)) then
        wAux := FormatFloat('###,###,##0.00', wParcela + wDiferenca + (wSomaCentavos - wCentavoFinal) + DMNotaSaida.QSomaItemNotaSVAL_ICMS_SUBST.Value)
      else if wCont = 1 then
        wAux := FormatFloat('###,###,##0.00', wParcela + wDiferenca + (wSomaCentavos - wCentavoFinal))
      else
        wAux := FormatFloat('###,###,##0.00', wParcela - wCentavoFinal);
      wAux := Copy(wBranco, 1, 15 - Length(waux)) + wAux;
      wLinha := wLinha + wAux;
      LBContaReceber.Items.Add(wLinha);
      DMPrazoVencimento.QPrazoVencimentoDias.Next;
    end;
    MEDataCP.Text := '';
    MEValorCP.Text := '';
    MePrazo.Text := '';
  end;
end;

end.
