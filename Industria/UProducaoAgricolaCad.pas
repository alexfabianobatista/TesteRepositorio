unit UProducaoAgricolaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, OracleNavigator, Grids, DBGrids, Variants,
  ActnList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

type
  TFProducaoAgricolaCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    BtnConsTurno: TBitBtn;
    DBDirceu1: TDBDirceu;
    BtnConsFilial: TBitBtn;
    DBDirceu2: TDBDirceu;
    BtnConsOp: TBitBtn;
    DBDirceu3: TDBDirceu;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    DSMateriaPrima: TDataSource;
    Btn2ConsProduto: TBitBtn;
    DBDirceu4: TDBDirceu;
    DSProdutoAcabado: TDataSource;
    Btn3ConsProduto: TBitBtn;
    DBDirceu5: TDBDirceu;
    DBGrid1: TDBGrid;
    OracleNavigator1: TOracleNavigator;
    DBGrid2: TDBGrid;
    OracleNavigator2: TOracleNavigator;
    Opes1: TMenuItem;
    Confirmar2: TMenuItem;
    VoltarConfirmao1: TMenuItem;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label17: TLabel;
    MaskEdit1: TMaskEdit;
    DBEdit9: TDBEdit;
    DBEdit14: TDBEdit;
    ProduoMatriaPrima1: TMenuItem;
    DBEdit17: TDBEdit;
    ProduoProdutoAcabado1: TMenuItem;
    RelatrioProduo1: TMenuItem;
    procedure BtnConsTurnoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnConsFilialClick(Sender: TObject);
    procedure BtnConsOpClick(Sender: TObject);
    procedure Btn2ConsProdutoClick(Sender: TObject);
    procedure Btn3ConsProdutoClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DSMateriaPrimaStateChange(Sender: TObject);
    procedure DSProdutoAcabadoStateChange(Sender: TObject);
    procedure Confirmar2Click(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure VoltarConfirmao1Click(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure ProduoMatriaPrima1Click(Sender: TObject);
    procedure DBEdit17Change(Sender: TObject);
    procedure ProduoProdutoAcabado1Click(Sender: TObject);
    procedure RelatrioProduo1Click(Sender: TObject);
    procedure OracleNavigator1Click(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure OracleNavigator2Click(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure MaskEdit1Change(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure DBPCadastroDefine(Sender: TObject; var QueryConsulta: TDataSet;
      var FormConsulta: TForm);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProducaoAgricolaCad: TFProducaoAgricolaCad;

implementation

uses UProducaoAgricola_cl, UTurnoCons, UTurno_cl,
  UFilialCons, UFilial_cl, UOperacaoCons, UOperacao_cl, UProdutoCons,
  UProduto_cl, UOracle_cl, UEstoque_cl, UProducaoAgricolaCons,
  UProducaoAgricolaParam, URProdMateriaPrima, URProdutoAcabado,
  URProducaoAgricola, UNotaSaida_cl, UCadastro_cl, UCadastroCons,
  UNotaEntrada_cl, USerie_cl;

{$R *.DFM}

procedure TFProducaoAgricolaCad.BtnConsTurnoClick(Sender: TObject);
begin
  inherited;
  if FTurnoCons = nil then
    FTurnoCons := TFTurnoCons.Create(Application);

  if FTurnoCons.ShowModal = mrOk then
  begin
    DMProducaoAgricola.QProducaoAgricolaCOD_TURNO.value := DMTurno.QTurnoAllCOD_TURNO.value;
  end;
end;

procedure TFProducaoAgricolaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMProducaoAgricola.QProducaoAgricola.Close;
  DMProducaoAgricola.QMateriaPrima.Close;
  DMProducaoAgricola.QProdutoAcabado.Close;

  DMProducaoAgricola.QProducaoAgricola.Open;
  DMProducaoAgricola.QMateriaPrima.Open;
  DMProducaoAgricola.QProdutoAcabado.Open;

end;

procedure TFProducaoAgricolaCad.BtnConsFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);

  if FFilialCons.ShowModal = mrOk then
  begin
    DMProducaoAgricola.QProducaoAgricolaCOD_FILIAL.value := DMFilial.QFilialConsCOD_FILIAL.value;
  end;
end;

procedure TFProducaoAgricolaCad.BtnConsOpClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex := 1;
  FOperacaoCons.RGTipoOperacao.Enabled := False;
  if FOperacaoCons.ShowModal = mrOk then
    DMProducaoAgricola.QProducaoAgricolaCOD_OPERACAO.value := DMOperacao.QOperacaoConsCOD_OPERACAO.value;
  FOperacaoCons.RGTipoOperacao.ItemIndex := 0;
  FOperacaoCons.RGTipoOperacao.Enabled := True;
end;

procedure TFProducaoAgricolaCad.Btn2ConsProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);

  if FProdutoCons.ShowModal = mrOk then
    DMProducaoAgricola.QMateriaPrimaCOD_PRODUTO.value := StrToInt(DMProduto.QProdutoConsCOD_PRODUTO.text);

end;

procedure TFProducaoAgricolaCad.Btn3ConsProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);

  if FProdutoCons.ShowModal = mrOk then
    DMProducaoAgricola.QProdutoAcabadoCOD_PRODUTO.value := StrToInt(DMProduto.QProdutoConsCOD_PRODUTO.text);
end;

procedure TFProducaoAgricolaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;

  if DSPrimario.DataSet.State in [dsEdit, dsInsert] then
  begin
    BtnConsTurno.Enabled := True;
    BtnConsFilial.Enabled := True;
    BtnConsOP.Enabled := True;
    OracleNavigator1.Enabled := False;
    OracleNavigator2.Enabled := False;
    MMCadSimples.Items[2].Items[0].Enabled := false;
    MMCadSimples.Items[2].Items[1].Enabled := false;
  end
  else
  begin
    BtnConsTurno.Enabled := False;
    BtnConsFilial.Enabled := False;
    BtnConsOP.Enabled := False;
    OracleNavigator1.Enabled := True;
    OracleNavigator2.Enabled := True;
    if DMProducaoAgricola.QProducaoAgricolaIND_CONFIRMADO.Value = '2' then
    begin
      MMCadSimples.Items[2].Items[0].Enabled := false;
      MMCadSimples.Items[2].Items[1].Enabled := true;
    end
    else
    begin
      MMCadSimples.Items[2].Items[0].Enabled := true;
      MMCadSimples.Items[2].Items[1].Enabled := false;
    end;

  end;


end;

procedure TFProducaoAgricolaCad.DSMateriaPrimaStateChange(Sender: TObject);
begin
  inherited;
  if DSMateriaPrima.DataSet.State in [dsEdit, dsInsert] then
  begin
    Btn2ConsProduto.Enabled := True;
    //MMCadSimples.Items[2].Items[0].Enabled := false;
    //MMCadSimples.Items[2].Items[1].Enabled := false;
  end
  else
  begin
    Btn2ConsProduto.Enabled := False;
    //MMCadSimples.Items[2].Items[0].Enabled := true;
    //MMCadSimples.Items[2].Items[1].Enabled := true;
  end;
end;

procedure TFProducaoAgricolaCad.DSProdutoAcabadoStateChange(
  Sender: TObject);
begin
  inherited;
  if DSProdutoAcabado.DataSet.State in [dsEdit, dsInsert] then
  begin
    Btn3ConsProduto.Enabled := True;
    //MMCadSimples.Items[2].Items[0].Enabled := false;
    //MMCadSimples.Items[2].Items[1].Enabled := false;
  end
  else
  begin
    Btn3ConsProduto.Enabled := False;
    //MMCadSimples.Items[2].Items[0].Enabled := true;
    //MMCadSimples.Items[2].Items[1].Enabled := false;
  end;

end;

procedure TFProducaoAgricolaCad.Confirmar2Click(Sender: TObject);
var
  wCommit, wCommitProducao: Boolean;
  wNumNFS, wNumNFE: Integer;  //Numero das notas de Entrada e Saida geradas.
//  wSerie: Integer;
procedure AtualizaEstoque;
begin
  with DMProducaoAgricola do
  begin
    QProdutoAcabado.First;
    while not QProdutoAcabado.Eof do
    begin
      DMEstoque.Atualiza_Estoque(-1, QProducaoAgricolaCOD_FILIAL.Value, QProdutoAcabadoCOD_PRODUTO.Value,
        1, QProdutoAcabadoQDE_QUANTIDADE.Value, 0, 0, 0);
      QProdutoAcabado.Next;
    end;
    QMateriaPrima.First;
    while not QMateriaPrima.Eof do
    begin
      DMEstoque.Atualiza_Estoque(-1, QProducaoAgricolaCOD_FILIAL.Value, QMateriaPrimaCOD_PRODUTO.Value,
        1, (QMateriaPrimaQDE_QUANTIDADE.Value * -1), 0, 0, 0);
      QMateriaPrima.Next;
    end;
  end;
end;
begin
  inherited;
  with DMProducaoAgricola do
  begin
    if QProducaoAgricolaIND_CONFIRMADO.Value <> '2' then
    begin
      DMOracle.DBCemapa.StartTransaction;
      wCommitProducao := QProducaoAgricola.CommitOnPost;
      try
        QProducaoAgricola.CommitOnPost := False;
        case MessageDlg('Deseja emitir as notas de entrada e saída? (Se clicar em Não irá apenas atualizar o estoque)', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
          mrYes:
            begin
              DMFilial.QFilial.Close;
              DMFilial.QFilial.SetVariable('PK', QProducaoAgricolaCOD_FILIAL.Value);
              DMFilial.QFilial.Open;
              if DMFilial.QFilialCOD_CADASTRO.Value <= 0 then
                raise Exception.Create('Filial não possui um cadastro padrão, checar cadastro da filial.');

              DMOperacao.QOperacao.Close;
              DMOperacao.QOperacao.SetVariable('PK', QProducaoAgricolaCOD_OPERACAO.Value);
              DMOperacao.QOperacao.Open;
              if DMOperacao.QOperacaoCOD_SERIE.Value = '' then
                raise Exception.Create('Operação não possui uma série, checar cadastro da operação.');

              with DMNotaSaida do // GERANDO NOTA DE SAIDA DA MATERIA PRIMA
              begin
                QItemNF.Close;
                QNotaSaida.Close;
                wCommit := QNotaSaida.CommitOnPost;
                QNotaSaida.CommitOnPost := False;
                QNotaSaida.Open;
                QItemNF.Open;
                QNotaSaida.Open;

                QNotaSaida.Insert;
                QNotaSaidaCOD_FILIAL.Value := QProducaoAgricolaCOD_FILIAL.Value;
                QNotaSaidaCOD_CADASTRO.Value := DMFilial.QFilialCOD_CADASTRO.Value;
                QNotaSaidaCOD_SERIE.Value := DMOperacao.QOperacaoCOD_SERIE.Value;
                QNotaSaidaCOD_OPERACAO.Value := QProducaoAgricolaCOD_OPERACAO.Value;
                QNotaSaidaNUM_NOTA.Value := DMSerie.NumeroSerie(QNotaSaidaCOD_FILIAL.Value,QNotaSaidaCOD_SERIE.Value
                ,QNotaSaidaCOD_SERIE_MODELO.Value);
                QNotaSaida.Post;
                QNotaSaida.Edit;

                QMateriaPrima.First;
                while not QMateriaPrima.Eof do
                begin
                  QItemNF.Insert;
                  QItemNFCOD_PRODUTO.Value := QMateriaPrimaCOD_PRODUTO.Value;
                  QItemNFQT_QUANTIDADE.Value := QMateriaPrimaQDE_QUANTIDADE.Value;
                  QItemNFVAL_UNITARIO.Value := QMateriaPrimaVAL_CUSTO.Value / QMateriaPrimaQDE_QUANTIDADE.Value;
                  QItemNF.Post;
                  QMateriaPrima.Next;
                end;

                QNotaSaidaIND_SITUACAO.Value := '2'; //Gerando nota já confirmada.
                QNotaSaidaIND_CONDICAO_PAGTO.Value := '3'; //Pagamento "OUTROS"
                QNotaSaida.Post;
                QProducaoAgricola.Edit;
                QProducaoAgricolaCOD_NOTA_CAB_SAIDA.Value := QNotaSaidaCOD_NOTA_CAB.Value;
                QProducaoAgricola.Post;
                wNumNFS := QNotaSaidaNUM_NOTA.Value;
                QNotaSaida.Close;
                QItemNF.Close;
                QNotaSaida.CommitOnPost := wCommit;
              end;

              with DMNotaEntrada do // GERANDO NOTA DE ENTRADA DO PRODUTO ACABADO
              begin
                QItemNF.Close;
                QNotaEntrada.Close;
                wCommit := QNotaEntrada.CommitOnPost;
                QNotaEntrada.CommitOnPost := False;
                QNotaEntrada.Open;
                QItemNF.Open;
                QNotaEntrada.Open;

                QNotaEntrada.Insert;
                QNotaEntradaCOD_FILIAL.Value := QProducaoAgricolaCOD_FILIAL.Value;
                QNotaEntradaCOD_CADASTRO.Value := DMFilial.QFilialCOD_CADASTRO.Value;
                QNotaEntradaCOD_SERIE.Value := DMOracle.BuscaNome('SELECT COD_SERIE FROM TB_OPERACAO',
                    'COD_OPERACAO = ' + DMOperacao.QOperacaoCOD_OPERACAO_ENTRADA.Text);
                QNotaEntradaCOD_OPERACAO.Value := DMOperacao.QOperacaoCOD_OPERACAO_ENTRADA.Value;
                QNotaEntradaNUM_NOTA.Value := DMSerie.NumeroSerie(QNotaEntradaCOD_FILIAL.Value,
                    QNotaEntradaCOD_SERIE.Value,QNotaEntradaCOD_SERIE_MODELO.Value);
                QNotaEntrada.Post;
                QNotaEntrada.Edit;

                QProdutoAcabado.First;
                while not QProdutoAcabado.Eof do
                begin
                  QItemNF.Insert;
                  QItemNFCOD_PRODUTO.Value := QProdutoAcabadoCOD_PRODUTO.Value;
                  QItemNFQT_QUANTIDADE.Value := QProdutoAcabadoQDE_QUANTIDADE.Value;
                  QItemNFVAL_TOTAL.Value := QProdutoAcabadoVAL_CUSTO.Value;
                  QItemNF.Post;
                  QProdutoAcabado.Next;
                end;

                QNotaEntradaIND_SITUACAO.Value := '2'; //Gerando nota já confirmada.
                QNotaEntradaIND_CONDICAO_PAGTO.Value := '3'; //Pagamento "OUTROS"
                QNotaEntrada.Post;
                QProducaoAgricola.Edit;
                QProducaoAgricolaCOD_NOTA_CAB_ENTRADA.Value := QNotaEntradaCOD_NOTA_CAB.Value;
                QProducaoAgricola.Post;
                wNumNFE := QNotaEntradaNUM_NOTA.Value;
                QNotaEntrada.Close;
                QItemNF.Close;
                QNotaEntrada.CommitOnPost := wCommit;
              end;

              AtualizaEstoque;
              QProducaoAgricola.Edit;
              QProducaoAgricolaIND_CONFIRMADO.Value := '2';
              QProducaoAgricola.Post;
              MessageDlg('Produção Confirmada. Nota de Saída número: ' + IntToStr(wNumNFS) +
                '; Nota de Entrada número ' + IntToStr(wNumNFE), mtInformation, [mbOK], 0);
              if DMOracle.DBCemapa.InTransaction then
                DMOracle.DBCemapa.Commit;
            end;
          mrNo:
            begin
              AtualizaEstoque;
              QProducaoAgricola.Edit;
              QProducaoAgricolaIND_CONFIRMADO.Value := '2';
              QProducaoAgricola.Post;
              MessageDlg('Produção Confirmada.', mtInformation, [mbOK], 0);
              if DMOracle.DBCemapa.InTransaction then
                DMOracle.DBCemapa.Commit;
            end;
          else
            begin
              if DMOracle.DBCemapa.InTransaction then
                DMOracle.DBCemapa.Rollback;
            end;
        end;
        QProducaoAgricola.CommitOnPost := wCommitProducao;
//        QProdutoAcabado.First;
//        while not QProdutoAcabado.Eof do
//        begin
//          DMEstoque.Atualiza_Estoque(-1, QProducaoAgricolaCOD_FILIAL.Value, QProdutoAcabadoCOD_PRODUTO.Value,
//            1, QProdutoAcabadoQDE_QUANTIDADE.Value, 0, 0, 0);
//          QProdutoAcabado.Next;
//        end;
//        QMateriaPrima.First;
//
//        //nota de saida
//        with DMNotaSaida do
//        begin
//          DMFilial.QFilial.Close();
//          DMFilial.QFilial.SetVariable('PK', QProducaoAgricolaCOD_FILIAL.Value);
//          DMFilial.QFilial.Open();
//          if DMFilial.QFilialCOD_CADASTRO.Value <= 0 then
//            raise Exception.Create('Filial não possui um cadastro padrão, checar cadastro da filial');
//          if DMFilial.QFilialCOD_SERIE.Value = '' then
//            raise Exception.Create('Filial não possui uma série padrão, checar cadastro da filial');
//
//          //pega o próximo numero da serie da filial e atualiza a serie
//          //******************************************************************************************
//          wSerie := strToInt(DMOracle.BuscaNome('SELECT NUM_SERIE FROM TB_SERIE', 'COD_SERIE = ' + QuotedStr(DMFilial.QFilialCOD_SERIE.Value) +
//            ' AND COD_FILIAL = ' + DMFilial.QFilialCOD_FILIAL.Text));
//          inc(wSerie);
//          DMOracle.QExecSQL.Close;
//          DMOracle.QExecSQL.SQL.Clear;
//          DMOracle.QExecSQL.SQL.Add('UPDATE TB_SERIE SET NUM_SERIE = ' + intToStr(wSerie) +
//            ' WHERE COD_SERIE = ' + QuotedStr(DMFilial.QFilialCOD_SERIE.Value) + ' AND' +
//            ' COD_FILIAL = ' + DMFilial.QFilialCOD_FILIAL.Text);
//          //******************************************************************************************
//          QNotaSaida.Open;
//          QItemNF.Open;
//          QNotaSaida.CommitOnPost := true;
//          QNotaSaida.Insert;
//          QNotaSaidaNUM_NOTA.Value := wSerie;
//
//          QNotaSaida.Post;
//          QNotaSaida.CommitOnPost := false;
//        end;
//
//        while not QMateriaPrima.Eof do
//        begin
//          DMEstoque.Atualiza_Estoque(-1, QProducaoAgricolaCOD_FILIAL.Value, QMateriaPrimaCOD_PRODUTO.Value,
//            1, (QMateriaPrimaQDE_QUANTIDADE.Value * -1), 0, 0, 0);
//          QMateriaPrima.Next;
//        end;
//        DMOracle.QExecSQL.Close;
//        DMOracle.QExecSQL.SQL.Clear;
//        DMOracle.QExecSQL.SQL.Add('UPDATE TB_PRODUCAO_AGRICOLA SET IND_CONFIRMADO = ''2'' ');
//        DMOracle.QExecSQL.SQL.Add('WHERE COD_PRODUCAO_AGRICOLA =' + IntToStr(QProducaoAgricolaCOD_PRODUCAO_AGRICOLA.Value));
//        DMOracle.QExecSQL.ExecSQL;
//
//        DMOracle.DBCemapa.Commit;
//        QProducaoAgricola.RefreshRecord;
//        MMCadSimples.Items[2].Items[0].Enabled := false;
//        MMCadSimples.Items[2].Items[1].Enabled := true;
      except
        QProducaoAgricola.CommitOnPost := wCommitProducao;
        DMOracle.DBCemapa.Rollback;
        raise;
      end;
    end
    else
      MessageDlg('Produção já confirmada', mtError, [mbOK], 0);
  end;
  OracleNavigator1.Enabled := false;
  OracleNavigator2.Enabled := false;
end;

procedure TFProducaoAgricolaCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TFProducaoAgricolaCad.VoltarConfirmao1Click(Sender: TObject);
var
  wCodNota: Integer;
  wCommit: Boolean;
begin
  inherited;
  with DMProducaoAgricola do
    if QProducaoAgricolaIND_CONFIRMADO.Value <> '1' then
      try
        DMOracle.DBCemapa.StartTransaction;
        wCommit := QProducaoAgricola.CommitOnPost;
        QProducaoAgricola.CommitOnPost := False;

        QProdutoAcabado.First;
        while not QProdutoAcabado.Eof do
        begin
          DMEstoque.Atualiza_Estoque(-1, QProducaoAgricolaCOD_FILIAL.Value, QProdutoAcabadoCOD_PRODUTO.Value,
            1, (QProdutoAcabadoQDE_QUANTIDADE.Value * -1), 0, 0, 0);
          QProdutoAcabado.Next;
        end;

        QMateriaPrima.First;
        while not QMateriaPrima.Eof do
        begin
          DMEstoque.Atualiza_Estoque(-1, QProducaoAgricolaCOD_FILIAL.Value, QMateriaPrimaCOD_PRODUTO.Value,
            1, QMateriaPrimaQDE_QUANTIDADE.Value, 0, 0, 0);
          QMateriaPrima.Next;
        end;

        if QProducaoAgricolaCOD_NOTA_CAB_ENTRADA.Value > 0 then
        begin
          wCodNota := QProducaoAgricolaCOD_NOTA_CAB_ENTRADA.Value;
          QProducaoAgricola.Edit;
          QProducaoAgricolaCOD_NOTA_CAB_ENTRADA.Clear;
          QProducaoAgricola.Post;
          DMOracle.ExecutaSql('DELETE FROM TB_NOTA_ITEM WHERE COD_NOTA_CAB = ' + IntToStr(wCodNota), False);
          DMOracle.ExecutaSql('DELETE FROM TB_NOTA_CAB WHERE COD_NOTA_CAB = ' + IntToStr(wCodNota), False);
        end;
        if QProducaoAgricolaCOD_NOTA_CAB_SAIDA.Value > 0 then
        begin
          wCodNota := QProducaoAgricolaCOD_NOTA_CAB_SAIDA.Value;
          QProducaoAgricola.Edit;
          QProducaoAgricolaCOD_NOTA_CAB_SAIDA.Clear;
          QProducaoAgricola.Post;
          DMOracle.ExecutaSql('DELETE FROM TB_NOTA_ITEM WHERE COD_NOTA_CAB = ' + IntToStr(wCodNota), False);
          DMOracle.ExecutaSql('DELETE FROM TB_NOTA_CAB WHERE COD_NOTA_CAB = ' + IntToStr(wCodNota), False);
        end;

        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('UPDATE TB_PRODUCAO_AGRICOLA SET IND_CONFIRMADO = ''3'' ');
        DMOracle.QExecSQL.SQL.Add('WHERE COD_PRODUCAO_AGRICOLA =' + IntToStr(QProducaoAgricolaCOD_PRODUCAO_AGRICOLA.Value));
        DMOracle.QExecSQL.ExecSQL;

        DMOracle.DBCemapa.Commit;
        QProducaoAgricola.CommitOnPost := wCommit;
        QProducaoAgricola.RefreshRecord;
        MMCadSimples.Items[2].Items[1].Enabled := false;
        MMCadSimples.Items[2].Items[0].Enabled := true;
        MessageDlg('Confirmação da produção voltada.', mtInformation, [mbOK], 0);
      except
        DMOracle.DBCemapa.Rollback;
        raise;
      end
    else
      MessageDlg('Essa produção não está confirmada', mtError, [mbOK], 0);
end;

procedure TFProducaoAgricolaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FProducaoAgricolaCons = nil then
    FProducaoAgricolaCons := TFProducaoAgricolaCons.Create(Application);
  if FProducaoAgricolaCons.ShowModal = mrOk then
    with DMProducaoAgricola do
    begin
      QProducaoAgricola.Close;
      QProducaoAgricola.SetVariable('PK', QProducaoAgricolaConsCOD_PRODUCAO_AGRICOLA.Value);
      QProducaoAgricola.Open;
      QMateriaPrima.Close;
      QProdutoAcabado.Close;
      QMateriaPrima.Open;
      QProdutoAcabado.Open;
    end;

end;


procedure TFProducaoAgricolaCad.DBEdit9Exit(Sender: TObject);
var
  wAux: string;
begin
  inherited;
  if DBEdit9.Text <> '' then
  begin
    with DMProducaoAgricola do
    begin

      wAux := DMOracle.BuscaNome('SELECT TB_ESTOQUE.VL_CUSTO_MEDIO FROM TB_ESTOQUE, TB_PRODUCAO_AGRICOLA',
        'TB_ESTOQUE.COD_PRODUTO =' + QMateriaPrimaCOD_PRODUTO.Text + 'AND TB_ESTOQUE.COD_FILIAL =' +
        QProducaoAgricolaCOD_FILIAL.text + 'AND TB_PRODUCAO_AGRICOLA.COD_PRODUCAO_AGRICOLA =' +
        QMateriaPrimaCOD_PRODUCAO_AGRICOLA.Text);


      if wAux <> '' then
      begin
        wAux := FloatToStr(QMateriaPrimaQDE_QUANTIDADE.Value * StrToFloat(wAux));
        QMateriaPrimaVAL_CUSTO.Text := FormatFloat('0.00', StrToFloat(wAux));
      end
      else
        QMateriaPrimaVAL_CUSTO.Text := '0';

    end;
  end;
end;

procedure TFProducaoAgricolaCad.ProduoMatriaPrima1Click(Sender: TObject);
//var
//  i: Integer;
begin
  inherited;
  if FProducaoAgricolaParam = nil then
    FProducaoAgricolaParam := TFProducaoAgricolaParam.Create(Application);
  FProducaoAgricolaParam.PGRelatorio.Pages[0].TabVisible := true;
  if FProducaoAgricolaParam.ShowModal = MrOk then
  begin
    with DMProducaoAgricola do
    begin
      QRProdMateriaPrima.Close;

      if Trim(FProducaoAgricolaParam.FmFilial1.MeFilial.Text) <> '' then
        QRProdMateriaPrima.SetVariable('FILIAL', Trim(FProducaoAgricolaParam.FmFilial1.MeFilial.Text))
      else
        QRProdMateriaPrima.SetVariable('FILIAL', null);
      if Trim(FProducaoAgricolaParam.FmTurno1.MeTurno.Text) <> '' then
        QRProdMateriaPrima.SetVariable('TURNO', Trim(FProducaoAgricolaParam.FmTurno1.MeTurno.Text))
      else
        QRProdMateriaPrima.SetVariable('TURNO', null);
      if Trim(FProducaoAgricolaParam.FmProduto1.MeProduto.Text) <> '' then
        QRProdMateriaPrima.SetVariable('PRODUTO', Trim(FProducaoAgricolaParam.FmProduto1.MeProduto.Text))
      else
        QRProdMateriaPrima.SetVariable('PRODUTO', null);
      if (Trim(FProducaoAgricolaParam.MeData_I.Text) <> '') and
        (Trim(FProducaoAgricolaParam.MeData_F.Text) <> '') then
      begin
        QRProdMateriaPrima.SetVariable('DATA_I', Trim(FProducaoAgricolaParam.MeData_I.Text));
        QRProdMateriaPrima.SetVariable('DATA_F', Trim(FProducaoAgricolaParam.MeData_F.Text))
      end
      else
        raise Exception.Create('Informar Data para a Busca');

      {if FProducaoAgricolaParam.CBXTurno1.Checked = true then
      begin
        QRProdMateriaPrima.SQL.Add('GROUP BY TB_PRODUCAO_AGRICOLA.COD_TURNO, TB_MATERIA_PRIMA.COD_PRODUTO,  TB_MATERIA_PRIMA.COD_MATERIA_PRIMA, ');
        QRProdMateriaPrima.SQL.Add('TB_PRODUCAO_AGRICOLA.COD_PRODUCAO_AGRICOLA, TB_MATERIA_PRIMA.VAL_CUSTO, TB_PRODUCAO_AGRICOLA.DT_PRODUCAO_AGRICOLA, ');
        QRProdMateriaPrima.SQL.Add('TB_MATERIA_PRIMA.QDE_QUANTIDADE, TB_PRODUTO.DESC_PRODUTO, TB_TURNO.DESC_TURNO');
      end
      else
      begin
        QRProdMateriaPrima.SQL.Add('GROUP BY TB_MATERIA_PRIMA.COD_PRODUTO, TB_PRODUCAO_AGRICOLA.COD_TURNO, TB_MATERIA_PRIMA.COD_MATERIA_PRIMA, ');
        QRProdMateriaPrima.SQL.Add('TB_PRODUCAO_AGRICOLA.COD_PRODUCAO_AGRICOLA, TB_MATERIA_PRIMA.VAL_CUSTO, TB_PRODUCAO_AGRICOLA.DT_PRODUCAO_AGRICOLA, ');
        QRProdMateriaPrima.SQL.Add('TB_MATERIA_PRIMA.QDE_QUANTIDADE, TB_PRODUTO.DESC_PRODUTO, TB_TURNO.DESC_TURNO');
      end;
      //QRProdMateriaPrima.SQL.Add(' ORDER BY DT_PRODUCAO_AGRICOLA');   }



      QRProdMateriaPrima.Open;
    end;
    if FRProdMateriaPrima = nil then
      FRProdMateriaPrima := TFRProdMateriaPrima.Create(Application);
    {if FProducaoAgricolaParam.CBXTurno1.Checked = true then
    begin
      FRProdMateriaPrima.QrGroup1.Enabled := true;
      FRProdMateriaPrima.QrBand4.Enabled := true;
      FRProdMateriaPrima.QRGroup1.Expression := 'QRProdMateriaPrima.DESC_TURNO';
      for i:=1 to 3 do
        DMProducaoAgricola.QRProdMateriaPrima.SQL[DMProducaoAgricola.QRProdMateriaPrima.SQL.Count-i]:='';
    end
    else
    begin
      FRProdMateriaPrima.QRGroup1.Expression := '';
      FRProdMateriaPrima.QRGroup1.Enabled := false;
      FRProdMateriaPrima.QrBand4.Enabled := false;
      for i:=1 to 3 do
        DMProducaoAgricola.QRProdMateriaPrima.SQL[DMProducaoAgricola.QRProdMateriaPrima.SQL.Count-i]:='';
    end;}
    FRProdMateriaPrima.QRLFilial.Caption := FProducaoAgricolaParam.FmFilial1.EdFilial.Text;
    FRProdMateriaPrima.QRLTurno.Caption := FProducaoAgricolaParam.FmTurno1.EdTurno.Text;
    FRProdMateriaPrima.QRLData_I.Caption := FProducaoAgricolaParam.MeData_I.Text;
    FRProdMateriaPrima.QRLData_F.Caption := FProducaoAgricolaParam.MeData_F.Text;
    if FProducaoAgricolaParam.RGPreview.ItemIndex = 0 then
      FRProdMateriaPrima.QRPrimario.Preview
    else
      FRProdMateriaPrima.QRPrimario.Print;
  end;

end;

procedure TFProducaoAgricolaCad.DBEdit17Change(Sender: TObject);
begin
  inherited;
  with DMProducaoAgricola do
  begin
    MMCadSimples.Items[2].Items[0].Enabled := QProducaoAgricolaConsIND_CONFIRMADO.Value = '1';
    MMCadSimples.Items[2].Items[1].Enabled := QProducaoAgricolaConsIND_CONFIRMADO.Value = '2';
    if QProducaoAgricolaConsIND_CONFIRMADO.Value = '3' then
    begin
      MMCadSimples.Items[2].Items[0].Enabled := true;
      MMCadSimples.Items[2].Items[1].Enabled := false;
    end;
  end;
end;

procedure TFProducaoAgricolaCad.ProduoProdutoAcabado1Click(
  Sender: TObject);
begin
  inherited;
  if FProducaoAgricolaParam = nil then
    FProducaoAgricolaParam := TFProducaoAgricolaParam.Create(Application);
  FProducaoAgricolaParam.PGRelatorio.Pages[1].TabVisible := true;
  if FProducaoAgricolaParam.ShowModal = MrOk then
  begin
    with DMProducaoAgricola do
    begin
      QRProdutoAcabado.Close;

      if Trim(FProducaoAgricolaParam.FmFilial2.MeFilial.Text) <> '' then
        QRProdutoAcabado.SetVariable('FILIAL', Trim(FProducaoAgricolaParam.FmFilial2.MeFilial.Text))
      else
        QRProdutoAcabado.SetVariable('FILIAL', null);

      if Trim(FProducaoAgricolaParam.FmTurno2.MeTurno.Text) <> '' then
        QRProdutoAcabado.SetVariable('TURNO', Trim(FProducaoAgricolaParam.FmTurno2.MeTurno.Text))
      else
        QRProdutoAcabado.SetVariable('TURNO', null);

      if Trim(FProducaoAgricolaParam.FmProduto2.MeProduto.Text) <> '' then
        QRProdutoAcabado.SetVariable('PRODUTO', Trim(FProducaoAgricolaParam.FmProduto2.MeProduto.Text))
      else
        QRProdutoAcabado.SetVariable('PRODUTO', null);

      if (Trim(FProducaoAgricolaParam.Me2Dt_I.Text) <> '') and (Trim(FProducaoAgricolaParam.Me2Dt_F.Text) <> '') then
      begin
        QRProdutoAcabado.SetVariable('DATA_I', Trim(FProducaoAgricolaParam.Me2Dt_I.Text));
        QRProdutoAcabado.SetVariable('DATA_F', Trim(FProducaoAgricolaParam.Me2Dt_F.Text));
      end
      else
        raise Exception.Create('Informar Data para a Busca');

      QRProdutoAcabado.open;
    end;
    if FRProdutoAcabado = nil then
      FRProdutoAcabado := TFRProdutoAcabado.Create(Application);
    FRProdutoAcabado.QRLFilial.Caption := FProducaoAgricolaParam.FmFilial2.EdFilial.Text;
    FRProdutoAcabado.QRLTurno.Caption := FProducaoAgricolaParam.FmTurno2.EdTurno.Text;
    FRProdutoAcabado.QRLData_I.Caption := FProducaoAgricolaParam.Me2Dt_I.Text;
    FRProdutoAcabado.QRLData_F.Caption := FProducaoAgricolaParam.Me2Dt_F.Text;
    if FProducaoAgricolaParam.RGPreview.ItemIndex = 0 then
      FRProdutoAcabado.QRPrimario.Preview
    else
      FRProdutoAcabado.QRPrimario.Print;
  end;
end;

procedure TFProducaoAgricolaCad.RelatrioProduo1Click(Sender: TObject);
begin
  inherited;
  if FProducaoAgricolaParam = nil then
    FProducaoAgricolaParam := TFProducaoAgricolaParam.Create(Application);
  FProducaoAgricolaParam.PGRelatorio.Pages[2].TabVisible := true;
  if FProducaoAgricolaParam.ShowModal = MrOk then
  begin
    with DMProducaoAgricola do
    begin
      QRProducao.Close;
      if Trim(FProducaoAgricolaParam.FmFilial3.MeFilial.Text) <> '' then
        QRProducao.SetVariable('FILIAL', Trim(FProducaoAgricolaParam.FmFilial3.MeFilial.Text))
      else
        QRProducao.SetVariable('FILIAL', null);

      if Trim(FProducaoAgricolaParam.FmTurno3.MeTurno.Text) <> '' then
        QRProducao.SetVariable('TURNO', Trim(FProducaoAgricolaParam.FmTurno3.MeTurno.Text))
      else
        QRProducao.SetVariable('TURNO', null);
      if (Trim(FProducaoAgricolaParam.Me3Data_I.Text) <> '') and
        (Trim(FProducaoAgricolaParam.Me3Data_F.Text) <> '') then
      begin
        QRProducao.SetVariable('DATA_I', FProducaoAgricolaParam.Me3Data_I.Text);
        QRProducao.SetVariable('DATA_F', FProducaoAgricolaParam.Me3Data_F.Text);
      end
      else
        raise Exception.Create('Informar Data para a Busca');
      QRProducao.Open;
      DMProducaoAgricola.QRProducaoPA.Close;
      DMProducaoAgricola.QRProducaoPA.Open;
      DMProducaoAgricola.QRProducaoMP.Close;
      DMProducaoAgricola.QRProducaoMP.Open;

    end;
    if FRProducaoAgricola = nil then
      FRProducaoAgricola := TFRProducaoAgricola.Create(Application);
    //---
    //se CheckBox marcado, habilita quebra por DESC_TURNO
    if FProducaoAgricolaParam.CBXTurno3.Checked = true then
      FRProducaoAgricola.QRGroup1.Enabled := true
    else
      FRProducaoAgricola.QRGroup1.Enabled := false;

    FRProducaoAgricola.QRLabel7.Enabled := FRProducaoAgricola.QRGroup1.Enabled;
    FRProducaoAgricola.QRLabel20.Enabled := FRProducaoAgricola.QRGroup1.Enabled;
    //---
    FRProducaoAgricola.QRLFilial.Caption := FProducaoAgricolaParam.FmFilial3.EdFilial.Text;
    FRProducaoAgricola.QRLTurno.Caption := FProducaoAgricolaParam.FmTurno3.EdTurno.Text;
    FRProducaoAgricola.QRLData_I.Caption := FProducaoAgricolaParam.Me3Data_I.Text;
    FRProducaoAgricola.QRLData_F.Caption := FProducaoAgricolaParam.Me3Data_F.Text;

    if FProducaoAgricolaParam.RGPreview.ItemIndex = 0 then
      FRProducaoAgricola.QRPrimario.Preview
    else
      FRProducaoAgricola.QRPrimario.Print;
  end;
end;

procedure TFProducaoAgricolaCad.OracleNavigator1Click(Sender: TObject;
  Button: TOracleNavigateBtn);
begin
  inherited;
  DBEdit11.SetFocus;
end;

procedure TFProducaoAgricolaCad.OracleNavigator2Click(Sender: TObject;
  Button: TOracleNavigateBtn);
begin
  inherited;
  DBEdit16.SetFocus;
end;

procedure TFProducaoAgricolaCad.MaskEdit1Change(Sender: TObject);
var wCusto: Real;
begin
  inherited;
  if MaskEdit1.Text <> '' then
  begin
    with DMProducaoAgricola do
    begin
      wCusto := 0;
      QMateriaPrima.First;
      while (not QMateriaPrima.Eof) do
      begin
        wCusto := wCusto + QMateriaPrimaVAL_CUSTO.value;
        QMateriaPrima.Next;
      end;
      QProdutoAcabadoVAL_CUSTO.Text := FormatFloat('0.00', ((StrToFloat(MaskEdit1.Text) * wCusto) / 100));
    end;
  end;
end;

procedure TFProducaoAgricolaCad.SBAlterarClick(Sender: TObject);
begin
  if DMProducaoAgricola.QProducaoAgricolaCOD_PRODUCAO_AGRICOLA.Text <> '' then
    if (DMOracle.BuscaNome('SELECT IND_CONFIRMADO FROM TB_PRODUCAO_AGRICOLA', 'COD_PRODUCAO_AGRICOLA = ' +
      DMProducaoAgricola.QProducaoAgricolaCOD_PRODUCAO_AGRICOLA.Text)) = '2' then
      raise Exception.Create('Não é possível alterar uma produção confirmada');

  inherited;

end;

procedure TFProducaoAgricolaCad.SBExcluirClick(Sender: TObject);
begin
  if DMProducaoAgricola.QProducaoAgricolaCOD_PRODUCAO_AGRICOLA.Text <> '' then
    if (DMOracle.BuscaNome('SELECT IND_CONFIRMADO FROM TB_PRODUCAO_AGRICOLA', 'COD_PRODUCAO_AGRICOLA = ' +
      DMProducaoAgricola.QProducaoAgricolaCOD_PRODUCAO_AGRICOLA.Text)) = '2' then
      raise Exception.Create('Não é possível excluir uma produção confirmada');
  inherited;

end;

procedure TFProducaoAgricolaCad.DBPCadastroDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  FormConsulta := FCadastroCons;
  QueryConsulta := DMCadastro.QCadastroCons;
end;

end.

