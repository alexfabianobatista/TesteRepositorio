unit UNfeImpressao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Dialogs;

Type
  TNfeImpressao = class
  public
    Function GeraXML(): String;
    Procedure setFlagAgricola(flag :Boolean);
  private
    Function MontaChaveAcessoNFe( codUF: integer; dtEmissao: TDateTime; CNPJ:string;
      Modelo, Serie, NumeroNF, FormaEmissao: integer): string;
    Function LimpaCNPJ( cnpj: string): string;
    Function LimpaStrXML(wStr: String): String;
    Function VerificaDados(): Boolean;
    Function RetornaCaminhoNfe(): String;
    Function RetornaCaminhoLoteNfe():String;
    Function RemZeroEsq(wStr: String): String;
    Function UltimoChar(Str: String): String;
    Procedure Calc_Peso_Nota;
end;

var
  NfeImpressao: TNfeImpressao;
  wPeso, wPesoBruto: Double;
  wAmbienteNfe: String;
  wFlagAgricola :Boolean = false; //variavel utilizada para saber se a chamada foi feita pelo agricola

implementation

Uses UOracle_cl, UNotaSaida_cl, UNotaEntrada_cl, UCadastro_cl,UParamSistema_cl,
  UContasReceber_cl, UPromissoria, UOperacao_cl, UGuiaTransito_cl, DB, Math,
  UBiblioteca, UTipoLote_cl;

//Function TNfeImpressao.UltimoChar(Str: String): String;
//begin
//  Result := Copy(Str, Length(Str), 1);
//end;

Function TNfeImpressao.UltimoChar(Str: String): String;
begin
  Result := Copy(Str, Length(Str), 1);
end;

Procedure TNfeImpressao.setFlagAgricola(flag :Boolean);
begin
  wFlagAgricola := flag;
end;

Function TNfeImpressao.RemZeroEsq(wStr: String): String;
var
  wRes: String;
begin
  wRes := wStr;

  while (Length(wRes) > 0) and (wRes[1] = '0') do
    wRes := Copy(wRes, 2, Length(wRes));

  Result := wRes;
end;

//Function TNfeImpressao.CortaZeros(Valor: Real): String;
//var
//  wRes : String;
//begin
//  wRes := FloatToStr(Valor);
//  Result := wRes;
//  if (Bib.ProcuraStr(',', wRes) = -1) then
//    Exit;
//
//  while (UltimoChar(wRes) = '0') do
//  begin
//    SetLength(wRes, Length(wRes) - 1);
//  end;
//
//  Result := wRes;
//end;

Function TNfeImpressao.RetornaCaminhoNfe(): String;
var
  XML : TStrings;
  Aux : String;
  i, j : Integer;
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

  If Aux = '' then
    MessageDlg('Caminho em branco na tag <xml> (config.xml)', mtError, [mbOK], 0);
  if Copy(Aux, Length(Aux), 1) <> '\' then
    Aux := Aux + '\';

  Result := Aux;
end;

Function TNfeImpressao.RetornaCaminhoLoteNfe(): String;
var
  XML : TStrings;
  Aux : String;
  i, j : Integer;
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

  i := Bib.ProcuraStr('<xmlValidacaoLote>', XML.Text);
  j := Bib.ProcuraStr('</xmlValidacaoLote>', XML.Text);
  if (i = -1) or (j = -1) then
  begin
    MessageDlg('Tag nao encontrada: <xmlValidacaoLote> ou </xmlValidacaoLote>(config.xml).', mtError, [mbOK], 0);
    Exit;
  end;
  Inc(i, 19);
  Aux := Trim(Copy(XML.Text, i, j - i + 1));

  If Aux = '' then
    MessageDlg('Caminho em branco na tag <xmlValidacaoLote> (config.xml)', mtError, [mbOK], 0);
  if Copy(Aux, Length(Aux), 1) <> '\' then
    Aux := Aux + '\';

  Result := Aux;
end;


function TNfeImpressao.LimpaStrXML(wStr: String): String;
var
  wRes: String;
  wChar: String;
  i: Integer;
  wTag: Boolean;
begin
  wRes := '';
  wTag := False;
  SetLength(wChar, 1);
  For i := 1 to Length(wStr) do
  Begin
    wChar := wStr[i];
    if wChar = '<' then
      wTag := True;
    if not wTag then
    begin
      if wStr[i] in ['à', 'á', 'ã', 'â', 'ä'] then
        wChar := 'a';
      if wStr[i] in ['é', 'è', 'ê', 'ë'] then
        wChar := 'e';
      if wStr[i] in ['í', 'ì', 'ï', 'î'] then
        wChar := 'i';
      if wStr[i] in ['ó', 'õ', 'ô', 'ò', 'ö'] then
        wChar := 'o';
      if wStr[i] in ['ú', 'ù', 'ü', 'û'] then
        wChar := 'u';
      if wStr[i] in ['ç'] then
        wChar := 'c';

      if wStr[i] in ['À', 'Á', 'Ã', 'Â', 'Ä'] then
        wChar := 'A';
      if wStr[i] in ['É', 'È', 'Ê', 'Ë'] then
        wChar := 'E';
      if wStr[i] in ['Í', 'Ì', 'Ï', 'Î'] then
        wChar := 'I';
      if wStr[i] in ['Ó', 'Õ', 'Ô', 'Ò', 'Ö'] then
        wChar := 'O';
      if wStr[i] in ['Ú', 'Ù', 'Ü', 'Û'] then
        wChar := 'U';
      if wStr[i] in ['Ç'] then
        wChar := 'C';

      if not (wChar[1] in ['A'..'Z','a'..'z', '0'..'9', ' ', '-', '.', ',', '&', '"', ':', chr(39)]) then
        wChar := '';
    end;
    if wChar = '>' then
      wTag := False;
    if not wTag then
    begin
      if wChar = '&' then
        wRes := wRes + '&amp;'
      else
      if wChar = '"' then
        wRes := wRes + '&quot;'
      else
      if wChar = chr(39) then
        wRes := wRes + '&#39;'
      else
      if wChar = ',' then
        wRes := wRes + '.'
      else
        wRes := wRes + wChar;
    end
    else
      wRes := wRes + wChar;

  End;
  Result := wRes;
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
Function TNfeImpressao.MontaChaveAcessoNFe( codUF: integer; dtEmissao: TDateTime; CNPJ:string;
Modelo, Serie, NumeroNF, FormaEmissao: integer): string;
var
  emissao:string[10];
  chave:string;
  CodigoNumerico: Integer;
begin
  emissao := formatdatetime('DD/MM/YY', dtEmissao);

// Essa parte do código gera o Código Numérico (Aleatório)
//para que funcione inclua a unit "Math" na cláusule Uses.
  Randomize;
  CodigoNumerico := Random(99999999);

  chave := IntToStr(codUF)+copy( emissao, 7,2)+copy(emissao,4,2)+
  LimpaCNPJ(CNPJ)+Bib.StrZero2(Modelo,2,0)+Bib.StrZero2(Serie,3,0)+
  Bib.StrZero2(NumeroNF,9,0)+IntToStr(FormaEmissao)+Bib.StrZero2(CodigoNumerico,8,0);

  Result := chave + Bib.Modulo11(chave);

end;

// LimpaCNPJ (retira máscaras do CNPJ)
//------------------------------------
Function TNfeImpressao.LimpaCNPJ( cnpj: string): string;
begin
  Result := StringReplace(StringReplace(StringReplace(StringReplace( cnpj,
  '.','',[rfReplaceAll]),
  '-','',[rfReplaceAll]),
  ' ','',[rfReplaceAll]),
  '/','',[rfReplaceAll]);
end;

Function TNfeImpressao.VerificaDados(): Boolean;
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
    if Length(QNFE_EmiteCOD_PAIS_IBGE.Text) <> 4 then
    begin
      MessageDlg('O Código(IBGE) do Pais ' + QNFE_EmiteDESC_PAIS.Text + ' precisa ter 4 digitos. Verifique o cadastro do Pais.', mtError, [mbOK], 0);
      Exit;
    end;
    if wAmbienteNfe = '' then
    begin
      MessageDlg('Não foi definido um ambiente NFE nos parâmetros do Sistema', mtError, [mbOK], 0);
      Exit;
    end;
    if  Length(QNFE_EmiteItDESC_SITUACAO_TRIB.Value) <> 3 then
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

    try
      StrToInt(QNFE_EmiteCOD_SERIE.Value);
    except
      MessageDlg('O Codigo da serie precisa ser um numero inteiro. Use outra série para NF-e.', mtError, [mbOK], 0);
      Exit;
    end;

  end;
  VerificaDados := True;
end;

//retirado da UNotaImpressao
Procedure TNfeImpressao.Calc_Peso_Nota;
begin
  If (DMNotaSaida.QNFE_EmiteITInd_Tipo_Produto.Value = 'AGRICOLA') Then
  Begin
    wPeso := wPeso + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value;
    wPesoBruto := wPesoBruto + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value;
  End
  Else
  Begin
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
    begin
      wPeso :=  wPeso + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value * DMNotaSaida.QNFE_EmiteITNum_embalagem.Value;
      if DMNotaSaida.QNFE_Emiteqt_beneficiado.Text <> '' then
        wPesoBruto :=  DMNotaSaida.QNFE_Emiteqt_beneficiado.Value
      else
        wPesoBruto := wPesoBruto + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value * DMNotaSaida.QNFE_EmiteITNum_Volumes.Value;
    end;
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARTICAR' then
    begin
      wPeso := wPeso +  DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value *  DMNotaSaida.QNFE_EmiteITNum_Volumes.Value;
      wPesoBruto := wPeso;
    end
    else
    begin
      wPeso := wPeso + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value * DMNotaSaida.QNFE_EmiteITNum_embalagem.Value;
      wPesoBruto := wPesoBruto + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value * DMNotaSaida.QNFE_EmiteITNum_Volumes.Value;
    end;
  End;
End;

function TNfeImpressao.GeraXML(): String;
var
  XML: TStrings;
  Aux, Aux2, wNumEndereco, wLgr, wLgrFilial, wCaminho, wEmpresa, wCst, wObsTrib, wFisicaJuridica, wInfComplemento :String;
  wVlrIcmSubst, wBaseIcmSubst :Double;
  wVolumes :Double;
  wbase_icm_tributada, wvlr_icm, wtotal_produtos, wvlr_ipi, wvlr_frete,
  wvlr_desconto, wvlr_pis, wvlr_cofins, wvlr_despesa, wvlr_total_nota, wvlr_servico, wvlr_iss: Real;
  wContItem: Integer;
  wAux2: Integer;
  wTribs: Array of Integer;
begin
  wEmpresa := DMParamSistema.QParamSistemaCOD_EMPRESA.Value;
  wAmbienteNfe := DMOracle.BuscaNome('SELECT IND_AMBIENTE_NFE FROM TB_FILIAL', 'COD_FILIAL = ' + DMNotaSaida.QNFE_EmiteCOD_FILIAL.Text);
  SetLength(wTribs, 1);

  // inicializa as variaves dos pesos e volume
  wPesoBruto := 0;
  wPeso := 0;
  wVolumes := 0;

  if not VerificaDados then
    Abort;

  with DMNotaSaida do
  begin
  wNumEndereco := Bib.NumEndereco(QNFE_EmiteDESC_ENDERECO.Text);
//  if wNumEndereco = '0' then
//    Raise Exception.Create('O número do endereço do cliente é necessário para validar a nota.' +
//      #13 +  #10 + 'Por favor, adicione esse número em seu endereço. (Dica: Coloque em seu final ", numero")');
  wLgr := Bib.RemoveNumEndereco(QNFE_EmiteDESC_ENDERECO.Text, wNumEndereco);
  wLgrFilial := Bib.RemoveNumEndereco(QNFE_EmiteEND_FILIAL.Text, QNFE_EmiteNUM_ENDERECO_FILIAL.Text);
  if QNFE_EmiteDESC_CHAVE_ACESSO.Value = '' then
    Aux := 'NFe' + MontaChaveAcessoNFe(QNFE_EmiteCOD_UF_IBGE_FILIAL.Value,
                               QNFE_EmiteDT_EMISSAO.Value,
                               QNFE_EmiteCGC_FILIAL.Value,
                               55, StrToInt(QNFE_EmiteCOD_SERIE.Value),
                               QNFE_EmiteNUM_NOTA.Value,
                               1)
  else
    Aux := QNFE_EmiteDESC_CHAVE_ACESSO.Value;
  Result := Aux;

  If DMNotaSaida.QNFE_EmiteInd_Entrada_Saida.Value = 'E' Then
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
    wvlr_servico := 0;
    wvlr_iss := 0;
  end
  else
  begin
    DMNotaSaida.QSomaItemNota.Close;
    DMNotaSaida.QSomaItemNota.Master := Nil; // FEITO PELO CESAR PARA NAO ACESSAR O QNOTASAIDA (ESTAVA DANDO OPEN)
    DMNotaSaida.QSomaItemNota.MasterFields := '';
    DMNotaSaida.QSomaItemNota.DetailFields := '';
    DMNotaSaida.QSomaItemNota.SetVariable('COD_NOTA_CAB',DMNotaSaida.QNFE_EmiteCOD_NOTA_CAB.Value);
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
  XML.Add('<NFe xmlns="http://www.portalfiscal.inf.br/nfe">');
    XML.Add('<infNFe versao="1.10" Id="'+Aux+'">');
      XML.Add('<ide>');
        XML.Add('<cUF>');
        XML.Add(QNFE_EmiteCOD_UF_IBGE_FILIAL.text);
        XML.Add('</cUF>');
        XML.Add('<cNF>');
        XML.Add(copy(Aux, 38, 9));
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
        {XML.Add('<NFref>');
          XML.Add('<refNFe>');// verificar se nota eh normal ou substituicao etc...Pag 87
          XML.Add('');//              aqui pega a chave de acesso da nota referenciada.
          XML.Add('</refNFe>');
          XML.Add('<refNF>');
            XML.Add('<cUF>');
            XML.Add('');            //referente a nota referenciada
            XML.Add('</cUF');
            XML.Add('<AAMM>');
            XML.Add('');          //referente a nota referenciada
            XML.Add('</AAMM>');
            XML.Add('<CNPJ>');
            XML.Add('');          //referente a nota referenciada
            XML.Add('</CNPJ>');
            XML.Add('<mod>');
            XML.Add('55');          //referente a nota referenciada
            XML.Add('</mod>');
            XML.Add('<serie>');
            XML.Add('');          //referente a nota referenciada
            XML.Add('</serie>');
            XML.Add('<nNF>');
            XML.Add('');          //referente a nota referenciada
            XML.Add('</nNF>');
          XML.Add('</refNF>');
        XML.Add('</NFref>');}
        XML.Add('<tpImp>');
        XML.Add('1');// 1-Retrato; 2-Paisagem;
        XML.Add('</tpImp>');
        XML.Add('<tpEmis>');
        if (QNFE_EmiteIND_CONTINGENCIA.Text = 'CONTINGENCIA') then
          XML.Add('2')
        else
          if (QNFE_EmiteIND_CONTINGENCIA.Text = 'NORMAL') then
            XML.Add('1')
          else
            if DMOracle.BuscaNome('SELECT IND_CONTINGENCIA FROM TB_FILIAL', 'COD_FILIAL = '
              + QNFE_EmiteCOD_FILIAL.Text) = 'CONTINGENCIA' then
              XML.Add('2')
            else
              XML.Add('1');
        XML.Add('</tpEmis>');
        XML.Add('<cDV>');
        XML.Add(UltimoChar(Aux));
        XML.Add('</cDV>');
        XML.Add('<tpAmb>');
        XML.Add(wAmbienteNfe);
        XML.Add('</tpAmb>');
        XML.Add('<finNFe>');
        XML.Add(QNFE_EmiteIND_FINALIDADE_NFE.Text);//FINALIDADE 1-NORMAL. (6) ADICIONAR NA TB OPERACAO CAMPO FIN_NFE COM AS 3 OPCOES(DEFAULT 1)
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
      XML.Add('<dest>');//destinatário
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
        XML.Add(Trim(QNFE_EmiteNOME.Value));
        XML.Add('</xNome>');
        XML.Add('<enderDest>');
          XML.Add('<xLgr>');
          XML.Add(wLgr);
          XML.Add('</xLgr>');
          XML.Add('<nro>');
          XML.Add(wNumEndereco);    // TB CADASTRO BUSCA PELO CLIENTE DA NOTA
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
          XML.Add(QNFE_EmiteCOD_PAIS_IBGE.Text);
          XML.Add('</cPais>');
          XML.Add('<xPais>');
          XML.Add(QNFE_EmiteDESC_PAIS.Text);
          XML.Add('</xPais>');
          if QNFE_EmiteDESC_TELEFONE.Value <> '' then
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
        //XML.Add('<ISUF>');
        //                      nao obrigatorio
        //XML.Add('</ISUF>');
      XML.Add('</dest>');
//      XML.Add('<retirada>');
//        XML.Add('<CNPJ>');
//        XML.Add('</CNPJ>');
//        XML.Add('<xLgr>');
//        XML.Add('</xLgr>');
//        XML.Add('<nro>');
//        XML.Add('</nro>');
//        XML.Add('<xCpl>');
//        XML.Add('</xCpl>');
//        XML.Add('<xBairro>');
//        XML.Add('</xBairro>');
//        XML.Add('<cMun>');
//        XML.Add('</cMun>');
//        XML.Add('<xMun>');
//        XML.Add('</xMun>');
//        XML.Add('<UF>');
//        XML.Add('</UF>');
//      XML.Add('</retirada>');
//      XML.Add('<entrega>');
//        XML.Add('<CNPJ>');
//        XML.Add('</CNPJ>');
//        XML.Add('<xLgr>');
//        XML.Add('</xLgr>');
//        XML.Add('<nro>');
//        XML.Add('</nro>');
//        XML.Add('<xCpl>');
//        XML.Add('</xCpl>');
//        XML.Add('<xBairro>');
//        XML.Add('</xBairro>');
//        XML.Add('<cMun>');
//        XML.Add('</cMun>');
//        XML.Add('<xMun>');
//        XML.Add('</xMun>');
//        XML.Add('<UF></UF>');
//      XML.Add('</entrega>');
      wContItem := 1;
      QNFE_EmiteIt.First;
      while not QNFE_EmiteIt.Eof do
      begin
      XML.Add('<det nItem="'+ IntToStr(wContItem) + '">');
        XML.Add('<prod>');
          XML.Add('<cProd>');
          XML.Add(QNFE_EmiteItCOD_PRODUTO.Text);
          XML.Add('</cProd>');
          XML.Add('<cEAN>');
          wAux2 := Length(QNFE_EmiteItNUM_FABRICANTE.Text);
          if (wAux2 = 8) or ((wAux2 >= 12) and (wAux2 <= 14)) then
            XML.Add(LimpaCNPJ(QNFE_EmiteItNUM_FABRICANTE.Text));//conteudo em branco, caso nao houver
          XML.Add('</cEAN>');
          XML.Add('<xProd>');
          //XML.Add(StringReplace(QNFE_EmiteItDESC_PRODUTO.Value,'  ',' ',[rfReplaceAll]));
          If QNFE_EmiteItNUM_VOLUMES_NOTA.Text <> '' Then
          begin
             //XML.Add(StringReplace(QNFE_EmiteItDESC_PRODUTO.Value,'  ',' ',[rfReplaceAll])) + '' + QNFE_EmiteItNUM_VOLUMES_NOTA.Text;
             XML.Add(Trim(QNFE_EmiteItDESC_PRODUTO.Value + ' ' + QNFE_EmiteItNUM_VOLUMES_NOTA.Text));
          end
          Else
          begin
             //XML.Add(StringReplace(QNFE_EmiteItDESC_PRODUTO.Value,'  ',' ',[rfReplaceAll])) + '' + QNFE_EmiteItNUM_CABECAS.Text;
             XML.Add(Trim(QNFE_EmiteITDESC_PRODUTO.Value + ' ' + QNFE_EmiteItNUM_CABECAS.Text));
          end;
          XML.Add('</xProd>');


          //***************************************TESTE NAO APAGAR*************************************************//     12/12/08
          {
          if QNFE_EmiteItIND_TIPO_PRODUTO.Value <> 'SERVIÇO' then
          begin
            if QNFE_EmiteItNUM_GENERO_NCM.Text = '' then
              Raise Exception.Create('O produto ' + QNFE_EmiteItCOD_PRODUTO.Text + ' precisa possuir Genero NCM.');
            if Length(QNFE_EmiteItNUM_GENERO_NCM.Text) <> 8 then
              Raise Exception.Create('O Genero NCM do produto ' + QNFE_EmiteItCOD_PRODUTO.Text + ' precisa ter 8 digitos.');
            XML.Add('<NCM>');
            XML.Add(QNFE_EmiteItNUM_GENERO_NCM.Text);
            XML.Add('</NCM>');
            if QNFE_EmiteitCOD_EX_TIPI.Text = '' then
              Raise Exception.Create('O produto ' + QNFE_EmiteItCOD_PRODUTO.Text + ' precisa possuir Código EX-TIPI.');
            wAux2 := Length(QNFE_EmiteItCOD_EX_TIPI.Text);
            if (wAux2 < 2) or (wAux2 > 3) then
              Raise Exception.Create('O código EX-TIPI do produto ' + QNFE_EmiteItCOD_PRODUTO.Text + ' precisa ter 2 ou 3 digitos.');
            XML.Add('<EXTIPI>');
            XML.Add(QNFE_EmiteitCOD_EX_TIPI.Value);
            XML.Add('</EXTIPI>');           //(14)    COLOCAR NO CADASTRO DE PRODUTO
            wAux2 := Length(QNFE_EmiteItCOD_GENERO_PRODUTO.Text);
            if (wAux2 < 1) or (wAux2 > 2) then
              Raise Exception.Create('O genero do produto ' + QNFE_EmiteItCOD_PRODUTO.Text + ' precisa ter 1 ou 2 digitos.');
            XML.Add('<genero>');
            XML.Add(QNFE_EmiteItCOD_GENERO_PRODUTO.Text);
            XML.Add('</genero>');
          end;
          }
          //**********************************************************************************************************//

          if QNFE_EmiteItIND_TIPO_PRODUTO.Value <> 'SERVIÇO' then
          begin
            if QNFE_EmiteItNUM_GENERO_NCM.Text <> '' then
            begin
              if Length(QNFE_EmiteItNUM_GENERO_NCM.Text) <> 8 then
                Raise Exception.Create('O Genero NCM do produto ' + QNFE_EmiteItCOD_PRODUTO.Text + ' precisa ter 8 digitos.');
              XML.Add('<NCM>');
              XML.Add(QNFE_EmiteItNUM_GENERO_NCM.Text);
              XML.Add('</NCM>');
            end;

            if QNFE_EmiteitCOD_EX_TIPI.Text <> '' then
            begin
              wAux2 := Length(QNFE_EmiteItCOD_EX_TIPI.Text);
              if (wAux2 < 2) or (wAux2 > 3) then
                Raise Exception.Create('O código EX-TIPI do produto ' + QNFE_EmiteItCOD_PRODUTO.Text + ' precisa ter 2 ou 3 digitos.');
              XML.Add('<EXTIPI>');
              XML.Add(QNFE_EmiteitCOD_EX_TIPI.Value);
              XML.Add('</EXTIPI>');
            end;

            if QNFE_EmiteItCOD_GENERO_PRODUTO.Text <> '' then
            begin
              wAux2 := Length(QNFE_EmiteItCOD_GENERO_PRODUTO.Text);
              if (wAux2 < 1) or (wAux2 > 2) then
                Raise Exception.Create('O genero do produto ' + QNFE_EmiteItCOD_PRODUTO.Text + ' precisa ter 1 ou 2 digitos.');
              XML.Add('<genero>');
              XML.Add(QNFE_EmiteItCOD_GENERO_PRODUTO.Text);
              XML.Add('</genero>');
            end
          end;

          //**********************************************************************************************************//

          if (QNFE_EmiteUF_FILIAL.Text = QNFE_EmiteCOD_ESTADO.Text) then
          begin
            XML.Add('<CFOP>');
            XML.Add(QNFE_EmiteNAT_ESTADUAL_NOVO.Text);
            XML.Add('</CFOP>');
          end
          else
          begin
            XML.Add('<CFOP>');
            XML.Add(QNFE_EmiteNAT_INTERESTADUAL_NOVO.Text);
            XML.Add('</CFOP>');
          end;
          XML.Add('<uCom>');
          XML.Add(QNFE_EmiteItDESC_UNIDADE.Text);
          XML.Add('</uCom>');
          XML.Add('<qCom>');
          XML.Add(FormatFloat('#0.0000', QNFE_EmiteItQT_QUANTIDADE.Value));
          XML.Add('</qCom>');
          XML.Add('<vUnCom>');
          XML.Add(FormatFloat('#0.0000', QNFE_EmiteItVAL_UNITARIO.Value));
          XML.Add('</vUnCom>');
          XML.Add('<vProd>');
          XML.Add(FormatFloat('#0.00', QNFE_EmiteItVAL_TOTAL.Value));
          XML.Add('</vProd>');
          XML.Add('<cEANTrib>');
          //em branco, se nao houver
          XML.Add('</cEANTrib>');
          if QNFE_EmiteItDESC_UNIDADE.Value = '' then
            Raise Exception.Create('Produto precisa possuir unidade de medida.');
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
            XML.Add(QNFE_EmiteItVAL_FRETE.Text);
            XML.Add('</vFrete>');
          end;
//          XML.Add('<vSeg>');
//          XML.Add('</vSeg>');
          if QNFE_EmiteItVAL_DESCONTO.Value <> 0 then
          begin
            XML.Add('<vDesc>');
            XML.Add(formatFloat('#0.00',QNFE_EmiteItVAL_DESCONTO.Value));
            XML.Add('</vDesc>');
          end;
          //Nao possui declaração de importação
          {
          XML.Add('<DI>');
            XML.Add('<nDI>');
            XML.Add('</nDI>');
            XML.Add('<dDI>');
            XML.Add('</dDI>');
            XML.Add('<xLocDesemb>');
            XML.Add('</xLocDesemb>');
            XML.Add('<UFDesemb>');
            XML.Add('</UFDesemb>');
            XML.Add('<dDesemb>');
            XML.Add('</dDesemb>');
            XML.Add('<cExportador>');
            XML.Add('</cExportador>');
            XML.Add('<adi>');
              XML.Add('<nAdicao>');
              XML.Add('</nAdicao>');
              XML.Add('<nSegAdic>');
              XML.Add('</nSegAdic>');
              XML.Add('<cFabricante>');
              XML.Add('</cFabricante>');
              XML.Add('<vDescDI>');
              XML.Add('</vDescDI>');
            XML.Add('</adi>');
          XML.Add('</DI>');

          tbm nao tem veiculo
          XML.Add('<veicProd>');
            XML.Add('<tpOp>');
            XML.Add('</tpOp>');
            XML.Add('<chassi>');
            XML.Add('</chassi>');
            XML.Add('<cCor>');
            XML.Add('</cCor>');
            XML.Add('<xCor>');
            XML.Add('</xCor>');
            XML.Add('<pot>');
            XML.Add('</pot>');
            XML.Add('<CM3>');
            XML.Add('</CM3>');
            XML.Add('<pesoL>');
            XML.Add('</pesoL>');
            XML.Add('<pesoB>');
            XML.Add('</pesoB>');
            XML.Add('<nSerie>');
            XML.Add('</nSerie>');
            XML.Add('<tpComb>');
            XML.Add('</tpComb>');
            XML.Add('<nMotor>');
            XML.Add('</nMotor>');
            XML.Add('<CMKG>');
            XML.Add('</CMKG>');
            XML.Add('<dist>');
            XML.Add('</dist>');
            XML.Add('<RENAVAN>');
            XML.Add('</RENAVAN>');
            XML.Add('<anoMod>');
            XML.Add('</anoMod>');
            XML.Add('<anoFab>');
            XML.Add('</anoFab>');
            XML.Add('<tpPint>');
            XML.Add('</tpPint>');
            XML.Add('<tpVeic>');
            XML.Add('</tpVeic>');
            XML.Add('<espVeic>');
            XML.Add('</espVeic>');
            XML.Add('<VIN>');
            XML.Add('</VIN>');
            XML.Add('<codVeic>');
            XML.Add('</codVeic>');
            XML.Add('<cMod>');
            XML.Add('</cMod>');
          XML.Add('</veicProd>');

          nem medicamentos
          XML.Add('<med>');
            XML.Add('<nLote>');
            XML.Add('</nLote>');
            XML.Add('<qLote>');
            XML.Add('</qLote>');
            XML.Add('<dFab>');
            XML.Add('</dFab>');
            XML.Add('<dVal>');
            XML.Add('</dVal>');
            XML.Add('<vPMC>');
            XML.Add('</vPMC>');
          XML.Add('</med>');

          nem armamentos:
          XML.Add('<arma>');
            XML.Add('<tpArma>');
            XML.Add('</tpArma>');
            XML.Add('<nSerie>');
            XML.Add('</nSerie>');
            XML.Add('<nCano>');
            XML.Add('</nCano>');
            XML.Add('<descr>');
            XML.Add('</descr>');
          XML.Add('</arma>');

          combustiveis:
          XML.Add('<comb>');
            XML.Add('<cProdANP></cProdANP>');
            XML.Add('<CODIF>');
            XML.Add('</CODIF>');
            XML.Add('<qTemp>');
            XML.Add('</qTemp>');
            XML.Add('<CIDE>');
              XML.Add('<qBCProd>');
              XML.Add('</qBCProd>');
              XML.Add('<vAliqProd>');
              XML.Add('</vAliqProd>');
              XML.Add('<vCIDE>');
              XML.Add('</vCIDE>');
            XML.Add('</CIDE>');
            XML.Add('<ICMSComb>');
              XML.Add('<vBCICMS>');
              XML.Add('</vBCICMS>');
              XML.Add('<vICMS>');
              XML.Add('</vICMS>');
              XML.Add('<vBCICMSST>');
              XML.Add('</vBCICMSST>');
              XML.Add('<vICMSST>');
              XML.Add('</vICMSST>');
            XML.Add('</ICMSComb>');
            XML.Add('<ICMSInter>');
              XML.Add('<vBCICMSSTDest>');
              XML.Add('</vBCICMSSTDest>');
              XML.Add('<vICMSDest>');
              XML.Add('</vICMSDest>');
            XML.Add('</ICMSInter>');
            XML.Add('<ICMSCons>');
              XML.Add('<vBCICMSSTCons>');
              XML.Add('</vBCICMSSTCons>');
              XML.Add('<vICMSSTCons>');
              XML.Add('</vICMSSTCons>');
              XML.Add('<UFCons>');
              XML.Add('</UFCons>');
            XML.Add('</ICMSCons>');
          XML.Add('</comb>');
          }
        XML.Add('</prod>');
        XML.Add('<imposto>');
          //if QNFE_EmiteItDESC_SITUACAO_TRIB.Text
          XML.Add('<ICMS>');
          wCst := Copy(QNFE_EmiteItDESC_SITUACAO_TRIB.Text, 2, 2);
            if (wCst = '00') then
            begin
            XML.Add('<ICMS00>');
              XML.Add('<orig>');
              XML.Add(copy(QNFE_EmiteItDESC_SITUACAO_TRIB.Value,0,1)); //0-Nacional; 1-Importado direto; 2-Importado, comprado no mercado interno
              XML.Add('</orig>');
              XML.Add('<CST>');
              XML.Add(wCst);
              XML.Add('</CST>');
              XML.Add('<modBC>');
              XML.Add('0');
              XML.Add('</modBC>');
              XML.Add('<vBC>');
              XML.Add(FormatFloat('#0.00',QNFE_EmiteItVAL_ICM_BASE.Value));
              XML.Add('</vBC>');
              XML.Add('<pICMS>');
              XML.Add(QNFE_EmiteItPERC_ALIQUOTA.Text);
              XML.Add('</pICMS>');
              XML.Add('<vICMS>');
              XML.Add(FormatFloat('#0.00',QNFE_EmiteItVAL_ICM.Value));
              XML.Add('</vICMS>');
            XML.Add('</ICMS00>');
            end
            else
            if (wCst = '10') then
            begin
              XML.Add('<ICMS10>');
                XML.Add('<orig>');
                XML.Add(copy(QNFE_EmiteItDESC_SITUACAO_TRIB.Value,0,1)); //0-Nacional; 1-Importado direto; 2-Importado, comprado no mercado interno
                XML.Add('</orig>');
                XML.Add('<CST>');
                XML.Add(wCst);
                XML.Add('</CST>');
                XML.Add('<modBC>');
                XML.Add('0');
                XML.Add('</modBC>');
                XML.Add('<vBC>');
                XML.Add(FormatFloat('#0.00',QNFE_EmiteItVAL_ICM_BASE.Value));
                XML.Add('</vBC>');
                XML.Add('<pICMS>');
                XML.Add(QNFE_EmiteItPERC_ALIQUOTA.Text);
                XML.Add('</pICMS>');
                XML.Add('<vICMS>');
                XML.Add(FormatFloat('#0.00',QNFE_EmiteItVAL_ICM.Value));
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
                XML.Add(FormatFloat('#0.00',QNFE_EmiteItVAL_BASE_SUBST.Value));
                XML.Add('</vBCST>');
                XML.Add('<pICMSST>');
                //Aliquota do imosto do ICMS ST
                XML.Add(DMOracle.BuscaNome('SELECT PERC_ALIQ_SUBST FROM TB_ESTADO','COD_ESTADO = ' + chr(39) + QNFE_EmiteCOD_ESTADO.Text + chr(39)));
                XML.Add('</pICMSST>');
                XML.Add('<vICMSST>');
                //valor do ICMS ST retido
                XML.Add(formatFloat('#0.00',QNFE_EmiteItVAL_ICMS_SUBST.Value));
                XML.Add('</vICMSST>');
              XML.Add('</ICMS10>');
            end
            else
            if (wCst = '20') then
            begin
              XML.Add('<ICMS20>');
                XML.Add('<orig>');
                XML.Add(copy(QNFE_EmiteItDESC_SITUACAO_TRIB.Value,0,1)); //0-Nacional; 1-Importado direto; 2-Importado, comprado no mercado interno
                XML.Add('</orig>');
                XML.Add('<CST>');
                XML.Add(wCst);
                XML.Add('</CST>');
                XML.Add('<modBC>');
                XML.Add('0');
                XML.Add('</modBC>');
                XML.Add('<pRedBC>');
                XML.Add(FloatToStr(100 - QNFE_EmiteItPERC_ALIQUOTA.Value));//100 - valor da tabela de tributacao
                XML.Add('</pRedBC>');
                XML.Add('<vBC>');
                XML.Add(FormatFloat('#0.00',QNFE_EmiteItVAL_ICM_BASE.Value));
                XML.Add('</vBC>');
                XML.Add('<pICMS>');
                XML.Add(QNFE_EmiteItPERC_ALIQUOTA.Text);
                XML.Add('</pICMS>');
                XML.Add('<vICMS>');
                XML.Add(FormatFloat('#0.00',QNFE_EmiteItVAL_ICM.Value));
                XML.Add('</vICMS>');
              XML.Add('</ICMS20>');
            end
            else
            if (wCst = '30') then
            begin
              XML.Add('<ICMS30>');
                XML.Add('<orig>');
                XML.Add(copy(QNFE_EmiteItDESC_SITUACAO_TRIB.Value,0,1)); //0-Nacional; 1-Importado direto; 2-Importado, comprado no mercado interno
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
            else
            if (wCst = '40') or
               (wCst = '41') or
               (wCst = '50')  then
            begin
              XML.Add('<ICMS40>');
                XML.Add('<orig>');
                XML.Add(copy(QNFE_EmiteItDESC_SITUACAO_TRIB.Value,0,1)); //0-Nacional; 1-Importado direto; 2-Importado, comprado no mercado interno
                XML.Add('</orig>');
                XML.Add('<CST>');
                XML.Add(wCst);
                XML.Add('</CST>');
              XML.Add('</ICMS40>');
            end
            else
            if (wCst = '51') then
            begin
              XML.Add('<ICMS51>');
                XML.Add('<orig>');
                XML.Add(copy(QNFE_EmiteItDESC_SITUACAO_TRIB.Value,0,1)); //0-Nacional; 1-Importado direto; 2-Importado, comprado no mercado interno
                XML.Add('</orig>');
                XML.Add('<CST>');
                XML.Add(wCst);
                XML.Add('</CST>');
                XML.Add('<modBC>');
                XML.Add('0');
                XML.Add('</modBC>');
                XML.Add('<pRedBC>');
                XML.Add('0');
                XML.Add('</pRedBC>');
                XML.Add('<vBC>');
                XML.Add('0');
                XML.Add('</vBC>');
                XML.Add('<pICMS>');
                XML.Add('0');
                XML.Add('</pICMS>');
                XML.Add('<vICMS>');
                XML.Add('0');
                XML.Add('</vICMS>');
              XML.Add('</ICMS51>');
            end
            else
            //XML.Add('<ICMS60>');
//              XML.Add('<orig>');
//              XML.Add('0'); //Mercadoria nacional
//              XML.Add('</orig>');
//              XML.Add('<CST>');
//              XML.Add(QNFE_EmiteItDESC_SITUACAO_TRIB.Text);
//              XML.Add('</CST>');
//              XML.Add('<vBCST>');
//              XML.Add('</vBCST>');
//              XML.Add('<pICMSST>');
//              XML.Add('</pICMSST>');
//            XML.Add('</ICMS60>');
//            XML.Add('<ICMS70>');
//              XML.Add('<orig>');
//              XML.Add('0'); //Mercadoria nacional
//              XML.Add('</orig>');
//              XML.Add('<CST>');
//              XML.Add(QNFE_EmiteItDESC_SITUACAO_TRIB.Text);
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
//            XML.Add('</ICMS70>');
            if (wCst = '90') then
            begin
              XML.Add('<ICMS90>');
                XML.Add('<orig>');
                XML.Add(copy(QNFE_EmiteItDESC_SITUACAO_TRIB.Value,0,1)); //0-Nacional; 1-Importado direto; 2-Importado, comprado no mercado interno
                XML.Add('</orig>');
                XML.Add('<CST>');
                XML.Add(wCst);
                XML.Add('</CST>');
                XML.Add('<modBC>');
                XML.Add('0');
                XML.Add('</modBC>');
                XML.Add('<vBC>');
                XML.Add(FormatFloat('#0.00',QNFE_EmiteItVAL_ICM_BASE.Value));
                XML.Add('</vBC>');
                XML.Add('<pRedBC>');
                XML.Add(FloatToStr(100 - QNFE_EmiteItPERC_ALIQUOTA.Value));
                XML.Add('</pRedBC>');
                XML.Add('<pICMS>');
                XML.Add(QNFE_EmiteItPERC_ALIQUOTA.Text);
                XML.Add('</pICMS>');
                XML.Add('<vICMS>');
                XML.Add(FormatFloat('#0.00',QNFE_EmiteItVAL_ICM.Value));
                XML.Add('</vICMS>');
                XML.Add('<modBCST>');
                XML.Add('0');
                XML.Add('</modBCST>');
                XML.Add('<pMVAST>');
                XML.Add('0');
                XML.Add('</pMVAST>');
                XML.Add('<pRedBCST>');
                XML.Add('0');
                XML.Add('</pRedBCST>');
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
//          if QNFE_EmiteItVAL_IPI.Value > 0 then
//          begin
//          XML.Add('<IPI>');
//            //XML.Add('<clEnq>');
//            //XML.Add('</clEnq>');
//            //XML.Add('<CNPJProd>');
//            //XML.Add('</CNPJProd>');
//            //XML.Add('<cSelo>');
//            //XML.Add('</cSelo>');
//            //XML.Add('<qSelo>');
//            //XML.Add('</qSelo>');
//            XML.Add('<cEnq>');
//            XML.Add('999');
//            XML.Add('</cEnq>');
//            if (QNFE_EmiteItDESC_SITUACAO_TRIB.Text = '000') or
//               (QNFE_EmiteItDESC_SITUACAO_TRIB.Text = '049') or
//               (QNFE_EmiteItDESC_SITUACAO_TRIB.Text = '050') or
//               (QNFE_EmiteItDESC_SITUACAO_TRIB.Text = '099') then
//            begin
//            XML.Add('<IPITrib>');  //analisar campo cst
//              XML.Add('<CST>');
//              XML.Add(QNFE_EmiteItDESC_SITUACAO_TRIB.Value);
//              XML.Add('</CST>');
//              XML.Add('<vBC>');
//              XML.Add('</vBC>');
//              {
//              XML.Add('<qUnid>');
//              XML.Add('</qUnid>');
//              XML.Add('<vUnid>');    SOMENTE SE FOR CALCULADO O IPI POR VLR UNIDADE
//              XML.Add('</vUnid>');
//              }
//              XML.Add('<pIPI>');
//              XML.Add(QNFE_EmiteItPERC_IPI.Text);
//              XML.Add('</pIPI>');
//              XML.Add('<vIPI>');
//              XML.Add(QNFE_EmiteItVAL_IPI.Text);
//              XML.Add('</vIPI>');
//            XML.Add('</IPITrib>');
//            end
//            else
//            if (QNFE_EmiteItDESC_SITUACAO_TRIB.Text = '001') or
//               (QNFE_EmiteItDESC_SITUACAO_TRIB.Text = '002') or
//               (QNFE_EmiteItDESC_SITUACAO_TRIB.Text = '003') or
//               (QNFE_EmiteItDESC_SITUACAO_TRIB.Text = '004') or
//               (QNFE_EmiteItDESC_SITUACAO_TRIB.Text = '051') or
//               (QNFE_EmiteItDESC_SITUACAO_TRIB.Text = '052') or
//               (QNFE_EmiteItDESC_SITUACAO_TRIB.Text = '053') or
//               (QNFE_EmiteItDESC_SITUACAO_TRIB.Text = '054') or
//               (QNFE_EmiteItDESC_SITUACAO_TRIB.Text = '055') then
//            begin
//              XML.Add('<IPINT>');
//                XML.Add('<CST>');
//                XML.Add(QNFE_EmiteItDESC_SITUACAO_TRIB.Value);
//                XML.Add('</CST>');
//              XML.Add('</IPINT>');
//            end;
//          XML.Add('</IPI>');
//          end;
          { Imposto de Importacao - Nao possui
          XML.Add('<II>');
            XML.Add('<vBC>');
            XML.Add('</vBC>');
            XML.Add('<vDespAdu>');
            XML.Add('</vDespAdu>');
            XML.Add('<vII>');
            XML.Add('</vII>');
            XML.Add('<vIOF>');
            XML.Add('</vIOF>');
          XML.Add('</II>');
          }
          XML.Add('<PIS>');
            // Apenas uma das tags será informada, de acordo com o CST
            XML.Add('<PISAliq>');
              XML.Add('<CST>');
              XML.Add('01');
              XML.Add('</CST>');
              XML.Add('<vBC>');
              XML.Add(FormatFloat('#0.00',QNFE_EmiteItVAL_TOTAL.Value));
              XML.Add('</vBC>');
              XML.Add('<pPIS>');
              XML.Add(QNFE_EmiteItPERC_PIS.Text);
              XML.Add('</pPIS>');
              XML.Add('<vPIS>');
              if QNFE_EmiteItVAL_PIS.Text = '' then
                XML.Add('0')
              else
                XML.Add(QNFE_EmiteItVAL_PIS.Text);
              XML.Add('</vPIS>');
            XML.Add('</PISAliq>');
            {XML.Add('<PISQtde>');
              XML.Add('<CST>');
              XML.Add('</CST>');
              XML.Add('<qBCProd>');
              XML.Add('</qBCProd>');
              XML.Add('<vAliqProd>');
              XML.Add('</vAliqProd>');
              XML.Add('<vPIS>');
              XML.Add('</vPIS>');
            XML.Add('</PISQtde>');
            XML.Add('<PISNT>');
              XML.Add('<CST>');
              XML.Add('</CST>');
            XML.Add('</PISNT>');
            XML.Add('<PISOutr>');
              XML.Add('<CST>');
              XML.Add('</CST>');
              XML.Add('<vBC>');
              XML.Add('</vBC>');
              XML.Add('<pPIS>');
              XML.Add('</pPIS>');
              XML.Add('<qBCProd>');
              XML.Add('</qBCProd>');
              XML.Add('<vAliqProd>');
              XML.Add('</vAliqProd>');
              XML.Add('<vPis>');
              XML.Add('</vPis>');
            XML.Add('</PISOutr>');}
          XML.Add('</PIS>');
//          XML.Add('<PISST>');
//            XML.Add('<vBC>');
//
//            XML.Add('</vBC>');
//            XML.Add('<pPIS>');
//            XML.Add('</pPIS>');
//            {
//            XML.Add('<qBCProd>');
//            XML.Add('</qBCProd>');
//            XML.Add('<vAliqProd>');
//            XML.Add('</vAliqProd>');
//            }
//            XML.Add('<vPIS>');
//            XML.Add('</vPIS>');
//          XML.Add('</PISST>');
          XML.Add('<COFINS>');
            //informar apenas 1 das tags, de acordo com cst.
            XML.Add('<COFINSAliq>');
              XML.Add('<CST>');
              XML.Add('01');
              XML.Add('</CST>');
              XML.Add('<vBC>');
              XML.Add(FormatFloat('#0.00',QNFE_EmiteItVAL_TOTAL.Value));
              XML.Add('</vBC>');
              XML.Add('<pCOFINS>');
              XML.Add(FormatFloat('####0.00', QNFE_EmiteItPERC_COFINS.Value));
              XML.Add('</pCOFINS>');
              XML.Add('<vCOFINS>');
              if QNFE_EmiteItVAL_CONFINS.Text = '' then
                XML.Add('0')
              else
                XML.Add(QNFE_EmiteItVAL_CONFINS.Text);
              XML.Add('</vCOFINS>');
            XML.Add('</COFINSAliq>');
            {XML.Add('<COFINSQtde>');
              XML.Add('<CST>');
              XML.Add('</CST>');
              XML.Add('<qBCProd>');
              XML.Add('</qBCProd>');
              XML.Add('<vAliqProd>');
              XML.Add('</vAliqProd>');
              XML.Add('<vCOFINS>');
              XML.Add('</vCOFINS>');
            XML.Add('</COFINSQtde>');
            XML.Add('<CONFINSNT>');
              XML.Add('<CST>');
              XML.Add('</CST>');
            XML.Add('</CONFINSNT>');
            XML.Add('<COFINSOutr>');
              XML.Add('<CST>');
              XML.Add('</CST>');
              XML.Add('<vBC>');
              XML.Add('</vBC>');
              XML.Add('<pCOFINS>');
              XML.Add('</pCOFINS>');
              XML.Add('<qBCProd>');
              XML.Add('</qBCProd>');
              XML.Add('<vAliqProd>');
              XML.Add('</vAliqProd>');
              XML.Add('<vCOFINS>');
              XML.Add('</vCOFINS>');
            XML.Add('</COFINSOutr>');}
          XML.Add('</COFINS>');
//          XML.Add('<COFINSST>');
//            XML.Add('<vBC>'); // se for percentual
//            XML.Add('</vBC>');
//            XML.Add('<pCOFINS>'); // se for percentual
//            XML.Add('</pCOFINS>');
//            {
//            XML.Add('<qBCProd>'); // se for valor
//            XML.Add('</qBCProd>');
//            XML.Add('<vAliqProd>');  // se for valor
//            XML.Add('</vAliqProd>');
//            }
//            XML.Add('<vCOFINS>');
//            XML.Add('</vCOFINS>');
//          XML.Add('</COFINSST>');
          if QNFE_EmiteItIND_TIPO_PRODUTO.Value = 'SERVIÇO' then
          begin
            XML.Add('<ISSQN>'); // para prestacao de SERVICOS sujeitos ao ISSQN e fornecimento de pecas sujeitas a ICMS
              XML.Add('<vBC>');
              XML.Add(FormatFloat('#0.00',QNFE_EmiteItVAL_TOTAL.Value));
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
        with DMTipoLote do
        begin
          QTipoLote.Close;
          QTipoLote.SetVariable('PK',QNFE_EmiteItCOD_LOTE_TIPO.Value);
          QTipoLote.Open;
          if(QTipoLote.RecordCount > 0) then
          begin
            XML.Add('<infAdProd>');
            if QTipoLoteDESC_LOTE.Text <> '' then
              XML.Add('Lote Nr. ' +  QTipoLoteDESC_LOTE.Text);
//            if QTipoLoteDESC_BOLETIM.Text <> '' then
//              XML.Add(', Boletim Nr. ' + QTipoLoteDESC_BOLETIM.Text);
            if QTipoLoteDESC_PUREZA.Text <> '' then
              XML.Add(' - Pureza ' + QTipoLoteDESC_PUREZA.Text);
            if QTipoLoteDESC_GERMINACAO.Text <> '' then
              XML.Add(', Germ. ' + QTipoLoteDESC_GERMINACAO.Text);
            if QTipoLoteDT_VENCIMENTO.Text <> '' then
              XML.Add(', Validade ' + QTipoLoteDT_VENCIMENTO.Text);
//            if QTipoLoteDESC_TERMO_CONFORMIDADE.Text <> '' then
//              XML.Add(' - Termo de conformidade Nr. ' + QTipoLoteDESC_TERMO_CONFORMIDADE.Text);
            XML.Add('</infAdProd>');
          end;
        end;
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
        wVolumes := wVolumes + QNFE_EmiteItNum_Metros_Cubicos.Value * QNFE_EmiteItQT_QUANTIDADE.Value;
        Calc_Peso_Nota;
      end;
//      wPeso := wPeso  + QNFE_EmiteItQT_QUANTIDADE.Value;
//      if (QNFE_EmiteItNUM_VOLUMES_NOTA.Value = 0) or (QNFE_EmiteItNUM_VOLUMES_NOTA.Text = '') then
//        wPesoBruto := wPesoBruto + QNFE_EmiteItQT_QUANTIDADE.Value + QNFE_EmiteItNum_Embalagem.Value
//      else
//        wPesoBruto := wPesoBruto + QNFE_EmiteItQT_QUANTIDADE.Value + (QNFE_EmiteItNUM_VOLUMES_NOTA.Value * QNFE_EmiteItNum_Embalagem.Value);
      if (QNFE_EmiteItCOD_TRIBUTACAO.Text <> '') and (not Bib.ComparaIntegerArray(QNFE_EmiteItCOD_TRIBUTACAO.Value, wTribs)) then
      begin
        SetLength(wTribs, Length(wTribs) + 1);
        wTribs[Length(wTribs) - 1] := QNFE_EmiteItCOD_TRIBUTACAO.Value;
        Aux2 := DMOracle.BuscaNome('SELECT DESC_OBSERVACAO FROM TB_TRIBUTACAO', 'COD_TRIBUTACAO = ' + QNFE_EmiteItCOD_TRIBUTACAO.Text);
        wObsTrib := wObsTrib + Aux2 + ' ';
      end;
      QNFE_EmiteIt.Next;
      end;
//      if QNFE_EmiteIND_ENTRADA_SAIDA.Value = 'S' then
//      begin
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
//      end
//      else
//      begin
//        XML.Add('<total>');
//          XML.Add('<ICMSTot>');
//            XML.Add('<vBC>');
//            XML.Add(FormatFloat('#0.00', wbase_icm_tributada));
//            XML.Add('</vBC>');
//            XML.Add('<vICMS>');
//            XML.Add(FormatFloat('#0.00', wvlr_icm));
//            XML.Add('</vICMS>');
//            XML.Add('<vBCST>');
//            XML.Add('0');
//            XML.Add('</vBCST>');
//            XML.Add('<vST>');
//            XML.Add('0');
//            XML.Add('</vST>');
//            XML.Add('<vProd>');
//            XML.Add(FormatFloat('#0.00', wtotal_produtos));
//            XML.Add('</vProd>');
//            XML.Add('<vFrete>');
//            XML.Add(FormatFloat('#0.00', wvlr_frete));
//            XML.Add('</vFrete>');
//            XML.Add('<vSeg>');
//            XML.Add('0');
//            XML.Add('</vSeg>');
//            XML.Add('<vDesc>');
//            XML.Add(FormatFloat('#0.00', wvlr_desconto));
//            XML.Add('</vDesc>');
//            XML.Add('<vII>');
//            XML.Add('0');
//            XML.Add('</vII>');
//            XML.Add('<vIPI>');
//            XML.Add(FormatFloat('#0.00', wvlr_ipi));
//            XML.Add('</vIPI>');
//            XML.Add('<vPIS>');
//            XML.Add(FormatFloat('#0.00', wvlr_pis));
//            XML.Add('</vPIS>');
//            XML.Add('<vCOFINS>');
//            XML.Add(FormatFloat('#0.00', wvlr_cofins));
//            XML.Add('</vCOFINS>');
//            XML.Add('<vOutro>');
//            XML.Add(FormatFloat('#0.00', wvlr_despesa));
//            XML.Add('</vOutro>');
//            XML.Add('<vNF>');
//            XML.Add(FormatFloat('#0.00', wvlr_total_nfe));
//            XML.Add('</vNF>');
//          XML.Add('</ICMSTot>');
//          XML.Add('<ISSQNtot>');
//            if wvlr_servico <> 0 then
//            begin
//            XML.Add('<vServ>');
//            XML.Add(FormatFloat('#0.00', wvlr_servico));
//            XML.Add('</vServ>');
//            XML.Add('<vBC>');
//            XML.Add(FormatFloat('#0.00', wvlr_servico));
//            XML.Add('</vBC>');
//            end;
//            if wvlr_iss <> 0 then
//            begin
//            XML.Add('<vISS>');
//            XML.Add(FormatFloat('#0.00', wvlr_iss));
//            XML.Add('</vISS>');
//            end;
//            {XML.Add('<vPIS>');
//            XML.Add();
//            XML.Add('</vPIS>');
//            XML.Add('<vCOFINS>');
//            XML.Add();
//            XML.Add('</vCOFINS>');}
//          XML.Add('</ISSQNtot>');
//          {XML.Add('<retTrib>');
//            XML.Add('<vRetPIS>');
//            XML.Add('</vRetPIS>');
//            XML.Add('<vRetCOFINS>');
//            XML.Add('</vRetCOFINS>');
//            XML.Add('<vRetCSLL>');
//            XML.Add('</vRetCSLL>');
//            XML.Add('<vBCIRRF>');
//            XML.Add('</vBCIRRF>');
//            XML.Add('<vIRRF>');
//            XML.Add('</vIRRF>');
//            XML.Add('<vBCRetPrev>');
//            XML.Add('</vBCRetPrev>');
//            XML.Add('<vRetPrev>');
//            XML.Add('</vRetPrev>');
//          XML.Add('</retTrib>');}
//        XML.Add('</total>');
//      end;
      XML.Add('<transp>');
        XML.Add('<modFrete>');
        if QNFE_EmiteIND_TIPO_FRETE.Text = 'FOB' then
          XML.Add('1') //comprador
        else
          XML.Add('0');//emitente
        XML.Add('</modFrete>');
        if (QNFE_Emitenome_transp.Value <> '') then
        begin
        XML.Add('<transporta>');
          if QNFE_EmiteCOD_TRANSPORTADOR.Text <> '' then
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
          //XML.Add('<CPF>');

          //XML.Add('</CPF>');
          XML.Add('<xNome>');
          XML.Add(Trim(QNFE_Emitenome_transp.Value));
          XML.Add('</xNome>');
          if QNFE_Emiteinsc_transp.Value <> '' then
          begin
            XML.Add('<IE>');
            XML.Add(QNFE_Emiteinsc_transp.Value);
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
          if (wVolumes > 0) then
          begin
            XML.Add('<qVol>');
            XML.Add(FormatFloat('000000000000000', wVolumes));
            XML.Add('</qVol>');
          end;
//          if(wVolumes > 0) then
//          begin
//            XML.Add('<qVol>');
//            if wEmpresa = 'ABATE' then
//              XML.Add(FormatFloat('000000000000000', wQuantidade))
//            else
//              XML.Add(FormatFloat('000000000000000', wVolumes));
//            XML.Add('</qVol>');
//          end;
          if(DMNotaSaida.QNFE_EmiteDESC_ESPECIE.Text <> '') then
          begin
            XML.Add('<esp>');
            XML.Add(copy(DMNotaSaida.QNFE_EmiteDESC_ESPECIE.Text,1,60));
            XML.Add('</esp>');
          end;
          if DMNotaSaida.QNFE_EmiteDESC_MARCA.Text <> '' then
          begin
            XML.Add('<marca>');
            XML.Add(copy(DMNotaSaida.QNFE_EmiteDESC_MARCA.Text,1,60));
            XML.Add('</marca>');
          end;
          if DMNotaSaida.QNFE_EmiteNUM_VOLUMES.Text <> '' then
          begin
            XML.Add('<nVol>');
            XML.Add(copy(DMNotaSaida.QNFE_EmiteNUM_VOLUMES.Text,1,60));
            XML.Add('</nVol>');
          end;
          XML.Add('<pesoL>');
          if wEmpresa = 'INSIDE' then
            XML.Add('0.000')
          else
            XML.Add(formatFloat('#0.000',wPeso));
          XML.Add('</pesoL>');
          XML.Add('<pesoB>');
          if wEmpresa = 'INSIDE' then
            XML.Add('0.000')
          else
            XML.Add(formatFloat('#0.000',wPesoBruto));
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
          XML.Add('<vOrig>');
          XML.Add(FormatFloat('#0.00', wvlr_total_nota));
          XML.Add('</vOrig>');
          if wvlr_desconto <> 0 then
          begin
            XML.Add('<vDesc>');
            XML.Add(FormatFloat('#0.00', wvlr_desconto));
            XML.Add('</vDesc>');
          end;
          XML.Add('<vLiq>');
          XML.Add(FormatFloat('#0.00', wvlr_total_nota));
          XML.Add('</vLiq>');
        XML.Add('</fat>');
        if QNFE_EmiteIND_ENTRADA_SAIDA.Value = 'S' then
        begin
          QContaReceber.Close;
          QContaReceber.SetVariable('COD_NOTA_CAB', QNFE_EmiteCOD_NOTA_CAB.Value);
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
              XML.Add(FormatFloat('#0.00',QContaReceberVAL_ORIGINAL.Value));
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
              XML.Add(FormatFloat('#0.00',DMNotaEntrada.QContaPagarVAL_ORIGINAL.Value));
              XML.Add('</vDup>');
            XML.Add('</dup>');
            DMNotaEntrada.QContaPagar.Next;
          end;
        end;
      XML.Add('</cobr>');

      wInfComplemento := '';
      if (QNFE_EmiteVAL_FUNRURAL.Value > 0) then
        wInfComplemento := 'Funrural: ' + Trim(QNFE_EmiteVAL_FUNRURAL.Text) + '. ';
      if (QNFE_EmiteOBS.Text <> '') then
        wInfComplemento := wInfComplemento + Trim(QNFE_EmiteOBS.Text) + '. ';
      if (QNFE_EmiteOBS_COMPLEMENTO.Text <> '') then
        wInfComplemento := wInfComplemento + Trim(QNFE_EmiteOBS_COMPLEMENTO.Text) + '. ';
      if (QNFE_EmiteDESC_OBS_CORPO_NOTA.Text <> '') then
        wInfComplemento := wInfComplemento + Trim(QNFE_EmiteDESC_OBS_CORPO_NOTA.Text) + '. ';
      if (wEmpresa = 'ABATE') and (QNFE_EmiteCOD_VENDEDOR.Text <> '') then
        wInfComplemento := wInfComplemento + 'Vendedor: ' + DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
            'COD_VENDEDOR = '+QNFE_EmiteCOD_VENDEDOR.Text) + '. ';
      If QNFE_EmiteCOD_NOTA_CAB_DEV_FIXAR.Text <> '' Then    // Acrescentado dia 18/12/2008 por Diego A. S.
        wInfComplemento := wInfComplemento + 'Devolucao ref nota fiscal: ' + Trim(DMOracle.BuscaNome('Select NUM_NOTA from Tb_Nota_Cab','Cod_Nota_Cab='+QNFE_EmiteCOD_NOTA_CAB_DEV_FIXAR.Text)) + '. ';

      wObsTrib := Trim(wObsTrib);
      if (wObsTrib <> '') then
        wInfComplemento := wInfComplemento + 'Obs. das tributacoes: ' + wObsTrib;
      wInfComplemento := Trim(StringReplace(wInfComplemento, chr(13), ' ', [rfReplaceAll]));
      if (wInfComplemento <> '') then
      begin
        XML.Add('<infAdic>');
//        XML.Add('<infAdFisco>');
//        XML.Add('</infAdFisco>');
        if (wInfComplemento <> '') then
        begin
          XML.Add('<infCpl>');
          XML.Add(wInfComplemento);
          XML.Add('</infCpl>');
        end;
{        if (wObsTrib <> '') then
        begin
        XML.Add('<obsCont xCampo="ObsTributacao">');
          XML.Add('<xTexto>');
          XML.Add(wObsTrib);
          XML.Add('</xTexto>');
        XML.Add('</obsCont>');
        end;}
//        XML.Add('<obsFisco xCampo="requerido">');
//          XML.Add('<xTexto>');
//          XML.Add('</xTexto>');
//        XML.Add('</obsFisco>');
//        XML.Add('<procRef>');
//          XML.Add('<nProc>');
//          XML.Add('</nProc>');
//          XML.Add('<indProc>');
//          XML.Add('</indProc>');
//        XML.Add('</procRef>');
        XML.Add('</infAdic>');
      end;
//      XML.Add('<exporta>');
//        XML.Add('<UFEmbarq>');
//        XML.Add('</UFEmbarq>');
//        XML.Add('<xLocEmbarq>');
//        XML.Add('</xLocEmbarq>');
//      XML.Add('</exporta>');
      {XML.Add('<compra>');
        XML.Add('<xNEmp>');
        XML.Add('</xNEmp>');
        XML.Add('<xPed>');
        XML.Add('</xPed>');
        XML.Add('<xCont>');
        XML.Add('</xCont>');
      XML.Add('</compra>');    }
    XML.Add('</infNFe>');
  XML.Add('</NFe>');
  XML.Text := LimpaStrXML(XML.Text);
  if not wFlagAgricola then
    wCaminho := RetornaCaminhoNfe
  else
    wCaminho := RetornaCaminhoLoteNfe;
  if (wCaminho = '') then
    Abort;

  XML.SaveToFile(wCaminho + Copy(Aux, 4, Length(Aux) - 3) + '-nfe.xml');
  end;
end;

end.
