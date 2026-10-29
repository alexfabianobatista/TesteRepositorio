unit UReceita_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables,OracleData, OraTeste;

type
  TDMReceita = class(TDataModule)
    DsReceitaCons: TDataSource;
    QRReceitaProdutos: TOracleDataSet1;
    QRReceitaPraga: TOracleDataSet1;
    QRReceitaPragaDESC_PRAGA: TStringField;
    QRReceitaPragaCOD_PRAGA: TIntegerField;
    QRReceita: TOracleDataSet1;
    QRReceitaCOD_AGRONOMO: TIntegerField;
    QRReceitaCOD_CULTURA: TIntegerField;
    QRReceitaCOD_PRODUTO: TFloatField;
    QRReceitaQT_PRODUTO: TFloatField;
    QRReceitaCOD_PRAGA: TIntegerField;
    QRReceitaCOD_NOTA_ITEM: TIntegerField;
    QRReceitaNUM_RECEITA: TIntegerField;
    QRReceitaDESC_PRAGA: TStringField;
    QRReceitaNOME_AGRONOMO: TStringField;
    QRReceitaDESC_CREA: TStringField;
    QRReceitaCPF_AGRONOMO: TStringField;
    QRReceitaESTADO_CADASTRO: TStringField;
    QRReceitaENDERECO_CADASTRO: TStringField;
    QRReceitaNOME_CADASTRO: TStringField;
    QRReceitaCIDADE_CADASTRO: TStringField;
    QRReceitaCGC_CPF_CADASTRO: TStringField;
    QRReceitaCEP_CADASTRO: TStringField;
    QRReceitaINSCRICAO_CADASTRO: TStringField;
    QRReceitaDESC_CULTURA: TStringField;
    QRReceitaCOD_FILIAL: TIntegerField;
    QRReceitaNOME_FILIAL: TStringField;
    QRReceitaCIDADE_FILIAL: TStringField;
    QRReceitaCEP_FILIAL: TStringField;
    QRReceitaENDERECO_FILIAL: TStringField;
    QRReceitaTELEFONE_FILIAL: TStringField;
    QRReceitaESTADO_FILIAL: TStringField;
    QRReceitaCGC_FILIAL: TStringField;
    QRReceitaINSCRICAO_FILIAL: TStringField;
    QRReceitaNUM_NOTA: TIntegerField;
    QRReceitaCOD_SERIE: TStringField;
    QRReceitaCOD_CADASTRO: TIntegerField;
    QRReceitaDT_EMISSAO: TDateTimeField;
    QRReceitaDESC_AGUA: TStringField;
    QRReceitaDESC_CARENCIA: TStringField;
    QRReceitaDESC_UTILIZACAO: TStringField;
    QRReceitaDESC_DESTINO: TStringField;
    QRReceitaDESC_AREA: TStringField;
    QRReceitaDESC_UNIDADE: TStringField;
    QRReceitaNUM_EMBALAGEM: TFloatField;
    QRReceitaQT_ADQUIRIR: TFloatField;
    QReceitaCons: TOracleDataSet1;
    QReceita: TOracleDataSet1;
    QReceitaCOD_AGRONOMO: TIntegerField;
    QReceitaCOD_CULTURA: TIntegerField;
    QReceitaQT_PRODUTO: TFloatField;
    QReceitaCOD_PRAGA_PRODUTO: TIntegerField;
    QReceitaCOD_NOTA_ITEM: TIntegerField;
    QReceitaNUM_RECEITA: TIntegerField;
    QReceitaDT_EMISSAO: TDateTimeField;
    QReceitaDESC_LOCAL_APLICACAO: TStringField;
    QRReceitaENDERECO_AGRONOMO: TStringField;
    QRReceitaCIDADE_AGRONOMO: TStringField;
    QRReceitaESTADO_AGRONOMO: TStringField;
    QRReceitaDESC_FORMULACAO: TStringField;
    QRReceitaDESC_GRUPO_QUIMICO: TStringField;
    QRReceitaProdutosNUM_EMBALAGEM: TFloatField;
    QRReceitaProdutosDESC_UNIDADE: TStringField;
    QRReceitaProdutosDESC_PRODUTO: TStringField;
    QRReceitaProdutosDESC_AGUA: TStringField;
    QRReceitaProdutosDESC_CARENCIA: TStringField;
    QRReceitaProdutosDESC_UTILIZACAO: TStringField;
    QRReceitaProdutosDESC_DESTINO: TStringField;
    QRReceitaProdutosCOD_MENS_RECEITA: TIntegerField;
    QRReceitaProdutosDESC_AREA: TStringField;
    QRReceitaProdutosCOD_PRAGA_PRODUTO: TIntegerField;
    QReceitaConsCOD_AGRONOMO: TIntegerField;
    QReceitaConsCOD_CULTURA: TIntegerField;
    QReceitaConsQT_PRODUTO: TFloatField;
    QReceitaConsCOD_NOTA_ITEM: TIntegerField;
    QReceitaConsNUM_RECEITA: TIntegerField;
    QReceitaConsDT_EMISSAO: TDateTimeField;
    QReceitaConsDESC_LOCAL_APLICACAO: TStringField;
    QReceitaConsDESC_CULTURA: TStringField;
    QReceitaConsCOD_PRAGA: TIntegerField;
    QReceitaConsDESC_PRAGA: TStringField;
    QReceitaConsCOD_PRODUTO: TFloatField;
    QRReceitaIND_CLASSE_TOX: TStringField;
    QRReceitaDESC_PRODUTO: TStringField;
    QReceitaConsulta: TOracleDataSet1;
    QReceitaConsultaNUM_RECEITA: TIntegerField;
    QReceitaConsultaNUM_NOTA: TIntegerField;
    QReceitaConsultaCOD_CADASTRO: TIntegerField;
    QReceitaConsultaNOME: TStringField;
    QReceitaConsultaDESC_PRODUTO: TStringField;
    QReceitaCab: TOracleDataSet1;
    QReceitaCabCOD_RECEITA_CAB: TIntegerField;
    QReceitaCabNUM_RECEITA: TIntegerField;
    QReceitaCabCOD_NOTA_CAB: TIntegerField;
    QReceitaConsCOD_RECEITA_CAB: TIntegerField;
    QReceitaCOD_RECEITA_CAB: TIntegerField;
    QReceitaCabDESC_OBS: TStringField;
    QReceitaCabDESC_PRECAUCAO: TStringField;
    QReceitaCabDESC_EPI: TStringField;
    QRReceitaDESC_OBS: TStringField;
    QRReceitaDESC_PRECAUCAO: TStringField;
    QRReceitaDESC_EPI: TStringField;
    QReceitaCabDESC_ORIENTACAO: TStringField;
    QRReceituario: TOracleDataSet1;
    QRReceituarioDESC_FILIAL: TStringField;
    QRReceituarioENDERECO_FILIAL: TStringField;
    QRReceituarioDESC_TELEFONE_FILIAL: TStringField;
    QRReceituarioNUM_CGC_FILIAL: TStringField;
    QRReceituarioDT_EMISSAO: TDateTimeField;
    QRReceituarioCADASTRO: TStringField;
    QRReceituarioDESC_ENDERECO_CADASTRO: TStringField;
    QRReceituarioNUM_NOTA: TIntegerField;
    QRReceituarioCOD_SERIE: TStringField;
    QRReceituarioDESC_CIDADE_CADASTRO: TStringField;
    QRReceituarioNUM_RECEITA: TIntegerField;
    QRReceituarioDESC_LOCAL_APLICACAO: TStringField;
    QRReceituarioDESC_CULTURA: TStringField;
    QRReceituarioCOD_CULTURA: TIntegerField;
    QRReceituarioDESC_PRAGA: TStringField;
    QRReceituarioDESC_PRODUTO: TStringField;
    QRReceituarioQT_ADQUIRIR: TFloatField;
    QRReceituarioDESC_UNIDADE: TStringField;
    QRReceituarioDESC_AGUA: TStringField;
    QRReceituarioDESC_CARENCIA: TStringField;
    QRReceituarioIND_CLASSE_TOX: TStringField;
    QRReceituarioDESC_UTILIZACAO: TStringField;
    QRReceituarioCOD_PRODUTO: TFloatField;
    QRReceituarioDESC_OBS: TStringField;
    QRReceituarioDESC_PRECAUCAO: TStringField;
    QRReceituarioNOME_AGRONOMO: TStringField;
    QRReceituarioDESC_CREA: TStringField;
    QRReceituarioDESC_CPF_AGRONOMO: TStringField;
    QRReceituarioDESC_DESTINO: TStringField;
    QRReceituarioDESC_AREA: TStringField;
    QRReceituarioQT_AREA: TFloatField;
    QRReceituarioIND_AREA: TStringField;
    QReceitaCabNUM_APLICACAO: TIntegerField;
    QRReceitaDESC_UNIDADE_DOSAGEM: TStringField;
    QRReceitaVISTO_AGRONOMO: TIntegerField;
    QRReceitaDESC_CONCENTRACAO: TStringField;
    QReceitaCOD_CIDADE_APLICACAO: TIntegerField;
    QRReceitaDESC_LOCAL_APLICACAO: TStringField;
    QReceitaCabNUM_ART_RELACIONADA: TStringField;
    QReceitaCabCOD_MENS_RECEITA: TIntegerField;
    QRReceituarioDESC_EPI: TStringField;
    QRReceituarioDESC_PRECAUCAO_MENS: TStringField;
    QRReceituarioNUM_APLICACAO: TIntegerField;
    QRReceitaNUM_DOSE: TFloatField;
    QRReceitaProdutosNUM_DOSE: TFloatField;
    QRReceituarioNUM_DOSE: TFloatField;
    QRReceitaART: TStringField;
    QRReceitaRel: TOracleDataSet1;
    QRReceitaRelNOME_AGRONOMO: TStringField;
    QRReceitaRelNUM_ART: TStringField;
    QRReceitaRelNUM_RECEITA: TIntegerField;
    QRReceitaRelDT_EMISSAO: TDateTimeField;
    QRReceitaRelDESC_LOCAL_APLICACAO: TStringField;
    QRReceitaRelCOD_CIDADE: TIntegerField;
    QRReceitaRelDESC_CIDADE: TStringField;
    QRReceitaRelCOD_AGRONOMO: TIntegerField;
    QRReceituarioCOD_NOTA_CAB: TIntegerField;
    QReceitaLatitudeLongitude: TOracleDataSet1;
    QRReceituarioDESC_LATITUDE: TStringField;
    QRReceituarioDESC_LONGITUDE: TStringField;
    QReceitaCabIND_EMITIDA: TStringField;
    QRReceituarioIND_TECNICO: TStringField;
    QRReceituarioNUM_ART_RELACIONADA: TStringField;
  private
    { Private declarations }
    fNome_Tela : String;  // serve para verificar se esta chamando a receita da nota ou do módulo de receita
    Procedure EmiteReceitaMoinho;
    Procedure EmiteReceitaBrasperon;
    Procedure EmiteReceitaAB;
    Procedure EmiteGuiaAplicacao;
    Procedure EmiteReceitaIrrigassolo;
    Procedure EmiteReceitaMultagro;
//    Procedure Imprime_Obs; // procedure que imprime a observacao do cadastro praga/produto
  public
    { Public declarations }
    Procedure EmiteReceita(wReceita, wFilial : Integer);
    Procedure EmiteGuiaAplicacaoBrasperon(wReceita, wFilial : Integer);
    Property pNome_Tela : String Read fNome_Tela Write fNome_Tela;
  end;

var
  DMReceita: TDMReceita;
  wGuiaDose,wGuiaQuant,wGuiaCodProd,wGuiaEmbalagem : Array[1..8] of Real;
  wGuiaCultura,wGuiaProduto,wGuiaArea : Array[1..8] of String;
  wCont, wI_Guia : Integer;

implementation

{$R *.DFM}

Uses UOracle_cl, UBiblioteca, UParamSistema_cl, UGuiaAplicacao_cl, URGuiaAplicacao,
  USequencia_cl;

{ TDMReceita }

procedure TDMReceita.EmiteReceita(wReceita,wFilial : Integer);
begin
  // Emissão de Receita
  QRReceita.Close;
  QRReceita.SetVariable('NUM_RECEITA',wReceita);
  QRReceita.SetVariable('COD_FILIAL',wFilial);
  QRReceita.Open;
  If Imp = Nil Then
    Imp := TImp.Create;
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' Then
  Begin
    Imp.AbreImpressora;
    Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',66);
    EmiteReceitaMoinho;
  End;
  If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AB') Then
  Begin
    Imp.AbreImpressora;
    Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',68);
    EmiteReceitaAB;
  End;
  If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GONZATTI') Then
  Begin
//    Imp.AbreImpressora_Lpt2;
    Imp.AbreImpressora;
    Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',51);
    EmiteReceitaBrasperon;
  End;
  If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'IRRIGASOLO') Then
  Begin
//    Imp.AbreImpressora_Lpt2;
    Imp.AbreImpressora;
    Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
    EmiteReceitaIrrigassolo;
  End;
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MULTAGRO' Then
  Begin
    Imp.AbreImpressora;
    Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',66);
    EmiteReceitaMultagro;
  End;
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao
  QRReceita.Close;
end;

procedure TDMReceita.EmiteReceitaBrasperon;
Var wItemProduto,wI,wCulturaAnterior,wQbCont : Integer;
    wVetUtilizacao,wVetUtilEmbalagem,wVetProduto,wVetUnidade,wVetAgua,wVetCarencia,wVetClassToxicologica,wVetArea : Array[1..5] of String;
    wVetAdquirir,wVetDose : Array[1..5] of Real;
    wLinhaExt1,wLinhaExt2,wString1:String;
    wOk   : Boolean;
    Msg: TMensagem;
Begin
  wI_Guia := 0;
  While not QRReceita.Eof do
  Begin
    // *** 0 ***
    wCont := 2;
    Imp.WriteXY(2.5,wCont,QRReceitaNome_Filial.Value);
    wCont := wCont+1;
    Imp.WriteXY(2.5,wCont,QRReceitaEndereco_Filial.Value);
    Imp.WriteXY(2.5,wCont,' - '+QRReceitaCidade_Filial.Value);
    Imp.WriteXY(2.5,wCont,' - '+QRReceitaEstado_Filial.Value);
    Inc(wCont);
    Imp.WriteXY(2.5,wCont,'FONE: '+QRReceitaTELEFONE_FILIAL.Value);
    Imp.WriteXY(5.5,wCont,'CGC: '+QRReceitaCGC_FILIAL.Value);
    Imp.WriteXY(10.5,wCont,'DT.EMISSAO: '+DateToStr(QRReceitaDT_EMISSAO.Value));
    // *** 1 ***
    wCont := 6;
    Imp.WriteXY(2.5,wCont,Trim(QRReceitaNome_Cadastro.Text)+'-'+QRReceitaCod_Cadastro.Text);
    wCont := wCont+1;
    Imp.WriteXY(2.5,wCont,QRReceitaENDERECO_Cadastro.Value);
    Imp.WriteXY(13.2,wCont,Bib.NumToTexto(QRReceitaNum_Nota.Value,0,6));
    Imp.WriteXY(14.4,wCont,QRReceitaCod_Serie.Value);
    wCont := wCont+1;
    Imp.WriteXY(2.5,wCont,QRReceitaCIDADE_Cadastro.Value);
    Imp.WriteXY(13,wCont,Bib.NumToTexto(QRReceitaNum_Receita.Value,0,6));
    wCont := wCont+1;
    Imp.WriteXY(2.5,wCont,QRReceitaDesc_Local_Aplicacao.Value);

    // *** 2 ***
    wCont := 11;
    Imp.WriteXY(1,wCont,QRReceitaDesc_Cultura.Value);
    wCulturaAnterior := QRReceitaCod_Cultura.Value;
    wItemProduto := 0;
    wI := 0;
    While (wCulturaAnterior = QRReceitaCod_Cultura.Value)
        and (not QRReceita.Eof) do
    Begin
      Inc(wI);
      Imp.WriteXY(2,wCont,IntToStr(wI)+'-'+QRReceitaDesc_Praga.Value);
      Inc(wItemProduto);
      wVetProduto[wItemProduto] := QRReceitaDESC_PRODUTO.Value;
      wVetAdquirir[wItemProduto] := QRReceitaQT_ADQUIRIR.Value;
      if ((QRReceitaDesc_Unidade.Value = 'GL') or (QRReceitaDesc_Unidade.Value = 'BD')) then
        QRReceitaDesc_Unidade.Value := 'LT';
      if QRReceitaDesc_Unidade.Value = 'PCT' then
        QRReceitaDesc_Unidade.Value := 'KG';
      wVetUnidade[wItemProduto] := QRReceitaDesc_Unidade.Value;
      wVetDose[wItemProduto] := QRReceitaNUM_DOSE.Value;
      wVetAgua[wItemProduto] := QRReceitaDESC_AGUA.Value;
      wVetCarencia[wItemProduto] := QRReceitaDESC_CARENCIA.Value;
      wVetClassToxicologica[wItemProduto] := QRReceitaIND_CLASSE_TOX.Value;
      wVetUtilizacao[wItemProduto] := QRReceitaDESC_UTILIZACAO.Value;
      wVetUtilEmbalagem[wItemProduto] := QRReceitaDESC_DESTINO.Value;
      if not QRReceitaDESC_UNIDADE_DOSAGEM.IsNull then
        wVetArea[wItemProduto] := QRReceitaDESC_UNIDADE_DOSAGEM.Value
      else
        wVetArea[wItemProduto] := QRReceitaDESC_AREA.Value;
      With DMGuiaAplicacao do
      Begin
        QGuiaAplicacao.Close;
        QGuiaAplicacao.SetVariable('PK',QRReceitaCod_Produto.Value);
        QGuiaAplicacao.Open;
        If Not QGuiaAplicacao.Eof Then
         Begin
           Inc(wI_guia);
           wGuiaDose[wI_Guia] := QRReceitaNUM_DOSE.Value;
           wGuiaQuant[wI_Guia] := QRReceitaQT_ADQUIRIR.Value;
           wGuiaCultura[wI_Guia] := QRReceitaDesc_Cultura.Value;
           wGuiaProduto[wI_Guia] := QRReceitaDESC_PRODUTO.Value;
           wGuiaCodProd[wI_Guia] := QRReceitaCOD_PRODUTO.Value;
           wGuiaEmbalagem[wI_Guia] := QRReceitaNUM_EMBALAGEM.Value;
           if not QRReceitaDESC_UNIDADE_DOSAGEM.IsNull then
             wGuiaArea[wI_Guia] := QRReceitaDESC_UNIDADE_DOSAGEM.Value
           else
             wGuiaArea[wI_Guia] := QRReceitaDESC_AREA.Value;
         End;
      End;
      wCont := wCont + 1;
      QRReceita.Next;
      If wI = 4 Then
         Break;
    End;
    // *** 3 ***
    wCont := 18;
    wI := 1;
    While wI <= wItemProduto do
    Begin
      Imp.WriteXY(0,wCont,IntToStr(wI));
      Imp.WriteXY(0.5,wCont,wVetProduto[wI]);
      Imp.WriteXY(5.8,wCont,Bib.NumToTexto(wVetAdquirir[wI],2,8));
      Imp.WriteXY(7.4,wCont,wVetUnidade[wI]);
      If wVetDose[wI] = 0 Then
         Imp.WriteXY(8,wCont,wVetArea[wI])
      Else
       Begin
        Imp.WriteXY(7.8,wCont,Bib.NumToTexto(wVetAdquirir[wI]/wVetDose[wI],2,10 ));
        Imp.WriteXY(9.4,wCont,Bib.NumToTexto(wVetDose[wI],2,8));
       End;
      Imp.WriteXY(11.1,wCont,wVetAgua[wI]);
      Imp.WriteXY(12.9,wCont,wVetCarencia[wI]);
      Imp.WriteXY(14.2,wCont,wVetClassToxicologica[wI]);
      wCont := wCont+1;
      Inc(wI);
    End;
    wCont := 23;
    For wI := 1 to wItemProduto do
    Begin
      Imp.WriteXY(0,wCont,IntToStr(wI)+'-');
      wString1 := wVetUtilizacao[wI];
      while Pos(chr(13), wsTring1) > 0 do
          wString1[Pos(chr(13), wsTring1)] := ' ';
      while Pos(chr(10), wsTring1) > 0 do
          wString1[Pos(chr(10), wsTring1)] := ' ';
      Bib.QuebraString(wString1,90,wLinhaExt1,wLinhaExt2,' ');   // 103
      Imp.WriteXY(0.2,wCont,wLinhaExt1);
      wCont := wCont + 1;
      If 90 >= Length(wLinhaExt2) then        //somente para fazer a terceira linha
        wQbCont := Length(wLinhaExt2)        //da mensagem do modo de aplicacao da receita
      Else
        Begin
          wOk := False;
          wQbCont := 90;
          While (wQbCont > 0) and (wOk = False) do
          Begin
            If wLinhaExt2[wQbCont] = ' ' then
              wOk := True
            Else
              Dec(wQbCont);
          End;
        End;
      wLinhaExt1 := Copy(wLinhaExt2,1,wQbCont);
      wLinhaExt2 := Copy(wLinhaExt2,wQbCont+1,Length(wLinhaExt2)); // ate aqui
      Imp.WriteXY(0.2,wCont,wLinhaExt1);
      If wLinhaExt2 <> '' Then
      Begin
        wCont := wCont + 1;
        Imp.WriteXY(0.2,wCont,wLinhaExt2);
      End;
      wCont := wCont + 1;
    End;
    Inc(wCont,1);
    Msg := TMensagem.Create(QRReceitaDESC_OBS.Value, 97);
    Msg.CortaPalavra := False; //Não cortar as palavras pela metade.
    while Msg.HasNext do
    begin
      Imp.WriteXY(0, wCont, Msg.Next);
      Inc(wCont);
    end;

    wCont := 38;
    Msg.Mensagem := QRReceitaDESC_PRECAUCAO.Value;
    while Msg.HasNext do
    begin
      Imp.WriteXY(0, wCont, Msg.Next);
      Inc(wCont);
    end;
    Msg.Mensagem := 'Endereco para entrega de embalagens vazias (triplice lavadas): ' +
        QRReceitaDESC_DESTINO.Value;
    while Msg.HasNext do
    begin
      Imp.WriteXY(0, wCont, Msg.Next);
      Inc(wCont);
    end;

    wCont := 43;
    Imp.WriteXY(10.3,wCont,QRReceitaNOME_AGRONOMO.Value);
    wCont := wCont+1;
    Imp.WriteXY(10.3,wCont,QRReceitaDESC_CREA.Value);
    wCont := wCont+1;
    Imp.WriteXY(10.3,wCont,QRReceitaCPF_AGRONOMO.Value);

    Imp.SaltaPagina;
//    QRReceita.Next;
  End;
  Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',66);
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao
  EmiteGuiaAplicacao;
end;

procedure TDMReceita.EmiteReceitaMoinho;
Var wCulturaAnterior : Real;
    wLinhaExt1,wLinhaExt2,wString1:String;
begin
  wI_Guia := 0;
  While not QRReceita.Eof do
  Begin
    wCont := 11;
    Imp.WriteXY(2,wCont,QRReceitaNome_Agronomo.Value);
    Imp.WriteXY(11,wCont,QRReceitaDesc_Crea.Value);
    wCont := wCont+1;
    Imp.WriteXY(2,wCont,QRReceitaEndereco_Agronomo.Value);
    Imp.WriteXY(12.8,wCont,QRReceitaCidade_Agronomo.Value);
    Imp.WriteXY(19,wCont,QRReceitaEstado_Agronomo.Value);
    wCont := wCont+1;
    Imp.WriteXY(6,wCont,Bib.NumToTexto(QRReceitaNum_Nota.Value,0,8));
    Imp.WriteXY(9.5,wCont,QRReceitaCod_Serie.Value);
    Imp.WriteXY(14,wCont,QRReceitaDt_Emissao.Text);
    Imp.WriteXY(18.5,wCont,QRReceitaNum_Receita.Text);
    wCont := wCont+2;
    Imp.WriteXY(1.3,wCont,QRReceitaNome_Cadastro.Value);
    wCont := wCont + 1;
    Imp.WriteXY(2.5,wCont,QRReceitaDesc_Local_Aplicacao.Value);
    wCont := wCont + 2;
    Imp.WriteXY(1.3,wCont,QRReceitaDesc_Cultura.Value);
    If QRReceitaNUM_DOSE.Value = 0 Then
       Imp.WriteXY(17.5,wCont,QRReceitaDESC_AREA.Value)
    Else
        Imp.WriteXY(17.5,wCont,Bib.NumToTexto(QRReceitaQT_ADQUIRIR.Value/QRReceitaNUM_DOSE.Value,2,10));
    wCont := wCont + 1;
    Imp.WriteXY(1.5,wCont,QRReceitaDesc_Praga.Value);
    wCont := wCont + 5;
    Imp.WriteXY(1.4,wCont,QRReceitaDESC_PRODUTO.Value);
    wCont := wCont + 1;
    Imp.WriteXY(2,wCont,QRReceitaDesc_Grupo_Quimico.Value);
    Imp.WriteXY(19,wCont,QRReceitaIND_CLASSE_TOX.Value);
    wCont := wCont + 1;
    Imp.WriteXY(1,wCont,Bib.NumToTexto(QRReceitaNUM_DOSE.Value,2,8)+' - '+QRReceitaDESC_AREA.Value);
    Imp.WriteXY(10,wCont,'Utilizar:'+QRReceitaDesc_Agua.Value);
    Imp.WriteXY(19,wCont,'1');
    wCont := wCont + 1;
    Imp.WriteXY(1.7,wCont,QRReceitaDesc_Formulacao.Value);
    Imp.WriteXY(11,wCont,QRReceitaDesc_Carencia.Value);
    Imp.WriteXY(13,wCont,Bib.NumToTexto(QRReceitaQT_ADQUIRIR.Value,2,10));
    wString1 := QRReceitaDESC_UTILIZACAO.Value;
    while Pos(chr(13), wsTring1) > 0 do
        wString1[Pos(chr(13), wsTring1)] := ' ';
    while Pos(chr(10), wsTring1) > 0 do
        wString1[Pos(chr(10), wsTring1)] := ' ';
    Bib.QuebraString(wString1,120,wLinhaExt1,wLinhaExt2,' *');   // 103
    wCont := wCont + 2;
    Imp.WriteXY(0.2,wCont,wLinhaExt1);
    wCont := wCont + 1;
    Imp.WriteXY(0.2,wCont,wLinhaExt2);
    wCont := wCont + 1;
    Imp.WriteXY(0,wCont,'------------------------------------------------------------------------------------------------------------------');
    With DMGuiaAplicacao do
    Begin
      QGuiaAplicacao.Close;
      QGuiaAplicacao.SetVariable('PK',QRReceitaCod_Produto.Value);
      QGuiaAplicacao.Open;
      If Not QGuiaAplicacao.Eof Then
       Begin
         Inc(wI_guia);
         wGuiaDose[wI_Guia] := QRReceitaNUM_DOSE.Value;
         wGuiaQuant[wI_Guia] := QRReceitaQT_ADQUIRIR.Value;
         wGuiaCultura[wI_Guia] := QRReceitaDesc_Cultura.Value;
         wGuiaProduto[wI_Guia] := QRReceitaDESC_PRODUTO.Value;
         wGuiaCodProd[wI_Guia] := QRReceitaCOD_PRODUTO.Value;
         wGuiaEmbalagem[wI_Guia] := QRReceitaNUM_EMBALAGEM.Value;
       End;
    End;
    wCulturaAnterior := QRReceitaCod_Cultura.Value;
    QRReceita.Next;
    While (wCulturaAnterior = QRReceitaCod_Cultura.Value)
        and (not QRReceita.Eof) do
    Begin
      wCont := wCont+1;
      Imp.WriteXY(0,wCont,'Produto: '+QRReceitaDESC_PRODUTO.Value);
      Imp.WriteXY(11,wCont,'Grupo Quimico:'+QRReceitaDesc_Grupo_Quimico.Value);
      Imp.WriteXY(14,wCont,'Cl.Toxicológica:'+QRReceitaIND_CLASSE_TOX.Value);
      wCont := wCont+1;
      Imp.WriteXY(1,wCont,' Dose: '+Bib.NumToTexto(QRReceitaNUM_DOSE.Value,2,8)+' - '+QRReceitaDESC_AREA.Value);
      Imp.WriteXY(8,wCont,'Concentraco:'+QRReceitaDesc_Agua.Value);
      Imp.WriteXY(8,wCont,'Nr. Aplicacoes: 1');
      wCont := wCont + 1;
      Imp.WriteXY(0,wCont,'Formulacao:'+QRReceitaDesc_Formulacao.Value);
      Imp.WriteXY(8,wCont,'Intevalo de Carencia:'+QRReceitaDesc_Carencia.Value);
      Imp.WriteXY(12,wCont,'Total:');
      Imp.WriteXY(13,wCont,Bib.NumToTexto(QRReceitaQT_ADQUIRIR.Value,2,10));
      wCont := wCont+1;
      wString1 := QRReceitaDESC_UTILIZACAO.Value;
      while Pos(chr(13), wsTring1) > 0 do
          wString1[Pos(chr(13), wsTring1)] := ' ';
      while Pos(chr(10), wsTring1) > 0 do
          wString1[Pos(chr(10), wsTring1)] := ' ';
      Bib.QuebraString(wString1,120,wLinhaExt1,wLinhaExt2,' *');   // 103
      Imp.WriteXY(0.2,wCont,wLinhaExt1);
      wCont := wCont + 1;
      Imp.WriteXY(0.2,wCont,wLinhaExt2);
      wCont := wCont + 1;
      Imp.WriteXY(0,wCont,'------------------------------------------------------------------------------------------------------------------');
      With DMGuiaAplicacao do
      Begin
        QGuiaAplicacao.Close;
        QGuiaAplicacao.SetVariable('PK',QRReceitaCod_Produto.Value);
        QGuiaAplicacao.Open;
        If Not QGuiaAplicacao.Eof Then
         Begin
           Inc(wI_guia);
           wGuiaDose[wI_Guia] := QRReceitaNUM_DOSE.Value;
           wGuiaQuant[wI_Guia] := QRReceitaQT_ADQUIRIR.Value;
           wGuiaCultura[wI_Guia] := QRReceitaDesc_Cultura.Value;
           wGuiaProduto[wI_Guia] := QRReceitaDESC_PRODUTO.Value;
           wGuiaCodProd[wI_Guia] := QRReceitaCOD_PRODUTO.Value;
           wGuiaEmbalagem[wI_Guia] := QRReceitaNUM_EMBALAGEM.Value;
         End;
      End;
      QRReceita.Next;
    End;
    wCont:=wCont + 1;
    Imp.WriteXY(0,wCont,'Usar Equipamento de Protecao Individual    -     Ler Atentamente o Rotulo do Produto');
    wCont:=wCont + 1;
    Imp.WriteXY(0,wCont,'Armazenar As Embalagens em Local Seco e Seguro');
    wCont := 61;
    Imp.WriteXY(0,wCont,QRReceitaCidade_Filial.Value);
    Imp.WriteXY(3,wCont,QRReceitaDt_Emissao.Text);
    Imp.WriteXY(11,wCont,QRReceitaNome_Agronomo.Value);
    wCont := wCont+1;
    Imp.WriteXY(0,wCont,QRReceitaNome_Cadastro.Value);
    Imp.WriteXY(11,wCont,QRREceitaCPF_Agronomo.Value);
    Imp.WriteXY(15.5,wCont,QRReceitaDesc_Crea.Value);
    Imp.SaltaPagina;
  End;
  Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',66);
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao
  EmiteGuiaAplicacao;
end;

procedure TDMReceita.EmiteReceitaMultagro;
Var wCulturaAnterior : Real;
    wLinhaExt1,wLinhaExt2,wString1:String;
    wAux: Integer;
begin
  wI_Guia := 0;
  While not QRReceita.Eof do
  Begin
    wCont := 10;
    Imp.WriteXY(2,wCont,QRReceitaNome_Agronomo.Value);
    Imp.WriteXY(11.8,wCont,QRReceitaDesc_Crea.Value);
    Imp.WriteXY(15.8,wCont, QRReceitaVISTO_AGRONOMO.Text);
    wCont := wCont+1;
    Imp.WriteXY(2,wCont,QRReceitaEndereco_Agronomo.Value);
    Imp.WriteXY(13.2,wCont,QRReceitaCidade_Agronomo.Value);
    Imp.WriteXY(19,wCont,QRReceitaEstado_Agronomo.Value);
    wCont := wCont+1;
    Imp.WriteXY(2,wCont, QRReceitaART.Value);
    Imp.WriteXY(6,wCont,Bib.NumToTexto(QRReceitaNum_Nota.Value,0,8));
    Imp.WriteXY(9.5,wCont,QRReceitaCod_Serie.Value);
    Imp.WriteXY(14,wCont,QRReceitaDt_Emissao.Text);
    Imp.WriteXY(18.5,wCont,QRReceitaNum_Receita.Text);
    wCont := wCont+2;
    Imp.WriteXY(1.3,wCont,QRReceitaNome_Cadastro.Value);
    wCont := wCont + 1;
    Imp.WriteXY(2.5,wCont,QRReceitaDesc_Local_Aplicacao.Value);
    wCont := wCont + 2;
    Imp.WriteXY(1.3,wCont,QRReceitaDesc_Cultura.Value);
    If QRReceitaNUM_DOSE.Value = 0 Then
       Imp.WriteXY(17.5,wCont,QRReceitaDESC_AREA.Value)
    Else
        Imp.WriteXY(17.5,wCont,Bib.NumToTexto(QRReceitaQT_ADQUIRIR.Value/QRReceitaNUM_DOSE.Value,2,10));
    wCont := wCont + 1;
    Imp.WriteXY(1.8,wCont,QRReceitaDesc_Praga.Value);
    wCont := wCont + 5;
    Imp.WriteXY(1.4,wCont,QRReceitaDESC_PRODUTO.Value);
    wCont := wCont + 1;
    Imp.WriteXY(2,wCont,QRReceitaDesc_Grupo_Quimico.Value);
    Imp.WriteXY(13.2,wCont,QRReceitaDESC_CONCENTRACAO.Value);
    Imp.WriteXY(19,wCont,QRReceitaIND_CLASSE_TOX.Value);
    wCont := wCont + 1;
    Imp.WriteXY(1,wCont,Bib.NumToTexto(QRReceitaNUM_DOSE.Value,2,8)+' - '+QRReceitaDESC_UNIDADE_DOSAGEM.Value);
    Imp.WriteXY(10,wCont,'Utilizar:'+QRReceitaDesc_Agua.Value);
    Imp.WriteXY(19,wCont,'1');
    wCont := wCont + 1;
    Imp.WriteXY(1.7,wCont,QRReceitaDesc_Formulacao.Value);
    Imp.WriteXY(11.6,wCont,QRReceitaDesc_Carencia.Value);
    if ((QRReceitaDESC_UNIDADE.Value = 'GL') or (QRReceitaDesc_Unidade.Value = 'BD') or (QRReceitaDesc_Unidade.Value = 'FRL')) then
        QRReceitaDESC_UNIDADE.Value := 'LT'
    else if (QRReceitaDESC_UNIDADE.Value = 'PCT') or (QRReceitaDESC_UNIDADE.Value = 'FRC') then
        QRReceitaDESC_UNIDADE.Value := 'KG';
    Imp.WriteXY(13,wCont,Bib.NumToTexto(QRReceitaQT_ADQUIRIR.Value,2,10) + QRReceitaDESC_UNIDADE.Value);
    wString1 := QRReceitaDESC_UTILIZACAO.Value;
    while Pos(chr(13), wsTring1) > 0 do
        wString1[Pos(chr(13), wsTring1)] := ' ';
    while Pos(chr(10), wsTring1) > 0 do
        wString1[Pos(chr(10), wsTring1)] := ' ';
    wCont := wCont + 2;

    wAux := 0;              //Alterado para imprimir toda a descrição. Imprimia apenas 240 caracteres. Rotina anterior está no bloco abaixo, comentada. Alessandro 20/08/2012.
    while (Length(wString1) >= wAux) do
    begin
      if Length(wString1) >= wAux + 120 then
        Imp.WriteXY(1,wCont,Copy(wString1, wAux + 1, 120))
      else
        Imp.WriteXY(1,wCont,Copy(wString1, wAux + 1, length(wString1) - wAux));
      wCont := wCont + 1;
      wAux := wAux + 120;
    end;

    {Bib.QuebraString(wString1,120,wLinhaExt1,wLinhaExt2,' *');   // 103
    Imp.WriteXY(1,wCont,wLinhaExt1);
    wCont := wCont + 1;
    Imp.WriteXY(1,wCont,wLinhaExt2);
    wCont := wCont + 1; }

    Imp.WriteXY(1,wCont,'------------------------------------------------------------------------------------------------------------------');
    With DMGuiaAplicacao do
    Begin
      QGuiaAplicacao.Close;
      QGuiaAplicacao.SetVariable('PK',QRReceitaCod_Produto.Value);
      QGuiaAplicacao.Open;
      If Not QGuiaAplicacao.Eof Then
       Begin
         Inc(wI_guia);
         wGuiaDose[wI_Guia] := QRReceitaNUM_DOSE.Value;
         wGuiaQuant[wI_Guia] := QRReceitaQT_ADQUIRIR.Value;
         wGuiaCultura[wI_Guia] := QRReceitaDesc_Cultura.Value;
         wGuiaProduto[wI_Guia] := QRReceitaDESC_PRODUTO.Value;
         wGuiaCodProd[wI_Guia] := QRReceitaCOD_PRODUTO.Value;
         wGuiaEmbalagem[wI_Guia] := QRReceitaNUM_EMBALAGEM.Value;
       End;
    End;
    wCulturaAnterior := QRReceitaCod_Cultura.Value;
    QRReceita.Next;
    While (wCulturaAnterior = QRReceitaCod_Cultura.Value)
        and (not QRReceita.Eof) do
    Begin
      wCont := wCont+1;
      Imp.WriteXY(1,wCont,'Produto: '+QRReceitaDESC_PRODUTO.Value);
      Imp.WriteXY(11,wCont,'Grupo Quimico:'+QRReceitaDesc_Grupo_Quimico.Value);
      Imp.WriteXY(14,wCont,'Cl.Toxicológica:'+QRReceitaIND_CLASSE_TOX.Value);
      wCont := wCont+1;
      Imp.WriteXY(1,wCont,' Dose: '+Bib.NumToTexto(QRReceitaNUM_DOSE.Value,2,8)+' - '+QRReceitaDESC_AREA.Value);
      Imp.WriteXY(8,wCont,'Concentraco:'+QRReceitaDesc_Agua.Value);
      Imp.WriteXY(8,wCont,'Nr. Aplicacoes: 1');
      wCont := wCont + 1;
      Imp.WriteXY(1,wCont,'Formulacao:'+QRReceitaDesc_Formulacao.Value);
      Imp.WriteXY(8,wCont,'Intevalo de Carencia:'+QRReceitaDesc_Carencia.Value);
      Imp.WriteXY(12,wCont,'Total:');
      Imp.WriteXY(13,wCont,Bib.NumToTexto(QRReceitaQT_ADQUIRIR.Value,2,10));
      wCont := wCont+1;
      wString1 := QRReceitaDESC_UTILIZACAO.Value;
      while Pos(chr(13), wsTring1) > 0 do
          wString1[Pos(chr(13), wsTring1)] := ' ';
      while Pos(chr(10), wsTring1) > 0 do
          wString1[Pos(chr(10), wsTring1)] := ' ';
      Bib.QuebraString(wString1,120,wLinhaExt1,wLinhaExt2,' *');   // 103
      Imp.WriteXY(1,wCont,wLinhaExt1);
      wCont := wCont + 1;
      Imp.WriteXY(1,wCont,wLinhaExt2);
      wCont := wCont + 1;
      Imp.WriteXY(1,wCont,'------------------------------------------------------------------------------------------------------------------');
      With DMGuiaAplicacao do
      Begin
        QGuiaAplicacao.Close;
        QGuiaAplicacao.SetVariable('PK',QRReceitaCod_Produto.Value);
        QGuiaAplicacao.Open;
        If Not QGuiaAplicacao.Eof Then
         Begin
           Inc(wI_guia);
           wGuiaDose[wI_Guia] := QRReceitaNUM_DOSE.Value;
           wGuiaQuant[wI_Guia] := QRReceitaQT_ADQUIRIR.Value;
           wGuiaCultura[wI_Guia] := QRReceitaDesc_Cultura.Value;
           wGuiaProduto[wI_Guia] := QRReceitaDESC_PRODUTO.Value;
           wGuiaCodProd[wI_Guia] := QRReceitaCOD_PRODUTO.Value;
           wGuiaEmbalagem[wI_Guia] := QRReceitaNUM_EMBALAGEM.Value;
         End;
      End;
      QRReceita.Next;
    End;
    wCont:=wCont + 1;
    Imp.WriteXY(1,wCont,'Usar Equipamento de Protecao Individual    -     Ler Atentamente o Rotulo do Produto');
    wCont:=wCont + 1;
    Imp.WriteXY(1,wCont,'Armazenar As Embalagens em Local Seco e Seguro, em deposito fechado e adequado para armazenagem');
    wCont := 60;
    Imp.WriteXY(1,wCont,QRReceitaCidade_Filial.Value);
    Imp.WriteXY(3,wCont,QRReceitaDt_Emissao.Text);
    Imp.WriteXY(12,wCont,QRReceitaNome_Agronomo.Value);
    wCont := wCont+1;
    Imp.WriteXY(1,wCont,QRReceitaNome_Cadastro.Value);
    Imp.WriteXY(12,wCont,QRREceitaCPF_Agronomo.Value);
    Imp.WriteXY(16.8,wCont,QRReceitaDesc_Crea.Value);
    Imp.SaltaPagina;
  End;
  //Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',66);
  //Imp.FechaImpressora;  // Finaliza os serviços de Impressao
  EmiteGuiaAplicacao;
end;

procedure TDMReceita.EmiteReceitaAB;
Var wItemProduto,wI,wCulturaAnterior,wQbCont : Integer;
    wVetUtilizacao,wVetUtilEmbalagem,wVetProduto,wVetUnidade,wVetAgua,wVetCarencia,wVetClassToxicologica,wVetArea : Array[1..5] of String;
    wVetAdquirir,wVetDose : Array[1..5] of Real;
    wLinhaExt1,wLinhaExt2,wString1:String;
    wOk   : Boolean;
begin
  wI_Guia := 0;
  While not QRReceita.Eof do
  Begin
    // *** 0 ***
    wCont := 1;
    Imp.WriteXY(2.5,wCont,QRReceitaNome_Filial.Value);
    wCont := wCont+1;
    Imp.WriteXY(2.5,wCont,QRReceitaEndereco_Filial.Value);
    wCont := wCont+1;
    Imp.WriteXY(2.5,wCont,QRReceitaCidade_Filial.Value);
    Imp.WriteXY(2.5,wCont,' - '+QRReceitaEstado_Filial.Value);
    Inc(wCont);
    Imp.WriteXY(2.5,wCont,'CGC: '+QRReceitaCGC_FILIAL.Value);
    Inc(wCont);
    Imp.WriteXY(2.5,wCont,'FONE: '+QRReceitaTELEFONE_FILIAL.Value);
    Imp.WriteXY(9,wCont,'DT.EMISSAO: '+DateToStr(QRReceitaDT_EMISSAO.Value));
    // *** 1 ***
    wCont := wCont+3;
    Imp.WriteXY(2.5,wCont,Trim(QRReceitaNome_Cadastro.Text)+'-'+QRReceitaCod_Cadastro.Text);
    wCont := wCont+1;
    Imp.WriteXY(2.5,wCont,QRReceitaENDERECO_Cadastro.Value);
    Imp.WriteXY(13.2,wCont,Bib.NumToTexto(QRReceitaNum_Nota.Value,0,6));
    Imp.WriteXY(14.4,wCont,QRReceitaCod_Serie.Value);
    wCont := wCont+1;
    Imp.WriteXY(2.5,wCont,QRReceitaCIDADE_Cadastro.Value);
    wCont := wCont+1;
    Imp.WriteXY(13,wCont,Bib.NumToTexto(QRReceitaNum_Receita.Value,0,6));
    wCont := wCont+1;
    Imp.WriteXY(2.5,wCont,QRReceitaDesc_Local_Aplicacao.Value);
    // *** 2 ***
    wCont := 15;
    Imp.WriteXY(1,wCont,QRReceitaDesc_Cultura.Value);
    wCulturaAnterior := QRReceitaCod_Cultura.Value;
    wItemProduto := 0;
    wI := 0;
    While (wCulturaAnterior = QRReceitaCod_Cultura.Value)
        and (not QRReceita.Eof) do
    Begin
      Inc(wI);
      Imp.WriteXY(2,wCont,IntToStr(wI)+'-'+QRReceitaDesc_Praga.Value);
      Inc(wItemProduto);
      wVetProduto[wItemProduto] := QRReceitaDESC_PRODUTO.Value;
      wVetAdquirir[wItemProduto] := QRReceitaQT_ADQUIRIR.Value;
      wVetUnidade[wItemProduto] := QRReceitaDesc_Unidade.Value;
      wVetDose[wItemProduto] := QRReceitaNUM_DOSE.Value;
      wVetAgua[wItemProduto] := QRReceitaDESC_AGUA.Value;
      wVetCarencia[wItemProduto] := QRReceitaDESC_CARENCIA.Value;
      wVetClassToxicologica[wItemProduto] := QRReceitaIND_CLASSE_TOX.Value;
      wVetUtilizacao[wItemProduto] := QRReceitaDESC_UTILIZACAO.Value;
      wVetUtilEmbalagem[wItemProduto] := QRReceitaDESC_DESTINO.Value;
      wVetArea[wItemProduto] := QRReceitaDESC_AREA.Value;
      With DMGuiaAplicacao do
      Begin
        QGuiaAplicacao.Close;
        QGuiaAplicacao.SetVariable('PK',QRReceitaCod_Produto.Value);
        QGuiaAplicacao.Open;
        If Not QGuiaAplicacao.Eof Then
         Begin
           Inc(wI_guia);
           wGuiaDose[wI_Guia] := QRReceitaNUM_DOSE.Value;
           wGuiaQuant[wI_Guia] := QRReceitaQT_ADQUIRIR.Value;
           wGuiaCultura[wI_Guia] := QRReceitaDesc_Cultura.Value;
           wGuiaProduto[wI_Guia] := QRReceitaDESC_PRODUTO.Value;
           wGuiaCodProd[wI_Guia] := QRReceitaCOD_PRODUTO.Value;
           wGuiaEmbalagem[wI_Guia] := QRReceitaNUM_EMBALAGEM.Value;
           wGuiaArea[wI_Guia] := QRReceitaDESC_AREA.Value;
         End;
      End;
      wCont := wCont + 1;
      QRReceita.Next;
      If wI = 4 Then
         Break;
    End;
    // *** 3 ***
    wCont := 24;
    wI := 1;
    While wI <= wItemProduto do
    Begin
      Imp.WriteXY(0,wCont,IntToStr(wI));
      Imp.WriteXY(0.5,wCont,wVetProduto[wI]);
      Imp.WriteXY(5.8,wCont,Bib.NumToTexto(wVetAdquirir[wI],2,8));
      Imp.WriteXY(7.4,wCont,wVetUnidade[wI]);
      If wVetDose[wI] = 0 Then
         Imp.WriteXY(8,wCont,wVetArea[wI])
      Else
       Begin
        Imp.WriteXY(7.8,wCont,Bib.NumToTexto(wVetAdquirir[wI]/wVetDose[wI],2,10 ));
        Imp.WriteXY(9.4,wCont,Bib.NumToTexto(wVetDose[wI],2,8));
       End;
      Imp.WriteXY(11.1,wCont,wVetAgua[wI]);
      Imp.WriteXY(12.9,wCont,wVetCarencia[wI]);
      Imp.WriteXY(14.2,wCont,wVetClassToxicologica[wI]);
      wCont := wCont+1;
      //Imp.WriteXY(0,wCont,QRReceitaDESC_DESTINO.Value);
      Inc(wI);
    End;
    wCont := 32;
    For wI := 1 to wItemProduto do
    Begin
      Imp.WriteXY(0,wCont,IntToStr(wI)+'-');
      wString1 := wVetUtilizacao[wI];
      while Pos(chr(13), wsTring1) > 0 do
          wString1[Pos(chr(13), wsTring1)] := ' ';
      while Pos(chr(10), wsTring1) > 0 do
          wString1[Pos(chr(10), wsTring1)] := ' ';
      Bib.QuebraString(wString1,90,wLinhaExt1,wLinhaExt2,' *');   // 103
      Imp.WriteXY(0.2,wCont,wLinhaExt1);
      wCont := wCont + 1;
      If 90 >= Length(wLinhaExt2) then        //somente para fazer a terceira linha
        wQbCont := Length(wLinhaExt2)        //da mensagem do modo de aplicacao da receita
      Else
        Begin
          wOk := False;
          wQbCont := 90;
          While (wQbCont > 0) and (wOk = False) do
          Begin
            If wLinhaExt2[wQbCont] = ' ' then
              wOk := True
            Else
              Dec(wQbCont);
          End;
        End;
      wLinhaExt1 := Copy(wLinhaExt2,1,wQbCont);
      wLinhaExt2 := Copy(wLinhaExt2,wQbCont+1,Length(wLinhaExt2)); // ate aqui
      Imp.WriteXY(0.2,wCont,wLinhaExt1);
      If wLinhaExt2 <> '' Then
      Begin
        wCont := wCont + 1;
        Imp.WriteXY(0.2,wCont,wLinhaExt2);
      End;
      wCont := wCont + 1;
    End;
    inc(wCont);
    Imp.WriteXY(0,wCont,'Fica permitida a aplicacao de defensivos agricolas com atomizadores ou canhoes numa distancia');
    inc(wCont);
    Imp.WriteXY(0,wCont,'minima de 250 metros, e por aparelhos costais ou tratorizados de barras, numa distancia minima');
    inc(wCont);
    Imp.WriteXY(0,wCont,'de 50 metros de mananciais de agua, moradias e agrupamento de animais.');
    wCont := 48;
    Imp.WriteXY(0,wCont,'EM SE TRATANDO DE EMBALAGENS DE VIDRO OU PLASTICO REALIZAR TRIPLICE LAVAGEM DAS MESMAS.');
    wCont := wCont + 1;
    Imp.WriteXY(0,wCont,'DEPOSITAR EM LOCAL SEGURO, ATE O MOMENTO DA COLETA PELOS ORGAOS COMPETENTES.');
    wCont := wCont + 1;
    Imp.WriteXY(0,wCont,'SEGUIR O PROGRAMA DE RECICLAGEM DE LIXO (EMBALAGEM) TOXICO');
    wCont := wCont + 1;
    Imp.WriteXY(0,wCont,'LER ATENTAMENTE O ROTULO E A BULA DO PRODUTO E O VERSO DESTA RECEITA AGRONOMICA.');
    wCont := wCont + 1;
    Imp.WriteXY(0,wCont,'ENDERECO PARA ENTREGA DE EMBALAGENS VAZIAS(TRIPLICE LAVAGEM): ESTRADA PARA ESCOLA MEU CANTINHO ');
    wCont := wCont + 1;
    Imp.WriteXY(0,wCont,'LINHA TRES FAZENDAS - SANTA TEREZINHA DE ITAIPU - PR ');
    wCont := 58;
    Imp.WriteXY(8.5,wCont,QRReceitaNome_Agronomo.Value);
    wCont := wCont+2;
    Imp.WriteXY(10,wCont,QRReceitaDesc_Crea.Value);
    wCont := wCont+1;
    Imp.WriteXY(8,wCont,QRREceitaCPF_Agronomo.Value);

    Imp.SaltaPagina;
//    QRReceita.Next;
  End;
  Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',66);
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao
  EmiteGuiaAplicacao;
End;

procedure TDMReceita.EmiteGuiaAplicacao;
Var wNumeroGuia :Integer;
Begin
  QRReceita.First;
  wCont := 1;
  If wI_Guia > 0 Then
    If FrGuiaAplicacao = Nil then
       FrGuiaAplicacao := TFrGuiaAplicacao.Create(Application);

  While wCont <= wI_Guia do
  Begin
    wNumeroGuia := DMSequencia.Sequencia(StrToInt(QRReceitaCod_Filial.Text),'GUIA_APLICACAO');
    FRGuiaAplicacao.QrNrGuia.Caption := FloatToStr(wNumeroGuia);
    FRGuiaAplicacao.QrNrNota.Caption :=QRReceitaNum_Nota.Text;
    FrGuiaAplicacao.QRNome.Caption := Trim(QRReceitaNome_Cadastro.Text)+'-'+QRReceitaCod_Cadastro.Text;
    FrGuiaAplicacao.QREndereco.Caption := QRReceitaENDERECO_Cadastro.Value;
    FrGuiaAplicacao.QRCultura.Caption := wGuiaCultura[wCont];
    FrGuiaAplicacao.QrLocalAplicacao.Caption := QRReceitaDesc_Local_Aplicacao.Value;
    FrGuiaAplicacao.QrProduto.Caption := wGuiaProduto[wCont];
    FRGuiaAplicacao.QrQuantidade.Caption := FloatToStr(wGuiaQuant[wCont]);
    If wGuiaDose[wCont] = 0 Then
       FRGuiaAplicacao.QrAreaTratada.Caption := wGuiaArea[wcont]
    Else
       FRGuiaAplicacao.QrAreaTratada.Caption := FloatToStr(wGuiaQuant[wCont] / wGuiaDose[wcont]);
    With DMGuiaAplicacao do
    Begin
      QGuiaAplicacao.Close;
      QGuiaAplicacao.SetVariable('PK',wGuiaCodProd[wCont]);
      QGuiaAplicacao.Open;
      If not QGuiaAplicacao.Eof Then
      Begin
        FrGuiaAplicacao.QrFormaAplicacao.Caption := Trim(QGuiaAplicacaoDesc_Forma_Aplicacao.Value);
        FrGuiaAplicacao.QrRiscos.Caption := Trim(QGuiaAplicacaoDesc_Riscos.Value);
        FrGuiaAplicacao.QrCuidados.Caption := Trim(QGuiaAplicacaoDesc_Cuidados.Value);
      End;
    End;
    FrGuiaAplicacao.QrEngenheiro.Caption := QRReceitaNome_Agronomo.Value;
    FrGuiaAplicacao.QrCpf.Caption := QRREceitaCPF_Agronomo.Value;
    FrGuiaAplicacao.QREmpresa.Caption := QRReceitaNome_Filial.Value;
    FrGuiaAplicacao.QREnderecoLocal.Caption := QRReceitaEndereco_Filial.Value;
    FrGuiaAplicacao.QrPrimario.Preview;
    Inc(wCont);
    DMGuiaAplicacao.QGuiaAplicacao.Close;
  End;

end;

{
procedure TDMReceita.Imprime_Obs;
Begin
  If Trim(QRReceitaDesc_Mensagem.Text) <> '' Then
   Begin
    Inc(wCont);
    Imp.WriteXY(8,wCont,Trim(QRReceitaDesc_Mensagem.Value)+' '+Trim(QRReceitaDesc_Complemento.Value));
   End;
  If Trim(QRReceitaDesc_Complemento1.Text) <> '' Then
   Begin
    Inc(wCont);
    Imp.WriteXY(8,wCont,Trim(QRReceitaDesc_Complemento1.Value)+' '+Trim(QRReceitaDesc_Complemento2.Value));
   End;
  If Trim(QRReceitaDesc_Complemento3.Text) <> '' Then
   Begin
    Inc(wCont);
    Imp.WriteXY(8,wCont,Trim(QRReceitaDesc_Complemento3.Value)+' '+Trim(QRReceitaDesc_Complemento4.Value));
   End;
  If Trim(QRReceitaDesc_Complemento5.Text) <> '' Then
   Begin
    Inc(wCont);
    Imp.WriteXY(8,wCont,Trim(QRReceitaDesc_Complemento5.Value)+' '+Trim(QRReceitaDesc_Complemento6.Value));
   End;
  If Trim(QRReceitaDesc_Complemento7.Text) <> '' Then
   Begin
    Inc(wCont);
    Imp.WriteXY(8,wCont,Trim(QRReceitaDesc_Complemento7.Value));
   End;
End;

}

procedure TDMReceita.EmiteReceitaIrrigassolo;
Var wCulturaAnterior : Real;
    wLinhaExt1,wLinhaExt2,wString1:String;
begin
  wI_Guia := 0;
  While not QRReceita.Eof do
  Begin
    Imp.WriteXY(8,wCont,'RECEITUARIO AGRICOLA:'+QRReceitaNum_Receita.Text);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Tec.Agricola:'+QRReceitaNome_Agronomo.Value);
    Imp.WriteXY(13,wCont,'Data:'+QRReceitaDt_Emissao.Text);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Endereco:'+QRReceitaEndereco_Agronomo.Value);
    Imp.WriteXY(12,wCont,'Cidade:'+Trim(QRReceitaCidade_Agronomo.Value)+'-'+QRReceitaEstado_Agronomo.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Nota Fiscal:'+Bib.NumToTexto(QRReceitaNum_Nota.Value,0,6)+ '   Serie:'+QRReceitaCod_Serie.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'--------------------------------------------------------------------------------');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Cliente:'+QRReceitaNome_Cadastro.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Local Aplicacao:'+QRReceitaDesc_Local_Aplicacao.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'--------------------------------------------------------------------------------');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Cultura/Diagnostico:'+QRReceitaDesc_Cultura.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,QRReceitaDesc_Praga.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'--------------------------------------------------------------------------------');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Produto:'+QRReceitaDESC_PRODUTO.Value);
    If QRReceitaNUM_DOSE.Value = 0 Then
       Imp.WriteXY(12,wCont,'Area a Tratar:'+QRReceitaDESC_AREA.Value)
    Else
        Imp.WriteXY(12,wCont,'Area a Tratar:'+Bib.NumToTexto(QRReceitaQT_ADQUIRIR.Value/QRReceitaNUM_DOSE.Value,2,10));
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Dosagem:'+Bib.NumToTexto(QRReceitaNUM_DOSE.Value,2,8));
    Imp.WriteXY(12,wCont,'Carencia:'+QRReceitaDesc_Carencia.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Adquirir:'+Bib.NumToTexto(QRReceitaQT_ADQUIRIR.Value,2,10));
    Imp.WriteXY(12,wCont,'Utilizar:'+QRReceitaDesc_Agua.Value);
    Inc(wCont,2);
    Imp.WriteXY(0,wCont,'Grupo quimico:'+QRReceitaDesc_Grupo_Quimico.Value);
    Imp.WriteXY(12,wCont,'Classe Toxicologica:'+QRReceitaIND_CLASSE_TOX.Value);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'RECOMENDACOES');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'');
    imp.ConfiguraCondensado('CONDENSADO_ON');
    wString1 := QRReceitaDESC_UTILIZACAO.Value;
    while Pos(chr(13), wsTring1) > 0 do
        wString1[Pos(chr(13), wsTring1)] := ' ';
    while Pos(chr(10), wsTring1) > 0 do
        wString1[Pos(chr(10), wsTring1)] := ' ';
    Bib.QuebraString(wString1,120,wLinhaExt1,wLinhaExt2,' *');   // 103
    Imp.WriteXY(0.2,wCont,wLinhaExt1);
    wCont := wCont + 1;
    Imp.WriteXY(0.2,wCont,wLinhaExt2);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'');
    imp.ConfiguraCondensado('CONDENSADO_OFF');
    Imp.WriteXY(0,wCont,'MODO DE APLICACAO');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'EQUIPAMENTO DE PROTECAO INDIVIDUAL OBRIGATORIO');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'');
    imp.ConfiguraCondensado('CONDENSADO_ON');
    Imp.WriteXY(0,wCont,'Durante a manipulacao, preparacao de calda ou aplicacao, use macacao com mangas cumplidas, capa ou avental impermeavel, luva');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'impermeavel, chapeu impermeavel de abas largas, botas, oculos protetores e mascaras protetoras de filtros adeaquados ao produto');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'');
    imp.ConfiguraCondensado('CONDENSADO_OFF');
    Imp.WriteXY(0,wCont,'PRECAUCOES DE USO');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'NAO APLIQUE O PRODUTO NA PRESENCA DE VENTOS FORTES E NAS HORAS MAIS QUENTES DO');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'DIA. EVITAR QUE A NEBLINA PULVERIZADA (DERIVA) ALCALCE CULTURAS E/OU AREAS VI-');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'ZINHAS.APOS A DILUICAO EM AGUA APLIQUE NO MESMO DIA. NAO APLIQUE CONTRA O VEN-');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'TO, EVITANDO ASPIRAR PARTICULAS PULVERIZADAS.MANEJE O PRODUTO EM LOCAL AREJADO');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'PREVENCAO E PRIMEIROS SOCORROS EM CASO DE ACIDENTE');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'EM CASO DE INGESTAO ACIDENTAL NAO PROVOQUE VOMITO E  PROCURE IMEDIATAMENTE  UM');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'MEDICO LEVANDO A EMBALAGEM E O ROTULO DO PRODUTO.EVITE A INALACAO OU ASPIRACAO');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'DO PRODUTO. CASO ACONTECA PROCURE UM LOCAL AREJADO E SE HOUVER SINAIS DE IRRI-');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'TACAO PROCURE UM MEDICO. EVITE CONTATO COM OS OLHOS. CASO ACONTECA, LAVAR IME-');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'DIATAMENTE.');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'DISPOSICAO FINAL DE RESIDUOS E EMBALAGENS');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'');
    imp.ConfiguraCondensado('CONDENSADO_ON');
    Imp.WriteXY(0,wCont,'Formulacoes liquidas ou po soluvel em agua: P/embalagens em plastico, vidro ou metal, apos o completo esvaziamento, devem  ser');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'enxaguadas 3 vezes, com agitacao, e as caldas resultantes vertidas no tanque do pulverizacao. Inutilize as embalagens lavadas.');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Fica proibido o enterro, queima ou abandono de embalagens. Armazene-as na propriedade, londe de pessoas, animais e residencias');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'A devolucao e obrigatoria (lei 9974/2000) no prazo de um ano.');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'O pulverizador devera apresentar boas condicoes de uso(não possuir vazamentos). O abastecimento e limpeza deverao ser realiza-');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'dos em locais adequados (abastecedouros), nunca diretamente nos rios, manaciais e corregos. O agrotoxico devera ser adicionado');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'ao tanque somente no local da aplicacao. Na aplicacao manter a distancia minima de 50m em relacao aos  mananciais de  captacao');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'de agua para abastecimento de populacoes, nucleos populacionais, escolas, habitacoes, agrupamento e animais, psicultura, cria-');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'cao de bicho-da-seda, areas de preservacao permanente, matas ciliares, reserva legal e culturas  susceptiveis, de acordo com a');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'legislacao federal, estadual e municipal vigentes.');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'ENDERECO PARA ENTREGA DE EMBALAGENS DE AGROTOXICOS TRIPLICE LAVADAS');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'ESTRADA P/ESCOLA AGRICOLA MEU CANTINHO - STA TEREZINHA DE ITAIUPU - PR');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'');
    imp.ConfiguraCondensado('CONDENSADO_OFF');
    Imp.WriteXY(0,wCont,'--------------------------------------------------------------------------------');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Estou ciente das informacoes tecnicas');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'contidas nesta receita e no seu anexo');
    Inc(wCont);
    Imp.WriteXY(0,wCont,QRReceitaCidade_Filial.Value);
    Imp.WriteXY(3,wCont,QRReceitaDt_Emissao.Text);
    Inc(wCont,2);
    Imp.WriteXY(0,wCont,'______________________________' );
    Imp.WriteXY(11,wCont,'______________________________');
    Inc(wCont);
    Imp.WriteXY(0,wCont,QRReceitaNome_Cadastro.Value);
    Imp.WriteXY(11,wCont,QRReceitaNome_Agronomo.Value);
    Inc(wCont);
    Imp.WriteXY(11,wCont,'Cpf:'+QRREceitaCPF_Agronomo.Value);
    Inc(wCont);
    Imp.WriteXY(11,wCont,'Crea:'+QRReceitaDesc_Crea.Value);
    Imp.SaltaPagina;
    QRReceita.Next;
  End;
  Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',66);
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao
  EmiteGuiaAplicacao;
end;

procedure TDMReceita.EmiteGuiaAplicacaoBrasperon(wReceita, wFilial : Integer);
Var wItemProduto,wI,wCulturaAnterior,wQbCont : Integer;
Begin
  QRReceita.Close;
  QRReceita.SetVariable('NUM_RECEITA',wReceita);
  QRReceita.SetVariable('COD_FILIAL',wFilial);
  QRReceita.Open;
  wI_Guia := 0;
  While not QRReceita.Eof do
  Begin
    wCont := 11;
    wCulturaAnterior := QRReceitaCod_Cultura.Value;
    wItemProduto := 0;
    wI := 0;
    While (wCulturaAnterior = QRReceitaCod_Cultura.Value)
        and (not QRReceita.Eof) do
    Begin
      Inc(wI);
      With DMGuiaAplicacao do
      Begin
        QGuiaAplicacao.Close;
        QGuiaAplicacao.SetVariable('PK',QRReceitaCod_Produto.Value);
        QGuiaAplicacao.Open;
        If Not QGuiaAplicacao.Eof Then
         Begin
           Inc(wI_guia);
           wGuiaDose[wI_Guia] := QRReceitaNUM_DOSE.Value;
           wGuiaQuant[wI_Guia] := QRReceitaQT_ADQUIRIR.Value;
           wGuiaCultura[wI_Guia] := QRReceitaDesc_Cultura.Value;
           wGuiaProduto[wI_Guia] := QRReceitaDESC_PRODUTO.Value;
           wGuiaCodProd[wI_Guia] := QRReceitaCOD_PRODUTO.Value;
           wGuiaEmbalagem[wI_Guia] := QRReceitaNUM_EMBALAGEM.Value;
           if QRReceitaDESC_UNIDADE_DOSAGEM.IsNull then
             wGuiaArea[wI_Guia] := QRReceitaDESC_AREA.Value
           else
             wGuiaArea[wI_Guia] := QRReceitaDESC_UNIDADE_DOSAGEM.Value;
         End;
      End;
      wCont := wCont + 1;
      QRReceita.Next;
      If wI = 4 Then
         Break;
    End;
  End;
  EmiteGuiaAplicacao;
end;

end.
