unit UNfeImpressao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Dialogs, Forms;

type
  TNfeImpressao = class
  public
    //function GeraXML: string;
    procedure setFlagAgricola(flag: Boolean);
  private
    function MontaChaveAcessoNFe(codUF: integer; dtEmissao: TDateTime; CNPJ: string;
      Modelo, Serie, NumeroNF, FormaEmissao: integer): string;
    function LimpaCNPJ(cnpj: string): string;
    function VerificaDados(): Boolean;
    function RetornaCaminhoNfe(): string;
    function RetornaCaminhoLoteNfe(): string;
    function RemZeroEsq(wStr: string): string;
    function UltimoChar(Str: string): string;
    procedure Calc_Peso_Nota;
    function RetornaHomeNfe: string;
    function RetornaVersaoSchema: string;
  end;

var
  NfeImpressao: TNfeImpressao;
  wPeso, wPesoBruto: Double;
  wAmbienteNfe: string;
  wFlagAgricola: Boolean = false; //variavel utilizada para saber se a chamada foi feita pelo agricola

implementation

uses UOracle_cl, UNotaSaida_cl, UNotaEntrada_cl, UCadastro_cl, UParamSistema_cl,
  UContasReceber_cl, UPromissoria, UOperacao_cl, UGuiaTransito_cl, DB, Math,
  UBiblioteca, UTipoLote_cl, UUsuario_cl, UNfe_cl, UMensagem_cl;

function TNfeImpressao.UltimoChar(Str: string): string;
begin
  Result := Copy(Str, Length(Str), 1);
end;

procedure TNfeImpressao.setFlagAgricola(flag: Boolean);
begin
  wFlagAgricola := flag;
end;

function TNfeImpressao.RemZeroEsq(wStr: string): string;
var
  wRes: string;
begin
  wRes := wStr;

  while (Length(wRes) > 0) and (wRes[1] = '0') do
    wRes := Copy(wRes, 2, Length(wRes));

  Result := wRes;
end;

function TNfeImpressao.RetornaHomeNfe: string;
var
  XML: TStrings;
  Aux: string;
  i, j: Integer;
begin
  Result := '';
  XML := TStringList.Create;
  try
    XML.LoadFromFile('C:\HomeNFe.xml');
  except
    MessageDlg('Arquivo nao encontrado: C:\HomeNFe.xml', mtError, [mbOK], 0);
    Exit;
  end;
  i := Bib.ProcuraStr('<home>', XML.Text);
  j := Bib.ProcuraStr('</home>', XML.Text);
  if (i = -1) or (j = -1) then
  begin
    MessageDlg('Tag nao encontrada: <home> ou </home>(HomeNFe.xml).', mtError, [mbOK], 0);
    Exit;
  end;
  Inc(i, 7);
  Aux := Trim(Copy(XML.Text, i, j - i + 1));

  if Aux = '' then
  begin
    MessageDlg('Caminho em branco na tag <home> (HomeNFe.xml)', mtError, [mbOK], 0);
    Exit;
  end;
  if Copy(Aux, Length(Aux), 1) <> '\' then
    Aux := Aux + '\';
  Result := Aux;
end;

function TNfeImpressao.RetornaVersaoSchema: string;
var
  i: Integer;
  s: string;
  SR: TSearchRec;
begin
  s := RetornaHomeNfe + 'Schema\nfe_v*.xsd';
  i := FindFirst(s, faAnyFile, SR);
  s := '';
  while i = 0 do
  begin
    s := SR.Name;
    s := Copy(s, 6, Bib.ProcuraStr('.xsd', s) - 5);
    try
      StrToFloat(StringReplace(s, '.', ',', [rfReplaceAll]));
      Break;
    except
      i := FindNext(SR);
    end;
  end;
  Result := s;
end;

function TNfeImpressao.RetornaCaminhoNfe(): string;
var
  XML: TStrings;
  Aux: string;
  i, j: Integer;
begin
  XML := TStringList.Create;
  XML.Clear;

  Aux := RetornaHomeNfe;
  try
    XML.LoadFromFile(Aux + '\Config\config.xml');
  except
    MessageDlg('Arquivo nao encontrado: ' + Aux + '\Config\config.xml', mtError, [mbOK], 0);
    Exit;
  end;

  i := Bib.ProcuraStr('<xml>', XML.Text);
  j := Bib.ProcuraStr('</xml>', XML.Text);
  if (i = -1) or (j = -1) then
  begin
    MessageDlg('Tag nao encontrada: <xml> ou </xml>(config.xml).', mtError, [mbOK], 0);
    Exit;
  end;
  Inc(i, 6);
  Aux := Trim(Copy(XML.Text, i, j - i + 1));

  if Aux = '' then
    MessageDlg('Caminho em branco na tag <xml> (config.xml)', mtError, [mbOK], 0);
  if Copy(Aux, Length(Aux), 1) <> '\' then
    Aux := Aux + '\';

  Result := Aux + 'xml\';
end;

function TNfeImpressao.RetornaCaminhoLoteNfe: string;
var
  XML: TStrings;
  Aux: string;
  i, j: Integer;
begin
  XML := TStringList.Create;
  XML.Clear;
  Result := '';
  try
    XML.LoadFromFile('C:\HomeNFe.xml');
  except
    MessageDlg('Arquivo nao encontrado: C:\HomeNFe.xml', mtError, [mbOK], 0);
    Exit;
  end;
  i := Bib.ProcuraStr('<home>', XML.Text);
  j := Bib.ProcuraStr('</home>', XML.Text);
  if (i = -1) or (j = -1) then
  begin
    MessageDlg('Tag nao encontrada: <home> ou </home>(HomeNFe.xml).', mtError, [mbOK], 0);
    Exit;
  end;
  Inc(i, 7);
  Aux := Trim(Copy(XML.Text, i, j - i + 1));

  if Aux = '' then
  begin
    MessageDlg('Caminho em branco na tag <home> (HomeNFe.xml)', mtError, [mbOK], 0);
    Exit;
  end;
  if Copy(Aux, Length(Aux), 1) <> '\' then
    Aux := Aux + '\';

  try
    XML.LoadFromFile(Aux + '\Config\config.xml');
  except
    MessageDlg('Arquivo nao encontrado: ' + Aux + '\Config\config.xml', mtError, [mbOK], 0);
    Exit;
  end;

  i := Bib.ProcuraStr('<xml>', XML.Text);
  j := Bib.ProcuraStr('</xml>', XML.Text);
  if (i = -1) or (j = -1) then
  begin
    MessageDlg('Tag nao encontrada: <xml> ou </xml>(config.xml).', mtError, [mbOK], 0);
    Exit;
  end;
  Inc(i, 6);
  Aux := Trim(Copy(XML.Text, i, j - i + 1));

  if Aux = '' then
    MessageDlg('Caminho em branco na tag <xml> (config.xml)', mtError, [mbOK], 0);
  if Copy(Aux, Length(Aux), 1) <> '\' then
    Aux := Aux + '\';

  Result := Aux + '\xmlValidacaoLote\';
end;

//MontaChaveAcesso
//-------------------
//Parametros:
//codUF - codigo da Unidade e Federação do Município de acordo tabela IBGE.
//dtEmissaso - data de emissão da nota fiscal
//CNPJ - codigo CNPJ do emitente
//Modelo - Modelo da Nota Fiscal NF-e (55)
//Serie - codigo de serie da NFe
//NumeroNF - Número da Nota Fiscal
//FormaEmissao - Forma Emissao da NF-e (1-Normal,2-Contigência,..)
//Result = Chave de acesso
//

function TNfeImpressao.MontaChaveAcessoNFe(codUF: integer; dtEmissao: TDateTime; CNPJ: string;
  Modelo, Serie, NumeroNF, FormaEmissao: integer): string;
var
  emissao: string[10];
  chave: string;
  CodigoNumerico: Integer;
begin
  emissao := formatdatetime('DD/MM/YY', dtEmissao);

// Essa parte do código gera o Código Numérico (Aleatório)
//para que funcione inclua a unit "Math" na cláusule Uses.
  Randomize;
  CodigoNumerico := Random(99999999);

  chave := IntToStr(codUF) + copy(emissao, 7, 2) + copy(emissao, 4, 2) +
    LimpaCNPJ(CNPJ) + Bib.StrZero2(Modelo, 2, 0) + Bib.StrZero2(Serie, 3, 0) +
    Bib.StrZero2(NumeroNF, 9, 0) + IntToStr(FormaEmissao) + Bib.StrZero2(CodigoNumerico, 8, 0);

  Result := chave + Bib.Modulo11(chave);

end;

// LimpaCNPJ (retira máscaras do CNPJ)
//------------------------------------

function TNfeImpressao.LimpaCNPJ(cnpj: string): string;
begin
  if trim(cnpj) = 'ISENTO' then
    Result := cnpj
  else
  begin
    Result := StringReplace(StringReplace(StringReplace(StringReplace(cnpj,
    '.', '', [rfReplaceAll]),
    '-', '', [rfReplaceAll]),
    ' ', '', [rfReplaceAll]),
    '/', '', [rfReplaceAll]);
    Result := Trim(Bib.LimpaNumero(Result));
  end;
end;

function TNfeImpressao.VerificaDados(): Boolean;
begin
  VerificaDados := False;
  with DMNotaSaida do
  begin
    if QNFE_EmiteCOD_UF_IBGE.text = '' then
    begin
      MessageDlg('O Código(IBGE) Do Uf ' + QNFE_EmiteCOD_ESTADO.Text + ' precisa ter um valor. Verifique o cadastro do Estado.', mtError, [mbOK], 0);
      Exit;
    end;
    if Length(QNFE_EmiteCOD_UF_IBGE.text) <> 2 then
    begin
      MessageDlg('O Código(IBGE) Do Uf ' + QNFE_EmiteCOD_ESTADO.Text + ' precisa ter 2 digitos. Verifique o cadastro do Estado.', mtError, [mbOK], 0);
      Exit;
    end;
    if QNFE_EmiteCOD_UF_IBGE_FILIAL.text = '' then
    begin
      MessageDlg('O Código(IBGE) Do Uf ' + QNFE_EmiteUF_FILIAL.Text + ' precisa ter um valor. Verifique o cadastro do Estado.', mtError, [mbOK], 0);
      Exit;
    end;
    if Length(QNFE_EmiteCOD_UF_IBGE_FILIAL.text) <> 2 then
    begin
      MessageDlg('O Código(IBGE) Do Uf ' + QNFE_EmiteUF_FILIAL.Text + ' da Filial precisa ter 2 digitos. Verifique o cadastro do Estado.', mtError, [mbOK], 0);
      Exit;
    end;
    if QNFE_EmiteCOD_CIDADE_IBGE.Text = '' then
    begin
      MessageDlg('O Código(IBGE) do Municipio ' + QNFE_EmiteDESC_CIDADE.Text + ' precisa ter um valor. Verifique o cadastro do Municipio.', mtError, [mbOK], 0);
      Exit;
    end;
    if Length(QNFE_EmiteCOD_CIDADE_IBGE.Text) <> 5 then
    begin
      MessageDlg('O Código(IBGE) do Municipio ' + QNFE_EmiteDESC_CIDADE.Text + ' precisa ter 5 digitos. Verifique o cadastro do Municipio.', mtError, [mbOK], 0);
      Exit;
    end;
    if QNFE_EmiteCOD_CIDADE_IBGE_FILIAL.Text = '' then
    begin
      MessageDlg('O Código(IBGE) da Cidade da Filial ' + QNFE_EmiteCIDADE_FILIAL.Text + ' precisa ter um valor. Verifique o cadastro da Cidade.', mtError, [mbOK], 0);
      Exit;
    end;
    if Length(QNFE_EmiteCOD_CIDADE_IBGE_FILIAL.Text) <> 5 then
    begin
      MessageDlg('O Código(IBGE) da Cidade da Filial ' + QNFE_EmiteCIDADE_FILIAL.Text + ' precisa ter 5 digitos. Verifique o cadastro da Cidade.', mtError, [mbOK], 0);
      Exit;
    end;
    if QNFE_EmiteCOD_PAIS_IBGE.Text = '' then
    begin
      MessageDlg('O Código(IBGE) do Pais ' + QNFE_EmiteDESC_PAIS.Text + ' precisa ter um valor. Verifique o cadastro do Pais.', mtError, [mbOK], 0);
      Exit;
    end;
//    if Length(QNFE_EmiteCOD_PAIS_IBGE.Text) <> 4 then
//    begin
//      MessageDlg('O Código(IBGE) do Pais ' + QNFE_EmiteDESC_PAIS.Text + ' precisa ter 4 digitos. Verifique o cadastro do Pais.', mtError, [mbOK], 0);
//      Exit;
//    end;
    if wAmbienteNfe = '' then
    begin
      MessageDlg('Não foi encontrado um ambiente NFE (Homologação ou Produção) no cadastro da filial.', mtError, [mbOK], 0);
      Exit;
    end;
    if Length(QNFE_EmiteItDESC_SITUACAO_TRIB.Value) <> 3 then
    begin
      MessageDlg('O número CST não possui 3 dígitos, verifique o cadastro da tributação', mtError, [mbOk], 0);
      Exit;
    end;
    if QNFE_EmiteDESC_BAIRRO.Text = '' then
    begin
      MessageDlg('Favor informar bairro do cadastro.' + chr(13) + 'Cadastro ' + QNFE_EmiteCOD_CADASTRO.Text, mtError, [mbOK], 0);
      Exit;
    end;
    if (QNFE_EmiteDESC_PLACA.Value <> '') and (QNFE_Emiteuf_transp.Text = '') then
    begin
      MessageDlg('Transportadora não possui UF.', mtError, [mbOK], 0);
      Exit;
    end;
   // if (QNFE_EmiteCOD_NOTA_CAB_REF.Value > 0) and (DMOracle.BuscaNome('SELECT DESC_CHAVE_ACESSO FROM TB_NOTA_CAB',
    //      'COD_NOTA_CAB = ' + QNFE_EmiteCOD_NOTA_CAB_REF.Text) = '') then
   // begin
  //    MessageDlg('NF referenciada não possui chave de acesso.', mtError, [mbOK], 0);
   //   Exit;
   // end;

    try
      StrToInt(QNFE_EmiteCOD_SERIE.Value);
    except
      MessageDlg('O Codigo da serie precisa ser um numero inteiro. Use outra série para NF-e.', mtError, [mbOK], 0);
      Exit;
    end;

    if (UpperCase(DMNfe.LimpaStrXML(QNFE_EmiteDESC_PAIS.Value)) <> 'BRASIL') and
      (not QNFE_EmiteItCOD_CADASTRO.IsNull) then
      if DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO',
        'COD_CADASTRO = ' + QNFE_EmiteItCOD_CADASTRO.Text) = '' then
      begin
        MessageDlg('Em caso de exportação, quando o produto possui fabricante, esse deve possuir o CNPJ' +
          ' informado no cadastro.' + #13 + #10 + 'Favor informar o CNPJ do cadastro ' + QNFE_EmiteItCOD_CADASTRO.Text,
          mtError, [mbOK], 0);
        Exit;
      end;

  end;
  VerificaDados := True;
end;

//retirado da UNotaImpressao

procedure TNfeImpressao.Calc_Peso_Nota;
var
  wFlagPeso :Boolean;
  wFlagPesoB :Boolean;
begin
  wFlagPeso := false;
  wFlagPesoB := false;

  //Faz este cálculo quando tiver um valor no peso bruto e peso liquido no cadastro do produto
  //Se fizer o cálculo por peso brugo e liquido, não pode fazer o cálculo pelo num_volumes e num_embalagens
  //Por isso utiliza wFlagPeso e wFlagPesoB
  with DMNotaSaida do
  begin
    if DMNotaSaida.QNFE_EmiteItNUM_PESO_BRUTO.Value > 0  then
    begin
      wPesoBruto := wPesoBruto + (QNFE_EmiteItNUM_PESO_BRUTO.Value * QNFE_EmiteItQT_QUANTIDADE.Value);
      wFlagPesoB := true;
    end;
    if DMNotaSaida.QNFE_EmiteItNUM_PESO_LIQUIDO.Value > 0  then
    begin
      wPeso := wPeso + (QNFE_EmiteItNUM_PESO_LIQUIDO.Value * QNFE_EmiteItQT_QUANTIDADE.Value);
      wFlagPeso := true;
    end;
  end;

  if (DMNotaSaida.QNFE_EmiteITInd_Tipo_Produto.Value = 'AGRICOLA') then
  begin
    if not wFlagPeso then
      wPeso := wPeso + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value;
    if not wFlagPesoB then
      wPesoBruto := wPesoBruto + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value;
  end
  else
    begin
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
      begin
        //wPeso :=  wPeso + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value * DMNotaSaida.QNFE_EmiteITNum_embalagem.Value;
        if not wFlagPeso then
          wPeso := wPeso + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value * DMNotaSaida.QNFE_EmiteItNUM_EMBALAGEM.Value;
        if not wFlagPesoB then
        begin
          if DMNotaSaida.QNFE_Emiteqt_beneficiado.Text <> '' then
            wPesoBruto := DMNotaSaida.QNFE_Emiteqt_beneficiado.Value
          else
            wPesoBruto := wPesoBruto + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value * DMNotaSaida.QNFE_EmiteITNum_Volumes.Value;
        end;
      end
      else if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARTICAR') or
              (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PERFIL') then
      begin
        if not wFlagPeso then
          wPeso := wPeso + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value * DMNotaSaida.QNFE_EmiteITNum_Volumes.Value;
        if not wFlagPesoB then
          wPesoBruto := wPeso;
      end
      else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED' then
      begin
        if not wFlagPeso then
          wPeso := wPeso + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value * DMNotaSaida.QNFE_EmiteItNUM_METROS_CUBICOS.Value;
        if not wFlagPesoB then
          wPesoBruto := wPeso;
      end
      else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TOFECO' then
      begin
        if DMNotaSaida.QNFE_EmiteInd_Entrada_Saida.Value = 'E' then
        begin
          if not wFlagPeso then
            wPeso := wPeso + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value;
          if not wFlagPesoB then
            wPesoBruto := wPeso;
        end
        else
        begin
          if not wFlagPeso then
            wPeso := wPesoBruto + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value * DMNotaSaida.QNFE_EmiteITNum_Embalagem.Value;
          if not wFlagPesoB then
          begin
            if DMNotaSaida.QNFE_EmiteITCod_Produto.Value = 7 then
              wPesoBruto := wPesoBruto + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value + (DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value / 700 * 2)
            else
              wPesoBruto := wPesoBruto + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value * DMNotaSaida.QNFE_EmiteITNum_Embalagem.Value + (DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value * 0.15);
          end;
        end
      end
      else if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'SETIMO') or
              (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PESCADO') then
      begin
        if not wFlagPeso then
          wPeso := wPeso + DMNotaSaida.QNFE_EmiteItQT_QUANTIDADE.Value;
        if not wFlagPesoB then
          wPesoBruto := wPeso;
      end
      else
      begin
        if not wFlagPeso then
          wPeso := wPeso + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value * DMNotaSaida.QNFE_EmiteITNum_embalagem.Value;
        if not wFlagPesoB then
          wPesoBruto := wPesoBruto + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value * DMNotaSaida.QNFE_EmiteITNum_Volumes.Value;
    end;
  end;

end;

(*function TNfeImpressao.GeraXML(): string;
  function HandleTPEmis(Value: string): string;
  begin
    // Tipo de Emissao (1 - Normal; 2 - Contingencia)
    Result := Value;
    if Length(Result) > 1 then
    begin
      if (Result = 'CONTINGENCIA') then
        Result := '2'
      else if (Result = 'NORMAL') then
        Result := '1';
    end;
  end;
var
  XML: TStrings;
  wChave, wAux, wAux2, wNumEndereco, wLgr, wLgrFilial, wCaminho, wEmpresa, wCst, wObsTrib,
    wFisicaJuridica, wInfComplemento, {wInfLotes, }wEmis, wSistemaNfe, wImpressora, wProd, wVias: string;
  wVlrIcmSubst, wBaseIcmSubst: Double;
  wVolumes: Double;
  wbase_icm_tributada, wvlr_icm, wtotal_produtos, wvlr_ipi, wvlr_frete,
    wvlr_desconto, wvlr_pis, wvlr_cofins, wvlr_despesa, wvlr_total_nota, wvlr_servico, wvlr_iss: Real;
  wContItem, wInt: Integer;
  wAux3: Integer;
  wTribs{, wLotes}: array of Integer;
  wRetornavel: Boolean;
  wInfAdProd :String;
begin
  with DMNotaSaida do
  begin
    wEmpresa := DMParamSistema.QParamSistemaCOD_EMPRESA.Value;
    wAmbienteNfe := QNFE_EmiteIND_AMBIENTE_NFE.Text;
    if not VerificaDados then
    begin
      if DMParamSistema.CodEmpresa = 'MEDIBENS' then
        Raise Exception.Create('Não foi possível gerar XML da NF-e. Dados incompletos.')
      else
        Abort;
    end;
    wSistemaNfe := QNFE_EmiteIND_SISTEMA_NFE.Text;
    wChave := QNFE_EmiteDESC_CHAVE_ACESSO.Value;
    Result := wChave;

    if wSistemaNfe = '2' then
      wCaminho := DMNfe.BuscaCaminho(tpEmissaoNfe, QNFE_EmiteCOD_FILIAL.Value)
    else if not (wFlagAgricola) then
      wCaminho := RetornaCaminhoNfe
    else
      wCaminho := RetornaCaminhoLoteNfe;
    if (wCaminho = '') then
    begin
      MessageDlg('Não foi encontrado nenhum caminho para geração do XML da NF-e.'+#13+#10+
          'NF-e não será gerada. Informe algum caminho e tente reemitir cópia dela.', mtInformation, [mbOK], 0);
      Exit;
    end;

    wVias := '';
    if (wSistemaNfe = '2') then
    begin
      if (not QNFE_EmiteDESC_CHAVE_ACESSO.IsNull) then
        with DMNfe do
        begin
          SetaNfe(QNFE_EmiteDESC_CHAVE_ACESSO.Value);
          if (QNfeind_aprovado.Value) or (QNfeind_cancelado.Value) or (QNfeind_denegado.Value) then
          begin
            MessageDlg('Essa NF-e já está autorizada, cancelada ou denegada na SEFAZ.'+#13+#10+
                'Portanto não será gerada novamente.', mtInformation, [mbOK], 0);
            Exit;
          end;
        end;
      wVias := QNFE_EmiteNUM_VIAS_DANFE.Text;
      if (QNFE_EmiteIND_VIAS_DANFE.Value = 'S') and (InputQuery('Impressão de DANFE', 'Número de cópias', wVias)) then
        wVias := IntToStr(StrToInt('0' + Bib.LimpaNumero(wVias)));
    end;

    //Para o IND_CONTINGENCIA ser preenchido corretamente é necessário ter a trigger TRG_NOTA_CAB_B atualizada
    wEmis := HandleTPEmis(QNFE_EmiteIND_CONTINGENCIA.Value);

    if (QNFE_EmiteDESC_CHAVE_ACESSO.IsNull) or (Trim(QNFE_EmiteDESC_CHAVE_ACESSO.Value) = '') then
      wChave := 'NFe' + MontaChaveAcessoNFe(QNFE_EmiteCOD_UF_IBGE_FILIAL.Value,
        QNFE_EmiteDT_EMISSAO.Value,
        QNFE_EmiteCGC_FILIAL.Value,
        55, StrToInt(QNFE_EmiteCOD_SERIE.Value),
        QNFE_EmiteNUM_NOTA.Value,
        StrToInt(wEmis));
    Result := wChave;

    // inicializa as variaveis
    SetLength(wTribs, 1);
    wPesoBruto := 0;
    wPeso := 0;
    wVolumes := 0;
    wBaseIcmSubst := 0;
    wVlrIcmSubst := 0;
    wvlr_cofins := 0;
    wRetornavel := False;

    wNumEndereco := Bib.NumEndereco(QNFE_EmiteDESC_ENDERECO.Text);
    wLgr := Bib.RemoveNumEndereco(QNFE_EmiteDESC_ENDERECO.Text, wNumEndereco);
    wLgrFilial := Bib.RemoveNumEndereco(QNFE_EmiteEND_FILIAL.Text, QNFE_EmiteNUM_ENDERECO_FILIAL.Text);

    if DMNotaSaida.QNFE_EmiteInd_Entrada_Saida.Value = 'E' then
    begin
      wbase_icm_tributada := DMNotaEntrada.QSomaItemNotaSVal_ICM_Base.Value;
      wvlr_icm := DMNotaEntrada.QSomaItemNotaSVal_ICM.Value;
      wtotal_produtos := DMNotaEntrada.QSomaItemNotaSVal_Total.Value;
      wvlr_ipi := DMNotaEntrada.QSomaItemNotaSVal_Ipi.Value;
//    wDesc_Transgenicos := DMNotaEntrada.QSomaItemNotasVal_Dpi_Transgenicos.Value;
//    wBase_Subst:=0;
//    wIcms_Subst:=0;
      wvlr_frete := DMNotaEntrada.QSomaItemNotaSVAL_FRETE.Value;
      wvlr_desconto := DMNotaEntrada.QSomaItemNotaSVAL_DESCONTO.Value;
      wvlr_pis := DMNotaEntrada.QSomaItemNotaSVAL_PIS.Value;
      wvlr_cofins := DMNotaEntrada.QSomaItemNotaSVAL_COFINS.Value;
      wvlr_despesa := 0;
      wvlr_total_nota := DMNotaEntrada.QSomaItemNotasval_total_nfe.Value;
      if DMParamSistema.CodEmpresa = 'NUTRI' then
        wvlr_total_nota := wvlr_total_nota - QNFE_EmiteVAL_FUNRURAL.Value;
      wvlr_servico := 0;
      wvlr_iss := 0;
    end
    else
    begin
      DMNotaSaida.QSomaItemNota.Close;
      DMNotaSaida.QSomaItemNota.Master := nil; // FEITO PELO CESAR PARA NAO ACESSAR O QNOTASAIDA (ESTAVA DANDO OPEN)
      DMNotaSaida.QSomaItemNota.MasterFields := '';
      DMNotaSaida.QSomaItemNota.DetailFields := '';
      DMNotaSaida.QSomaItemNota.SetVariable('COD_NOTA_CAB', DMNotaSaida.QNFE_EmiteCOD_NOTA_CAB.Value);
      DMNotaSaida.QSomaItemNota.Open;
      wbase_icm_tributada := DMNotaSaida.QSomaItemNotaSVal_ICM_Base.Value;
      wvlr_icm := DMNotaSaida.QSomaItemNotaSVal_ICM.Value;
      wVlrIcmSubst := DMNotaSaida.QSomaItemNotaSVAL_ICMS_SUBST.Value;
      wBaseIcmSubst := DMNotaSaida.QSomaItemNotaSVAL_BASE_SUBST.Value;
      wtotal_produtos := DMNotaSaida.QSomaItemNotaSVal_Total.Value;
      wvlr_ipi := DMNotaSaida.QSomaItemNotaSVal_Ipi.Value;
//    wBase_Subst:=DMNotaSaida.QSomaItemNotaSVal_Base_Subst.Value;
//    wIcms_Subst:=DMNotaSaida.QSomaItemNotaSVal_Icms_Subst.Value;
      wvlr_frete := DMNotaSaida.QSomaItemNotaSVAL_FRETE.Value;
      wvlr_desconto := DMNotaSaida.QSomaItemNotaSVAL_DESCONTO.Value;
      wvlr_pis := DMNotaSaida.QSomaItemNotaSVAL_PIS.Value;
      wvlr_despesa := DMNotaSaida.QSomaItemNotaSVAL_DESPEAS.Value;
      wvlr_total_nota := DMNotaSaida.QSomaItemNotasval_total_nota.Value;
      wvlr_servico := DMNotaSaida.QSomaItemNotaSVAL_TOTAL_SERVICOS.Value;
      wvlr_iss := DMNotaSaida.QSomaItemNotaSVAL_ISS.Value;
      DMNotaSaida.QSomaItemNota.Close;
      DMNotaSaida.QSomaItemNota.Master := DMNotaSaida.QNotaSaida;
      DMNotaSaida.QSomaItemNota.MasterFields := 'COD_NOTA_CAB';
      DMNotaSaida.QSomaItemNota.DetailFields := 'COD_NOTA_CAB';
    end;

    XML := TStringList.Create;
    XML.Clear;
    XML.Add('<?xml version="1.0" encoding="utf-8"?>');
    if wSistemaNfe = '2' then
      XML.Add('<cemapa>');
    XML.Add('<NFe xmlns="http://www.portalfiscal.inf.br/nfe">');
    if wSistemaNfe = '2' then
      XML.Add('<infNFe versao="' + VERSAO_NFE_EMITE + '" Id="' + wChave + '">')
    else
      XML.Add('<infNFe versao="' + RetornaVersaoSchema + '" Id="' + wChave + '">');
    XML.Add('<ide>');
    XML.Add('<cUF>');
    XML.Add(QNFE_EmiteCOD_UF_IBGE_FILIAL.text);
    XML.Add('</cUF>');
    XML.Add('<cNF>');
    XML.Add(copy(wChave, 38, 9));
    XML.Add('</cNF>');
    XML.Add('<natOp>');
    XML.Add(QNFE_EmiteNAT_OPERACAO.Text);
    XML.Add('</natOp>');
    XML.Add('<indPag>');
    XML.Add(IntToStr(StrToInt(QNFE_EmiteIND_CONDICAO_PAGTO.Value) - 1));
    XML.Add('</indPag>');
    XML.Add('<mod>');
    XML.Add('55');
    XML.Add('</mod>');
    XML.Add('<serie>');
    XML.Add(QNFE_EmiteCOD_SERIE.Value);
    XML.Add('</serie>');
    XML.Add('<nNF>');
    XML.Add(QNFE_EmiteNUM_NOTA.Text);
    XML.Add('</nNF>');
    XML.Add('<dEmi>');
    XML.Add(FormatDateTime('yyyy-MM-dd', QNFE_EmiteDT_EMISSAO.Value));
    XML.Add('</dEmi>');
    XML.Add('<dSaiEnt>');
    XML.Add(FormatDateTime('yyyy-MM-dd', QNFE_EmiteDT_RECEBIMENTO.Value));
    XML.Add('</dSaiEnt>');
    XML.Add('<tpNF>');
    if QNFE_EmiteIND_ENTRADA_SAIDA.Value = 'E' then
      XML.Add('0')
    else
      XML.Add('1');
    XML.Add('</tpNF>');
    XML.Add('<cMunFG>');
    XML.Add(QNFE_EmiteCOD_UF_IBGE_FILIAL.Text + QNFE_EmiteCOD_CIDADE_IBGE_FILIAL.Text);
    XML.Add('</cMunFG>');
    if QNFE_EmiteCOD_NOTA_CAB_REF.Value > 0 then
    begin
      wAux := Bib.LimpaNumero(DMOracle.FastSelect('DESC_CHAVE_ACESSO', 'TB_NOTA_CAB',
        'COD_NOTA_CAB = ' + QNFE_EmiteCOD_NOTA_CAB_REF.Text));
      XML.Add('<NFref>');
      if wAux <> '' then // NF-e
      begin
        XML.Add('<refNFe>'); // verificar se nota eh normal ou substituicao etc...Pag 87
        XML.Add(wAux);
        XML.Add('</refNFe>');
      end
      else // NF
      begin
        wInt := QNFE_EmiteCOD_NOTA_CAB.Value;
        SetaEmissao(QNFE_EmiteCOD_NOTA_CAB_REF.Value);
        XML.Add('<refNF>');
        XML.Add('<cUF>');
        XML.Add(QNFE_EmiteUF_NOTA.Value);
        XML.Add('</cUF');
        XML.Add('<AAMM>');
        XML.Add(FormatDateTime('yyMM', QNFE_EmiteDT_EMISSAO.Value));
        XML.Add('</AAMM>');
        XML.Add('<CNPJ>');
        XML.Add(LimpaCNPJ(QNFE_EmiteCGC_FILIAL.Value));
        XML.Add('</CNPJ>');
        XML.Add('<mod>');
        XML.Add('01');
        XML.Add('</mod>');
        wAux := '';
        try
          wAux := IntToStr(StrToInt(QNFE_EmiteCOD_SERIE.Value));
        except
          wAux := '0';
        end;
        XML.Add('<serie>');
        XML.Add(wAux);
        XML.Add('</serie>');
        XML.Add('<nNF>');
        XML.Add(QNFE_EmiteNUM_NOTA.Text);
        XML.Add('</nNF>');
        XML.Add('</refNF>');
        SetaEmissao(wInt);
      end;
      XML.Add('</NFref>');
    end;
    XML.Add('<tpImp>');
    XML.Add('1'); // 1-Retrato; 2-Paisagem;
    XML.Add('</tpImp>');
    XML.Add('<tpEmis>');
    XML.Add(wEmis);
    XML.Add('</tpEmis>');
    XML.Add('<cDV>');
    XML.Add(UltimoChar(wChave));
    XML.Add('</cDV>');
    XML.Add('<tpAmb>');
    XML.Add(wAmbienteNfe);
    XML.Add('</tpAmb>');
    XML.Add('<finNFe>');
    XML.Add(QNFE_EmiteIND_FINALIDADE_NFE.Text); //FINALIDADE 1-NORMAL. 2-COMPLEMENTAR. 3-AJUSTE
    XML.Add('</finNFe>');
    XML.Add('<procEmi>');
    XML.Add('0');
        // 0-EMISSAO NFE COM APLICATIVO DO CONTRIBUINTE;
        // 1-AVULSA, PELO FISCO
        // 2-AVULSA, PELO CONTRIBUINTE COM SEU CERTIFICADO DIGITAL
        // 3-EMISSAO PELO CONTRIBUINTE COM APLICATIVO DO FISCO;
    XML.Add('</procEmi>');
    XML.Add('<verProc>');
    XML.Add('1.0');
    XML.Add('</verProc>');
    XML.Add('</ide>');
    XML.Add('<emit>');
    XML.Add('<CNPJ>');
    XML.Add(LimpaCNPJ(QNFE_EmiteCGC_FILIAL.Value));
    XML.Add('</CNPJ>');
        //XML.Add('<CPF>');
        //XML.Add(); //
        //XML.Add('</CPF');
    XML.Add('<xNome>');
    XML.Add(Trim(QNFE_EmiteNOME_FILIAL.Text));
    XML.Add('</xNome>');
    XML.Add('<xFant>');
    XML.Add(Trim(QNFE_EmiteNOME_FILIAL.Text));
    XML.Add('</xFant>');
    XML.Add('<enderEmit>');
    XML.Add('<xLgr>');
    XML.Add(wLgrFilial);
    XML.Add('</xLgr>');
    XML.Add('<nro>');
    if QNFE_EmiteNUM_ENDERECO_FILIAL.Text <> '' then
      XML.Add(QNFE_EmiteNUM_ENDERECO_FILIAL.Text)
    else
      XML.Add('SN');
    XML.Add('</nro>');
    if QNFE_EmiteCOMPLEMENTO_FILIAL.Text <> '' then
    begin
      XML.Add('<xCpl>');
      XML.Add(QNFE_EmiteCOMPLEMENTO_FILIAL.Value);
      XML.Add('</xCpl>');
    end;
    XML.Add('<xBairro>');
    XML.Add(QNFE_EmiteBAIRRO_FILIAL.Value);
    XML.Add('</xBairro>');
    XML.Add('<cMun>');
    XML.Add(QNFE_EmiteCOD_UF_IBGE_FILIAL.Text + QNFE_EmiteCOD_CIDADE_IBGE_FILIAL.Text);
    XML.Add('</cMun>');
    XML.Add('<xMun>');
    XML.Add(QNFE_EmiteCIDADE_FILIAL.Value);
    XML.Add('</xMun>');
    XML.Add('<UF>');
    XML.Add(QNFE_EmiteUF_FILIAL.Text);
    XML.Add('</UF>');
    XML.Add('<CEP>');
    XML.Add(LimpaCNPJ(QNFE_EmiteCEP_FILIAL.Text));
    XML.Add('</CEP>');
    XML.Add('<cPais>');
    XML.Add('1058');
    XML.Add('</cPais>');
    XML.Add('<xPais>');
    XML.Add('Brasil');
    XML.Add('</xPais>');
    XML.Add('<fone>');
    XML.Add(RemZeroEsq(LimpaCNPJ(QNFE_EmiteTELEFONE_FILIAL.Text)));
    XML.Add('</fone>');
    XML.Add('</enderEmit>');
    XML.Add('<IE>');
    XML.Add(LimpaCNPJ(QNFE_EmiteINSCRICAO_FILIAL.Value));
    XML.Add('</IE>');
        //XML.Add('<IEST>');
        //XML.Add(QNFE_Emite); <--- Alternativo
        //XML.Add('</IEST>');
        //XML.Add('<IM>');
        //                     <--- Alternativo
        //XML.Add('</IM>');
        //XML.Add('<CNAE>');
        //XML.Add(QNFE_Emite); <--- Alternativo
        //XML.Add('</CNAE>');
    XML.Add('</emit>');
//      XML.Add('<avulsa>');// nao obrigatorio. Somente para uso do fisco
//        XML.Add('<CNPJ>');
//        XML.Add(QNFE_EmiteCGC_FILIAL.Text);
//        XML.Add('</CNPJ>');
//        XML.Add('<xOrgao>');
//        XML.Add(QNFE_EmiteNOME_FILIAL.Text);
//        XML.Add('</xOrgao>');
//        //XML.Add('<matr>');
//                              //matricula do agente
//        //XML.Add('</matr>');
//        //XML.Add('<xAgente>');
//
//        //XML.Add('</xAgente>');
//        XML.Add('<fone>');
//        XML.Add(QNFE_EmiteTELEFONE_FILIAL.Text);
//        XML.Add('</fone>');
//        XML.Add('<UF>');
//        XML.Add(QNFE_EmiteUF_FILIAL.Value);
//        XML.Add('</UF>');
//        //XML.Add('<nDAR>');
//        //documento de arrecadação de receita
//        //XML.Add('</nDAR>');
//        //XML.Add('<dEmi>');
//                      // emissao do DAR
//        //XML.Add('</dEmi>');
//        //XML.Add('<vDAR>');
//          //valor do dar
//        //XML.Add('</vDAR>');
//        //XML.Add('<repEmi>');
//          //reparticao fiscal emitente
//        //XML.Add('</repEmi>');
//        //XML.Add('<dPag>');
//          //data do pagamento do DAR
//        //XML.Add('</dPag>');
//      XML.Add('</avulsa>');
    XML.Add('<dest>'); //destinatário
        //verificar se eh fisica ou juridica...
    if (QNFE_EmiteIND_FISICA_JURIDICA.Value = 'J') then
    begin
      XML.Add('<CNPJ>');
      XML.Add(LimpaCNPJ(QNFE_EmiteNUM_CGC_CPF.Text));
      XML.Add('</CNPJ>');
    end
    else
    begin
      XML.Add('<CPF>');
      XML.Add(LimpaCNPJ(QNFE_EmiteNUM_CGC_CPF.Text));
      XML.Add('</CPF>');
    end;
    XML.Add('<xNome>');
    try
      with DMNfe do
      begin
        if QNfeConfig.IsEmpty then
        begin
          QNfeConfig.Close;
          QNfeConfig.Open;
        end;
        if QNfeConfigIND_COD_CADASTRO_NFE.Value = 'S' then
          XML.Add(Trim(QNFE_EmiteNOME.Value + ' - ' + QNFE_EmiteCOD_CADASTRO.Text))
        else
          XML.Add(Trim(QNFE_EmiteNOME.Value));
      end;
    except
      XML.Add(Trim(QNFE_EmiteNOME.Value));
    end;
    XML.Add('</xNome>');
    XML.Add('<enderDest>');
    XML.Add('<xLgr>');
    XML.Add(wLgr);
    XML.Add('</xLgr>');
    XML.Add('<nro>');
    XML.Add(wNumEndereco); // TB CADASTRO BUSCA PELO CLIENTE DA NOTA
    XML.Add('</nro>');
          //XML.Add('<xCpl>');

          //XML.Add('</xCpl>');
    XML.Add('<xBairro>');
    XML.Add(QNFE_EmiteDESC_BAIRRO.Text);
    XML.Add('</xBairro>');
    XML.Add('<cMun>');
    XML.Add(QNFE_EmiteCOD_UF_IBGE.Text + QNFE_EmiteCOD_CIDADE_IBGE.Text);
    XML.Add('</cMun>');
    XML.Add('<xMun>');
    XML.Add(QNFE_EmiteDESC_CIDADE.Value);
    XML.Add('</xMun>');
    XML.Add('<UF>');
    XML.Add(QNFE_EmiteCOD_ESTADO.Text); // COD ESTADO DO CADASTRO DO CLIENTE
    XML.Add('</UF>');
    if (QNFE_EmiteDESC_CEP.Value <> '') and (QNFE_EmiteDESC_CEP.Value <> '0') then
    begin
      XML.Add('<CEP>');
      XML.Add(LimpaCNPJ(QNFE_EmiteDESC_CEP.Value));
      XML.Add('</CEP>');
    end;
    XML.Add('<cPais>');
    XML.Add(FormatFloat('0000', QNFE_EmiteCOD_PAIS_IBGE.Value));
    XML.Add('</cPais>');
    XML.Add('<xPais>');
    XML.Add(QNFE_EmiteDESC_PAIS.Text);
    XML.Add('</xPais>');
    if ((QNFE_EmiteDESC_TELEFONE.Value <> '') and (QNFE_EmiteIND_OCULTA_FONE_DANFE.Value <> 'S')) then
    begin
      XML.Add('<fone>');
      XML.Add(RemZeroEsq(LimpaCNPJ(QNFE_EmiteDESC_TELEFONE.Value)));
      XML.Add('</fone>');
    end;
    XML.Add('</enderDest>');
    XML.Add('<IE>');
    if (QNFE_EmiteIND_FISICA_JURIDICA.Text = 'J') then
    begin
      XML.Add(LimpaCNPJ(QNFE_EmiteNUM_INSCRICAO.Value)); // NUM INSCRICAO DO CLIENTE (só pessoa juridica)
    end
    else
    begin
      if QNFE_EmiteDESC_INSCRICAO_MUNICIPAL.Value <> '' then
        XML.Add(LimpaCNPJ(QNFE_EmiteDESC_INSCRICAO_MUNICIPAL.Value)); // se cliente tiver inscricao municipal sai na insc estadual
    end;
    XML.Add('</IE>');
    XML.Add('</dest>');
    wContItem := 1;
    QNFE_EmiteIt.First;
    while not QNFE_EmiteIt.Eof do
    begin
      XML.Add('<det nItem="' + IntToStr(wContItem) + '">');
      XML.Add('<prod>');
      XML.Add('<cProd>');
      if (DMParamSistema.QParamSistemaIND_COD_PRODUTO_NFE.Value = 'F') then
        XML.Add(QNFE_EmiteItNUM_FABRICANTE.Text)
      else
        XML.Add(QNFE_EmiteItCOD_PRODUTO.Text);
      XML.Add('</cProd>');
      XML.Add('<cEAN>');
      wAux3 := Length(QNFE_EmiteItNUM_FABRICANTE.Text);
      if (wAux3 = 8) or ((wAux3 >= 12) and (wAux3 <= 14)) then
      try
        StrToInt(QNFE_EmiteItNUM_FABRICANTE.Value); //precisa ser numeros apenas, se nao for vai dar erro aqui e nao vai adicionar. Diego A. Selzlein 20/10/2009
        XML.Add(LimpaCNPJ(QNFE_EmiteItNUM_FABRICANTE.Text)); //conteudo em branco, caso nao houver
      except
      end;
      XML.Add('</cEAN>');
      XML.Add('<xProd>');
      if QNFE_EmiteItNUM_VOLUMES_NOTA.Text <> '' then
        wProd := QNFE_EmiteItDESC_PRODUTO.Value + ' ' + QNFE_EmiteItNUM_VOLUMES_NOTA.Text
      else
        wProd := QNFE_EmiteITDESC_PRODUTO.Value + ' ' + QNFE_EmiteItNUM_CABECAS.Text;
      XML.Add(Trim(wProd));
      XML.Add('</xProd>');

      if QNFE_EmiteItIND_TIPO_PRODUTO.Value <> 'SERVIÇO' then
      begin
        if QNFE_EmiteItNUM_GENERO_NCM.Text <> '' then
        begin
          if Length(QNFE_EmiteItNUM_GENERO_NCM.Text) <> 8 then
            raise Exception.Create('O Genero NCM do produto ' + QNFE_EmiteItCOD_PRODUTO.Text + ' precisa ter 8 digitos.');
          XML.Add('<NCM>');
          XML.Add(QNFE_EmiteItNUM_GENERO_NCM.Text);
          XML.Add('</NCM>');
        end;

        if QNFE_EmiteitCOD_EX_TIPI.Text <> '' then
        begin
          wAux3 := Length(QNFE_EmiteItCOD_EX_TIPI.Text);
          if (wAux3 < 2) or (wAux3 > 3) then
            raise Exception.Create('O código EX-TIPI do produto ' + QNFE_EmiteItCOD_PRODUTO.Text + ' precisa ter 2 ou 3 digitos.');
          XML.Add('<EXTIPI>');
          XML.Add(QNFE_EmiteitCOD_EX_TIPI.Value);
          XML.Add('</EXTIPI>');
        end;

        if QNFE_EmiteItCOD_GENERO_PRODUTO.Text <> '' then
        begin
          wAux3 := Length(QNFE_EmiteItCOD_GENERO_PRODUTO.Text);
          if (wAux3 < 1) or (wAux3 > 2) then
            raise Exception.Create('O genero do produto ' + QNFE_EmiteItCOD_PRODUTO.Text + ' precisa ter 1 ou 2 digitos.');
          XML.Add('<genero>');
          XML.Add(QNFE_EmiteItCOD_GENERO_PRODUTO.Text);
          XML.Add('</genero>');
        end
      end;

      XML.Add('<CFOP>');
      if QNFE_EmiteItCOD_CFOP.Value > 0 then // Dar prioridade a CFOP do item se houver
        XML.Add(QNFE_EmiteItCOD_CFOP.Text)
      else if (QNFE_EmiteUF_FILIAL.Text = QNFE_EmiteCOD_ESTADO.Text) then
        XML.Add(QNFE_EmiteNAT_ESTADUAL_NOVO.Text)
      else
        XML.Add(QNFE_EmiteNAT_INTERESTADUAL_NOVO.Text);
      XML.Add('</CFOP>');
      XML.Add('<uCom>');
      XML.Add(QNFE_EmiteItDESC_UNIDADE.Text);
      XML.Add('</uCom>');
      XML.Add('<qCom>');
      XML.Add(FormatFloat('#0.0000', QNFE_EmiteItQT_QUANTIDADE.Value));
      XML.Add('</qCom>');
      XML.Add('<vUnCom>');
      XML.Add(FormatFloat('#0.0000', {Bib.ift((QNFE_EmiteIND_FINALIDADE_NFE.Value = 2)
        and (QNFE_EmiteItQT_QUANTIDADE.Value = 0),
        0, }QNFE_EmiteItVAL_UNITARIO.Value{)}));
      XML.Add('</vUnCom>');
      XML.Add('<vProd>');
      XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_TOTAL.Value));
      XML.Add('</vProd>');
      XML.Add('<cEANTrib>');
          //em branco, se nao houver
      XML.Add('</cEANTrib>');
      if QNFE_EmiteItDESC_UNIDADE.Value = '' then
        raise Exception.Create('Produto "' + QNFE_EmiteItDESC_PRODUTO.Value +
          '" não possui unidade de medida.');
      XML.Add('<uTrib>');
      XML.Add(QNFE_EmiteItDESC_UNIDADE.Value);
      XML.Add('</uTrib>');
      XML.Add('<qTrib>');
      XML.Add(FormatFloat('#0.0000', QNFE_EmiteItQT_QUANTIDADE.Value));
      XML.Add('</qTrib>');
      XML.Add('<vUnTrib>');
      XML.Add(FormatFloat('#0.0000', QNFE_EmiteItVAL_UNITARIO.Value));
      XML.Add('</vUnTrib>');
      if QNFE_EmiteItVAL_FRETE.Value <> 0 then
      begin
        XML.Add('<vFrete>');
        XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_FRETE.Value));
        XML.Add('</vFrete>');
      end;
//          XML.Add('<vSeg>');
//          XML.Add('</vSeg>');
      if QNFE_EmiteItVAL_DESCONTO.Value <> 0 then
      begin
        XML.Add('<vDesc>');
        XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_DESCONTO.Value));
        XML.Add('</vDesc>');
      end;
      XML.Add('</prod>');
      XML.Add('<imposto>');
      XML.Add('<ICMS>');
      wCst := Copy(QNFE_EmiteItDESC_SITUACAO_TRIB.Text, 2, 2);
      if (wCst = '00') then
      begin
        XML.Add('<ICMS00>');
        XML.Add('<orig>');
        XML.Add(copy(QNFE_EmiteItDESC_SITUACAO_TRIB.Value, 0, 1)); //0-Nacional; 1-Importado direto; 2-Importado, comprado no mercado interno
        XML.Add('</orig>');
        XML.Add('<CST>');
        XML.Add(wCst);
        XML.Add('</CST>');
        XML.Add('<modBC>');
        XML.Add(Bib.ift(QNFE_EmiteIND_FINALIDADE_NFE.Value = 2,
          '3', '0')); //se for nota de complemento (finalidade 2) informar modalidade 3 - Valor da Operacao.
        XML.Add('</modBC>');
        XML.Add('<vBC>');
        XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_ICM_BASE.Value));
        XML.Add('</vBC>');
        XML.Add('<pICMS>');
        if QNFE_EmiteItPERC_TRIBUTADO_NOTA.Text <> '' then//usado para aliquota reduzida Marcos 08/02/2011
          XML.Add(FormatFloat('#0.00',QNFE_EmiteItPERC_TRIBUTADO_NOTA.Value))
        else
          XML.Add(FormatFloat('#0.00',QNFE_EmiteItPERC_ALIQUOTA.Value));
        XML.Add('</pICMS>');
        XML.Add('<vICMS>');
        XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_ICM.Value));
        XML.Add('</vICMS>');
        XML.Add('</ICMS00>');
      end
      else if (wCst = '10') then
      begin
        XML.Add('<ICMS10>');
        XML.Add('<orig>');
        XML.Add(copy(QNFE_EmiteItDESC_SITUACAO_TRIB.Value, 0, 1)); //0-Nacional; 1-Importado direto; 2-Importado, comprado no mercado interno
        XML.Add('</orig>');
        XML.Add('<CST>');
        XML.Add(wCst);
        XML.Add('</CST>');
        XML.Add('<modBC>');
        XML.Add(Bib.ift(QNFE_EmiteIND_FINALIDADE_NFE.Value = 2,
          '3', '0')); //se for nota de complemento (finalidade 2) informar modalidade 3 - Valor da Operacao.
        XML.Add('</modBC>');
        XML.Add('<vBC>');
        XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_ICM_BASE.Value));
        XML.Add('</vBC>');
        XML.Add('<pICMS>');
        if QNFE_EmiteItPERC_TRIBUTADO_NOTA.Text <> '' then//usado para aliquota reduzida Marcos 08/02/2011
          XML.Add(FormatFloat('#0.00',QNFE_EmiteItPERC_TRIBUTADO_NOTA.Value))
        else
          XML.Add(FormatFloat('#0.00',QNFE_EmiteItPERC_ALIQUOTA.Value));
        XML.Add('</pICMS>');
        XML.Add('<vICMS>');
        XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_ICM.Value));
        XML.Add('</vICMS>');
        XML.Add('<modBCST>');
        XML.Add('0'); //valor agregado (%)
        XML.Add('</modBCST>');
                //XML.Add('<pMVAST>');
                //percentual do modBCST
                //XML.Add('</pMVAST>');
                //XML.Add('<pRedBCST>');
                //XML.Add('</pRedBCST>');
        XML.Add('<vBCST>');
        XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_BASE_SUBST.Value));
        XML.Add('</vBCST>');
        XML.Add('<pICMSST>');
                //Aliquota do imposto do ICMS ST
        XML.Add(DMOracle.BuscaNome('SELECT PERC_ALIQ_SUBST FROM TB_ESTADO', 'COD_ESTADO = ' + chr(39) + QNFE_EmiteCOD_ESTADO.Text + chr(39)));
        XML.Add('</pICMSST>');
        XML.Add('<vICMSST>');
                //valor do ICMS ST retido
        XML.Add(formatFloat('#0.00', QNFE_EmiteItVAL_ICMS_SUBST.Value));
        XML.Add('</vICMSST>');
        XML.Add('</ICMS10>');
      end
      else if (wCst = '20') then
      begin
        XML.Add('<ICMS20>');
        XML.Add('<orig>');
        XML.Add(copy(QNFE_EmiteItDESC_SITUACAO_TRIB.Value, 0, 1)); //0-Nacional; 1-Importado direto; 2-Importado, comprado no mercado interno
        XML.Add('</orig>');
        XML.Add('<CST>');
        XML.Add(wCst);
        XML.Add('</CST>');
        XML.Add('<modBC>');
        XML.Add(Bib.ift(QNFE_EmiteIND_FINALIDADE_NFE.Value = 2,
          '3', '0')); //se for nota de complemento (finalidade 2) informar modalidade 3 - Valor da Operacao.
        XML.Add('</modBC>');
        XML.Add('<pRedBC>');
        XML.Add(FloatToStr(100 - QNFE_EmiteItPERC_ALIQUOTA.Value)); //100 - valor da tabela de tributacao
        XML.Add('</pRedBC>');
        XML.Add('<vBC>');
        XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_ICM_BASE.Value));
        XML.Add('</vBC>');
        XML.Add('<pICMS>');
        if QNFE_EmiteItPERC_TRIBUTADO_NOTA.Text <> '' then//usado para aliquota reduzida Marcos 08/02/2011
          XML.Add(FormatFloat('#0.00',QNFE_EmiteItPERC_TRIBUTADO_NOTA.Value))
        else
          XML.Add(FormatFloat('#0.00',QNFE_EmiteItPERC_ALIQUOTA.Value));
        XML.Add('</pICMS>');
        XML.Add('<vICMS>');
        XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_ICM.Value));
        XML.Add('</vICMS>');
        XML.Add('</ICMS20>');
      end
      else if (wCst = '30') then
      begin
        XML.Add('<ICMS30>');
        XML.Add('<orig>');
        XML.Add(copy(QNFE_EmiteItDESC_SITUACAO_TRIB.Value, 0, 1)); //0-Nacional; 1-Importado direto; 2-Importado, comprado no mercado interno
        XML.Add('</orig>');
        XML.Add('<CST>');
        XML.Add(wCst);
        XML.Add('</CST>');
        XML.Add('<modBCST>');
        XML.Add('4');
        XML.Add('</modBCST>');
  //              XML.Add('<pMVAST>');
  //              XML.Add('0');
  //              XML.Add('</pMVAST>');
  //              XML.Add('<pRedBCST>');
  //              XML.Add('0');
  //              XML.Add('</pRedBCST>');
        XML.Add('<vBCST>');
        XML.Add('0');
        XML.Add('</vBCST>');
        XML.Add('<pICMSST>');
        XML.Add('0');
        XML.Add('</pICMSST>');
        XML.Add('<vICMSST>');
        XML.Add('0');
        XML.Add('</vICMSST>');
        XML.Add('</ICMS30>');
      end
      else if (wCst = '40') or
        (wCst = '41') or
        (wCst = '50') then
      begin
        XML.Add('<ICMS40>');
        XML.Add('<orig>');
        XML.Add(copy(QNFE_EmiteItDESC_SITUACAO_TRIB.Value, 0, 1)); //0-Nacional; 1-Importado direto; 2-Importado, comprado no mercado interno
        XML.Add('</orig>');
        XML.Add('<CST>');
        XML.Add(wCst);
        XML.Add('</CST>');
        XML.Add('</ICMS40>');
      end
      else if (wCst = '51') then
      begin
        XML.Add('<ICMS51>');
        XML.Add('<orig>');
        XML.Add(copy(QNFE_EmiteItDESC_SITUACAO_TRIB.Value, 0, 1)); //0-Nacional; 1-Importado direto; 2-Importado, comprado no mercado interno
        XML.Add('</orig>');
        XML.Add('<CST>');
        XML.Add(wCst);
        XML.Add('</CST>');
        XML.Add('<modBC>');
        XML.Add(Bib.ift(QNFE_EmiteIND_FINALIDADE_NFE.Value = 2,
          '3', '0')); //se for nota de complemento (finalidade 2) informar modalidade 3 - Valor da Operacao.
        XML.Add('</modBC>');
        XML.Add('<pRedBC>');
        XML.Add('0');
        XML.Add('</pRedBC>');
        If ((DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'BISSOLOTTI') or
           (DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'ZORZINCO'))Then
        Begin
          XML.Add('<vBC>');
          XML.Add(FormatFloat('#0.00',QNFE_EmiteItVAL_ICM_BASE.Value));
          XML.Add('</vBC>');
          XML.Add('<pICMS>');
          if QNFE_EmiteItPERC_TRIBUTADO_NOTA.Text <> '' then//ALTERADO PARA BISSOLOTI usado para aliquota reduzida Marcos 10/02/2011
            XML.Add(FormatFloat('#0.00',QNFE_EmiteItPERC_TRIBUTADO_NOTA.Value))
          else
            XML.Add(FormatFloat('#0.00',QNFE_EmiteItPERC_ALIQUOTA.Value));
          XML.Add('</pICMS>');
          XML.Add('<vICMS>');
          XML.Add(FormatFloat('#0.00',QNFE_EmiteItVAL_ICM.Value));
          XML.Add('</vICMS>');
        end
        else
        begin
          XML.Add('<vBC>');
          XML.Add('0');
          XML.Add('</vBC>');
          XML.Add('<pICMS>');
          XML.Add('0');
          XML.Add('</pICMS>');
          XML.Add('<vICMS>');
          XML.Add('0');
          XML.Add('</vICMS>');
        end;
        XML.Add('</ICMS51>');
      end
      else if (wCst = '60') then
      begin
        XML.Add('<ICMS60>');
        XML.Add('<orig>');
        XML.Add('0'); //Mercadoria nacional
        XML.Add('</orig>');
        XML.Add('<CST>');
        XML.Add(wCst);
        XML.Add('</CST>');
        XML.Add('<vBCST>');
        XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_BASE_SUBST.Value));
        XML.Add('</vBCST>');
        XML.Add('<vICMSST>');
                //valor do ICMS ST retido
        XML.Add(formatFloat('#0.00', QNFE_EmiteItVAL_ICMS_SUBST.Value));
        XML.Add('</vICMSST>');
        XML.Add('</ICMS60>');
      end;
//            XML.Add('<ICMS70>');
//              XML.Add('<orig>');
//              XML.Add('0'); //Mercadoria nacional
//              XML.Add('</orig>');
//              XML.Add('<CST>');
//              XML.Add(wCst);
//              XML.Add('</CST>');
//              XML.Add('<modBC>');
//              XML.Add('0');
//              XML.Add('</modBC>');
//              XML.Add('<pRedBC>');
//              XML.Add('</pRedBC>');
//              XML.Add('<vBC>');
//              XML.Add('</vBC>');
//              XML.Add('<pICMS>');
//              XML.Add('</pICMS>');
//              XML.Add('<vICMS>');
//              XML.Add('</vICMS>');
//              XML.Add('<modBCST>');
//              XML.Add('</modBCST>');
//              XML.Add('<pMVAST>');
//              XML.Add('</pMVAST>');
//              XML.Add('<pRedBCST>');
//              XML.Add('</pRedBCST>');
//              XML.Add('<vBCST>');
//              XML.Add('</vBCST>');
//              XML.Add('<pICMSST>');
//              XML.Add('</pICMSST>');
//              XML.Add('<vICMSST>');
//              XML.Add('</vICMSST>');
{//            XML.Add('</ICMS70>');}
        if (wCst = '90') then
        begin
          XML.Add('<ICMS90>');
          XML.Add('<orig>');
          XML.Add(copy(QNFE_EmiteItDESC_SITUACAO_TRIB.Value, 0, 1)); //0-Nacional; 1-Importado direto; 2-Importado, comprado no mercado interno
          XML.Add('</orig>');
          XML.Add('<CST>');
          XML.Add(wCst);
          XML.Add('</CST>');
          XML.Add('<modBC>');
          XML.Add(Bib.ift(QNFE_EmiteIND_FINALIDADE_NFE.Value = 2,
            '3', '0')); //se for nota de complemento (finalidade 2) informar modalidade 3 - Valor da Operacao.
          XML.Add('</modBC>');
          XML.Add('<vBC>');
          XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_ICM_BASE.Value));
          XML.Add('</vBC>');
          XML.Add('<pRedBC>');
          XML.Add(FloatToStr(100 - QNFE_EmiteItPERC_ALIQUOTA.Value));
          XML.Add('</pRedBC>');
          XML.Add('<pICMS>');
          if QNFE_EmiteItPERC_TRIBUTADO_NOTA.Text <> '' then//usado para aliquota reduzida Marcos 08/02/2011
            XML.Add(FormatFloat('#0.00',QNFE_EmiteItPERC_TRIBUTADO_NOTA.Value))
          else
            XML.Add(FormatFloat('#0.00',QNFE_EmiteItPERC_ALIQUOTA.Value));
          XML.Add('</pICMS>');
          XML.Add('<vICMS>');
          XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_ICM.Value));
          XML.Add('</vICMS>');
          XML.Add('<modBCST>');
          XML.Add('0');
          XML.Add('</modBCST>');
//          XML.Add('<pMVAST>');
//          XML.Add('0');
//          XML.Add('</pMVAST>');
//          XML.Add('<pRedBCST>');
//          XML.Add('0');
//          XML.Add('</pRedBCST>');
          XML.Add('<vBCST>');
          XML.Add('0');
          XML.Add('</vBCST>');
          XML.Add('<pICMSST>');
          XML.Add('0');
          XML.Add('</pICMSST>');
          XML.Add('<vICMSST>');
          XML.Add('0');
          XML.Add('</vICMSST>');
          XML.Add('</ICMS90>');
        end;
      XML.Add('</ICMS>');

          // Tag IPI
      if QNFE_EmiteItVAL_IPI.Value > 0 then
      begin
        XML.Add('<IPI>');
//            XML.Add('<clEnq>');  //Segundo o manual, apenas para bebidas e cigarros
//            XML.Add('</clEnq>');
        if (UpperCase(DMNfe.LimpaStrXML(QNFE_EmiteDESC_PAIS.Value)) <> 'BRASIL') and
          (not QNFE_EmiteItCOD_CADASTRO.IsNull) then
        begin
          wAux2 := DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO',
            'COD_CADASTRO = ' + QNFE_EmiteItCOD_CADASTRO.Text);
          XML.Add('<CNPJProd>');
          XML.Add(LimpaCNPJ(wAux2));
          XML.Add('</CNPJProd>');
        end;
//            XML.Add('<cSelo>');
//            XML.Add(QNFE_EmiteItNUM_FABRICANTE.Value); // CONFIRMAR
//            XML.Add('</cSelo>');
//            XML.Add('<qSelo>');
//            XML.Add('</qSelo>');
        XML.Add('<cEnq>');
        XML.Add('999');
        XML.Add('</cEnq>');
//            if (QNFE_EmiteItDESC_SITUACAO_TRIB.Text = '000') or
//               (QNFE_EmiteItDESC_SITUACAO_TRIB.Text = '049') or
//               (QNFE_EmiteItDESC_SITUACAO_TRIB.Text = '050') or
//               (QNFE_EmiteItDESC_SITUACAO_TRIB.Text = '099') then
//            begin
        XML.Add('<IPITrib>'); //analisar campo cst
        XML.Add('<CST>');
//              00-Entrada com recuperação de crédito
//              49-Outras entradas
//              50-Saída tributada
//              99-Outras saídas
        if QNFE_EmiteIND_ENTRADA_SAIDA.Value = 'S' then
          XML.Add('50')
        else
          XML.Add('00');
        XML.Add('</CST>');
        XML.Add('<vBC>');
        XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_TOTAL.Value)); //Levando base de calculo do IPI sendo de 100%
        XML.Add('</vBC>');
              {
              XML.Add('<qUnid>');
              XML.Add('</qUnid>');
              XML.Add('<vUnid>');    SOMENTE SE FOR CALCULADO O IPI POR VLR UNIDADE
              XML.Add('</vUnid>');
              }
        XML.Add('<pIPI>');
        XML.Add(FormatFloat('#0.00', QNFE_EmiteItPERC_IPI.Value));
        XML.Add('</pIPI>');
        XML.Add('<vIPI>');
        XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_IPI.Value));
        XML.Add('</vIPI>');
        XML.Add('</IPITrib>');
        XML.Add('</IPI>');
      end
      else
      Begin
        XML.Add('<IPI>');

        XML.Add('<cEnq>');
        XML.Add('999');
        XML.Add('</cEnq>');

        XML.Add('<IPITrib>'); //analisar campo cst
        XML.Add('<CST>');

        if QNFE_EmiteIND_ENTRADA_SAIDA.Value = 'S' then
          XML.Add('50')
        else
          XML.Add('00');
        XML.Add('</CST>');
        XML.Add('<vBC>');
        XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_TOTAL.Value)); //Levando base de calculo do IPI sendo de 100%
        XML.Add('</vBC>');

        XML.Add('<pIPI>');
        XML.Add(FormatFloat('#0.00', QNFE_EmiteItPERC_IPI.Value));
        XML.Add('</pIPI>');
        XML.Add('<vIPI>');
        XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_IPI.Value));
        XML.Add('</vIPI>');
        XML.Add('</IPITrib>');  
        XML.Add('</IPI>');
      end;
      XML.Add('<PIS>');
            // Apenas uma das tags será informada, de acordo com o CST
      XML.Add('<PISAliq>');
      XML.Add('<CST>');
      XML.Add('01');
      XML.Add('</CST>');
      XML.Add('<vBC>');
      XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_TOTAL.Value));
      XML.Add('</vBC>');
      XML.Add('<pPIS>');
      XML.Add(QNFE_EmiteItPERC_PIS.Text);
      XML.Add('</pPIS>');
      XML.Add('<vPIS>');
      if QNFE_EmiteItVAL_PIS.Text = '' then
        XML.Add('0')
      else
        XML.Add(FormatFloat('#0.00',QNFE_EmiteItVAL_PIS.Value));
      XML.Add('</vPIS>');
      XML.Add('</PISAliq>');
      XML.Add('</PIS>');
      XML.Add('<COFINS>');
            //informar apenas 1 das tags, de acordo com cst.
      XML.Add('<COFINSAliq>');
      XML.Add('<CST>');
      XML.Add('01');
      XML.Add('</CST>');
      XML.Add('<vBC>');
      XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_TOTAL.Value));
      XML.Add('</vBC>');
      XML.Add('<pCOFINS>');
      XML.Add(FormatFloat('####0.00', QNFE_EmiteItPERC_COFINS.Value));
      XML.Add('</pCOFINS>');
      XML.Add('<vCOFINS>');
      if QNFE_EmiteItVAL_CONFINS.Text = '' then
        XML.Add('0')
      else
        XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_CONFINS.Value));
      XML.Add('</vCOFINS>');
      XML.Add('</COFINSAliq>');
      XML.Add('</COFINS>');
      if QNFE_EmiteItIND_TIPO_PRODUTO.Value = 'SERVIÇO' then
      begin
        XML.Add('<ISSQN>'); // para prestacao de SERVICOS sujeitos ao ISSQN e fornecimento de pecas sujeitas a ICMS
        XML.Add('<vBC>');
        XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_TOTAL.Value));
        XML.Add('</vBC>');
        XML.Add('<vAliq>');
        XML.Add(QNFE_EmiteItPERC_ISS.Text);
        XML.Add('</vAliq>');
        XML.Add('<vISSQN>');
        XML.Add(FloatToStr(QNFE_EmiteItVAL_ISS.Value));
        XML.Add('</vISSQN>');
        XML.Add('<cMunFG>');
        XML.Add(QNFE_EmiteCOD_UF_IBGE_FILIAL.Text + QNFE_EmiteCOD_CIDADE_IBGE_FILIAL.Text);
        XML.Add('</cMunFG>');
        XML.Add('<cListServ>');
        XML.Add(QNFE_EmiteItCOD_LISTA_SERVICO.Text);
        XML.Add('</cListServ>');
        XML.Add('</ISSQN>');
      end;
      XML.Add('</imposto>');
      if not QNFE_EmiteItDESC_INF_ADICIONAL.IsNull then
      begin
        wInfAdProd := StringReplace(QNFE_EmiteItDESC_INF_ADICIONAL.Value, #$D + #$A, '\n', [rfReplaceAll]);
        wInfAdProd := StringReplace(wInfAdProd, #$A, '\n', [rfReplaceAll]);
        XML.Add('<infAdProd>');
        XML.Add(wInfAdProd);
        XML.Add('</infAdProd>');
      end;
      wRetornavel := (wRetornavel) or (QNFE_EmiteItIND_RETORNAVEL.Value = 'SIM'); //Se houver ao menos 1 produto retornavel, já vai adicionar informações de devolução de embalagens vazias.
      XML.Add('</det>');
      Inc(wContItem);
      if wEmpresa = 'ABATE' then
      begin
        wPeso := wPeso + QNFE_EmiteItQT_QUANTIDADE.Value;
        wPesoBruto := wPesoBruto + (QNFE_EmiteItNUM_VOLUMES_NOTA.Value * QNFE_EmiteItNum_Embalagem.Value) + QNFE_EmiteItQT_QUANTIDADE.Value;
        wVolumes := wVolumes + QNFE_EmiteItNUM_VOLUMES_NOTA.Value; //para abatedouro a quantidade transp é a soma dos volumes dos intens informado na nota
      end
      else
      begin
        wVolumes := wVolumes + QNFE_EmiteItNUM_METROS_CUBICOS.Value * QNFE_EmiteItQT_QUANTIDADE.Value;
        Calc_Peso_Nota;
      end;
      if (QNFE_EmiteItCOD_TRIBUTACAO.Text <> '') and (not Bib.ComparaIntegerArray(QNFE_EmiteItCOD_TRIBUTACAO.Value, wTribs)) then
      begin
        SetLength(wTribs, Length(wTribs) + 1);
        wTribs[Length(wTribs) - 1] := QNFE_EmiteItCOD_TRIBUTACAO.Value;
        wAux2 := QNFE_EmiteItDESC_OBSERVACAO_TR.Value;
        wObsTrib := wObsTrib + wAux2 + ' ';
      end;
      QNFE_EmiteIt.Next;
    end;
    XML.Add('<total>');
    XML.Add('<ICMSTot>');
    XML.Add('<vBC>');
    XML.Add(FormatFloat('#0.00', wbase_icm_tributada));
    XML.Add('</vBC>');
    XML.Add('<vICMS>');
    XML.Add(FormatFloat('#0.00', wvlr_icm));
    XML.Add('</vICMS>');
    XML.Add('<vBCST>');
    XML.Add(FormatFloat('#0.00', wBaseIcmSubst));
    XML.Add('</vBCST>');
    XML.Add('<vST>');
    XML.Add(formatFloat('#0.00', wVlrIcmSubst));
    XML.Add('</vST>');
    XML.Add('<vProd>');
    XML.Add(FormatFloat('#0.00', wtotal_produtos));
    XML.Add('</vProd>');
    XML.Add('<vFrete>');
    XML.Add(FormatFloat('#0.00', wvlr_frete));
    XML.Add('</vFrete>');
    XML.Add('<vSeg>');
    XML.Add('0');
    XML.Add('</vSeg>');
    XML.Add('<vDesc>');
    XML.Add(FormatFloat('#0.00', wvlr_desconto));
    XML.Add('</vDesc>');
    XML.Add('<vII>');
    XML.Add('0');
    XML.Add('</vII>');
    XML.Add('<vIPI>');
    XML.Add(FormatFloat('#0.00', wvlr_ipi));
    XML.Add('</vIPI>');
    XML.Add('<vPIS>');
    XML.Add(FormatFloat('#0.00', wvlr_pis));
    XML.Add('</vPIS>');
    XML.Add('<vCOFINS>');
    XML.Add(FormatFloat('#0.00', wvlr_cofins));
    XML.Add('</vCOFINS>');
    XML.Add('<vOutro>');
    XML.Add(FormatFloat('#0.00', wvlr_despesa));
    XML.Add('</vOutro>');
    XML.Add('<vNF>');
    XML.Add(FormatFloat('#0.00', wvlr_total_nota));
    XML.Add('</vNF>');
    XML.Add('</ICMSTot>');
    XML.Add('<ISSQNtot>');
    if wvlr_servico <> 0 then
    begin
      XML.Add('<vServ>');
      XML.Add(FormatFloat('#0.00', wvlr_servico));
      XML.Add('</vServ>');
      XML.Add('<vBC>');
      XML.Add(FormatFloat('#0.00', wvlr_servico));
      XML.Add('</vBC>');
    end;
    if wvlr_iss <> 0 then
    begin
      XML.Add('<vISS>');
      XML.Add(FormatFloat('#0.00', wvlr_iss));
      XML.Add('</vISS>');
    end;
          {XML.Add('<vPIS>');
          XML.Add();
          XML.Add('</vPIS>');
          XML.Add('<vCOFINS>');
          XML.Add();
          XML.Add('</vCOFINS>');}
    XML.Add('</ISSQNtot>');
        {XML.Add('<retTrib>');
          XML.Add('<vRetPIS>');
          XML.Add('</vRetPIS>');
          XML.Add('<vRetCOFINS>');
          XML.Add('</vRetCOFINS>');
          XML.Add('<vRetCSLL>');
          XML.Add('</vRetCSLL>');
          XML.Add('<vBCIRRF>');
          XML.Add('</vBCIRRF>');
          XML.Add('<vIRRF>');
          XML.Add('</vIRRF>');
          XML.Add('<vBCRetPrev>');
          XML.Add('</vBCRetPrev>');
          XML.Add('<vRetPrev>');
          XML.Add('</vRetPrev>');
        XML.Add('</retTrib>');}
    XML.Add('</total>');
    XML.Add('<transp>');
    XML.Add('<modFrete>');
    if QNFE_EmiteIND_TIPO_FRETE.Text = 'FOB' then
      XML.Add('1') //destinatario
    else
      XML.Add('0'); //emitente
    XML.Add('</modFrete>');
    if (QNFE_Emitenome_transp.Value <> '') then
    begin
      XML.Add('<transporta>');
      if QNFE_EmiteCOD_TRANSPORTADOR.Text <> '' then
      begin
        if not QNFE_Emitecgc_transp.IsNull then
        begin
          wFisicaJuridica := DMOracle.BuscaNome('SELECT IND_FISICA_JURIDICA FROM TB_CADASTRO', 'COD_CADASTRO = ' + QNFE_EmiteCOD_TRANSPORTADOR.Text);
          if wFisicaJuridica = 'J' then
          begin
            XML.Add('<CNPJ>');
            XML.Add(LimpaCNPJ(QNFE_Emitecgc_transp.Text));
            XML.Add('</CNPJ>');
          end
          else
          begin
            XML.Add('<CPF>');
            XML.Add(LimpaCNPJ(QNFE_Emitecgc_transp.Text));
            XML.Add('</CPF>');
          end;
        end;
      end;
      if not QNFE_Emitenome_transp.IsNull then
      begin
        XML.Add('<xNome>');
        XML.Add(Trim(QNFE_Emitenome_transp.Value));
        XML.Add('</xNome>');
      end;
      if QNFE_Emiteinsc_transp.Value <> '' then
      begin
        XML.Add('<IE>');
        XML.Add(LimpaCNPJ(QNFE_Emiteinsc_transp.Value));
        XML.Add('</IE>');
      end;
      if QNFE_Emiteend_transp.Value <> '' then
      begin
        XML.Add('<xEnder>');
        XML.Add(QNFE_Emiteend_transp.Value);
        XML.Add('</xEnder>');
      end;
      if QNFE_Emitecidade_transp.Value <> '' then
      begin
        XML.Add('<xMun>');
        XML.Add(QNFE_Emitecidade_transp.Value);
        XML.Add('</xMun>');
      end;
      if QNFE_Emiteuf_transp.Value <> '' then
      begin
        XML.Add('<UF>');
        XML.Add(QNFE_Emiteuf_transp.Value);
        XML.Add('</UF>');
      end;
      XML.Add('</transporta>');
    end;
        {XML.Add('<retTransp>');
          XML.Add('<vServ>');
          XML.Add('</vServ>');
          XML.Add('<vBCRet>');
          XML.Add('</vBCRet>');
          XML.Add('<pICMSRet>');
          XML.Add('</pICMSRet>');
          XML.Add('<vICMSRet>');
          XML.Add('</vICMSRet>');
          XML.Add('<CFOP>');
          XML.Add('</CFOP>');
          XML.Add('<cMunFG>');
          XML.Add('</cMunFG>');
        XML.Add('</retTransp>'); }
    if (QNFE_EmiteDESC_PLACA.Value <> '') then
    begin
      XML.Add('<veicTransp>');
      XML.Add('<placa>');
      XML.Add(UpperCase(QNFE_EmiteDESC_PLACA.Value));
      XML.Add('</placa>');
      XML.Add('<UF>');
      XML.Add(QNFE_Emiteuf_transp.Text);
      XML.Add('</UF>');
            {XML.Add('<RNTC>');

            XML.Add('</RNTC>');}
      XML.Add('</veicTransp>');
    end;
        {XML.Add('<reboque>');
          XML.Add('<placa>');
          XML.Add('</placa>');
          XML.Add('<UF>');
          XML.Add('</UF>');
          XML.Add('<RNTC>');
          XML.Add('</RNTC>');
        XML.Add('</reboque>');}
    XML.Add('<vol>');
    if not QNFE_EmiteNUM_VOLUMES.IsNull then
      wVolumes := QNFE_EmiteNUM_VOLUMES.Value; //Alterado para imprimir os volumes para todos. //Imprimir o numero de volumes informado na Nota. Issac, Inside. Diego A. S. 09/11/2009.
    if (DMParamSistema.CodEmpresa <> 'VETRO') and (DMParamSistema.CodEmpresa <> 'TEMPER')
        and (wVolumes > 0) then
    begin
      XML.Add('<qVol>');
      XML.Add(FormatFloat('000000000000000', wVolumes));
      XML.Add('</qVol>');
    end;
    if (DMNotaSaida.QNFE_EmiteDESC_ESPECIE.Text <> '') then
    begin
      XML.Add('<esp>');
      XML.Add(copy(DMNotaSaida.QNFE_EmiteDESC_ESPECIE.Text, 1, 60));
      XML.Add('</esp>');
    end;
    if DMNotaSaida.QNFE_EmiteDESC_MARCA.Text <> '' then
    begin
      XML.Add('<marca>');
      XML.Add(copy(DMNotaSaida.QNFE_EmiteDESC_MARCA.Text, 1, 60));
      XML.Add('</marca>');
    end;
    XML.Add('<pesoL>');
    if (wEmpresa = 'INSIDE') or (wEmpresa = 'GRASMIL') then
      XML.Add('0.000')
    else
      XML.Add(formatFloat('#0.000', wPeso));
    XML.Add('</pesoL>');
    XML.Add('<pesoB>');
    if wEmpresa = 'INSIDE' then
      XML.Add('0.000')
    else
      XML.Add(formatFloat('#0.000', wPesoBruto));
    XML.Add('</pesoB>');
          {
          XML.Add('<lacres>');
            XML.Add('<nLacre>');
            XML.Add('</nLacre>');
          XML.Add('</lacres>');
          }
    XML.Add('</vol>');
    XML.Add('</transp>');
    XML.Add('<cobr>');
    XML.Add('<fat>');
    XML.Add('<nFat>');
    XML.Add(QNFE_EmiteNUM_NOTA.Text);
    XML.Add('</nFat>');
    if wvlr_total_nota + wvlr_desconto > 0 then
    begin
      XML.Add('<vOrig>');
      XML.Add(FormatFloat('#0.00', wvlr_total_nota + wvlr_desconto)); //adicionado + wvlr_desconto 22/08/2009 por Diego A S.
      XML.Add('</vOrig>');
    end;
    if wvlr_desconto <> 0 then
    begin
      XML.Add('<vDesc>');
      XML.Add(FormatFloat('#0.00', wvlr_desconto));
      XML.Add('</vDesc>');
    end;
    if wvlr_total_nota > 0 then
    begin
      XML.Add('<vLiq>');
      XML.Add(FormatFloat('#0.00', wvlr_total_nota));
      XML.Add('</vLiq>');
    end;
    XML.Add('</fat>');
    if QNFE_EmiteIND_ENTRADA_SAIDA.Value = 'S' then
    begin
      if QNotaSaidaCOD_NOTA_CAB.Value <> QNFE_EmiteCOD_NOTA_CAB.Value then
      begin
        QNotaSaida.Close;
        QNotaSaida.SetVariable('PK', QNFE_EmiteCOD_NOTA_CAB.Value);
        QNotaSaida.Open;
      end;
      QContaReceber.Close;
      QContaReceber.open;
      QContaReceber.First;
      while not QContaReceber.Eof do
      begin
        XML.Add('<dup>');
        XML.Add('<nDup>');
        XML.Add(QContaReceberNUM_PARCELA.Text);
        XML.Add('</nDup>');
        XML.Add('<dVenc>');
        XML.Add(FormatDateTime('yyyy-MM-dd', QContaReceberDT_VENCIMENTO.Value));
        XML.Add('</dVenc>');
        XML.Add('<vDup>');
        XML.Add(FormatFloat('#0.00', QContaReceberVAL_ORIGINAL.Value));
        XML.Add('</vDup>');
        XML.Add('</dup>');
        QContaReceber.Next;
      end;
    end
    else
    begin
          //nota de entrada
      DMNotaEntrada.QContaPagar.Close;
      DMNotaEntrada.QContaPagar.SetVariable('COD_NOTA_CAB', QNFE_EmiteCOD_NOTA_CAB.Value);
      DMNotaEntrada.QContaPagar.open;
      DMNotaEntrada.QContaPagar.First;
      while not DMNotaEntrada.QContaPagar.Eof do
      begin
        XML.Add('<dup>');
        XML.Add('<nDup>');
        XML.Add(DMNotaEntrada.QContaPagarNUM_PARCELA.Text);
        XML.Add('</nDup>');
        XML.Add('<dVenc>');
        XML.Add(FormatDateTime('yyyy-MM-dd', DMNotaEntrada.QContaPagarDT_VENCIMENTO.Value));
        XML.Add('</dVenc>');
        XML.Add('<vDup>');
        XML.Add(FormatFloat('#0.00', DMNotaEntrada.QContaPagarVAL_ORIGINAL.Value));
        XML.Add('</vDup>');
        XML.Add('</dup>');
        DMNotaEntrada.QContaPagar.Next;
      end;
    end;
    XML.Add('</cobr>');

    wInfComplemento := '';
    if (QNFE_EmiteVAL_FUNRURAL.Value > 0) then
      wInfComplemento := 'Funrural: ' + Trim(QNFE_EmiteVAL_FUNRURAL.Text) + '\n';
    if (QNFE_EmiteOBS.Text <> '') then
      wInfComplemento := wInfComplemento + Trim(QNFE_EmiteOBS.Text) + '\n';
    if (QNFE_EmiteOBS_COMPLEMENTO.Text <> '') then
      wInfComplemento := wInfComplemento + Trim(QNFE_EmiteOBS_COMPLEMENTO.Text) + '\n';
    if (QNFE_EmiteDESC_OBS_CORPO_NOTA.Text <> '') then
      wInfComplemento := wInfComplemento + Trim(QNFE_EmiteDESC_OBS_CORPO_NOTA.Text) + '\n';
    if (QNFE_EmiteNOME_VENDEDOR.Text <> '') then
      wInfComplemento := wInfComplemento + 'Vendedor: ' + DMNfe.LimpaStrXML(QNFE_EmiteNOME_VENDEDOR.Text) + '\n';
    if QNFE_EmiteCOD_NOTA_CAB_DEV_FIXAR.Text <> '' then // Acrescentado dia 18/12/2008 por Diego A. S.
      wInfComplemento := wInfComplemento + 'Devolucao ref nota fiscal: ' + Trim(DMOracle.BuscaNome('Select NUM_NOTA from Tb_Nota_Cab', 'Cod_Nota_Cab=' + QNFE_EmiteCOD_NOTA_CAB_DEV_FIXAR.Text)) + '\n';
    if QNFE_EmiteVAL_SENAR.Value > 0 then
      wInfComplemento := wInfComplemento + 'Senar: ' + trim(QNFE_EmiteVAL_SENAR.Text) + '\n';
    wObsTrib := Trim(wObsTrib);
    if (wObsTrib <> '') then
      wInfComplemento := wInfComplemento + 'Obs. das tributacoes: ' + wObsTrib + '\n';
    wInfComplemento := Trim(StringReplace(wInfComplemento, chr(13), ' ', [rfReplaceAll]));

      //colocar nome fantasia nas informaçoes adicionais a pedido do Joao Moinho - Marlon 08/2009
    if (wEmpresa = 'MOINHO') and (QNFE_EmiteDESC_FANTASIA.Text <> '') then
    begin
        wInfComplemento := wInfComplemento + 'Fantasia: ' + trim(QNFE_EmiteDESC_FANTASIA.Text) + '\n';
    end;

    if QNFE_EmiteItVAL_DPI_TRANSGENICOS.Value > 0 then
      wInfComplemento := wInfComplemento + 'Desconto DPI: ' + Trim(QNFE_EmiteItVAL_DPI_TRANSGENICOS.Text) + '\n';

    if (not QNFE_EmiteCOD_MENSAGEM.IsNull) then
      with DMMensagem do
      begin
        QMensagem.Close;
        QMensagem.SetVariable('PK', QNFE_EmiteCOD_MENSAGEM.Value);
        QMensagem.Open;

        wInfComplemento := Trim(wInfComplemento + ' ' +
          QMensagemDESC_MENSAGEM.Value + ' ' +
          QMensagemDESC_COMPLEMENTO.Value + ' ' +
          QMensagemDESC_COMPLEMENTO1.Value + ' ' +
          QMensagemDESC_COMPLEMENTO2.Value + ' ' +
          QMensagemDESC_COMPLEMENTO3.Value + ' ' +
          QMensagemDESC_COMPLEMENTO4.Value + ' ' +
          QMensagemDESC_COMPLEMENTO5.Value + ' ' +
          QMensagemDESC_COMPLEMENTO6.Value + ' ' +
          QMensagemDESC_COMPLEMENTO7.Value);
      end;

    if (QNFE_EmiteVAL_AVISTA.Value > 0) and (QNFE_EmiteIND_CONDICAO_PAGTO.Value = '2') then
      wInfComplemento := wInfComplemento + ' VALOR A VISTA: ' + FormatFloat('#0.00', QNFE_EmiteVAL_AVISTA.Value);
    if wRetornavel then //Informacoes de devolucao de embalagens
      wInfComplemento := wInfComplemento + '\nEndereco para entrega de embalagens vazias(triplice lavadas):' +
        '\nEstrada para escola agricola Meu Cantinho - Linha Tres Fazendas - Santa Terezinha de Itaipu - PR' +
        '\nE Obrigatorio a apresentacao desta NF ou copia no momento da entrega das embalagens vazias, acompanhada da NF de produtor';

    if (wInfComplemento <> '') then
    begin
      XML.Add('<infAdic>');
//        XML.Add('<infAdFisco>');
//        XML.Add('</infAdFisco>');
      XML.Add('<infCpl>');
      XML.Add(DMNfe.BlockStr(StringReplace(Trim({wInfLotes + }wInfComplemento), #$A, '\n', [rfReplaceAll])));
      XML.Add('</infCpl>');
      XML.Add('</infAdic>');
    end;
    XML.Add('</infNFe>');
    XML.Add('</NFe>');
    if wSistemaNfe = '2' then
    begin
      XML.Add('<filial>');
      XML.Add(QNFE_EmiteCOD_FILIAL.Text);
      XML.Add('</filial>');
      wImpressora := '';
      wImpressora := DMOracle.BuscaNome('SELECT DESC_IMPRESSORA_DANFE FROM TB_USUARIO ', ' COD_USUARIO = ' + intToStr(DMUsuario.CodUsuarioCorrente));
      if wImpressora = '' then
        raise Exception.Create('Nenhuma impressora definida no cadastro do usuário, verificar cadastro')
      else
      begin
        XML.Add('<impressora>');
        XML.Add(DMNfe.BlockStr(wImpressora));
        XML.Add('</impressora>');
      end;
      XML.Add('<numVias>');
      XML.Add(wVias);
      XML.Add('</numVias>');
      if not QNFE_EmiteDESC_REPOSITORIO_NFE.isnull then
      begin
        XML.Add('<agrupamento>');
        XML.Add(DMNfe.BlockStr(QNFE_EmiteDESC_REPOSITORIO_NFE.Value));
        XML.Add('</agrupamento>');
      end;
      if not QNFE_EmiteDESC_CERTIFICADO.IsNull then
      begin
        XML.Add('<certificado>');
        XML.Add(Trim(QNFE_EmiteDESC_CERTIFICADO.Value));
        XML.Add('</certificado>');
      end;
      if not QNFE_EmiteDESC_LOGOTIPO_DANFE.IsNull then
      begin
        XML.Add('<logotipo>');
        XML.Add(DMNfe.BlockStr(Trim(QNFE_EmiteDESC_LOGOTIPO_DANFE.Value)));
        XML.Add('</logotipo>');
      end;
      XML.Add('</cemapa>');
    end;

    XML.Text := DMNfe.LimpaStrXML(XML.Text, '$');
    if wSistemaNfe = '2' then
      DMNfe.Salva(wCaminho, XML, PREFIX_NFE_EMITE + Bib.LimpaNumero(wChave) + '.xml', QNFE_EmiteCOD_FILIAL.Text)
    else
      XML.SaveToFile(wCaminho + Bib.LimpaNumero(wChave) + '-nfe.xml');
  end;
end;*)

end.

