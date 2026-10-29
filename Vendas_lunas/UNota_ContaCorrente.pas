unit UNota_ContaCorrente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Mask, Grids, DBGrids, Db, DBTables, DBCtrls, variants;

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
    MEVencimento: TMaskEdit;
    Label5: TLabel;
    EdBanco: TEdit;
    LBParcela: TListBox;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNota_ContaCorrente: TFNota_ContaCorrente;

implementation

uses UFilialCons, UFilial_cl, UCadastro_cl, UCadastroCons, UNotaSaida_cl,
  UUsuario_cl, UOracle_cl, UParamSistema_cl, UFinalidadeCons,
  UFinalidade_cl, UBancosCons, UBancoAgencia_cl, UNotaEntrada_cl, USerie_cl,
  UOperacao_cl, URBloqueto, UNotaSaidaCad, UDepartamentoCons,
  UDepartamento_cl, URelatorioVenda_cl, UContaCorrenteCons;

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
    wTipoNota,wOperacao,wAux, wLinha, wBancoAgencia, wSql,wLibera_Bloqueto, wContaCorrente : String;
    wCadastro_Anterior,wConfirmados,wCancelados,wCodNotaCab : Integer;
Const wBranco : String = '                                      ';
begin
  wValor_Itens := 0;  // INICIALIZA VALOR DA VARIAVEL - Robson 26/06/2000
  wConfirmados := 0;
  wCancelados := 0;
  Case PCContaCorrente.ActivePage.PageIndex of
    0 : With DMNotaSaida do
        Begin
          pTrazPedido := False;
          DmUsuario.Checar_Filial_Usuario( Trim(MEFilial.Text),'VENDA');
          QSomaContaCorrente.Close;
          QSomaContaCorrente.Sql.Clear;
          wSql := wSql + 'Select SUM(Tb_nota_item.QT_QUANTIDADE) SQT_QUANTIDADE,TB_NOTA_CAB.VAL_AVISTA,';
          wSql := wSql + 'SUM(Tb_nota_item.VAL_TOTAL - tb_nota_item.VAL_DESCONTO) SVAL_TOTAL,';
          wSql := wSql + 'TB_NOTA_ITEM.PERC_IPI,TB_NOTA_ITEM.COD_TRIBUTACAO,TB_NOTA_CAB.COD_CADASTRO,';
          wSql := wSql + 'TB_NOTA_CAB.COD_NOTA_CAB,TB_PRODUTO.COD_PRODUTO,Tb_produto.DESC_PRODUTO ';
          wSql := wSql + ' FROM TB_PRODUTO,TB_NOTA_CAB,TB_NOTA_ITEM ';
          wSql := wSql + ' WHERE Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB ';
          wSql := wSql + ' AND Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO ';
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
          wSql := wSql + ' GROUP BY TB_NOTA_CAB.COD_CADASTRO,TB_NOTA_CAB.COD_NOTA_CAB, TB_PRODUTO.COD_PRODUTO, TB_NOTA_CAB.VAL_AVISTA , TB_NOTA_ITEM.PERC_IPI, TB_NOTA_ITEM.COD_TRIBUTACAO, Tb_produto.DESC_PRODUTO';
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
        End;
    2 : With DMNotaSaida do
        Try
          QSomaContaCorrente.First;
          wCadastro_Anterior := 0;
          wCodNotaCab := 0;
          wEntrada := 0;
          wOperacao := DMOracle.BuscaNome('SELECT COD_OPERACAO_CC FROM TB_CADASTRO',
                                          'COD_CADASTRO = '+FloatToStr(QSomaContaCorrenteCod_Cadastro.Value)) ;
          If Trim(wOperacao) = '' Then
             Raise Exception.Create ('Cliente Sem Código de Operação No Cadastro');
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
              QNotaSaidaCod_Filial.Value := StrToInt(Trim(MEFilial.Text));
              wTipoNota := DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO','COD_OPERACAO = '+FloatToStr(QNotaSaidaCod_Operacao.Value) );
              If wTipoNota = 'F' Then // Nota Fiscal
                QNotaSaidaCod_Serie.Value := DMParamSistema.QParamSistemaCod_Serie_Nota.Value
              else
                QNotaSaidaCod_Serie.Value := DMParamSistema.QParamSistemaCod_Serie_Pedido.Value;
            End;
            QItemNF.Insert;
            QItemNFCod_Produto.Value := QSomaContaCorrenteCod_Produto.Value;
            QItemNFQt_Quantidade.Value := QSomaContaCorrenteSQt_Quantidade.Value;
            QItemNFVal_Unitario.Value := QSomaContaCorrenteSVal_Total.Value / QItemNFQt_Quantidade.Value;
            QItemNFVal_Total.Value := QSomaContaCorrenteSVal_Total.Value;
            wValor_itens := wValor_Itens + QSomaContaCorrenteSVal_Total.Value;
            QItemNFPerc_Ipi.Value := QSomaContaCorrentePerc_Ipi.Value;
            QItemNFCod_Tributacao.Value := QSomaContaCorrenteCod_Tributacao.Value;
            QItemNFVal_ICM_Base.Value := 0;
            QItemNFVal_Desconto.Value := 0;
            QItemNFPerc_Desconto.Value := 0;
            QItemNFVal_Despesas.Value := 0;
            CalculaICM;
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
                  QNotaSaidaNum_Nota.Value := DMSerie.NumeroSerie(QNotaSaidaCod_Filial.Value,QNotaSaidaCod_Serie.Value);
                wLinha := DateToStr( StrToDate(MEVencimento.Text) );
                wAux := FormatFloat('###,###,##0.00',DMNotaSaida.QSomaItemNotaSVal_Total_Nota.Value - wEntrada);
                wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
                wLinha := wLinha + wAux;
                LBParcela.Items.Clear;
                LBParcela.Items.Add(wLinha);
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
                 End;
                QNotaSaidaInd_Situacao.Value := '2'; // Confirmada
                QNotaSaidaVal_AVista.Value := wEntrada;
                QNotaSaida.Post;
                wEntrada := 0;
                DMNotaSaida.GeraContaReceber(LBParcela.Items,StrToInt(Trim(MEFinalidade.Text)),wBancoAgencia,Trim(MEDepartamento.Text),wContaCorrente);
        //        DMNotaSaida.Contabiliza;
        //        DMNotaSaida.AtualizaEstoque(1);
                QAtzNFContaCorrente.Close;
                QAtzNFContaCorrente.SetVariable('FILIAL',StrToInt(Trim(MEFilial.Text)));
                QAtzNFContaCorrente.SetVariable('DATA_I',StrToDate(MEDataI.Text));
                QAtzNFContaCorrente.SetVariable('DATA_F',StrToDate(MEDataF.Text));
                QAtzNFContaCorrente.SetVariable('CADASTRO',wCadastro_Anterior);
                QAtzNFContaCorrente.SetVariable('COD_NOTA',QNotaSaidaCod_Nota_Cab.Value);
                If Trim(MENrNota.Text) = '' then
                  QAtzNFContaCorrente.SetVariable('NUM_NOTA',Null)
                Else
                  QAtzNFContaCorrente.SetVariable('NUM_NOTA',StrToInt(Trim(MENrNota.Text)));
                QAtzNFContaCorrente.ExecSQL;
                QSomaItemNota.Close;
                QSomaItemNota.Open;
                FNotaSaidaCad.Emisso1Click(Self);
                DMOracle.DBCemapa.Commit;
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
end;

procedure TFNota_ContaCorrente.FormCreate(Sender: TObject);
begin
  MEFilial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  MEDataI.Text := DateToStr(Date-30);
  MEDataF.Text := DateToStr(Date);
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

end.
