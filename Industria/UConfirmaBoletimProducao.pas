unit UConfirmaBoletimProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, StdCtrls, Buttons, Mask, Grids, DBGrids;

type
  TFConfirmaBoletimProducao = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label12: TLabel;
    MEQtBaixar: TMaskEdit;
    BtBaixaAux: TBitBtn;
    DBGrid1: TDBGrid;
    BtOk: TBitBtn;
    BtVoltaBaixa: TBitBtn;
    procedure BtBaixaAuxClick(Sender: TObject);
    procedure BtBaixaAuxGERAL(Sender: TObject);
    procedure BtBaixaAuxPERCAITEM(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtVoltaBaixaGERAL(Sender: TObject);
    procedure BtVoltaBaixaPERCAITEM(Sender: TObject);
    procedure BtVoltaBaixaPERCAACABADO(Sender: TObject);
    procedure BtVoltaBaixaClick(Sender: TObject);
    procedure BtBaixaAuxPRODUTOACABADO(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConfirmaBoletimProducao: TFConfirmaBoletimProducao;

implementation
uses UBoletim_cl, UOracle_cl, DB, UEstoque_cl, UFormula_cl, UBiblioteca, UBoletimOrdemProducao,
  UParamSistema_cl, UUsuario_cl, USenha, UCaixaLanc_Cont, UPlanilha_cl;

{$R *.dfm}

procedure TFConfirmaBoletimProducao.BtBaixaAuxGERAL(Sender: TObject);
var wQtde :double;
    wAux, wAux2 : String;
    wCustoTotal, wCustosAdicionais : Real;
    wQtEstoque: double;
    wTotalEstoque: double;
    wDescProduto: string;
    wQtdeBaixar: string;
    wFilial : integer;
    wCodDoc, wCodCompl, wCodHistorico : integer;
    wContaCred, wContaDeb, wNumDoc : String;
    wVlrLancto : Real;
    wDtLancto : TDateTime;
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEION' Then
    wFilial := 1
  else
    wFilial := DMBoletim.QBoletimProducaoCOD_FILIAL.Value;

  wQtde := StrToFloat(MEQtBaixar.Text);
  DMFormula.QFormula.Close;
  DMFormula.QFormula.SetVariable('PK', DMBoletim.QBoletimProducaoCOD_FORMULA.Value);
  DMFormula.QFormula.Open;

  with DMBoletim do
  begin
    if (wQtde > (QBoletimProducaoQT_FABRICADO.Value - QBoletimProducaoQT_BAIXADO.Value)) then
      raise Exception.Create('Quantidade inválida! - Quantidade maior que quantidade em aberto ');
    with DMOracle do
    begin
      try
        while not QBoletimProducaoItem.Eof do //Estoque do boletimItem
        begin
          wAux := DMOracle.BuscaNome('SELECT VL_ULTIMO_CUSTO FROM TB_ESTOQUE',
                                   'COD_PRODUTO = '+FloatToStr(QBoletimProducaoItemCod_Produto.Value)
                                   +' AND COD_LOTE_TIPO = '+FloatToStr(QBoletimProducaoItemCod_Lote_Tipo.Value)
                                   +' AND COD_FILIAL = ' + IntToStr(wFilial));
          If Trim(wAux) <> '' then
           QBoletimProducaoItemVal_Custo.Value := StrtoFloat(wAux)* QBoletimProducaoItemQt_Usada.Value;
          wCustoTotal := wCustoTotal + QBoletimProducaoItemVal_Custo.Value;

          wQtEstoque := ((((QBoletimProducaoItemQT_USADA.Value / DMFormula.QFormulaQT_PRODUCAO.Value)
            / QBoletimProducaoQT_FABRICADO.Value) * wQtde));

          // Gerencia baixa de estoque por lotes
          if DMParamSistema.QParamSistemaIND_GERENCIA_LOTE_ESTOQUE.Value = 'SIM' then
          begin
            DMEstoque.BuscaLotesEstoque(wFilial, QBoletimProducaoItemCOD_PRODUTO.Value);
            // DMEstoque.BuscaLotesEstoque(QBoletimProducaoCOD_FILIAL.AsInteger
            //  , QBoletimProducaoItemCOD_PRODUTO.Value);

            // Checa se a quantidade a ser baixada existe no estoque
            wTotalEstoque := 0;
            while not DMEstoque.QBuscaLoteEstoque.Eof do
            begin
              wTotalEstoque := wTotalEstoque
                + DMEstoque.QBuscaLoteEstoqueQT_QUANTIDADE.Value;
              DMEstoque.QBuscaLoteEstoque.Next;
            end;
            if wTotalEstoque < wQtEstoque then
            begin
              wDescProduto := DMOracle.FastSelect('DESC_PRODUTO', 'TB_PRODUTO'
                , 'COD_PRODUTO = ' + QBoletimProducaoItemCOD_PRODUTO.Text);
              MessageDlg('Estoque do produto ' + wDescProduto
                + ' sem quantidade disponível', mtError, [mbOk], 0);
              abort;
            end;

            // Faz a baixa
            DMEstoque.QBuscaLoteEstoque.First;
            while not DMEstoque.QBuscaLoteEstoque.Eof do
            begin
              // Último registro - deve baixar a quantidade total restante
              if DMEstoque.QBuscaLoteEstoque.RecNo
                = DMEstoque.QBuscaLoteEstoque.RecordCount then
              begin
                DMEstoque.AtualizaEstoque(-1,
                                    Trunc(wFilial),
                                    QBoletimProducaoItemCOD_PRODUTO.Value,
                                    DMEstoque.QBuscaLoteEstoqueCOD_LOTE_TIPO.AsInteger,
                                    wQtEstoque * -1,
                                    0,0,0 );
              end
              else // Não é o último registro
              begin
                if DMEstoque.QBuscaLoteEstoqueQT_QUANTIDADE.Value < wQtEstoque then
                begin
                  DMEstoque.AtualizaEstoque(-1,
                                      Trunc(wFilial),
                                      QBoletimProducaoItemCOD_PRODUTO.Value,
                                      DMEstoque.QBuscaLoteEstoqueCOD_LOTE_TIPO.AsInteger,
                                      DMEstoque.QBuscaLoteEstoqueQT_QUANTIDADE.Value * -1,
                                      0,0,0 );
                  wQtEstoque := wQtEstoque - DMEstoque.QBuscaLoteEstoqueQT_QUANTIDADE.Value;
                end
                else
                begin
                  DMEstoque.AtualizaEstoque(-1,
                                      Trunc(wFilial),
                                      QBoletimProducaoItemCOD_PRODUTO.Value,
                                      DMEstoque.QBuscaLoteEstoqueCOD_LOTE_TIPO.AsInteger,
                                      wQtEstoque * -1,
                                      0,0,0 );
                  break;
                end;
              end;
              DMEstoque.QBuscaLoteEstoque.Next;
            end;
          end
          else // baixa o estoque sem gerenciar lotes
          begin
            DMEstoque.AtualizaEstoque(-1,
                                Trunc(wFilial),
                                QBoletimProducaoItemCOD_PRODUTO.Value,
                                Trunc(QBoletimProducaoItemCOD_LOTE_TIPO.Value),
                                wQtEstoque * -1,
                                0,0,0 );
          end;
          QBoletimProducaoItem.Next;
        end;
        wCustoTotal := QBoletimProducaoVAL_CUSTO.Value;
        wAux := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_FORMULA', 'COD_FORMULA = '+FloatToStr(QBoletimProducaoCod_Formula.Value));
{Dionata da Rações Iguaçu solicitou comentar esta parte de codigo para que o custo atualize automaticamente. Alex 18/01/2024.
        if (DMParamSistema.CodEmpresa = 'RACOESIGUA') then
          DMEstoque.AtualizaEstoque(-2,  //-2 atualiza qtde mas não atualiza custo
                              Trunc(QBoletimProducaoCOD_FILIAL.Value),
                              StrToInt(wAux), //cod_produto
                              QBoletimProducaoCOD_LOTE_TIPO.Value,
                              StrToFloat(MEQtBaixar.Text),
                              0,0,0 ) //Rações Iguaçu(Clóvis) solicitou para não mudar o valor do custo do produto Junior 04/10/2017
        else}
          DMEstoque.AtualizaEstoque(-1,
                              Trunc(wFilial),
                              StrToInt(wAux), //cod_produto
                              QBoletimProducaoCOD_LOTE_TIPO.Value,
                              StrToFloat(MEQtBaixar.Text),
                              ((wCustoTotal/QBoletimProducaoQT_FABRICADO.Value) * StrToFloat(MEQtBaixar.Text)),0,0 ); //Estava calculando o custo errado na baixa parcial da Ordem de producao
                                                                                       //pegamos o custo total * a quantidade a baixar e diviimos por 100 (para pegar o custo proporcional) Junior 05/04/2019
        wQtdeBaixar := StringReplace(FloatToStr(wQtde + QBoletimProducaoQT_BAIXADO.Value), ',','.',[rfReplaceAll]);
        DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET QT_BAIXADO = ' + wQtdeBaixar +
                            ' WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text) );

        QBoletimProducao.Refresh;
        if QBoletimProducaoQT_BAIXADO.Value = 0 then
          DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET IND_SITUACAO = 1 WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text))
        else if QBoletimProducaoQT_FABRICADO.Value = QBoletimProducaoQT_BAIXADO.Value then
          DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET IND_SITUACAO = 2 WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text))
        else if (QBoletimProducaoQT_FABRICADO.Value > QBoletimProducaoQT_BAIXADO.Value) and (QBoletimProducaoQT_BAIXADO.Value > 0) then
          DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET IND_SITUACAO = 3 WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text));

        // contabiliza a pedido do Odirlei
        if (DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S') then
        begin
          wCodDoc := DMBoletim.QBoletimProducaoCod_Boletim.Value;
          wNumDoc := FloatToStr(DMBoletim.QBoletimProducaoCod_Boletim.Value) + '-' + Trim(DMBoletim.QBoletimProducaoCod_Formula.Text);
          wFilial := DMBoletim.QBoletimProducaoCod_Filial.Value;
          wCodCompl := DMBoletim.QBoletimProducaoCod_Cadastro_Envasador.Value;
          wVlrLancto := DMBoletim.QBoletimProducaoVal_Custo_Contabil.Value;
          wDtLancto := DMOracle.DataServ;
          if FCaixa_Lanc_Cont = nil then
            FCaixa_Lanc_Cont := TFCaixa_Lanc_Cont.Create(Application);
          if DMParamSistema.QParamSistemaInd_Tipo_Plano_Conta.Value = 'UNICO' then
            FCaixa_Lanc_Cont.pFilial := 1
          else
            FCaixa_Lanc_Cont.pFilial := wFilial;
          FCaixa_Lanc_Cont.MeFilialDebito.Text := FloatToStr(wFilial);
          FCaixa_Lanc_Cont.MeFilialCredito.Text := FloatToStr(wFilial);
          FCaixa_Lanc_Cont.LbHistorico.Visible := True;
          FCaixa_Lanc_Cont.MeHistorico.Visible := True;
          FCaixa_Lanc_Cont.SbConsHistorico.Visible := True;
          FCaixa_Lanc_Cont.MeHistoricoDescricao.Visible := True;
          FCaixa_Lanc_Cont.ShowModal;
          wContaCred := Bib.LimpaString(FCaixa_Lanc_Cont.MEContaCredito.text, '.');
          wContaDeb := Bib.LimpaString(FCaixa_Lanc_Cont.MEContaDebito.text, '.');
          wCodHistorico := StrToInt(Trim(FCaixa_Lanc_Cont.MeHistorico.Text));
          DMPlanilha.GravaLanc('IND', wCodDoc, wNumDoc, strtoint(FCaixa_Lanc_Cont.MeFilialCredito.Text), wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
          DMPlanilha.GravaLanc('IND', wCodDoc, wNumDoc, strtoint(FCaixa_Lanc_Cont.MeFilialDebito.Text), wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
        end;
        DBCemapa.Commit;
      except
        DBCemapa.Rollback;
        showmessage('Não foi possivel efetuar o lançamento');
      end;
      MEQtBaixar.Text := '';
      QBoletimProducao.Close;
      QBoletimProducao.Open;
    end;
  end;
end;

procedure TFConfirmaBoletimProducao.BtBaixaAuxPERCAITEM(Sender: TObject);
var wQtde :double;
    wAux, wAux2, wQtdPercaProducao : String;
    wCustoTotal, wCustosAdicionais, wCustoPerca : Real;
    wQtEstoque,  wQtdUtilizada: double;
    wTotalEstoque: double;
    wDescProduto: string;
    wQtdeBaixar: string;
    wFilial : integer;
    wCodDoc, wCodCompl, wCodHistorico : integer;
    wContaCred, wContaDeb, wNumDoc : String;
    wVlrLancto : Real;
    wDtLancto : TDateTime;
begin
  wFilial := DMBoletim.QBoletimProducaoCOD_FILIAL.Value;

  wQtde := StrToFloat(MEQtBaixar.Text);
  DMFormula.QFormula.Close;
  DMFormula.QFormula.SetVariable('PK', DMBoletim.QBoletimProducaoCOD_FORMULA.Value);
  DMFormula.QFormula.Open;

  with DMBoletim do
  begin
    wQtdPercaProducao := '';
    wQtdUtilizada := 0;

    if (wQtde > (QBoletimProducaoQT_FABRICADO.Value - QBoletimProducaoQT_BAIXADO.Value)) then
      raise Exception.Create('Quantidade inválida! - Quantidade maior que quantidade em aberto ');
    with DMOracle do
    begin
      try
        while not QBoletimProducaoItem.Eof do //Estoque do boletimItem
        begin
          wAux := DMOracle.BuscaNome('SELECT VL_ULTIMO_CUSTO FROM TB_ESTOQUE',
                                   'COD_PRODUTO = '+FloatToStr(QBoletimProducaoItemCod_Produto.Value)
                                   +' AND COD_LOTE_TIPO = '+FloatToStr(QBoletimProducaoItemCod_Lote_Tipo.Value)
                                   +' AND COD_FILIAL = ' + IntToStr(wFilial));
          // (QBoletimProducaoQT_FABRICADO.Value - dmboletim.QBoletimProducaoQT_BAIXADO.Value - wQtde = 0) then
            wQtdPercaProducao := DMOracle.FastSelect('QT_PERCA_PRODUCAO','TB_PERCA_PRODUCAO','COD_PRODUTO = ' + QBoletimProducaoItemCOD_PRODUTO.Text
                                          + ' AND COD_BOLETIM = ' + QBoletimProducaoItemCOD_BOLETIM.Text);

          if (wQtdPercaProducao <> '' ) and (Trim(wAux) <> '')  then
          begin
            wQtdPercaProducao := FloatToStr( (StrToFloat(wQtdPercaProducao)/QBoletimProducaoQT_FABRICADO.Value) * wQtde);
            wQtdUtilizada := ((QBoletimProducaoItemQT_USADA.Value /QBoletimProducaoQT_FABRICADO.Value ) * wQtde)   + StrToFloat(wQtdPercaProducao);
            QBoletimProducaoItemVAL_CUSTO.Value := StrToFloat(wAux) * wQtdUtilizada;
            wCustoPerca := wCustoPerca + QBoletimProducaoItemVAL_CUSTO.Value;
            //wQtEstoque := ((((wQtdUtilizada / DMFormula.QFormulaQT_PRODUCAO.Value) / QBoletimProducaoQT_FABRICADO.Value) + wQtde));
            wQtEstoque := wQtdUtilizada;
          end
          else
          begin
            If Trim(wAux) <> '' then
              QBoletimProducaoItemVal_Custo.Value := StrtoFloat(wAux)* QBoletimProducaoItemQt_Usada.Value;
            wCustoTotal := wCustoTotal + QBoletimProducaoItemVal_Custo.Value;
            wQtEstoque := ((((QBoletimProducaoItemQT_USADA.Value / DMFormula.QFormulaQT_PRODUCAO.Value) / QBoletimProducaoQT_FABRICADO.Value) * wQtde));
          end;
 {
          wQtEstoque := ((((QBoletimProducaoItemQT_USADA.Value / DMFormula.QFormulaQT_PRODUCAO.Value)
            / QBoletimProducaoQT_FABRICADO.Value) * wQtde));
}
          // Gerencia baixa de estoque por lotes
          if DMParamSistema.QParamSistemaIND_GERENCIA_LOTE_ESTOQUE.Value = 'SIM' then
          begin
            DMEstoque.BuscaLotesEstoque(wFilial, QBoletimProducaoItemCOD_PRODUTO.Value);

            // Checa se a quantidade a ser baixada existe no estoque
            wTotalEstoque := 0;
            while not DMEstoque.QBuscaLoteEstoque.Eof do
            begin
              wTotalEstoque := wTotalEstoque
                + DMEstoque.QBuscaLoteEstoqueQT_QUANTIDADE.Value;
              DMEstoque.QBuscaLoteEstoque.Next;
            end;
            if wTotalEstoque < wQtEstoque then
            begin
              wDescProduto := DMOracle.FastSelect('DESC_PRODUTO', 'TB_PRODUTO'
                , 'COD_PRODUTO = ' + QBoletimProducaoItemCOD_PRODUTO.Text);
              MessageDlg('Estoque do produto ' + wDescProduto
                + ' sem quantidade disponível', mtError, [mbOk], 0);
              abort;
            end;

            // Faz a baixa
            DMEstoque.QBuscaLoteEstoque.First;
            while not DMEstoque.QBuscaLoteEstoque.Eof do
            begin
              // Último registro - deve baixar a quantidade total restante
              if DMEstoque.QBuscaLoteEstoque.RecNo
                = DMEstoque.QBuscaLoteEstoque.RecordCount then
              begin
                DMEstoque.AtualizaEstoque(-1,
                                    Trunc(wFilial),
                                    QBoletimProducaoItemCOD_PRODUTO.Value,
                                    DMEstoque.QBuscaLoteEstoqueCOD_LOTE_TIPO.AsInteger,
                                    wQtEstoque * -1,
                                    0,0,0 );
              end
              else // Não é o último registro
              begin
                if DMEstoque.QBuscaLoteEstoqueQT_QUANTIDADE.Value < wQtEstoque then
                begin
                  DMEstoque.AtualizaEstoque(-1,
                                      Trunc(wFilial),
                                      QBoletimProducaoItemCOD_PRODUTO.Value,
                                      DMEstoque.QBuscaLoteEstoqueCOD_LOTE_TIPO.AsInteger,
                                      DMEstoque.QBuscaLoteEstoqueQT_QUANTIDADE.Value * -1,
                                      0,0,0 );
                  wQtEstoque := wQtEstoque - DMEstoque.QBuscaLoteEstoqueQT_QUANTIDADE.Value;
                end
                else
                begin
                  DMEstoque.AtualizaEstoque(-1,
                                      Trunc(wFilial),
                                      QBoletimProducaoItemCOD_PRODUTO.Value,
                                      DMEstoque.QBuscaLoteEstoqueCOD_LOTE_TIPO.AsInteger,
                                      wQtEstoque * -1,
                                      0,0,0 );
                  break;
                end;
              end;
              DMEstoque.QBuscaLoteEstoque.Next;
            end;
          end
          else // baixa o estoque sem gerenciar lotes
          begin
            DMEstoque.AtualizaEstoque(-1,
                                Trunc(wFilial),
                                QBoletimProducaoItemCOD_PRODUTO.Value,
                                Trunc(QBoletimProducaoItemCOD_LOTE_TIPO.Value),
                                wQtEstoque * -1,
                                0,0,0 );
          end;
          QBoletimProducaoItem.Next;
        end;
        if wCustoPerca > 0 then
          wCustoTotal := wCustoTotal + wCustoPerca;
        wAux := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_FORMULA', 'COD_FORMULA = '+FloatToStr(QBoletimProducaoCod_Formula.Value));
        DMEstoque.AtualizaEstoque(-1,
                            Trunc(wFilial),
                            StrToInt(wAux), //cod_produto
                            QBoletimProducaoCOD_LOTE_TIPO.Value,
                            StrToFloat(MEQtBaixar.Text),
                            ((wCustoTotal/QBoletimProducaoQT_FABRICADO.Value) * StrToFloat(MEQtBaixar.Text)),0,0 ); //Estava calculando o custo errado na baixa parcial da Ordem de producao
                                                                                       //pegamos o custo total * a quantidade a baixar e diviimos por 100 (para pegar o custo proporcional) Junior 05/04/2019
        wQtdeBaixar := StringReplace(FloatToStr(wQtde + QBoletimProducaoQT_BAIXADO.Value), ',','.',[rfReplaceAll]);
        DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET QT_BAIXADO = ' + wQtdeBaixar +
                            ' WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text) );

        QBoletimProducao.Refresh;
        if QBoletimProducaoQT_BAIXADO.Value = 0 then
          DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET IND_SITUACAO = 1 WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text))
        else if QBoletimProducaoQT_FABRICADO.Value = QBoletimProducaoQT_BAIXADO.Value then
          DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET IND_SITUACAO = 2 WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text))
        else if (QBoletimProducaoQT_FABRICADO.Value > QBoletimProducaoQT_BAIXADO.Value) and (QBoletimProducaoQT_BAIXADO.Value > 0) then
          DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET IND_SITUACAO = 3 WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text));

        // contabiliza a pedido do Odirlei
        if (DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S') then
        begin
          wCodDoc := DMBoletim.QBoletimProducaoCod_Boletim.Value;
          wNumDoc := FloatToStr(DMBoletim.QBoletimProducaoCod_Boletim.Value) + '-' + Trim(DMBoletim.QBoletimProducaoCod_Formula.Text);
          wFilial := DMBoletim.QBoletimProducaoCod_Filial.Value;
          wCodCompl := DMBoletim.QBoletimProducaoCod_Cadastro_Envasador.Value;
          wVlrLancto := DMBoletim.QBoletimProducaoVal_Custo_Contabil.Value;
          wDtLancto := DMOracle.DataServ;
          if FCaixa_Lanc_Cont = nil then
            FCaixa_Lanc_Cont := TFCaixa_Lanc_Cont.Create(Application);
          if DMParamSistema.QParamSistemaInd_Tipo_Plano_Conta.Value = 'UNICO' then
            FCaixa_Lanc_Cont.pFilial := 1
          else
            FCaixa_Lanc_Cont.pFilial := wFilial;
          FCaixa_Lanc_Cont.MeFilialDebito.Text := FloatToStr(wFilial);
          FCaixa_Lanc_Cont.MeFilialCredito.Text := FloatToStr(wFilial);
          FCaixa_Lanc_Cont.LbHistorico.Visible := True;
          FCaixa_Lanc_Cont.MeHistorico.Visible := True;
          FCaixa_Lanc_Cont.SbConsHistorico.Visible := True;
          FCaixa_Lanc_Cont.MeHistoricoDescricao.Visible := True;
          FCaixa_Lanc_Cont.ShowModal;
          wContaCred := Bib.LimpaString(FCaixa_Lanc_Cont.MEContaCredito.text, '.');
          wContaDeb := Bib.LimpaString(FCaixa_Lanc_Cont.MEContaDebito.text, '.');
          wCodHistorico := StrToInt(Trim(FCaixa_Lanc_Cont.MeHistorico.Text));
          DMPlanilha.GravaLanc('IND', wCodDoc, wNumDoc, strtoint(FCaixa_Lanc_Cont.MeFilialCredito.Text), wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
          DMPlanilha.GravaLanc('IND', wCodDoc, wNumDoc, strtoint(FCaixa_Lanc_Cont.MeFilialDebito.Text), wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
        end;
        DBCemapa.Commit;
      except
        DBCemapa.Rollback;
        showmessage('Não foi possivel efetuar o lançamento');
      end;
      MEQtBaixar.Text := '';
      QBoletimProducao.Close;
      QBoletimProducao.Open;
    end;
  end;
end;

procedure TFConfirmaBoletimProducao.BtBaixaAuxPRODUTOACABADO(Sender: TObject);
var wQtde :double;
    wAux, wAux2, wQtdPercaProducao, wQtdPercaAcabado : String;
    wCustoTotal, wCustosAdicionais, wCustoPerca : Real;
    wQtEstoque,  wQtdUtilizada: double;
    wTotalEstoque, wBaixaPercaAcabado: double;
    wDescProduto, wProdutoAcabado, wPercaProdAcabado: string;
    wQtdeBaixar: string;
    wFilial : integer;
    wCodDoc, wCodCompl, wCodHistorico : integer;
    wContaCred, wContaDeb, wNumDoc : String;
    wVlrLancto : Real;
    wDtLancto : TDateTime;
begin
  wFilial := DMBoletim.QBoletimProducaoCOD_FILIAL.Value;

  wQtde := StrToFloat(MEQtBaixar.Text);
  DMFormula.QFormula.Close;
  DMFormula.QFormula.SetVariable('PK', DMBoletim.QBoletimProducaoCOD_FORMULA.Value);
  DMFormula.QFormula.Open;

  with DMBoletim do
  begin
    wQtdPercaProducao := '';
    wQtdPercaAcabado := '';
    wQtdUtilizada := 0;
    wProdutoAcabado := DMOracle.FastSelect('COD_PRODUTO','TB_FORMULA','COD_FORMULA = ' + QBoletimProducaoCOD_FORMULA.Text);

    if (wQtde > (QBoletimProducaoQT_FABRICADO.Value - QBoletimProducaoQT_BAIXADO.Value)) then
      raise Exception.Create('Quantidade inválida! - Quantidade maior que quantidade em aberto ');
    with DMOracle do
    begin
      try
        while not QBoletimProducaoItem.Eof do //Estoque do boletimItem
        begin
          wAux := DMOracle.BuscaNome('SELECT VL_ULTIMO_CUSTO FROM TB_ESTOQUE',
                                   'COD_PRODUTO = '+FloatToStr(QBoletimProducaoItemCod_Produto.Value)
                                   +' AND COD_LOTE_TIPO = '+FloatToStr(QBoletimProducaoItemCod_Lote_Tipo.Value)
                                   +' AND COD_FILIAL = ' + IntToStr(wFilial));
          if (QPercaProducaoIND_PRODUTO_ACABADO.Value = 'NAO') then
            wQtdPercaProducao := DMOracle.FastSelect('QT_PERCA_PRODUCAO','TB_PERCA_PRODUCAO','COD_PRODUTO = ' + QBoletimProducaoItemCOD_PRODUTO.Text +
            					     ' AND COD_BOLETIM = ' + QBoletimProducaoItemCOD_BOLETIM.Text)
          else
            wPercaProdAcabado := DMOracle.FastSelect('QT_PERCA_PRODUCAO','TB_PERCA_PRODUCAO','COD_PRODUTO = ' + wProdutoAcabado + ' AND COD_BOLETIM = ' +
            					     QBoletimProducaoItemCOD_BOLETIM.Text);

          if (wQtdPercaProducao <> '' ) and (Trim(wAux) <> '')  then
          begin
            wQtdPercaProducao := FloatToStr( (StrToFloat(wQtdPercaProducao)/QBoletimProducaoQT_FABRICADO.Value) * wQtde);
            wQtdUtilizada := ((QBoletimProducaoItemQT_USADA.Value /QBoletimProducaoQT_FABRICADO.Value ) * wQtde)   + StrToFloat(wQtdPercaProducao);
            QBoletimProducaoItemVAL_CUSTO.Value := StrToFloat(wAux) * wQtdUtilizada;
            wCustoPerca := wCustoPerca + QBoletimProducaoItemVAL_CUSTO.Value;
            wQtEstoque := wQtdUtilizada;
          end
          else
          begin
            If Trim(wAux) <> '' then
              QBoletimProducaoItemVal_Custo.Value := StrtoFloat(wAux)* QBoletimProducaoItemQt_Usada.Value;
            wCustoTotal := wCustoTotal + QBoletimProducaoItemVal_Custo.Value;
            wQtEstoque := ((((QBoletimProducaoItemQT_USADA.Value / DMFormula.QFormulaQT_PRODUCAO.Value) / QBoletimProducaoQT_FABRICADO.Value) * wQtde));
          end;

          // Gerencia baixa de estoque por lotes
          if DMParamSistema.QParamSistemaIND_GERENCIA_LOTE_ESTOQUE.Value = 'SIM' then
          begin
            DMEstoque.BuscaLotesEstoque(wFilial, QBoletimProducaoItemCOD_PRODUTO.Value);

            // Checa se a quantidade a ser baixada existe no estoque
            wTotalEstoque := 0;
            while not DMEstoque.QBuscaLoteEstoque.Eof do
            begin
              wTotalEstoque := wTotalEstoque
                + DMEstoque.QBuscaLoteEstoqueQT_QUANTIDADE.Value;
              DMEstoque.QBuscaLoteEstoque.Next;
            end;
            if wTotalEstoque < wQtEstoque then
            begin
              wDescProduto := DMOracle.FastSelect('DESC_PRODUTO', 'TB_PRODUTO'
                , 'COD_PRODUTO = ' + QBoletimProducaoItemCOD_PRODUTO.Text);
              MessageDlg('Estoque do produto ' + wDescProduto
                + ' sem quantidade disponível', mtError, [mbOk], 0);
              abort;
            end;

            // Faz a baixa
            DMEstoque.QBuscaLoteEstoque.First;
            while not DMEstoque.QBuscaLoteEstoque.Eof do
            begin
              // Último registro - deve baixar a quantidade total restante
              if DMEstoque.QBuscaLoteEstoque.RecNo
                = DMEstoque.QBuscaLoteEstoque.RecordCount then
              begin
                DMEstoque.AtualizaEstoque(-1,
                                    Trunc(wFilial),
                                    QBoletimProducaoItemCOD_PRODUTO.Value,
                                    DMEstoque.QBuscaLoteEstoqueCOD_LOTE_TIPO.AsInteger,
                                    wQtEstoque * -1,
                                    0,0,0 );
              end
              else // Não é o último registro
              begin
                if DMEstoque.QBuscaLoteEstoqueQT_QUANTIDADE.Value < wQtEstoque then
                begin
                  DMEstoque.AtualizaEstoque(-1,
                                      Trunc(wFilial),
                                      QBoletimProducaoItemCOD_PRODUTO.Value,
                                      DMEstoque.QBuscaLoteEstoqueCOD_LOTE_TIPO.AsInteger,
                                      DMEstoque.QBuscaLoteEstoqueQT_QUANTIDADE.Value * -1,
                                      0,0,0 );
                  wQtEstoque := wQtEstoque - DMEstoque.QBuscaLoteEstoqueQT_QUANTIDADE.Value;
                end
                else
                begin
                  DMEstoque.AtualizaEstoque(-1,
                                      Trunc(wFilial),
                                      QBoletimProducaoItemCOD_PRODUTO.Value,
                                      DMEstoque.QBuscaLoteEstoqueCOD_LOTE_TIPO.AsInteger,
                                      wQtEstoque * -1,
                                      0,0,0 );
                  break;
                end;
              end;
              DMEstoque.QBuscaLoteEstoque.Next;
            end;
          end
          else // baixa o estoque sem gerenciar lotes
          begin
            DMEstoque.AtualizaEstoque(-1,
                                Trunc(wFilial),
                                QBoletimProducaoItemCOD_PRODUTO.Value,
                                Trunc(QBoletimProducaoItemCOD_LOTE_TIPO.Value),
                                wQtEstoque * -1,
                                0,0,0 );
          end;
          QBoletimProducaoItem.Next;
        end;
        if wCustoPerca > 0 then
          wCustoTotal := wCustoTotal + wCustoPerca;
        wAux := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_FORMULA', 'COD_FORMULA = '+FloatToStr(QBoletimProducaoCod_Formula.Value));
        if (wPercaProdAcabado <> '') then
        begin
          QBoletimProducaoQT_FABRICADO.Value := QBoletimProducaoQT_FABRICADO.Value - StrToFloat(wPercaProdAcabado);
          wBaixaPercaAcabado := StrToFloat(MEQtBaixar.Text) - StrToFloat(wPercaProdAcabado);
        end
        else
          wBaixaPercaAcabado := StrToFloat(MEQtBaixar.Text);
        DMEstoque.AtualizaEstoque(-1,
                            Trunc(wFilial),
                            StrToInt(wAux), //cod_produto
                            QBoletimProducaoCOD_LOTE_TIPO.Value,
                            //StrToFloat(MEQtBaixar.Text),
                            wBaixaPercaAcabado,
                            ((wCustoTotal/QBoletimProducaoQT_FABRICADO.Value) * StrToFloat(MEQtBaixar.Text)),0,0 ); //Estava calculando o custo errado na baixa parcial da Ordem de producao
                                                                                       //pegamos o custo total * a quantidade a baixar e diviimos por 100 (para pegar o custo proporcional) Junior 05/04/2019
        wQtdeBaixar := StringReplace(FloatToStr(wQtde + QBoletimProducaoQT_BAIXADO.Value), ',','.',[rfReplaceAll]);
        DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET QT_BAIXADO = ' + wQtdeBaixar +
                            ' WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text) );

        QBoletimProducao.Refresh;
        if QBoletimProducaoQT_BAIXADO.Value = 0 then
          DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET IND_SITUACAO = 1 WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text))
        else if QBoletimProducaoQT_FABRICADO.Value = QBoletimProducaoQT_BAIXADO.Value then
          DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET IND_SITUACAO = 2 WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text))
        else if (QBoletimProducaoQT_FABRICADO.Value > QBoletimProducaoQT_BAIXADO.Value) and (QBoletimProducaoQT_BAIXADO.Value > 0) then
          DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET IND_SITUACAO = 3 WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text));

        // contabiliza a pedido do Odirlei
        if (DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S') then
        begin
          wCodDoc := DMBoletim.QBoletimProducaoCod_Boletim.Value;
          wNumDoc := FloatToStr(DMBoletim.QBoletimProducaoCod_Boletim.Value) + '-' + Trim(DMBoletim.QBoletimProducaoCod_Formula.Text);
          wFilial := DMBoletim.QBoletimProducaoCod_Filial.Value;
          wCodCompl := DMBoletim.QBoletimProducaoCod_Cadastro_Envasador.Value;
          wVlrLancto := DMBoletim.QBoletimProducaoVal_Custo_Contabil.Value;
          wDtLancto := DMOracle.DataServ;
          if FCaixa_Lanc_Cont = nil then
            FCaixa_Lanc_Cont := TFCaixa_Lanc_Cont.Create(Application);
          if DMParamSistema.QParamSistemaInd_Tipo_Plano_Conta.Value = 'UNICO' then
            FCaixa_Lanc_Cont.pFilial := 1
          else
            FCaixa_Lanc_Cont.pFilial := wFilial;
          FCaixa_Lanc_Cont.MeFilialDebito.Text := FloatToStr(wFilial);
          FCaixa_Lanc_Cont.MeFilialCredito.Text := FloatToStr(wFilial);
          FCaixa_Lanc_Cont.LbHistorico.Visible := True;
          FCaixa_Lanc_Cont.MeHistorico.Visible := True;
          FCaixa_Lanc_Cont.SbConsHistorico.Visible := True;
          FCaixa_Lanc_Cont.MeHistoricoDescricao.Visible := True;
          FCaixa_Lanc_Cont.ShowModal;
          wContaCred := Bib.LimpaString(FCaixa_Lanc_Cont.MEContaCredito.text, '.');
          wContaDeb := Bib.LimpaString(FCaixa_Lanc_Cont.MEContaDebito.text, '.');
          wCodHistorico := StrToInt(Trim(FCaixa_Lanc_Cont.MeHistorico.Text));
          DMPlanilha.GravaLanc('IND', wCodDoc, wNumDoc, strtoint(FCaixa_Lanc_Cont.MeFilialCredito.Text), wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
          DMPlanilha.GravaLanc('IND', wCodDoc, wNumDoc, strtoint(FCaixa_Lanc_Cont.MeFilialDebito.Text), wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
        end;
        DBCemapa.Commit;
      except
        DBCemapa.Rollback;
        showmessage('Não foi possivel efetuar o lançamento');
      end;
      MEQtBaixar.Text := '';
      QBoletimProducao.Close;
      QBoletimProducao.Open;
    end;
  end;
end;


procedure TFConfirmaBoletimProducao.BtOkClick(Sender: TObject);
begin
  Close;
  With DMBoletim do
  begin
    if (DMParamSistema.QParamSistemaIND_CONTROLA_PERCA_PRODUCAO.Value = 'SIM') and  (QBoletimProducaoIND_SITUACAO.Value = '2') then
        FBoletimOrdemProducao.OracleNavigator1.Enabled := False;
  end;
end;

procedure TFConfirmaBoletimProducao.FormActivate(Sender: TObject);
begin
  with DMBoletim do
  begin
    MEQtBaixar.Text := FloatToStr(QBoletimProducaoQT_FABRICADO.Value - DMBoletim.QBoletimProducaoQT_BAIXADO.Value);
    if (QBoletimProducaoIND_SITUACAO.Value = '1') then
    begin
      BtVoltaBaixa.Enabled := False;
      BtBaixaAux.Enabled := True;
    end;
    if (QBoletimProducaoIND_SITUACAO.Value = '2') then
    begin
      BtBaixaAux.Enabled := False;
      BtVoltaBaixa.Enabled := True
    end;
    if (QBoletimProducaoIND_SITUACAO.Value = '3') then
    begin
      BtBaixaAux.Enabled := True;
      BtVoltaBaixa.Enabled := True;
    end;
  end;
end;

procedure TFConfirmaBoletimProducao.BtVoltaBaixaGERAL(Sender: TObject);
var wQtde, wQtdeAberto :Real;
    wAux, wAux2 : String;
    wQtEstoque: double;
    wQtdeVolta: string;
    wFilial : integer;
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEION' Then
    wFilial := 1
  else
    wFilial := DMBoletim.QBoletimProducaoCOD_FILIAL.Value;
  if FSenha = nil then
    FSenha := TFSenha.Create(Application);
  if FSenha.ShowModal = MrOk then
    if UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) then
      raise Exception.Create('Senha inválida!');

  wQtde := StrToFloat(MEQtBaixar.Text);
  DMFormula.QFormula.Close;
  DMFormula.QFormula.SetVariable('PK', DMBoletim.QBoletimProducaoCOD_FORMULA.Value);
  DMFormula.QFormula.Open;

  with DMBoletim do
  begin
    if  (wQtde = 0 ) or (wQtde > QBoletimProducaoQT_BAIXADO.Value)  then
      raise Exception.Create('Quantidade inválida! - Quantidade informada é maior que a quantidade fabricada ou baixada ');
    with DMOracle do
    begin
      try
        wAux := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_FORMULA',   'COD_FORMULA = '+FloatToStr(QBoletimProducaoCod_Formula.Value));
        wQtdeAberto := QBoletimProducaoQT_FABRICADO.Value - (QBoletimProducaoQT_BAIXADO.Value - wQtde);
        if DMParamSistema.CodEmpresa = 'RACOESIGUA' then
          DMEstoque.AtualizaEstoque(-2, //-2 atualiza qtde mas não atualiza custo
                              Trunc(QBoletimProducaoCOD_FILIAL.Value),
                              StrToInt(wAux), //cod_produto
                              QBoletimProducaoCOD_LOTE_TIPO.Value,
                              StrToFloat(MEQtBaixar.Text)*-1,
                              0,0,0 ) //Rações Iguaçu(Clóvis) solicitou para não mudar o valor do custo do produto Junior 04/10/2017

        else
          DMEstoque.AtualizaEstoque(-1,
                              Trunc(wFilial),
                              StrToInt(wAux), //cod_produto
                              QBoletimProducaoCOD_LOTE_TIPO.Value,
                              StrToFloat(MEQtBaixar.Text)*-1,
                              ((QBoletimProducaoVAL_CUSTO.Value/QBoletimProducaoQT_FABRICADO.Value)*wQtdeAberto)*-1,0,0 );

        //Estoque do boletimItem
        QBoletimProducaoItem.First;
        wQtEstoque := 0;
        while not QBoletimProducaoItem.Eof do
        begin
          wQtEstoque := (((QBoletimProducaoItemQT_USADA.Value / DMFormula.QFormulaQT_PRODUCAO.Value)
            / QBoletimProducaoQT_FABRICADO.Value) * wQtde);
          DMEstoque.BuscaLotesEstoque(wFilial
              , QBoletimProducaoItemCOD_PRODUTO.Value, false);
          DMEstoque.QBuscaLoteEstoque.Last;
          DMEstoque.AtualizaEstoque(-1,
                              Trunc(wFilial),
                              QBoletimProducaoItemCOD_PRODUTO.Value,
                              DMEstoque.QBuscaLoteEstoqueCOD_LOTE_TIPO.AsInteger,
                              wQtEstoque,
                              0,0,0 );
          QBoletimProducaoItem.Next;
        end;
        wQtdeVolta := StringReplace(FloatToStr(QBoletimProducaoQT_BAIXADO.Value - wQtde ), ',','.',[rfReplaceAll]);
        DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET QT_BAIXADO = ' + wQtdeVolta +
                            ' WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text) );
        QBoletimProducao.Refresh;
        if QBoletimProducaoQT_BAIXADO.Value = 0 then
          DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET IND_SITUACAO = 1 WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text))
        else if QBoletimProducaoQT_FABRICADO.Value = QBoletimProducaoQT_BAIXADO.Value then
          DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET IND_SITUACAO = 2 WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text))
        else if (QBoletimProducaoQT_FABRICADO.Value > QBoletimProducaoQT_BAIXADO.Value) and (QBoletimProducaoQT_BAIXADO.Value > 0) then
          DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET IND_SITUACAO = 3 WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text));

        if (DMParamSistema.QParamSistemaIND_CONTROLA_PERCA_PRODUCAO.Value = 'SIM') and
           ( ( QBoletimProducaoIND_SITUACAO.Value = '1') or (QBoletimProducaoIND_SITUACAO.Value = '3') ) then
          FBoletimOrdemProducao.TabSheet5.TabVisible := True;
      except
        DBCemapa.Rollback;
        showmessage('Não foi possivel efetuar o lançamento');
      end;
      MEQtBaixar.Text := '';
      QBoletimProducao.Close;
      QBoletimProducao.Open;
    end;
  end;
end;

procedure TFConfirmaBoletimProducao.BtVoltaBaixaPERCAITEM(Sender: TObject);
var wQtde, wQtdeAberto :Real;
    wAux, wAux2 : String;
    wQtEstoque: double;
    wQtdeVolta, wQtdPerca: string;
    wFilial : integer;
begin
  wFilial := DMBoletim.QBoletimProducaoCOD_FILIAL.Value;
  if FSenha = nil then
    FSenha := TFSenha.Create(Application);
  if FSenha.ShowModal = MrOk then
    if UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) then
      raise Exception.Create('Senha inválida!');

  wQtde := StrToFloat(MEQtBaixar.Text);
  DMFormula.QFormula.Close;
  DMFormula.QFormula.SetVariable('PK', DMBoletim.QBoletimProducaoCOD_FORMULA.Value);
  DMFormula.QFormula.Open;

  with DMBoletim do
  begin
    if  (wQtde = 0 ) or (wQtde > QBoletimProducaoQT_BAIXADO.Value)  then
      raise Exception.Create('Quantidade inválida! - Quantidade informada é maior que a quantidade fabricada ou baixada ');
    with DMOracle do
    begin
      try
        wAux := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_FORMULA',   'COD_FORMULA = '+FloatToStr(QBoletimProducaoCod_Formula.Value));
        wQtdeAberto := QBoletimProducaoQT_FABRICADO.Value - (QBoletimProducaoQT_BAIXADO.Value - wQtde);
        DMEstoque.AtualizaEstoque(-1,
                            Trunc(wFilial),
                            StrToInt(wAux), //cod_produto
                            QBoletimProducaoCOD_LOTE_TIPO.Value,
                            StrToFloat(MEQtBaixar.Text)*-1,
                            ((QBoletimProducaoVAL_CUSTO.Value/QBoletimProducaoQT_FABRICADO.Value)*wQtdeAberto)*-1,0,0 );

        //Estoque do boletimItem
        QBoletimProducaoItem.First;
        wQtEstoque := 0;
        wQtdPerca := '';
        while not QBoletimProducaoItem.Eof do
        begin
          //if (wQtde = QBoletimProducaoQT_BAIXADO.Value) then
          wQtdPerca := DMOracle.FastSelect('QT_PERCA_PRODUCAO','TB_PERCA_PRODUCAO','COD_PRODUTO = ' + QBoletimProducaoItemCOD_PRODUTO.Text +
                                                        ' AND COD_BOLETIM = ' + QBoletimProducaoItemCOD_BOLETIM.Text);
          wQtEstoque := (((QBoletimProducaoItemQT_USADA.Value / DMFormula.QFormulaQT_PRODUCAO.Value)/ QBoletimProducaoQT_FABRICADO.Value) * wQtde);

          if (Trim(wQtdPerca) <> '') then
          begin
            wQtEstoque := wQtEstoque + ((StrToFloat(wQtdPerca) / QBoletimProducaoQT_FABRICADO.Value) * wQtde);
            //wQtEstoque := wQtEstoque + StrToFloat(wQtdPerca);
          end;
          DMEstoque.BuscaLotesEstoque(wFilial
              , QBoletimProducaoItemCOD_PRODUTO.Value, false);
          DMEstoque.QBuscaLoteEstoque.Last;
          DMEstoque.AtualizaEstoque(-1,
                              Trunc(wFilial),
                              QBoletimProducaoItemCOD_PRODUTO.Value,
                              DMEstoque.QBuscaLoteEstoqueCOD_LOTE_TIPO.AsInteger,
                              wQtEstoque,
                              0,0,0 );
          QBoletimProducaoItem.Next;
        end;
        wQtdeVolta := StringReplace(FloatToStr(QBoletimProducaoQT_BAIXADO.Value - wQtde ), ',','.',[rfReplaceAll]);
        DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET QT_BAIXADO = ' + wQtdeVolta +
                            ' WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text) );
        QBoletimProducao.Refresh;
        if QBoletimProducaoQT_BAIXADO.Value = 0 then
          DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET IND_SITUACAO = 1 WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text))
        else if QBoletimProducaoQT_FABRICADO.Value = QBoletimProducaoQT_BAIXADO.Value then
          DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET IND_SITUACAO = 2 WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text))
        else if (QBoletimProducaoQT_FABRICADO.Value > QBoletimProducaoQT_BAIXADO.Value) and (QBoletimProducaoQT_BAIXADO.Value > 0) then
          DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET IND_SITUACAO = 3 WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text));

        if (DMParamSistema.QParamSistemaIND_CONTROLA_PERCA_PRODUCAO.Value = 'SIM') and
           ( ( QBoletimProducaoIND_SITUACAO.Value = '1') or (QBoletimProducaoIND_SITUACAO.Value = '3') ) then
          FBoletimOrdemProducao.TabSheet5.TabVisible := True;
      except
        DBCemapa.Rollback;
        showmessage('Não foi possivel efetuar o lançamento');
      end;
      MEQtBaixar.Text := '';
      QBoletimProducao.Close;
      QBoletimProducao.Open;
    end;
  end;
end;

procedure TFConfirmaBoletimProducao.BtVoltaBaixaPERCAACABADO(Sender: TObject);
var wQtde, wQtdeAberto :Real;
    wAux, wAux2, wQtdPerca : String;
    wQtEstoque: double;
    wQtdeVolta: string;
    wFilial : integer;
begin
  wFilial := DMBoletim.QBoletimProducaoCOD_FILIAL.Value;
  if FSenha = nil then
    FSenha := TFSenha.Create(Application);
  if FSenha.ShowModal = MrOk then
    if UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) then
      raise Exception.Create('Senha inválida!');

  wQtde := StrToFloat(MEQtBaixar.Text);
  wQtdPerca := '';
  DMFormula.QFormula.Close;
  DMFormula.QFormula.SetVariable('PK', DMBoletim.QBoletimProducaoCOD_FORMULA.Value);
  DMFormula.QFormula.Open;

  with DMBoletim do
  begin
    if  (wQtde = 0 ) or (wQtde > QBoletimProducaoQT_BAIXADO.Value)  then
      raise Exception.Create('Quantidade inválida! - Quantidade informada é maior que a quantidade fabricada ou baixada ');
    with DMOracle do
    begin
      try
        wAux := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_FORMULA',   'COD_FORMULA = '+FloatToStr(QBoletimProducaoCod_Formula.Value));
        wQtdPerca := DMOracle.BuscaNome('SELECT QT_PERCA_PRODUCAO FROM TB_PERCA_PRODUCAO',   'COD_PRODUTO = ' + wAux + ' AND COD_BOLETIM = ' +
        				QBoletimProducaoCOD_BOLETIM.Text);
        if (wQtdPerca <> '') then
          wQtdPerca := FloatToStr(StrToFloat(MEQtBaixar.Text) - StrToFloat(wQtdPerca))
        else
          wQtdPerca := MEQtBaixar.Text;

        wQtdeAberto := QBoletimProducaoQT_FABRICADO.Value - (QBoletimProducaoQT_BAIXADO.Value - wQtde);
        DMEstoque.AtualizaEstoque(-1,
                            Trunc(wFilial),
                            StrToInt(wAux), //cod_produto
                            QBoletimProducaoCOD_LOTE_TIPO.Value,
                            //StrToFloat(MEQtBaixar.Text)*-1,
                            StrToFloat(wQtdPerca)*-1,
                            ((QBoletimProducaoVAL_CUSTO.Value/QBoletimProducaoQT_FABRICADO.Value)*wQtdeAberto)*-1,0,0 );

        //Estoque do boletimItem
        QBoletimProducaoItem.First;
        wQtEstoque := 0;
        while not QBoletimProducaoItem.Eof do
        begin
          wQtEstoque := (((QBoletimProducaoItemQT_USADA.Value / DMFormula.QFormulaQT_PRODUCAO.Value)
            / QBoletimProducaoQT_FABRICADO.Value) * wQtde);
          DMEstoque.BuscaLotesEstoque(wFilial
              , QBoletimProducaoItemCOD_PRODUTO.Value, false);
          DMEstoque.QBuscaLoteEstoque.Last;
          DMEstoque.AtualizaEstoque(-1,
                              Trunc(wFilial),
                              QBoletimProducaoItemCOD_PRODUTO.Value,
                              DMEstoque.QBuscaLoteEstoqueCOD_LOTE_TIPO.AsInteger,
                              wQtEstoque,
                              0,0,0 );
          QBoletimProducaoItem.Next;
        end;
        wQtdeVolta := StringReplace(FloatToStr(QBoletimProducaoQT_BAIXADO.Value - wQtde ), ',','.',[rfReplaceAll]);
        DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET QT_BAIXADO = ' + wQtdeVolta +
                            ' WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text) );
        QBoletimProducao.Refresh;
        if QBoletimProducaoQT_BAIXADO.Value = 0 then
          DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET IND_SITUACAO = 1 WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text))
        else if QBoletimProducaoQT_FABRICADO.Value = QBoletimProducaoQT_BAIXADO.Value then
          DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET IND_SITUACAO = 2 WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text))
        else if (QBoletimProducaoQT_FABRICADO.Value > QBoletimProducaoQT_BAIXADO.Value) and (QBoletimProducaoQT_BAIXADO.Value > 0) then
          DMOracle.ExecutaSql('UPDATE TB_BOLETIM SET IND_SITUACAO = 3 WHERE COD_BOLETIM = ' + Trim(QBoletimProducaoCOD_BOLETIM.Text));

        if (DMParamSistema.QParamSistemaIND_CONTROLA_PERCA_PRODUCAO.Value = 'SIM') and
           ( ( QBoletimProducaoIND_SITUACAO.Value = '1') or (QBoletimProducaoIND_SITUACAO.Value = '3') ) then
          FBoletimOrdemProducao.TabSheet5.TabVisible := True;
      except
        DBCemapa.Rollback;
        showmessage('Não foi possivel efetuar o lançamento');
      end;
      MEQtBaixar.Text := '';
      QBoletimProducao.Close;
      QBoletimProducao.Open;
    end;
  end;
end;

procedure TFConfirmaBoletimProducao.BtBaixaAuxClick(Sender: TObject);
begin
  if (DMParamSistema.QParamSistemaIND_CONTROLA_PERCA_PRODUCAO.Value = 'SIM') and
     (DMBoletim.QPercaProducaoIND_PRODUTO_ACABADO.Value = 'NAO') then
  begin
    BtBaixaAuxPERCAITEM(Sender);
    FConfirmaBoletimProducao.Activate;
  end
  else if (DMParamSistema.QParamSistemaIND_CONTROLA_PERCA_PRODUCAO.Value = 'SIM') and
           (DMBoletim.QPercaProducaoIND_PRODUTO_ACABADO.Value = 'SIM') then
  begin
    BtBaixaAuxPRODUTOACABADO(Sender);
    FConfirmaBoletimProducao.Activate;
  end
  else
    BtBaixaAuxGERAL(Sender);
end;

procedure TFConfirmaBoletimProducao.BtVoltaBaixaClick(Sender: TObject);
begin
  if (DMParamSistema.QParamSistemaIND_CONTROLA_PERCA_PRODUCAO.Value = 'SIM') and
     (DMBoletim.QPercaProducaoIND_PRODUTO_ACABADO.Value = 'NAO') then
  begin
    BtVoltaBaixaPERCAITEM(Sender);
    FConfirmaBoletimProducao.Activate;
  end
  else if (DMParamSistema.QParamSistemaIND_CONTROLA_PERCA_PRODUCAO.Value = 'SIM') and
           (DMBoletim.QPercaProducaoIND_PRODUTO_ACABADO.Value = 'SIM') then
  begin
    BtVoltaBaixaPERCAACABADO(Sender);
    FConfirmaBoletimProducao.Activate;
  end
  else
    BtVoltaBaixaGERAL(Sender);
end;

procedure TFConfirmaBoletimProducao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  BtOkClick(Sender);
end;

end.
