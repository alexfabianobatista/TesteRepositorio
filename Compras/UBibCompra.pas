unit UBibCompra;

interface

uses Forms, Controls, Dialogs, SysUtils, Uoracle_cl, OraTeste;

type
  TBibCompra = Class

  private

    function personalizaBuscaProdutoAusenteNFeConcrefer(
      pCodProduto: string): TBuscador;
    function personalizaNumOrdemCompraARZ(pNumero: integer; pOperacao: string): integer;
    function itemImportacaoXMLKreuz(pQItemNF: TOracleDataSet1
      ; pCampo: string; pValor: variant; pQNotaEntrada: TOracleDataSet1; pTemCST020, pTemCSOSN103: Boolean): TOracleDataSet1;
    function itemImportacaoXMLDiniz(pQItemNF: TOracleDataSet1
      ; pCampo: string; pValor: variant; pQNotaEntrada: TOracleDataSet1): TOracleDataSet1;
    function itemImportacaoXMLMzm(pQItemNF: TOracleDataSet1
      ; pCampo: string; pValor: variant; pQNotaEntrada: TOracleDataSet1): TOracleDataSet1;


  public

    function personalizaBuscaProdutoAusenteNFe(pBuscador: TBuscador
      ; pCodProduto: string): TBuscador;
    function personalizaAdicionaItemNota(pFabricante: string
      ; pCodigo: integer): string;
    function importacaoPorCodigo: boolean;
    function personalizaNumOrdemCompra(pNumero: integer; pOperacao: string): integer;
    function itemImportacaoXML(pQItemNF: TOracleDataSet1
      ; pCampo: string; pValor: variant; pQNotaEntrada: TOracleDataSet1; pTemCST020, pTemCSOSN103: boolean): TOracleDataSet1;
    function loteImportacaoXML(pCnpj, pDescricao, pInfAdProd, pCprod: string): integer;
  end;

var BibCompra: TBibCompra;

implementation

uses UParamSistema_cl, UNfe_cl, Variants, DateUtils, StrUtils;

{ TBibCompra }

function TBibCompra.importacaoPorCodigo: boolean;
begin
  result := (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CONCREFER');
end;

function TBibCompra.itemImportacaoXML(pQItemNF: TOracleDataSet1;
  pCampo: string; pValor: variant; pQNotaEntrada: TOracleDataSet1; pTemCST020, pTemCSOSN103: boolean): TOracleDataSet1;
begin
  result := pQItemNF;
  //SOLICITADO POR E-MAIL PARA NÃO ALTERAR DADOS DA NF NA ENTRADA E MANTER AS INFORMAÇÕES DA TELA DE INPORTAÇAO
 // SOLICITADO POR RUBENS - CLEBER - 14/07/2021 - DESCOMENTADO DIA 26/08/2021. O RUBENS PEDIU PARA DESFAZER ESSA ALTERAÇÃO
  if (DMParamSistema.CodEmpresa = 'KREUZ') then    // A PEDIDO DO RUBENS PARA NÃO ACONTECER NA CONKRETA
    result := itemImportacaoXMLKreuz(pQItemNF, pCampo, pValor, pQNotaEntrada, pTemCST020, pTemCSOSN103);
  if (DMParamSistema.CodEmpresa = 'DINIZ') then
    result := itemImportacaoXMLDiniz(pQItemNF, pCampo, pValor, pQNotaEntrada);
{Solicitado por Fabio para a tributação ser codigo 12. Cod_Suporte: 8941 Alex 12/11/2024.}
  if (DMParamSistema.CodEmpresa = 'RETIFOZ2') then
    result := itemImportacaoXMLMzm(pQItemNF, pCampo, pValor, pQNotaEntrada);

end;

function TBibCompra.itemImportacaoXMLKreuz(pQItemNF: TOracleDataSet1;
  pCampo: string; pValor: variant; pQNotaEntrada: TOracleDataSet1; pTemCST020, pTemCSOSN103: boolean): TOracleDataSet1;
var exec: TExecutador;
begin
  result := pQItemNF;
  if pCampo = 'CFOP' then
  begin
    if (Copy(VarToStr(pValor), 1, 2) = '14') or (Copy(VarToStr(pValor), 1, 2) = '24') or
       (Copy(VarToStr(pValor), 1, 2) = '54') or (Copy(VarToStr(pValor), 1, 2) = '64') then
    begin
      pQItemNF.Edit;
      pQItemNF.FieldByName('COD_TRIBUTACAO').Value := 9;
      pQItemNF.Post;
      exec := TExecutador.Create;
      exec.Adiciona('UPDATE TB_PRODUTO SET COD_TRIBUTACAO = 9'
        + ' WHERE COD_PRODUTO = ' + pQItemNF.FieldByName('COD_PRODUTO').Text);
      exec.Executar(true, false);
      exec.Fecha;
      exec.Free;
      exec := nil;
    end;
    if (Copy(VarToStr(pValor), 1, 2) = '11') or (Copy(VarToStr(pValor), 1, 2) = '21') or
       (Copy(VarToStr(pValor), 1, 2) = '51') or (Copy(VarToStr(pValor), 1, 2) = '61') then
    begin
      pQItemNF.Edit;
      if pTemCSOSN103 then //Kreuz foi para o Normal Sublimite. Junior 21/01/2025 Voltaram para o Simples Junior 11/03/2026
        pQItemNF.FieldByName('COD_TRIBUTACAO').Value := 3 //era 3 mudei para 20(mudaram do simples para normal)
      else if pTemCST020 then
        pQItemNF.FieldByName('COD_TRIBUTACAO').Value := 3 //era 3 mudei para 20(mudaram do simples para normal)
      else
        pQItemNF.FieldByName('COD_TRIBUTACAO').Value := 3; //era 3 mudei para 20(mudaram do simples para normal) 

      pQItemNF.Post;
      exec := TExecutador.Create;
      //exec.Adiciona('UPDATE TB_PRODUTO SET COD_TRIBUTACAO = 20'// Voltaram para o Simples Junior 11/03/2026
      exec.Adiciona('UPDATE TB_PRODUTO SET COD_TRIBUTACAO = 3'
        + ' WHERE COD_PRODUTO = ' + pQItemNF.FieldByName('COD_PRODUTO').Text + ' AND COD_TRIBUTACAO <> 32'); //Alguns produtos(areia,...) possuem beneficio de emissão a 7% de ICMS e esses produtos não pode alterar a tributação na imp. por XML. Junior 04/04/2023
      exec.Executar(true, false);
      exec.Fecha;
      exec.Free;
      exec := nil;
    end;
    //Rubens solicitou para pegar a CFOP da OPERAÇÃO.
    {if (DMOracle.FastSelect('IND_BRINDE', 'TB_OPERACAO', 'COD_OPERACAO = '
      + pQNotaEntrada.FieldByName('COD_OPERACAO').Text) <> 'S')
      and
      (DMOracle.FastSelect('IND_BONIFICACAO', 'TB_OPERACAO', 'COD_OPERACAO = '
      + pQNotaEntrada.FieldByName('COD_OPERACAO').Text) <> 'S')
      and                                                   //29 - Uso/Consumo, não pode puxar CFOP de compras. Solicitado Rubens. 29/02/2020.
       (pQNotaEntrada.FieldByName('COD_OPERACAO').Text <> '29') then
    begin
      // Código copiado do BeforePost da DMNotaEntrada.QItemNF para KREUZ
      If pQItemNF.FieldByName('COD_TRIBUTACAO').Value = 3 Then  //isento
        If pQNotaEntrada.FieldByName('COD_ESTADO').Value = 'PR' Then
        begin
           pQItemNF.Edit;
           pQItemNF.FieldByName('COD_CFOP').Value := 1102;
           pQItemNF.Post;
        end
        Else
        begin
           pQItemNF.Edit;
           pQItemNF.FieldByName('COD_CFOP').Value := 2102;
           pQItemNF.Post;
        end
      Else
        If pQItemNF.FieldByName('COD_TRIBUTACAO').Value = 9 Then  //substituicao
          If pQNotaEntrada.FieldByName('COD_ESTADO').Value = 'PR' Then
          begin
          // Comentado a pedido do Rubens 14/11/2019
          // Rubens disse que não havia pedido para fazer esta atualização. Disse que o cfop deve ser o cfop da operação.
//             pQItemNF.Edit;
//             pQItemNF.FieldByName('COD_CFOP').Value := 1403;
//             pQItemNF.Post;

            {if (pQItemNF.FieldByName('COD_CFOP').Value = null) and
               (DMOracle.FastSelect('COD_CFOP_ST', 'TB_OPERACAO', 'COD_OPERACAO = ' + pQNotaEntrada.FieldByName('COD_OPERACAO').text) <> '') then
            begin
              pQItemNF.Edit;
              pQItemNF.FieldByName('COD_CFOP').Value := DMOracle.FastSelect('COD_CFOP_ST', 'TB_OPERACAO', 'COD_OPERACAO = '
                                                                                  + pQNotaEntrada.FieldByName('COD_OPERACAO').Text);
              pQItemNF.Post;
            end;    }

//          end
//          Else
//          begin
          // Comentado a pedido do Rubens 14/11/2019
          // Rubens disse que não havia pedido para fazer esta atualização. Disse que o cfop deve ser o cfop da operação.
//             pQItemNF.Edit;
//             pQItemNF.FieldByName('COD_CFOP').Value := 2403;
//             pQItemNF.Post;
            {if (pQItemNF.FieldByName('COD_CFOP').Value = null) and
              (DMOracle.FastSelect('COD_CFOP_INT_ST', 'TB_OPERACAO', 'COD_OPERACAO = ' + pQNotaEntrada.FieldByName('COD_OPERACAO').text) <> '') then
            begin
              pQItemNF.Edit;
              pQItemNF.FieldByName('COD_CFOP').Value := DMOracle.FastSelect('COD_CFOP_INT_ST', 'TB_OPERACAO', 'COD_OPERACAO = '
                                                                                      + pQNotaEntrada.FieldByName('COD_OPERACAO').text);
              pQItemNF.Post;
            end;     }
{          end
        Else
          If pQNotaEntrada.FieldByName('COD_ESTADO').Value = 'PR' Then
          begin
             pQItemNF.Edit;
             pQItemNF.FieldByName('COD_CFOP').Value := 1652;
             pQItemNF.Post;
          end
          Else
          begin
             pQItemNF.Edit;
             pQItemNF.FieldByName('COD_CFOP').Value := 2652;
             pQItemNF.Post;
          end
    end;  }



    result := pQItemNF;
  end;
end;

function TBibCompra.itemImportacaoXMLDiniz(pQItemNF: TOracleDataSet1;
  pCampo: string; pValor: variant; pQNotaEntrada: TOracleDataSet1): TOracleDataSet1;
var exec: TExecutador;
begin
  result := pQItemNF;
  if pCampo = 'CFOP' then
  begin
    if (Copy(VarToStr(pValor), 1, 4) = '5652') or (Copy(VarToStr(pValor), 1, 2) = '5655') then
    begin
      pQItemNF.Edit;
      pQItemNF.FieldByName('COD_TRIBUTACAO').Value := 25;
      pQItemNF.FieldByName('CFOP').Value := 1652;
      pQItemNF.Post;
    end
    else if (Copy(VarToStr(pValor), 1, 4) = '6652') or (Copy(VarToStr(pValor), 1, 2) = '6655') then
    begin
      pQItemNF.Edit;
      pQItemNF.FieldByName('COD_TRIBUTACAO').Value := 25;
      pQItemNF.FieldByName('CFOP').Value := 2652;
      pQItemNF.Post;
    end;
    result := pQItemNF;
  end;
end;

function TBibCompra.itemImportacaoXMLMzm(pQItemNF: TOracleDataSet1;
  pCampo: string; pValor: variant; pQNotaEntrada: TOracleDataSet1): TOracleDataSet1;
var exec: TExecutador;
begin
  result := pQItemNF;
  pQItemNF.Edit;
  pQItemNF.FieldByName('COD_TRIBUTACAO').Value := 12;
  pQItemNF.Post;
end;

function TBibCompra.loteImportacaoXML(pCnpj, pDescricao, pInfAdProd, pCprod: string): integer;
var wLoteStr: string;
  wLoteInt, wAux: integer;
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
  begin
    wLoteStr := '';
    wLoteInt := 1;
    with DMNfe do
    begin
      QProdutoInformacaoLoteXml.Close;
      QProdutoInformacaoLoteXml.SetVariable('DESC_CNPJ', pCnpj);
      QProdutoInformacaoLoteXml.Open;

      if not QProdutoInformacaoLoteXml.Eof then
      begin
        if QProdutoInformacaoLoteXmlIND_TAG.Value = 'xProd' then
        begin
          if QProdutoInformacaoLoteXmlIND_LOCAL.Value = 'FIM' then
          begin
            wLoteStr := Copy(pDescricao, Length(pDescricao) - 1, 2);
            if not TryStrToInt(wLoteStr, wLoteInt) then
            begin
              pDescricao := StringReplace(pDescricao,'-','',[rfReplaceAll]);
              wLoteStr := Copy(pDescricao, Length(pDescricao) - 1, 2);
              if not TryStrToInt(wLoteStr, wLoteInt) then
                wLoteInt := 1;
            end;
          end
          else if TryStrToInt(QProdutoInformacaoLoteXmlIND_LOCAL.Value, wAux) then
          begin
            if wAux > 0 then
            begin
              wLoteStr := Copy(pDescricao, wAux+1, 2);
              if not TryStrToInt(wLoteStr, wLoteInt) then
                wLoteInt := 1;
            end
            else if wAux < 0 then
            begin
              wLoteStr := Copy(pDescricao, Length(pDescricao) + (wAux+1), 2);
              if not TryStrToInt(wLoteStr, wLoteInt) then
                wLoteInt := 1;
            end;
          end;
        end
        else
        if QProdutoInformacaoLoteXmlIND_TAG.Value = 'infAdProd' then
        begin
          if QProdutoInformacaoLoteXmlIND_LOCAL.Value = 'INICIO' then
          begin
            wLoteStr := Trim(Copy(pInfAdProd, 0, 2));
            if not TryStrToInt(wLoteStr, wLoteInt) then
              wLoteInt := 1;
          end
          else
          begin
            wLoteStr :=
              Copy(pInfAdProd, Pos(QProdutoInformacaoLoteXmlIND_LOCAL.Value, pInfAdProd)
                + Length(QProdutoInformacaoLoteXmlIND_LOCAL.Value)+1 , 2);
            if not TryStrToInt(wLoteStr, wLoteInt) then
              wLoteInt := 1;
          end;
        end
        else
        if QProdutoInformacaoLoteXmlIND_TAG.Value = 'cProd' then
        begin
          if QProdutoInformacaoLoteXmlIND_LOCAL.Value = 'FIM' then
          begin
            wLoteStr := Copy(pCprod, Length(pCprod) - 1, 2);
            if not TryStrToInt(wLoteStr, wLoteInt) then
              wLoteInt := 1;
          end;
        end;
      end;
      result := wLoteInt;
      
    end;
  end
  else
    result := 1;
end;

function extrairTextoDoMeio(const Str: string; const Delim1, Delim2: string): string;
var
  pos1, pos2: integer;
begin
  result := '';
  pos1 := Pos(Delim1, Str);
  if pos1 > 0 then begin
    pos2 := PosEx(Delim2, Str, pos1+1);
    if pos2 > 0 then
      result := Copy(Str, pos1 + 1, pos2 - pos1 - 1);
  end;
end;

function TBibCompra.personalizaAdicionaItemNota(pFabricante: string;
  pCodigo: integer): string;
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CONCREFER' then
    result := intToStr(pCodigo)
  else
    result := pFabricante;
end;

function TBibCompra.personalizaBuscaProdutoAusenteNFe(
  pBuscador: TBuscador; pCodProduto: string): TBuscador;
begin
  result := pBuscador;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CONCREFER' then
    result := personalizaBuscaProdutoAusenteNFeConcrefer(pCodProduto);
end;

function TBibCompra.personalizaBuscaProdutoAusenteNFeConcrefer(
  pCodProduto: string): TBuscador;
  var pBuscador: TBuscador;
begin
  pBuscador := TBuscador.Create;
  pBuscador.Limpa;
  pBuscador.Adiciona('SELECT COUNT(*) FROM TB_PRODUTO WHERE COD_PRODUTO = '
        + pCodProduto);
  result := pBuscador;
end;

function TBibCompra.personalizaNumOrdemCompra(pNumero: integer; pOperacao: string): integer;
begin
  result := pNumero;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARZ' then
    result := personalizaNumOrdemCompraARZ(pNumero, pOperacao);

end;

function TBibCompra.personalizaNumOrdemCompraARZ(pNumero: integer; pOperacao: string): integer;
begin
  if pOperacao = 'INSERT' then
    result := 0
  else
  begin
    if pNumero > 0 then
      result := pNumero
    else
      result := StrToInt(DMOracle.FastSelect('SQNUM_ORDEM_COMPRA.NEXTVAL', 'DUAL'));
  end;
end;

end.
