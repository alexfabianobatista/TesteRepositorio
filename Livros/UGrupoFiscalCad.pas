unit UGrupoFiscalCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, OracleNavigator, Variants, ComObj,
  ActnList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

type
  TFGrupoFiscalCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DSGrupoFiscalItem: TDataSource;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    Label4: TLabel;
    OracleNavigator1: TOracleNavigator;
    DBRadioGroup1: TDBRadioGroup;
    RelatrioGruposFiscais1: TMenuItem;
    Opes1: TMenuItem;
    GerarArquivoDFC1: TMenuItem;
    ValoresGrupoFiscal1: TMenuItem;
    RelatrioDFC1: TMenuItem;
    GerarArquivoGI1: TMenuItem;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelatrioGruposFiscais1Click(Sender: TObject);
    procedure ValoresGrupoFiscal1Click(Sender: TObject);
    procedure GerarArquivoDFC1Click(Sender: TObject);
    procedure RelatrioDFC1Click(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure GerarArquivoGI1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGrupoFiscalCad: TFGrupoFiscalCad;

implementation

uses UGrupoFiscal_cl, UGrupoFiscalCons, URGruposFiscais, UGrupoFiscalParam,
  URGrupoFiscalValor, ULivroFiscalParam, UOracle_cl, UBiblioteca, URDFC,
  URDFCSaida;

{$R *.DFM}

function RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
var S : string;
    x : integer;
begin

for x := 1 to length(wCgc1) do
    if wCgc1[x] in ['0','1','2','3','4','5','6','7','8','9'] then
       S := S + wCgc1[x];

while Length(S) < Zeros do
      S := '0' + S;

Result := S;

end;

function intdecimais (wValor :String; wTamanho, wDecimais:integer): String;
var
  C, Cont, Posicao :integer;
  Res, Aux :String;
begin
  for Cont := 1 to wTamanho do
    Aux := '0' + Aux;

  If wValor <> '' then
  Begin
    Str(StrToFloat(Trim(wValor)):wTamanho:wDecimais, Res);

    while Pos(' ', Res) > 0 do
      Res[Pos(' ', Res)] := '0';

    while Pos('.', Res) > 0 do
    Begin
      Posicao:= Pos('.', Res);
      Delete(Res,Posicao,1);
    End;

  C := Length(Res);
  for Cont:= wTamanho downto 1 do
  Begin
    Aux[Cont] := Res[C];
    Dec(C,1);
    If C < 1 then
      Break;
  End;

  End;
  Res:= Aux;
  Result := Res;
End; 

procedure TFGrupoFiscalCad.FormCreate(Sender: TObject);
begin
  inherited;
  if DSPrimario.DataSet = nil then
    DSPrimario.DataSet := DMGrupoFiscal.QGrupoFiscalCab;

  DMGrupoFiscal.QGrupoFiscalCab.close;
  DMGrupoFiscal.QGrupoFiscalCab.open;
  DMGrupoFiscal.QGrupoFiscalItem.close;
  DMGrupoFiscal.QGrupoFiscalItem.open;
end;

procedure TFGrupoFiscalCad.DBEdit5Exit(Sender: TObject);
begin
  inherited;
  if DSGrupoFiscalItem.State in [dsInsert] then
    if DMGrupoFiscal.QGrupoFiscalItemNUM_NATUREZA_OPERACAO_FIM.IsNull then
      DMGrupoFiscal.QGrupoFiscalItemNUM_NATUREZA_OPERACAO_FIM.Value := DMGrupoFiscal.QGrupoFiscalItemNUM_NATUREZA_OPERACAO_INI.Value;
end;

procedure TFGrupoFiscalCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FGrupoFiscalCons = nil then
    FGrupoFiscalCons := TFGrupoFiscalCons.create(application);

  if FGrupoFiscalCons.showmodal = mrok then
  begin
    {DMGrupoFiscal.QGrupoFiscalCab.Close;
    DMGrupoFiscal.QGrupoFiscalCab.SetVariable('PK', DMGrupoFiscal.QGrupoFiscalConsCOD_GRUPO_FISCAL_CAB.Value);
    DMGrupoFiscal.QGrupoFiscalCab.Open;
    DMG}
    MELocaliza.Text := DMGrupoFiscal.QGrupoFiscalConsCOD_GRUPO_FISCAL_CAB.Text;
    MELocalizaExit(Self);
  end;
end;

procedure TFGrupoFiscalCad.RelatrioGruposFiscais1Click(Sender: TObject);
begin
  inherited;
  with DMGrupoFiscal do
  begin
    QRGrupoFiscal.Close;
    QRGrupoFiscal.Open;
  end;
  if FRGruposFiscais = Nil then
    FRGruposFiscais := TFRGruposFiscais.Create(Application);
  FRGruposFiscais.QRPrimario.Preview;
end;

procedure TFGrupoFiscalCad.ValoresGrupoFiscal1Click(Sender: TObject);
var
//  i :integer;
  wSQL, wVal_contabil, wIcm_base, wIcm_base_isento, wIcm_base_outras: String;
begin
  inherited;
//  i := 0;
  if FGrupoFiscalParam = Nil then
    FGrupoFiscalParam := TFGrupoFiscalParam.Create(Application);
  FGrupoFiscalParam.PGRelatorio.Pages[0].TabVisible := true;
  if FGrupoFiscalParam.ShowModal = MrOk then
  begin
    if (trim(FGrupoFiscalParam.ME1NatOperacao_I.Text)   = '') or
       (trim(FGrupoFiscalParam.ME1NatOperacao_F.Text)   = '') or
       (trim(FGrupoFiscalParam.ME1Data_I.Text)          = '') or
       (trim(FGrupoFiscalParam.ME1Data_F.Text)          = '') or
       (trim(FGrupoFiscalParam.FmFilial1.MeFilial.Text) = '') then
      Raise Exception.Create('Todos os campos devem ser preenchidos');

    with DMGrupoFiscal do
    begin
      QRGrupoDFC.Close;
      QRGrupoDFC.open;
      QRGrupoDFC.First;

      QRGrupoFiscalCFOP.Close;
      QRGrupoFiscalCFOP.SetVariable('FILIAL', trim(FGrupoFiscalParam.FmFilial1.MeFilial.Text));
      QRGrupoFiscalCFOP.SetVariable('NATUREZA_INI', trim(FGrupoFiscalParam.ME1NatOperacao_I.Text));
      QRGrupoFiscalCFOP.SetVariable('NATUREZA_FIM', trim(FGrupoFiscalParam.ME1NatOperacao_F.Text));
      QRGrupoFiscalCFOP.SetVariable('DATA_I', trim(FGrupoFiscalParam.ME1Data_I.Text));
      QRGrupoFiscalCFOP.SetVariable('DATA_F', trim(FGrupoFiscalParam.ME1Data_F.Text));
      QRGrupoFiscalCFOP.Open;
      
      with DMOracle do
      begin
        try
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          QExecSQL.SQL.Add('DELETE FROM TB_TEMPORARIA2');
          QExecSQL.ExecSQL;
          DBCemapa.Commit;
        Except
          DBCemapa.Rollback;
        end;
        while not QRGrupoDFC.Eof do
        begin
          if (QRGrupoFiscalCFOPCFOP.Text >= QRGrupoDFCNUM_NATUREZA_OPERACAO_INI.Text) and
             (QRGrupoFiscalCFOPCFOP.Text <= QRGrupoDFCNUM_NATUREZA_OPERACAO_FIM.Text) then
          begin
            try

             wVal_contabil := bib.TrocaVirgulaPorPonto(QRGrupoFiscalCFOPVAL_CONTABIL.Text);
             wIcm_base := bib.TrocaVirgulaPorPonto(QRGrupoFiscalCFOPSVAL_ICM_BASE.Text);
             wIcm_base_isento := bib.TrocaVirgulaPorPonto(QRGrupoFiscalCFOPSVAL_ICM_BASE_ISENTO.Text);
             wIcm_base_outras := bib.TrocaVirgulaPorPonto(QRGrupoFiscalCFOPSVAL_ICM_BASE_OUTRAS.Text);

             wSQL := 'INSERT INTO TB_TEMPORARIA2(COD_FILIAL, DESC_FILIAL, CFOP_INICIAL, CFOP_FINAL, ' +
                      'VAL_CONTABIL, VAL_ICM_BASE, VAL_ICM_BASE_ISENTO, VAL_ICM_BASE_OUTRAS, DESC_GRUPO_FISCAL) VALUES' +
                      '(' + QRGrupoFiscalCFOPCOD_FILIAL.Text +
                      ', '+ chr(39) + QRGrupoFiscalCFOPDESC_FILIAL.Text + chr(39) +
                      ', '+ QRGrupoDFCNUM_NATUREZA_OPERACAO_INI.Text +
                      ', '+ QRGrupoDFCNUM_NATUREZA_OPERACAO_FIM.Text +
                      ', '+ wVal_contabil +
                      ', '+ wIcm_base +
                      ', '+ wIcm_base_isento +
                      ', '+ wIcm_base_outras +
                      ', '+ chr(39) + QRGrupoDFCDESC_GRUPO_FISCAL.Text + chr(39) +
                      ')';

              QExecSQL.Close;
              QExecSQL.SQL.Clear;
              QExecSQL.SQL.Add(wSQL);
              QExecSQL.ExecSQL;
              DBCemapa.Commit;
            Except
              DBCemapa.Rollback;
              Raise Exception.Create('Operação nao concluida');
            end;
            QRGrupoFiscalCFOP.Next;
          end;
          QRGrupoDFC.Next;
        end;
      end;
    QRMostraDados.Close;
    QRMostraDados.open;
    end;

    if FRGrupoFiscalValor = Nil then
      FRGrupoFiscalValor := TFRGrupoFiscalValor.Create(Application);
    if (trim(FGrupoFiscalParam.ME1Data_I.Text) <> '') and (trim(FGrupoFiscalParam.ME1Data_F.Text) <> '') then
      FRGrupoFiscalValor.QRLPeriodo.Caption := 'De: ' + trim(FGrupoFiscalParam.ME1Data_I.Text) +
                                              ' Até: ' + trim(FGrupoFiscalParam.ME1Data_F.Text)
    else
      FRGrupoFiscalValor.QRLPeriodo.Caption := '';
    FRGrupoFiscalValor.QRLIntervalo.Caption := 'CFOP Inicial: ' + trim(FGrupoFiscalParam.ME1NatOperacao_I.Text) +
                                               '  CFOP Final: ' + trim(FGrupoFiscalParam.ME1NatOperacao_F.Text);
    if FGrupoFiscalParam.RGPreview.ItemIndex = 0 then
      FRGrupoFiscalValor.QRPrimario.Preview
    else
      FRGrupoFiscalValor.QRPrimario.Print;
  end;
end;

procedure TFGrupoFiscalCad.GerarArquivoDFC1Click(Sender: TObject);
var
  wStr1, wStr2, wCodFiscal, wDescGrupo : string;
  F : TextFile;
  wVal : Real;
  x,y : array of string;
  wCont, Posicao : Integer;
begin
  inherited;
  wVal := 0;
  wCont := 0;
  if FGrupoFiscalParam = Nil then
    FGrupoFiscalParam := TFGrupoFiscalParam.Create(Application);
  FGrupoFiscalParam.PGRelatorio.Pages[1].TabVisible := true;
  if FGrupoFiscalParam.ShowModal = MrOk then
  begin

  setLength(x, 3);
  setLength(y, 3);
  x[0] := 'SELECT DESC_INSCRICAO FROM TB_FILIAL WHERE COD_FILIAL =' + FGrupoFiscalParam.FMFilial2.MEFilial.Text;
  x[1] := 'SELECT NUM_CGC FROM TB_FILIAL WHERE COD_FILIAL =' + FGrupoFiscalParam.FMFilial2.MeFilial.Text;
  x[2] := 'SELECT NUM_CGC_CPF FROM TB_CADASTRO WHERE COD_CADASTRO = '+ FGrupoFiscalParam.FMCadastro1.MeCadastro.Text;
  DMOracle.BuscaNomes(x, y);

  with DMGrupoFiscal do
  Begin
    wStr1 := '1';
    Case FGrupoFiscalParam.Rg9TipoDocumento.ItemIndex of
     0 : wStr1 := wStr1 + '21';
     1 : wStr1 := wStr1 + '22';
     2 : wStr1 := wStr1 + '24';
    End;
    wStr1 := wStr1 + RMaskCGC_CPF(y[0],10) + RMaskCGC_CPF(y[1],14);
    wStr1 := wStr1 + copy(FGrupoFiscalParam.ME2DtInicial.Text,7,4) + '00';
    wStr1 := wStr1 + 'C' +  RMaskCGC_CPF(y[2],11) +'    '+ '8';
    wStr1 := wStr1 + '                                                           ';
                      
    {QRGrupoDFC.Close;
    QRGrupoDFC.Open;
    QRGrupoDFC.First;
    wCodFiscal := QRGrupoDFCCOD_GRUPO_FISCAL_CAB.Text;
    while not QRGrupoDFC.EOF do
    Begin
{      QRGrupoFiscalValor.Close;
      QRGrupoFiscalValor.SetVariable('NATUREZA_I',QRGrupoDFCNUM_NATUREZA_OPERACAO_INI.Value);
      QRGrupoFiscalValor.SetVariable('NATUREZA_F',QRGrupoDFCNUM_NATUREZA_OPERACAO_FIM.Value);
      QRGrupoFiscalValor.SetVariable('DT_INICIAL',FGrupoFiscalParam.ME2DtInicial.Text);
      QRGrupoFiscalValor.SetVariable('DT_FINAL',FGrupoFiscalParam.ME2DtFinal.Text);
      QRGrupoFiscalValor.SetVariable('FILIAL',FGrupoFiscalParam.FMFilial2.MEFilial.Text);
      QRGrupoFiscalValor.Open;}


//      wVal := wVal + QRGrupoFiscalValorVAL_CONTABIL.Value;
//         wVal := wVal + QRDFCArquivoVAL_CONTABIL.Value;

     { QRGrupoDFC.Next;

      if (wCodFiscal <> QRGrupoDFCCOD_GRUPO_FISCAL_CAB.Text) Then
      Begin
        inc(wCont);
        wVal := wVal + QRDFCArquivoVAL_CONTABIL.Value;
        wStr2 := wStr2 + '2';
        wStr2 := wStr2 + copy(wDescGrupo + '0000',1,4);
        wStr2 := wStr2 + copy(intdecimais(FloatToStr(wVal),17,2),1,15)  + Chr(13)+Chr(10);
        wVal := 0;
      end;
      wCodFiscal := QRGrupoDFCCOD_GRUPO_FISCAL_CAB.Text;
      wDescGrupo := QRGrupoDFCDESC_Grupo_fiscal.Text;
    end;
    inc(wCont);
    wStr2 := wStr2 + '2';
    wStr2 := wStr2 + copy(wDescGrupo + '0000',1,4);
    wStr2 := wStr2 + copy(intdecimais(FloatToStr(wVal),17,2),1,15)  + Chr(13)+Chr(10);
    wVal := 0;}

    QRDFCArquivo.Close;
    QRDFCArquivo.SetVariable('DT_INICIAL',FGrupoFiscalParam.ME2DtInicial.Text);
    QRDFCArquivo.SetVariable('DT_FINAL',FGrupoFiscalParam.ME2DtFinal.Text);
    QRDFCArquivo.SetVariable('FILIAL',FGrupoFiscalParam.FMFilial2.MEFilial.Text);
    QRDFCArquivo.Open;
    QRDFCArquivo.First;
    while not QRDFCArquivo.EOF do
    Begin
      inc(wCont);
//      Valores Contabeis
      wDescGrupo := QRDFCArquivoDESC_Grupo_Contabeis.Text;
      wVal := QRDFCArquivoVAL_CONTABIL.Value;
      wStr2 := wStr2 + '2';
      wStr2 := wStr2 + copy(wDescGrupo + '0000',1,4);
      wStr2 := wStr2 + copy(intdecimais(FloatToStr(wVal),17,2),1,15)  + Chr(13)+Chr(10);
//      Base Calculo
      inc(wCont);
      wDescGrupo := QRDFCArquivoDESC_Grupo_Base.Text;
      wVal := QRDFCArquivoVAL_ICM_BASE.Value;
      wStr2 := wStr2 + '2';
      wStr2 := wStr2 + copy(wDescGrupo + '0000',1,4);
      wStr2 := wStr2 + copy(intdecimais(FloatToStr(wVal),17,2),1,15)  + Chr(13)+Chr(10);
//      Isenta ou N/T
      inc(wCont);
      wDescGrupo := QRDFCArquivoDESC_Grupo_Isentas.Text;
      wVal := QRDFCArquivoVAL_ICM_BASE_ISENTO.Value;
      wStr2 := wStr2 + '2';
      wStr2 := wStr2 + copy(wDescGrupo + '0000',1,4);
      wStr2 := wStr2 + copy(intdecimais(FloatToStr(wVal),17,2),1,15)  + Chr(13)+Chr(10);
//      Outras
      inc(wCont);
      wDescGrupo := QRDFCArquivoDESC_Grupo_Outras.Text;
      wVal := QRDFCArquivoVAL_ICM_BASE_OUTRAS.Value;
      wStr2 := wStr2 + '2';
      wStr2 := wStr2 + copy(wDescGrupo + '0000',1,4);
      wStr2 := wStr2 + copy(intdecimais(FloatToStr(wVal),17,2),1,15)  + Chr(13)+Chr(10);

      wVal := 0;

      QRDFCArquivo.Next;
    end;

//Estoque Inicial
    inc(wCont);
    wDescGrupo := '823';
    wVal := StrToFloat(FGrupoFiscalParam.ME823.text);
    wStr2 := wStr2 + '2';
    wStr2 := wStr2 + copy(wDescGrupo + '0000',1,4);
    wStr2 := wStr2 + copy(intdecimais(FloatToStr(wVal),17,2),1,15)  + Chr(13)+Chr(10);


    QRDFCArquivoSaida.Close;
    QRDFCArquivoSaida.SetVariable('DT_INICIAL',FGrupoFiscalParam.ME2DtInicial.Text);
    QRDFCArquivoSaida.SetVariable('DT_FINAL',FGrupoFiscalParam.ME2DtFinal.Text);
    QRDFCArquivoSaida.SetVariable('FILIAL',FGrupoFiscalParam.FMFilial2.MEFilial.Text);
    QRDFCArquivoSaida.Open;
    QRDFCArquivoSaida.First;
    while not QRDFCArquivoSaida.EOF do
    Begin
      inc(wCont);
//      Valores Contabeis
      wDescGrupo := QRDFCArquivoSaidaDESC_Grupo_Contabeis.Text;
      wVal := QRDFCArquivoSaidaVAL_CONTABIL.Value;
      wStr2 := wStr2 + '2';
      wStr2 := wStr2 + copy(wDescGrupo + '0000',1,4);
      wStr2 := wStr2 + copy(intdecimais(FloatToStr(wVal),17,2),1,15)  + Chr(13)+Chr(10);
//      Base Calculo
      inc(wCont);
      wDescGrupo := QRDFCArquivoSaidaDESC_Grupo_Base.Text;
      wVal := QRDFCArquivoSaidaVAL_ICM_BASE.Value;
      wStr2 := wStr2 + '2';
      wStr2 := wStr2 + copy(wDescGrupo + '0000',1,4);
      wStr2 := wStr2 + copy(intdecimais(FloatToStr(wVal),17,2),1,15)  + Chr(13)+Chr(10);
//      Isenta ou N/T
      inc(wCont);
      wDescGrupo := QRDFCArquivoSaidaDESC_Grupo_Isentas.Text;
      wVal := QRDFCArquivoSaidaVAL_ICM_BASE_ISENTO.Value;
      wStr2 := wStr2 + '2';
      wStr2 := wStr2 + copy(wDescGrupo + '0000',1,4);
      wStr2 := wStr2 + copy(intdecimais(FloatToStr(wVal),17,2),1,15)  + Chr(13)+Chr(10);
//      Outras
      inc(wCont);
      wDescGrupo := QRDFCArquivoSaidaDESC_Grupo_Outras.Text;
      wVal := QRDFCArquivoSaidaVAL_ICM_BASE_OUTRAS.Value;
      wStr2 := wStr2 + '2';
      wStr2 := wStr2 + copy(wDescGrupo + '0000',1,4);
      wStr2 := wStr2 + copy(intdecimais(FloatToStr(wVal),17,2),1,15)  + Chr(13)+Chr(10);

      wVal := 0;

      QRDFCArquivoSaida.Next;
    end;

//Estoque Final
    inc(wCont);
    wDescGrupo := '921';
    wVal := StrToFloat(FGrupoFiscalParam.ME921.text);
    wStr2 := wStr2 + '2';
    wStr2 := wStr2 + copy(wDescGrupo + '0000',1,4);
    wStr2 := wStr2 + copy(intdecimais(FloatToStr(wVal),17,2),1,15)  + Chr(13)+Chr(10);

    QRDFCCidade.Close; //total comprado por cidade do pr
    QRDFCCidade.SetVariable('DT_INICIAL',FGrupoFiscalParam.ME2DtInicial.Text);
    QRDFCCidade.SetVariable('DT_FINAL',FGrupoFiscalParam.ME2DtFinal.Text);
    QRDFCCidade.SetVariable('FILIAL',FGrupoFiscalParam.FmFilial2.MeFilial.Text);
    If Trim(FGrupoFiscalParam.MeOperacao9.Text)= '' then
       QRDFCCidade.SetVariable('OPERACAO','1=1')
    Else
       QRDFCCidade.SetVariable('OPERACAO','TB_NOTA_CAB.COD_OPERACAO IN ('+Trim(FGrupoFiscalParam.MeOperacao9.Text)+')');

    If Trim(FGrupoFiscalParam.MeOperacao9.Text)= '' then
       QRDFCCidade.SetVariable('OPERACAO1','1=1')
    Else
       QRDFCCidade.SetVariable('OPERACAO1','TB_CONHECIMENTO.COD_OPERACAO IN ('+Trim(FGrupoFiscalParam.MeOperacao9.Text)+')');

    If Trim(FGrupoFiscalParam.MeOperacao9.Text)= '' then
       QRDFCCidade.SetVariable('OPERACAO2','1=1')
    Else
       QRDFCCidade.SetVariable('OPERACAO2','TB_CONHECIMENTO_FRETE.COD_OPERACAO IN ('+Trim(FGrupoFiscalParam.MeOperacao9.Text)+')');

    QRDFCCidade.open;
    QRDFCCidade.First;

    While not QRDFCCidade.Eof do
    Begin
      if QRDFCCidadeVAL_CONTABIL.Value > 0 then begin
        inc(wCont);
        wStr2 := wStr2 + '2';
        wStr2 := wStr2 + RMaskCGC_CPF(QRDFCCidadeCOD_DFC.Text,4);
        wStr2 := wStr2 + copy(Intdecimais(FloatToStr(QRDFCCidadeVAL_CONTABIL.Value),17,2),1,15)+ Chr(13)+Chr(10);
      end;
      QRDFCCidade.Next;
    end;

    wStr1 := wStr1 + FormatFloat('000', wCont) + Chr(13)+ Chr(10);

    FGrupoFiscalParam.SDlgGrupoFiscal.FileName := 'DFC.txt';
    if FGrupoFiscalParam.SDlgGrupoFiscal.Execute then
    begin
      AssignFile( F, FGrupoFiscalParam.SDlgGrupoFiscal.FileName);
      Rewrite(F);
      Writeln(F, wStr1+wStr2);
      CloseFile(F);
      MessageDlg('Arquivo de Exportação de Notas Fiscais Gerado com Sucesso!', mtInformation,[mbOk], 0);
    end
    else
      MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
  end;
  end;
end;

procedure TFGrupoFiscalCad.RelatrioDFC1Click(Sender: TObject);
{var
  wcfops        :String;
  wcont         :integer;
  wFlagFirstReg :Boolean;}
begin
  inherited;

  if FGrupoFiscalParam = Nil then
    FGrupoFiscalParam := TFGrupoFiscalParam.Create(Application);
  FGrupoFiscalParam.PGRelatorio.Pages[2].TabVisible := true;
  if FGrupoFiscalParam.ShowModal = MrOk then
  begin

{
    //inicializa variaveis
    wcfops        := '';
    wcont         := 0;
    wFlagFirstReg := true;
}
    //busca os intervalos de cfops dos grupos fiscais
    with DMGrupoFiscal do
    begin
{     QRGrupoDFC.Close;
      QRGrupoDFC.open;
      QRGrupoDFC.First;

      //calcula os intervalos de cfops dos grupos fiscais e joga pra uma string
      // ex. se o intevalo for do 10 aou 13, calcula 10,11,12,13
      while not QRGrupoDFC.Eof do
      begin
        if QRGrupoDFC.RecordCount > 0 then
        begin
          if QRGrupoDFCNUM_NATUREZA_OPERACAO_INI.Value = QRGrupoDFCNUM_NATUREZA_OPERACAO_FIM.Value then
          begin
            if wFlagFirstReg then
            begin
              wcfops := QRGrupoDFCNUM_NATUREZA_OPERACAO_INI.Text;
              wFlagFirstReg := false;
            end
            else
              wcfops := wcfops + ',' + QRGrupoDFCNUM_NATUREZA_OPERACAO_INI.Text;
            end
          else
          begin
            wcont := QRGrupoDFCNUM_NATUREZA_OPERACAO_INI.Value;
            while wcont <= QRGrupoDFCNUM_NATUREZA_OPERACAO_FIM.Value do
            begin
              if wFlagFirstReg then
              begin
                wcfops := intToStr(wcont);
                wFlagFirstReg := false;
              end
              else
                wcfops := wcfops + ',' + intToStr(wcont);
              inc(wcont);
            end;// fim while
          end;
          QRGrupoDFC.Next;
        end;// fim if recordcount
      end; // fim while
}

      if (trim(FGrupoFiscalParam.FmFilial3.MeFilial.Text) = '') or
         (trim(FGrupoFiscalParam.me3Data_I.Text) = '') or
         (trim(FGrupoFiscalParam.Me3Data_F.Text) = '') then
        Raise Exception.Create('Todos os campos devem ser preenchidos');

      QRDFCEntrada.Close;
      QRDFCSaida.Close;

      QRDFCEntrada.SetVariable('FILIAL',trim(FGrupoFiscalParam.FmFilial3.MeFilial.Text));
      QRDFCEntrada.SetVariable('DATA_I',trim(FGrupoFiscalParam.me3Data_I.Text));
      QRDFCEntrada.SetVariable('DATA_F',trim(FGrupoFiscalParam.Me3Data_F.Text));

      QRDFCSaida.SetVariable('FILIAL',trim(FGrupoFiscalParam.FmFilial3.MeFilial.Text));
      QRDFCSaida.SetVariable('DATA_I',trim(FGrupoFiscalParam.me3Data_I.Text));
      QRDFCSaida.SetVariable('DATA_F',trim(FGrupoFiscalParam.Me3Data_F.Text));


      QRDFCEntrada.open;
      QRDFCSaida.open;

      if FRDFC = Nil then
        FRDFC := TFRDFC.Create(Application);
      if FRDFCSaida = Nil then
        FRDFCSaida := TFRDFCSaida.Create(Application);

      FRDFC.QRLFilial.Caption := 'Filial: ' + Trim(FGrupoFiscalParam.FMFilial3.MeFilial.Text) + ' - '+ FGrupoFiscalParam.FMFilial3.EdFilial.Text;
      FRDFC.QRPeriodo.Caption := 'Período de ' + FGrupoFiscalParam.Me3Data_I.Text + ' até ' + FGrupoFiscalParam.Me3Data_F.Text;
      FRDFCSaida.QRLFilial.Caption := 'Filial: ' + Trim(FGrupoFiscalParam.FMFilial3.MeFilial.Text) + ' - '+ FGrupoFiscalParam.FMFilial3.EdFilial.Text;
      FRDFCSaida.QRPeriodo.Caption := 'Período de ' + FGrupoFiscalParam.Me3Data_I.Text + ' até ' + FGrupoFiscalParam.Me3Data_F.Text;                

      if FGrupoFiscalParam.RGPreview.ItemIndex = 0 then
        FRDFC.QRCompositeReport1.Preview
      else
        FRDFC.QRCompositeReport1.Print;

    end;// fim with
  end;// fim showModal
end;

procedure TFGrupoFiscalCad.MELocalizaExit(Sender: TObject);
begin
  inherited;
  with DMGrupoFiscal do
  begin
    QGrupoFiscalItem.Close;
    QGrupoFiscalItem.Open;
  end;
end;

procedure TFGrupoFiscalCad.GerarArquivoGI1Click(Sender: TObject);
var
  wStr1, wStr2, wCodFiscal, wDescGrupo : string;
  F : TextFile;
  wVal : Real;
  x,y : array of string;
  wCont, Posicao : Integer;
begin
  inherited;
  wVal := 0;
  wCont := 0;
  if FGrupoFiscalParam = Nil then
    FGrupoFiscalParam := TFGrupoFiscalParam.Create(Application);
  FGrupoFiscalParam.PGRelatorio.Pages[3].TabVisible := true;
  if FGrupoFiscalParam.ShowModal = MrOk then begin

    setLength(x, 3);
    setLength(y, 3);
    x[0] := 'SELECT DESC_INSCRICAO FROM TB_FILIAL WHERE COD_FILIAL =' + FGrupoFiscalParam.FMFilial4.MEFilial.Text;
    x[1] := 'SELECT NUM_CGC FROM TB_FILIAL WHERE COD_FILIAL =' + FGrupoFiscalParam.FMFilial4.MeFilial.Text;
    x[2] := 'SELECT NUM_CGC_CPF FROM TB_CADASTRO WHERE COD_CADASTRO = '+ FGrupoFiscalParam.FMCadastro2.MeCadastro.Text;
    DMOracle.BuscaNomes(x, y);

    with DMGrupoFiscal do
    Begin
      wStr1 := '';
      wStr1 := '1' + '31';
      wStr1 := wStr1 + RMaskCGC_CPF(y[0],10) + RMaskCGC_CPF(y[1],14);
      wStr1 := wStr1 + copy(FGrupoFiscalParam.ME4DtInicial.Text,7,4) + '00';
      wStr1 := wStr1 + 'F' +  RMaskCGC_CPF(y[2],11) +'   '+ ' ';
      wStr1 := wStr1 + '                                                           ';

      QRGIArquivo.Close;
      QRGIArquivo.SetVariable('DATA_I',FGrupoFiscalParam.ME4DtInicial.Text);
      QRGIArquivo.SetVariable('DATA_F',FGrupoFiscalParam.ME4DtFinal.Text);
      QRGIArquivo.SetVariable('FILIAL',FGrupoFiscalParam.FMFilial4.MEFilial.Text);
      QRGIArquivo.Open;
      QRGIArquivo.First;
      while not QRGIArquivo.EOF do
      Begin
        inc(wCont);
  //      Valores Contabeis Entradas
        if QRGIArquivoIND_ENTRADA_SAIDA.Value = 'E' then begin
           wDescGrupo := '3'+ FormatFloat('00', QRGIArquivoCOD_GI.Value) + '1';
           wVal := QRGIArquivoVAL_CONTABIL.Value;
           wStr2 := wStr2 + '2';
           wStr2 := wStr2 + copy(wDescGrupo + '0000',1,4);
           wStr2 := wStr2 + copy(intdecimais(FloatToStr(wVal),17,2),1,15)  + Chr(13)+Chr(10);
  //      Base Calculo Entradas
           inc(wCont);
           wDescGrupo := '3'+ FormatFloat('00', QRGIArquivoCOD_GI.Value) + '2';
           wVal := QRGIArquivoVAL_ICM_BASE.Value;
           wStr2 := wStr2 + '2';
           wStr2 := wStr2 + copy(wDescGrupo + '0000',1,4);
           wStr2 := wStr2 + copy(intdecimais(FloatToStr(wVal),17,2),1,15)  + Chr(13)+Chr(10);
  //      Outras Entradas
           inc(wCont);
           wDescGrupo := '3'+ FormatFloat('00', QRGIArquivoCOD_GI.Value) + '3';
           wVal := QRGIArquivoVAL_ICM_BASE_OUTRAS.Value;
           wStr2 := wStr2 + '2';
           wStr2 := wStr2 + copy(wDescGrupo + '0000',1,4);
           wStr2 := wStr2 + copy(intdecimais(FloatToStr(wVal),17,2),1,15)  + Chr(13)+Chr(10);
        end;
        if QRGIArquivoIND_ENTRADA_SAIDA.Value = 'S' then begin
  //      Valores Contabeis Saidas
  //      Nao Contribuinte
           if QRGIArquivoIND_FISICA_JURIDICA.Value = 'F' then begin
              wDescGrupo := '5'+ FormatFloat('00', QRGIArquivoCOD_GI.Value) + '1';
              wVal := QRGIArquivoVAL_CONTABIL.Value;
              wStr2 := wStr2 + '2';
              wStr2 := wStr2 + copy(wDescGrupo + '0000',1,4);
              wStr2 := wStr2 + copy(intdecimais(FloatToStr(wVal),17,2),1,15)  + Chr(13)+Chr(10);
           end
  //       Contribuinte
           else if QRGIArquivoIND_FISICA_JURIDICA.Value = 'J' then begin
              wDescGrupo := '5'+ FormatFloat('00', QRGIArquivoCOD_GI.Value) + '2';
              wVal := QRGIArquivoVAL_CONTABIL.Value;
              wStr2 := wStr2 + '2';
              wStr2 := wStr2 + copy(wDescGrupo + '0000',1,4);
              wStr2 := wStr2 + copy(intdecimais(FloatToStr(wVal),17,2),1,15)  + Chr(13)+Chr(10);
           end;
  //      Base Calculo Saidas
  //      Nao Contribuinte
           if QRGIArquivoIND_FISICA_JURIDICA.Value = 'F' then begin
               inc(wCont);
               wDescGrupo := '5'+ FormatFloat('00', QRGIArquivoCOD_GI.Value) + '3';
               wVal := QRGIArquivoVAL_ICM_BASE.Value;
               wStr2 := wStr2 + '2';
               wStr2 := wStr2 + copy(wDescGrupo + '0000',1,4);
               wStr2 := wStr2 + copy(intdecimais(FloatToStr(wVal),17,2),1,15)  + Chr(13)+Chr(10);
           end
  //       Contribuinte
           else if QRGIArquivoIND_FISICA_JURIDICA.Value = 'J' then begin
               inc(wCont);
               wDescGrupo := '5'+ FormatFloat('00', QRGIArquivoCOD_GI.Value) + '4';
               wVal := QRGIArquivoVAL_ICM_BASE.Value;
               wStr2 := wStr2 + '2';
               wStr2 := wStr2 + copy(wDescGrupo + '0000',1,4);
               wStr2 := wStr2 + copy(intdecimais(FloatToStr(wVal),17,2),1,15)  + Chr(13)+Chr(10);
           end;
  //      Outras Saidas
           inc(wCont);
           wDescGrupo := '5'+ FormatFloat('00', QRGIArquivoCOD_GI.Value) + '5';
           wVal := QRGIArquivoVAL_ICM_BASE_OUTRAS.Value;
           wStr2 := wStr2 + '2';
           wStr2 := wStr2 + copy(wDescGrupo + '0000',1,4);
           wStr2 := wStr2 + copy(intdecimais(FloatToStr(wVal),17,2),1,15)  + Chr(13)+Chr(10);
        end;

        wVal := 0;

        QRGIArquivo.Next;
      end;

      wStr1 := wStr1 + FormatFloat('000', wCont) + Chr(13)+ Chr(10);

      FGrupoFiscalParam.SDlgGrupoFiscal.FileName := 'GI.txt';
      if FGrupoFiscalParam.SDlgGrupoFiscal.Execute then
      begin
        AssignFile( F, FGrupoFiscalParam.SDlgGrupoFiscal.FileName);
        Rewrite(F);
        Writeln(F, wStr1+wStr2);
        CloseFile(F);
        MessageDlg('Arquivo de Exportação de Notas Fiscais Gerado com Sucesso!', mtInformation,[mbOk], 0);
      end
      else
        MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
    end;
  end;
end;

end.
