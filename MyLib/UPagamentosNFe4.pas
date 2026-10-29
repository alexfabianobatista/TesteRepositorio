unit UPagamentosNFe4;

interface

uses SysUtils, Math;

type
  TPagamentosNFe4 = class 

private
public
  procedure GeraPagamentos(IndEntradaSaida: String);
end;

var
  PagamentosNFe4: TPagamentosNFe4;
implementation

uses UNotaSaida_cl, UNotaEntrada_cl, UNfe_cl, UBiblioteca,
  UParamSistema_cl;

{ TPagamentosNFe4 }

procedure TPagamentosNFe4.GeraPagamentos(IndEntradaSaida: String);
begin
  if IndEntradaSaida = 'E' then
  begin
    with DMNotaEntrada do
    begin
      DMNfe.QNfeEmissao.Close;
      DMNfe.QNfeEmissao.SetVariable('NOTA_CAB', QNotaEntradaCOD_NOTA_CAB.Value);
      DMNfe.QNfeEmissao.Open;
      QSomaItemNota.Refresh;
      QPagamento.Close;
      QPagamento.SetVariable('COD_NOTA_CAB',QNotaEntradaCOD_NOTA_CAB.Value);
      QPagamento.Open;
      if (DMNfe.QNfeEmissaoDESC_VERSAO_NFE.Value = '4.00') then
      begin
        if QNotaEntradaIND_CONDICAO_PAGTO.Value = '1' then
        begin
          if (StrToInt('0' + DMNfe.QNfeEmissaoDESC_RETORNO_PROCESSAMENTO.Value) in SIT_NFE_ACEITO) and
             (QSomaPagamentosVAL_PAGAMENTOS_CONFIRMADOS.Value > 0) then
          begin
              ConfirmaPagamentoNFCe
          end
          else
            InserePagamentoNFCe(RoundTo(Bib.ift(DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'CEREAIS', QSomaItemNotasval_total_nota.Value, QSomaItemNotasval_total_nfe.Value),-2),
                  Bib.ift(QNotaEntradaIND_FINALIDADE_NFE.Value < 3, 'Dinheiro', 'Sem pagamento'));
        end
        else if QNotaEntradaIND_CONDICAO_PAGTO.Value = '2' then
        begin
          if (StrToInt('0' + DMNfe.QNfeEmissaoDESC_RETORNO_PROCESSAMENTO.Value) in SIT_NFE_ACEITO) and
             (QSomaPagamentosVAL_PAGAMENTOS_CONFIRMADOS.Value > 0) then
          begin
              ConfirmaPagamentoNFCe
          end
          else
            InserePagamentoNFCe(RoundTo(Bib.ift(DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'CEREAIS', QSomaItemNotasval_total_nota.Value, QSomaItemNotasval_total_nfe.Value),-2),
                  Bib.ift(QNotaEntradaIND_FINALIDADE_NFE.Value < 3, 'Crédito Loja', 'Sem pagamento'));
        end
        else if QNotaEntradaIND_CONDICAO_PAGTO.Value = '3' then
        begin
          if (StrToInt('0' + DMNfe.QNfeEmissaoDESC_RETORNO_PROCESSAMENTO.Value) in SIT_NFE_ACEITO) and
             (QSomaPagamentosVAL_PAGAMENTOS_CONFIRMADOS.Value > 0) then
          begin
              ConfirmaPagamentoNFCe
          end
          else
            InserePagamentoNFCe(RoundTo(Bib.ift(DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'CEREAIS', QSomaItemNotasval_total_nota.Value, QSomaItemNotasval_total_nfe.Value),-2),
                  Bib.ift(QNotaEntradaIND_FINALIDADE_NFE.Value < 3, 'Outros', 'Sem pagamento'));
        end
        else if QNotaEntradaIND_CONDICAO_PAGTO.Value = '6' then
        begin
          if (StrToInt('0' + DMNfe.QNfeEmissaoDESC_RETORNO_PROCESSAMENTO.Value) in SIT_NFE_ACEITO) and
             (QSomaPagamentosVAL_PAGAMENTOS_CONFIRMADOS.Value > 0) then
          begin
              ConfirmaPagamentoNFCe
          end
          else
            InserePagamentoNFCe(RoundTo(Bib.ift(DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'CEREAIS', QSomaItemNotasval_total_nota.Value, QSomaItemNotasval_total_nfe.Value),-2),
                  Bib.ift(QNotaEntradaIND_FINALIDADE_NFE.Value < 3, 'Pagamento Instantâneo (PIX)', 'Sem pagamento'));
        end;
      end;
    end;
  end
  else
  begin
    with DMNotaSaida do
    begin
      DMNfe.QNfeEmissao.Close;
      DMNfe.QNfeEmissao.SetVariable('NOTA_CAB', QNotaSaidaCOD_NOTA_CAB.Value);
      DMNfe.QNfeEmissao.Open;
      QSomaItemNota.Refresh;
      QPagamento.Close;
      QPagamento.SetVariable('COD_NOTA_CAB',QNotaSaidaCOD_NOTA_CAB.Value);
      QPagamento.Open;
      if ((QNotaSaidaCOD_SERIE_MODELO.Value = '65') or (DMNfe.QNfeEmissaoDESC_VERSAO_NFE.Value = '4.00')) then
      begin
        if QNotaSaidaVal_AVista.Value > 0 then
          if (StrToInt('0' + DMNfe.QNfeEmissaoDESC_RETORNO_PROCESSAMENTO.Value) in SIT_NFE_ACEITO) then
            ConfirmaPagamentoNFCe
          else
            InserePagamentoNFCe(QNotaSaidaVAL_AVISTA.Value,
            Bib.ift(QNotaSaidaIND_FINALIDADE_NFE.Value < 3, 'Dinheiro', 'Sem pagamento'));             

        if (pValorValeCompras + pValorValePresente > 0) then
          if StrToInt('0' + DMNfe.QNfeEmissaoDESC_RETORNO_PROCESSAMENTO.Value) in SIT_NFE_ACEITO then
            ConfirmaPagamentoNFCe
          else
            InserePagamentoNFCe(pValorValeCompras + pValorValePresente,
            Bib.ift(QNotaSaidaIND_FINALIDADE_NFE.Value < 3, 'Outros', 'Sem pagamento'));
      end;
      if (QNotaSaidaCOD_SERIE_MODELO.Value = '55') or (QNotaSaidaCOD_SERIE_MODELO.Value = '99') then
      begin
        if  (DMNfe.QNfeEmissaoDESC_VERSAO_NFE.Value = '4.00') then
        begin
          if (QNotaSaidaInd_Condicao_Pagto.Value = '1') then // A Vista
            if (StrToInt('0' + DMNfe.QNfeEmissaoDESC_RETORNO_PROCESSAMENTO.Value) in SIT_NFE_ACEITO) then
              ConfirmaPagamentoNFCe
            else
              InserePagamentoNFCe(RoundTo(QSomaItemNotaSVal_Total_Nota.Value - QNotaSaidaVAL_AVISTA.Value -
                    pValorValeCompras - pValorValePresente,-2),
                    Bib.ift(QNotaSaidaIND_FINALIDADE_NFE.Value < 3, 'Dinheiro', 'Sem pagamento'));

          if (QNotaSaidaInd_Condicao_Pagto.Value = '2') then
            if (StrToInt('0' + DMNfe.QNfeEmissaoDESC_RETORNO_PROCESSAMENTO.Value) in SIT_NFE_ACEITO) then
              ConfirmaPagamentoNFCe
            else
              InserePagamentoNFCe(RoundTo(QSomaItemNotaSVal_Total_Nota.Value - QNotaSaidaVAL_AVISTA.Value -
                    pValorValeCompras - pValorValePresente,-2),
                    Bib.ift(QNotaSaidaIND_FINALIDADE_NFE.Value < 3, 'Crédito Loja', 'Sem pagamento'));

          if (QNotaSaidaIND_CONDICAO_PAGTO.Value = '3') then
            if (StrToInt('0' + DMNfe.QNfeEmissaoDESC_RETORNO_PROCESSAMENTO.Value) in SIT_NFE_ACEITO) then
              ConfirmaPagamentoNFCe
            else
              InserePagamentoNFCe(RoundTo(QSomaItemNotaSVal_Total_Nota.Value - QNotaSaidaVAL_AVISTA.Value -
                    pValorValeCompras - pValorValePresente,-2),
                    Bib.ift(QNotaSaidaIND_FINALIDADE_NFE.Value < 3, 'Outros', 'Sem pagamento'));

          if QNotaSaidaIND_CONDICAO_PAGTO.Value = '6' then
            if (StrToInt('0' + DMNfe.QNfeEmissaoDESC_RETORNO_PROCESSAMENTO.Value) in SIT_NFE_ACEITO) and
               (QSomaPagamentosVAL_PAGAMENTOS_CONFIRMADOS.Value > 0) then
              ConfirmaPagamentoNFCe
            else
              InserePagamentoNFCe(RoundTo(QSomaItemNotaSVal_Total_Nota.Value - QNotaSaidaVAL_AVISTA.Value -
                    pValorValeCompras - pValorValePresente,-2),
                    Bib.ift(QNotaSaidaIND_FINALIDADE_NFE.Value < 3, 'Pagamento Instantâneo (PIX)', 'Sem pagamento'));

            if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'NUTRIPET' then
            begin
              if (QNotaSaidaIND_CONDICAO_PAGTO.Value = '4') then
              begin
                if StrToInt('0' + DMNfe.QNfeEmissaoDESC_RETORNO_PROCESSAMENTO.Value) in SIT_NFE_ACEITO then
                  ConfirmaPagamentoNFCe
                else
                begin
                  InserePagamentoNFCe(RoundTo(QSomaItemNotaSVal_Total_Nota.Value - QNotaSaidaVAL_AVISTA.Value -
                        pValorValeCompras - pValorValePresente,-2),
                        Bib.ift(QNotaSaidaIND_FINALIDADE_NFE.Value < 3, 'Cartão de Crédito','Sem pagamento'));
                end;
              end
              else if (QNotaSaidaIND_CONDICAO_PAGTO.Value = '5') then
              begin
                if StrToInt('0' + DMNfe.QNfeEmissaoDESC_RETORNO_PROCESSAMENTO.Value) in SIT_NFE_ACEITO then
                  ConfirmaPagamentoNFCe
                else
                begin
                  InserePagamentoNFCe(RoundTo(QSomaItemNotaSVal_Total_Nota.Value - QNotaSaidaVAL_AVISTA.Value -
                        pValorValeCompras - pValorValePresente,-2),
                        Bib.ift(QNotaSaidaIND_FINALIDADE_NFE.Value < 3, 'Cartão de Débito', 'Sem pagamento'));
                end;
              end;
            end;
        end;
      end;
    end;
  end;
end;

end.
