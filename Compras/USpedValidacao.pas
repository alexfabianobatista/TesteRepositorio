unit USpedValidacao;

interface

uses UOracle_cl, Dialogs, SysUtils, Controls, OraTeste, Variants,
  Classes;

type
  TSpedValidacao = class
  private
    prodSemNCM: TStringList;
  protected
  public
    function IsSped(pFilial: String): Boolean;
    function IsOperacaoSped(pCodOperacao: Integer): Boolean;
    procedure ValidaCST(pCSTPis, pCSTCofins, pEntradaSaida: Variant);
    procedure Valida(pQNota, pQItem: TOracleDataSet1);
    procedure ValidaPerPisCofins();
    procedure ValidaNcm(pCodProduto: String);
    procedure ValidaCSTIPI(pCstIpi: Variant; pPercIpi: Variant;
      pEntradaSaida: Variant);
    function IsSpedPisCofins(pFilial: String): Boolean;
    function ValidaCFOP(pCodOperacao: Integer; pCfopItem: Variant;
      pUFFilial, pUFCadastro: String; pCodTributacao: Integer): String;
  end;

implementation

  procedure TSpedValidacao.Valida(pQNota, pQItem: TOracleDataSet1);
  var erroNcm :string;
  i: Integer;
  wValIpi: Variant;
  wRetornoCfop: String;
  begin
    if (IsSped(pQNota.FieldValues['COD_FILIAL'])) and
      (IsOperacaoSped(pQNota.FieldValues['COD_OPERACAO'])) then
    begin
      //Para cada nota cria uma lista de produtos sem ncm nova
      prodSemNCM := TStringList.Create;
      if IsSpedPisCofins(pQNota.FieldValues['COD_FILIAL']) then
      begin
          ValidaPerPisCofins();
      pQItem.First;
      end;

      while not pQItem.Eof do
      begin
        if pQItem.FieldValues['VAL_PIS'] > 0 then
        begin
          ValidaCST(pQItem.FieldValues['COD_CST_PIS'],pQItem.FieldValues['COD_CST_COFINS'],
            pQNota.FieldValues['IND_ENTRADA_SAIDA']);
        end;
        ValidaNcm(pQItem.FieldValues['COD_PRODUTO']);
        if pQNota.FieldValues['IND_ENTRADA_SAIDA'] = 'E' then
          wValIpi := pQItem.FieldValues['VAL_IPI']
        else
          wValIpi := pQItem.FieldValues['PERC_IPI'];
        ValidaCSTIPI(pQItem.FieldValues['COD_CST_IPI'], wValIpi,
          pQNota.FieldValues['IND_ENTRADA_SAIDA']);
        wRetornoCfop := ValidaCFOP(pQNota.FieldValues['COD_OPERACAO'],
          pQItem.FieldValues['COD_CFOP'],
          DMOracle.FastSelect('COD_ESTADO' ,'TB_FILIAL', 'COD_FILIAL = '
            + IntToStr(pQNota.FieldValues['COD_FILIAL'])),
          DMOracle.FastSelect('COD_ESTADO', 'TB_CADASTRO', 'COD_CADASTRO = '
            + IntToStr(pQNota.FieldValues['COD_CADASTRO'])),
          pQitem.FieldValues['COD_TRIBUTACAO']
        );
        if wRetornoCfop <> 'OK' then
        begin
          MessageDlg(wRetornoCfop, mtError, [mbOk],0);
          Abort;
        end;
        pQItem.Next;
      end;
      if prodSemNCM.Count > 0 then
      begin
        erroNcm := 'Os seguintes produtos estão sem código NCM:' + #10#13;
        for i := 0 to (prodSemNCM.Count - 1) do
        begin
          erroNcm := erroNcm + prodSemNCM[i] + #10#13;
        end;
        MessageDlg(erroNcm, mtError, [mbOk],0);
        Abort;
      end;
    end;
  end;

  function TSpedValidacao.IsSped(pFilial: String): Boolean;
  begin
    with DMOracle do
    begin
      if Trim(pFilial) <> '' then
        result := (((FastSelect('NVL(COD_INC_TRIB,-1)','TB_FILIAL','COD_FILIAL = ' +
        pFilial)) >= '0') or (FastSelect('NVL(IND_PERFIL_SPED,'+quotedStr('Z')+')','TB_FILIAL',
          'COD_FILIAL = ' + pFilial)<> 'Z'))
      else
        result := false;
    end;
  end;

  function TSpedValidacao.IsSpedPisCofins(pFilial: String): Boolean;
  begin
    with DMOracle do
    begin
      if Trim(pFilial) <> '' then
        result := (((FastSelect('NVL(COD_INC_TRIB,-1)','TB_FILIAL','COD_FILIAL = ' +
        pFilial)) >= '0'))
      else
        result := false;
    end;
  end;

  function TSpedValidacao.IsOperacaoSped(pCodOperacao: Integer): Boolean;
  begin
    with DMOracle do
    begin
      result :=
      (FastSelect('NVL(PERC_BASE_PIS,-1)','TB_OPERACAO','COD_OPERACAO = ' +
        IntToStr(pCodOperacao)) <> '-1') or ((
        FastSelect('IND_LIVRO_FISCAL','TB_OPERACAO','COD_OPERACAO = ' +
          IntToStr(pCodOperacao)) = 'S'
          ) and (
            FastSelect('NVL(NUM_LIVROS,0)','TB_OPERACAO','COD_OPERACAO = ' +
              IntToStr(pCodOperacao)) <> '0')
          );
    end;
  end;

  procedure TSpedValidacao.ValidaCST(pCSTPis, pCSTCofins, pEntradaSaida: Variant);
  begin
    if (pCSTPis = Null) and (pCSTCofins = Null) then
    begin
      MessageDlg('Os campos CST do Pis e Cofins de todos os itens devem ser informados',
            mtInformation, [mbOk],0);
      Abort;
    end;
    if pCSTPis = Null then
    begin
      MessageDlg('O campo CST do Pis de todos os itens devem ser informados',
            mtInformation, [mbOk],0);
      Abort;
    end;
    if pCSTCofins = Null then
    begin
      MessageDlg('O campo CST do Cofins de todos os itens devem ser informados',
            mtInformation, [mbOk],0);
      Abort;
    end;
    with DMOracle do
    begin
      if Trim(pEntradaSaida) = 'E' then
      begin
        if FastSelect('IND_TIPO','TB_CST_PIS','COD_CST_PIS = ' + pCSTPis) <> 'E' then
        begin
          MessageDlg('Algum item possui o CST do Pis informado que não é de entrada.',mtError, [mbOk],0);
          Abort;
        end;
        if FastSelect('IND_TIPO','TB_CST_COFINS','COD_CST_COFINS = ' + pCSTCofins) <> 'E' then
        begin
          MessageDlg('Algum item possui o CST do Cofins informado que não é de entrada.',mtError, [mbOk],0);
          Abort;
        end;
      end;

      if pEntradaSaida = 'S' then
      begin
        if FastSelect('IND_TIPO','TB_CST_PIS','COD_CST_PIS = ' + pCSTPis) <> 'S' then
        begin
          MessageDlg('Algum item possui o CST do Pis informado que não é de saída.',mtError, [mbOk],0);
          Abort;
        end;
        if FastSelect('IND_TIPO','TB_CST_COFINS','COD_CST_COFINS = ' + pCSTCofins) <> 'S' then
        begin
          MessageDlg('Algum item possui o CST do Cofins informado que não é de saída.',mtError, [mbOk],0);
          Abort;
        end;
      end;
    end;
  end;

  procedure TSpedValidacao.ValidaPerPisCofins();
  begin
    with DMOracle do
    begin
      if ((FastSelect('NVL(PERC_PIS,-1)','TB_PARAM_SISTEMA','0=0')) = '-1') and
        ((FastSelect('NVL(PERC_COFINS,-1)','TB_PARAM_SISTEMA','0=0')) = '-1') then
      begin
        MessageDlg('Os percentuais de PIS e COFINS não foram informados nos parâmetros do sistema.',
          mtError, [mbOk],0);
        Abort;
      end;
      if (FastSelect('NVL(PERC_PIS,-1)','TB_PARAM_SISTEMA','0=0')) = '-1' then
      begin
        MessageDlg('O percentual de PIS não foi informado nos parâmetros do sistema.',
          mtError, [mbOk],0);
        Abort;
      end;
      if (FastSelect('NVL(PERC_COFINS,-1)','TB_PARAM_SISTEMA','0=0')) = '-1' then
      begin
        MessageDlg('O percentual de COFINS não foi informado nos parâmetros do sistema.',
          mtError, [mbOk],0);
        Abort;
      end;
    end;
  end;

  procedure TSpedValidacao.ValidaNcm(pCodProduto: String);
  var x,y: array of string;
      wTipoProduto: String;
  begin
    setLength(x, 2);
    setLength(y, 2);

    x[0] := 'SELECT COD_PRODUTO FROM TB_PRODUTO WHERE COD_PRODUTO = ' + pCodProduto;
    x[1] := 'SELECT DESC_PRODUTO FROM TB_PRODUTO WHERE COD_PRODUTO = ' + pCodProduto;
    
    with DMOracle do
    begin
      wTipoProduto := FastSelect('IND_TIPO_PRODUTO','TB_PRODUTO','COD_PRODUTO = '+ pCodProduto);
      if (wTipoProduto <> 'GAS') and
         (wTipoProduto <> 'ENERGIA') and
         (wTipoProduto <> 'AGUA') and
         (wTipoProduto <> 'IMOBILIZAD') and
         (wTipoProduto <> 'CONSUMO') and
         (wTipoProduto <> 'SERVIÇO') and
         (wTipoProduto <> 'VEICULO') then
      begin
        if (FastSelect('NVL(NUM_GENERO_NCM,0)','TB_PRODUTO',
          'COD_PRODUTO = '+ pCodProduto)) = '0' then
        begin
          DMOracle.BuscaNomes(x, y);
          prodSemNCM.Add(y[0] +' - '+ y[1]);
        end;
      end;
    end;
  end;
procedure TSpedValidacao.ValidaCSTIPI(pCstIpi: Variant; pPercIpi: Variant;
  pEntradaSaida: Variant);
begin
  if pPercIpi > 0 then
  begin
    if pCstIpi = null then
    begin
      MessageDlg('Itens com IPI informado e CST de IPI não informado.',mtError,
        [mbOk],0);
      Abort;
    end;
    if (pEntradaSaida = 'E') and (pCstIpi > 49) then
    begin
      MessageDlg('Informar CST de IPI válida', mtError,[mbOk],0);
      Abort;
    end;
    if(pEntradaSaida = 'S') and (pCstIpi < 50) then
    begin
      MessageDlg('Informar CST de IPI válida', mtError,[mbOk],0);
      Abort;
    end;
    if (pEntradaSaida = 'E') and ((pCstIpi = '01') or (pCstIpi = '02') or
      (pCstIpi = '04'))then
    begin
      MessageDlg('Itens com percentual de IPI informado porém CST de IPI não permite recuperação de crédito.',mtError,
        [mbOk],0);
      Abort;
    end;
    if (pEntradaSaida = 'S') and ((pCstIpi = '51') or (pCstIpi = '52') or
      (pCstIpi = '53') or (pCstIpi = '54'))then
    begin
      MessageDlg('Itens com percentual de IPI informado porém CST de IPI não permite tributação.',mtError,
        [mbOk],0);
      Abort;
    end;
  end
  else
  begin
    if (pEntradaSaida = 'E') and (pCstIpi = '00') and (pPercIpi = 0) then
    begin
      MessageDlg('Itens sem percentual de IPI informado porém CST de IPI permite recuperação de crédito.',mtError,
        [mbOk],0);
      Abort;
    end;
    if(pEntradaSaida = 'S') and (pCstIpi = '50') and (pPercIpi = 0)then
    begin
      MessageDlg('Itens sem percentual de IPI informado porém CST de IPI permite tributação.',mtError,
        [mbOk],0);
      Abort;
    end;
  end;
end;


function TSpedValidacao.ValidaCFOP(pCodOperacao: Integer; pCfopItem: Variant;
  pUFFilial, pUFCadastro: String; pCodTributacao: Integer): String;
var
  wCst, wCsosn: String;
  wSt: Boolean;
  wDescOperacao: String;
begin
  result := 'OK';
  wCst := '';
  wCsosn := '';
  wSt := false;

  wCst := DMOracle.FastSelect('DESC_SITUACAO_TRIB', 'TB_TRIBUTACAO',
      'COD_TRIBUTACAO = ' + IntToStr(pCodTributacao));
  wCsosn := DMOracle.FastSelect('DESC_CSOSN', 'TB_TRIBUTACAO',
      'COD_TRIBUTACAO = ' + IntToStr(pCodTributacao));

  wSt := ((wCst = '010') or (wCst = '030') or (wCst = '060') or (wCst = '070') or
    (wCsosn = '201') or (wCsosn = '202') or (wCsosn = '203') or (wCsosn = '500'));

  if (wSt) and (pCfopItem = null) then
  begin
    if pUFFilial = pUFCadastro then
    begin
      if DMOracle.FastSelect('NVL(COD_CFOP_ST, -1)','TB_OPERACAO',
        'COD_OPERACAO = ' + IntToStr(pCodOperacao)) < '0' then
      begin
        result := 'Esta nota possui produtos com substituição tributária porém ' +
          'não foi encontrado cfop de substituição tributária na operação:' + chr(13)+
          IntToStr(pCodOperacao) + ' : ' +
          DMOracle.FastSelect('DESC_OPERACAO', 'TB_OPERACAO', 'COD_OPERACAO = ' +
            IntToStr(pCodOperacao)) + '.' + chr(13) +
          'Por favor informe cfop de substituição tributária no cadastro da operação.';
      end;
    end
    else
    begin
      if DMOracle.FastSelect('NVL(COD_CFOP_INT_ST, -1)','TB_OPERACAO',
        'COD_OPERACAO = ' + IntToStr(pCodOperacao)) < '0' then
      begin
        result := 'Esta nota possui produtos com substituição tributária porém ' +
          'não foi encontrado cfop de substituição tributária na operação:' + chr(13)+
          IntToStr(pCodOperacao) + ' : ' +
          DMOracle.FastSelect('DESC_OPERACAO', 'TB_OPERACAO', 'COD_OPERACAO = ' +
            IntToStr(pCodOperacao)) + '.' + chr(13) +
          'Por favor informe cfop de substituição tributária no cadastro da operação.';
      end;
    end;
  end;
end;

end.
