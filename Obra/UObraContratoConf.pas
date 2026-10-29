unit UObraContratoConf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, variants;

type
  TFObraContratoConf = class(TForm)
    Label2: TLabel;
    GBCPNota: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label20: TLabel;
    Label31: TLabel;
    MEDataCP: TMaskEdit;
    MEValorCP: TMaskEdit;
    BtApagaParcela: TBitBtn;
    LBContaReceber: TListBox;
    MEFinalidade: TMaskEdit;
    EdFinalidade: TEdit;
    MEDiasCP: TMaskEdit;
    Panel1: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    MEDepartamento: TMaskEdit;
    BtConsDepartamento: TBitBtn;
    EdDepartamento: TEdit;
    BtAvancar: TBitBtn;
    BtCancelar: TBitBtn;
    BtConsFinalidade: TBitBtn;
    Label1: TLabel;
    MeNota: TMaskEdit;
    MeSerie: TMaskEdit;
    Label3: TLabel;
    Label7: TLabel;
    MeEmissao: TMaskEdit;
    SBPrazo: TSpeedButton;
    MePrazo: TMaskEdit;
    EdTotal: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    MEValorEntrada: TMaskEdit;
    Label10: TLabel;
    procedure BtConsDepartamentoClick(Sender: TObject);
    procedure BtConsFinalidadeClick(Sender: TObject);
    procedure MEDepartamentoExit(Sender: TObject);
    procedure MEFinalidadeExit(Sender: TObject);
    procedure MEDiasCPExit(Sender: TObject);
    procedure MEValorCPExit(Sender: TObject);
    procedure BtAvancarClick(Sender: TObject);
    procedure BtApagaParcelaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBPrazoClick(Sender: TObject);
    procedure MePrazoExit(Sender: TObject);
    procedure MEValorEntradaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure geraParcelas;
  end;

var
  FObraContratoConf: TFObraContratoConf;
  wSerie : String;


implementation

uses UDepartamentoCons, UDepartamento_cl, UFinalidadeCons, UFinalidade_cl,
  UOracle_cl, UObra_cl, UObraContrato_cl, UUsuario_cl, UBiblioteca,
  UParamSistema_cl, UPrazoVencimentoCons, UPrazoVencimento_cl, DB,
  USequencia_cl;

{$R *.DFM}

procedure TFObraContratoConf.BtConsDepartamentoClick(Sender: TObject);
begin
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
  Begin
    MEDepartamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
    MEDepartamentoExit(Self);
  End;

end;

procedure TFObraContratoConf.BtConsFinalidadeClick(Sender: TObject);
begin
  If FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.showModal = mrOk then
  Begin
    MEFinalidade.Text := DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
    MEFinalidadeExit(Self);
  End;

end;

procedure TFObraContratoConf.MEDepartamentoExit(Sender: TObject);
begin
  If Trim(MEDepartamento.Text) <> '' Then
    EdDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MEDepartamento.Text)
  Else
    EdDepartamento.Text := '';

end;

procedure TFObraContratoConf.MEFinalidadeExit(Sender: TObject);
begin
  If Trim(MEFinalidade.Text) <> '' Then
    EdFinalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+MEFinalidade.Text)
  Else
    EdFinalidade.Text := '';
end;

procedure TFObraContratoConf.MEDiasCPExit(Sender: TObject);
begin
  If Trim(MEDiasCP.Text) <> '' then
  Begin
    MEDataCP.Text := DateToStr( DMObraContrato.QObraContrato_CadDt_Inicio.Value + StrToFloat(MEDiasCP.Text) );
    MEDiasCP.Text := '';
  End;

end;

procedure TFObraContratoConf.MEValorCPExit(Sender: TObject);
Var wLinha, wAux : String;
Const wBranco : String = '                            ';
begin
  If (MEDataCP.Text <> '') and
     (MEValorCP.Text <> '') then
  Begin
    wLinha := DateToStr( StrToDate(MEDataCP.Text) );
    wAux := '     '+FormatFloat('###,###,##0.00',StrToFloat(MEValorCP.Text));
    wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
    wLinha := wLinha + wAux;
    LBContaReceber.Items.Add(wLinha);
    MEDataCP.Text := '';
    MEValorCP.Text := '';
    MEDiasCP.SetFocus;
  End;

end;

procedure TFObraContratoConf.BtAvancarClick(Sender: TObject);
Var  wCont, wParc : Integer;
     wAux : String;
     wTotalParcelas, wEntrada : Real;
Begin
  wTotalParcelas := 0;
  wEntrada := 0;
  If Trim(MeValorEntrada.Text) <> '' then
  Begin
    wEntrada := StrTofloat(MEValorEntrada.Text);

    with DMOracle do
    begin
      DMOracle.DBCemapa.StartTransaction;
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add('INSERT INTO TB_CAIXA_MOV (COD_CAIXA_MOV, COD_USUARIO, DT_USUARIO, COD_FILIAL, COD_DEPARTAMENTO, COD_HISTORICO,');
      QExecSQL.SQL.Add('DT_MOVIMENTO, VAL_MOVIMENTO, NUM_DOCUMENTO, COD_CADASTRO, COD_CONTRATO_OBRA, DESC_COMPLEMENTO)');
      QExecSQL.SQL.Add('VALUES( ' + IntToStr(DMOracle.Sequencia('CAIXA_MOV')) + ',' + IntToStr(DMUsuario.CodUsuarioCorrente) + ',' + QuotedStr(DateToStr(DMOracle.DataServ)) + ',' +
                         DMObraContrato.QObraContrato_CadCOD_FILIAL.Text + ','+ Trim(MEDepartamento.Text) + ',' + IntToStr(1) + ',' +
                         QuotedStr(Trim(MeEmissao.Text)) + ',' + FloatToStr(wEntrada) + ',' + DMObraContrato.QObraContrato_CadNUM_CONTRATO.Text + ',' +
                         DMObraContrato.QObraContrato_CadCOD_CADASTRO.Text + ',' + DMObraContrato.QObraContrato_CadCOD_OBRA_CONTRATO.Text + ',' +
                         QuotedStr('ENT.CTT.') + ')'); 
      QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
    end;
  end;

  For wCont := 0 to LBContaReceber.Items.Count - 1 do
   Begin
    wAux := Copy(LBContaReceber.Items[wCont],12,16);
    wAux := Bib.LimpaString(wAux,'.');
    wTotalParcelas := wTotalParcelas + StrToFloat(wAux);
   End;

  If Trim(MeSerie.Text) <> 'ADI' Then
   Begin
     If Not Bib.ComparaNumero( (wTotalParcelas + wEntrada), DMObraContrato.QObraContrato_CadVl_Contrato.Value,2) then
        Raise Exception.Create('Soma das parcelas diferente do valor total do Contrato!');
   End
  Else
     If Not Bib.ComparaNumero( (wTotalParcelas + wEntrada), DMObraContrato.QObraContrato_AditivoVL_ADITIVO.Value,2) then
        Raise Exception.Create('Soma das parcelas diferente do valor aditivo!');


  //---comentado por Fabio 23/03/2005 em cuiabá deste ponto em adiante comentario anterior já estava assim
 {
  For wCont := 0 to LBContaReceber.Items.Count - 1 do
  Begin
    DMObraContrato.QContaReceberCab.Open;
    DMObraContrato.QContaReceberMov.Open;
    Try
      DMObraContrato.QContaReceberCab.Insert;
      DMObraContrato.QContaReceberCabCOD_FINALIDADE.Value := StrToInt(Trim(MeFinalidade.Text));
      DMObraContrato.QContaReceberCabCOD_CADASTRO.Value := DMObraContrato.QObraContrato_CadCod_Cadastro.Value;
      DMObraContrato.QContaReceberCabDT_EMISSAO.Value := StrToDate(MeEmissao.Text);
      DMObraContrato.QContaReceberCabDT_MOVIMENTO.Value := Date;
      DMObraContrato.QContaReceberCabNUM_TITULO.Value := StrToInt(Trim(MeNota.Text));
      DMObraContrato.QContaReceberCabCOD_FILIAL.Value := DMObraContrato.QObraContrato_CadCod_Filial.Value;
      DMObraContrato.QContaReceberCabCOD_DEPARTAMENTO.Value := StrToInt(Trim(MeDepartamento.Text));
      DMObraContrato.QContaReceberCabNUM_PARCELA.Value := wCont+1;
      DMObraContrato.QContaReceberCabDESC_TIPO_DOCUMENTO.Value := Trim(MeSerie.Text);
      DMObraContrato.QContaReceberCabIND_ACEITE.Value := 'SIM';
      DMObraContrato.QContaReceberCabIND_SITUACAO.Value := 'ABERTO';
      DMObraContrato.QContaReceberCabPERC_COMISSAO.Value := 0;
      DMObraContrato.QContaReceberCabVAL_JUROS.Value := 0;
      DMObraContrato.QContaReceberCabDT_VENCIMENTO.Value := StrToDate(Copy(LBContaReceber.Items[wCont],1,10) );
      DMObraContrato.QContaReceberCabDT_CAPITALIZACAO.Value := StrToDate(Copy(LBContaReceber.Items[wCont],1,10) );
      DMObraContrato.QContaReceberCabCOD_OBRA_CONTRATO.Value := DMObraContrato.QObraContrato_CadCod_Obra_Contrato.Value;
      wAux := Copy(LBContaReceber.Items[wCont],11,15);
      wAux := Bib.LimpaString(wAux,'.');
      DMObraContrato.QContaReceberCabVAL_TITULO.Value := StrToFloat(wAux );
      DMObraContrato.QContaReceberCabVAL_ORIGINAL.Value := StrToFloat(wAux );
      DMObraContrato.QContaReceberCab.Post;
      DMObraContrato.QContaReceberMov.Open;
      DMObraContrato.QContaReceberMov.Insert;
      DMObraContrato.QContaReceberMovCod_Conta_Receber_Cab.Value := DMObraContrato.QContaReceberCabCod_Conta_Receber_Cab.Value;
      DMObraContrato.QContaReceberMovDt_Movimento.Value := Date;
      DMObraContrato.QContaReceberMovInd_Tipo_Movimento.Value := 'PRINCIPAL';
      DMObraContrato.QContaReceberMovDt_Usuario.Value := DMOracle.DataHoraServ;
      DMObraContrato.QContaReceberMovCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
      DMObraContrato.QContaReceberMovVal_Movimento.Value :=  DMObraContrato.QContaReceberCabVAL_TITULO.Value;
      DMObraContrato.QContaReceberMov.Post;
    Except
        DMObraContrato.QContaReceberCab.Cancel;
        DMObraContrato.QContaReceberMov.Cancel;
      Raise;
    End;
  End;
  DMObraContrato.QObraContrato_Cad.Edit;
  DMObraContrato.QObraContrato_CadInd_Situacao.Value := '2';
  DMObraContrato.QObraContrato_Cad.Post;
  if DMOracle.DBCemapa.inTransaction then
    DMOracle.DBCemapa.Commit;
  DMObraContrato.QContaReceberCab.Close;
  DMObraContrato.QContaReceberMov.Close;
  DMObraContrato.QObraContrato_Cad.Close;
  DMObraContrato.QObraContrato_Cad.Open;
 }
  wParc := 1;  // este campo serve para controlar a parcela do C. Receber dos contratos aditivos
               // porque são feitos em dias diferentes e deve gerar parcela 1,2,3,4 ....
  If Trim(MeSerie.Text) = 'ADI' Then
     wParc := StrToInt('0'+DMOracle.BuscaNome('SELECT MAX(NUM_PARCELA) FROM TB_CONTA_RECEBER_CAB','COD_OBRA_CONTRATO = '+DMObraContrato.QObraContrato_CadCod_Obra_Contrato.Text));
  For wCont := 0 to LBContaReceber.Items.Count - 1 do
  Begin
    DMObraContrato.QContaReceberCab.Open;
    DMObraContrato.QContaReceberMov.Open;
    Try
      DMObraContrato.QContaReceberCab.Insert;
      DMObraContrato.QContaReceberCabCOD_FINALIDADE.Value := StrToInt(Trim(MeFinalidade.Text));
      DMObraContrato.QContaReceberCabCOD_CADASTRO.Value := DMObraContrato.QObraContrato_CadCod_Cadastro.Value;
      DMObraContrato.QContaReceberCabDT_EMISSAO.Value := StrToDate(MeEmissao.Text);
      DMObraContrato.QContaReceberCabDT_MOVIMENTO.Value := Date;
      DMObraContrato.QContaReceberCabNUM_TITULO.Value := StrToInt(DMObraContrato.QObraContrato_CadNUM_CONTRATO.Value);
      DMObraContrato.QContaReceberCabCOD_FILIAL.Value := DMObraContrato.QObraContrato_CadCod_Filial.Value;
      DMObraContrato.QContaReceberCabCOD_DEPARTAMENTO.Value := StrToInt(Trim(MeDepartamento.Text));
      If Trim(MeSerie.Text) <> 'CON' Then 
         DMObraContrato.QContaReceberCabNUM_PARCELA.Value := wCont + 1 + wParc
      Else
         DMObraContrato.QContaReceberCabNUM_PARCELA.Value := wCont + 1;
      If Trim(MeSerie.Text) <> '' Then
         DMObraContrato.QContaReceberCabDESC_TIPO_DOCUMENTO.Value := Trim(MeSerie.Text)
      Else
         DMObraContrato.QContaReceberCabDESC_TIPO_DOCUMENTO.Value := 'CON';
      DMObraContrato.QContaReceberCabIND_ACEITE.Value := 'SIM';
      DMObraContrato.QContaReceberCabIND_SITUACAO.Value := 'ABERTO';
      DMObraContrato.QContaReceberCabPERC_COMISSAO.Value := 0;
      DMObraContrato.QContaReceberCabVAL_JUROS.Value := 0;
      DMObraContrato.QContaReceberCabDT_VENCIMENTO.Value := StrToDate(Copy(LBContaReceber.Items[wCont],1,10) );
      DMObraContrato.QContaReceberCabDT_CAPITALIZACAO.Value := StrToDate(Copy(LBContaReceber.Items[wCont],1,10) );
      DMObraContrato.QContaReceberCabCOD_OBRA_CONTRATO.Value := DMObraContrato.QObraContrato_CadCod_Obra_Contrato.Value;
      DMObraContrato.QContaReceberCabCOD_OBRA_CONTRATO_ADITIVO.Value := DMObraContrato.QObraContrato_AditivoCOD_OBRA_CONTRATO_ADITIVO.Value;
      DMObraContrato.QContaReceberCabCOD_OBRA.Value := DMObraContrato.QObraContrato_CadCod_Obra.Value;
      wAux := Copy(LBContaReceber.Items[wCont],12,16);
      wAux := Bib.LimpaString(wAux,'.');
      DMObraContrato.QContaReceberCabVAL_TITULO.Value := StrToFloat(wAux );
      DMObraContrato.QContaReceberCabVAL_ORIGINAL.Value := StrToFloat(wAux );
      DMObraContrato.QContaReceberCab.Post;
      DMObraContrato.QContaReceberMov.Open;
      DMObraContrato.QContaReceberMov.Insert;
      DMObraContrato.QContaReceberMovCod_Conta_Receber_Cab.Value := DMObraContrato.QContaReceberCabCod_Conta_Receber_Cab.Value;
      DMObraContrato.QContaReceberMovDt_Movimento.Value := Date;
      DMObraContrato.QContaReceberMovInd_Tipo_Movimento.Value := 'PRINCIPAL';
      DMObraContrato.QContaReceberMovDt_Usuario.Value := DMOracle.DataHoraServ;
      DMObraContrato.QContaReceberMovCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
      DMObraContrato.QContaReceberMovVal_Movimento.Value :=  DMObraContrato.QContaReceberCabVAL_TITULO.Value;
      DMObraContrato.QContaReceberMov.Post;
    Except
        DMObraContrato.QContaReceberCab.Cancel;
        DMObraContrato.QContaReceberMov.Cancel;
      Raise;
    End;
  End;
  If Trim(MeSerie.Text) <> 'ADI' Then
   Begin
     DMObraContrato.QObraContrato_Cad.Edit;
     DMObraContrato.QObraContrato_CadInd_Situacao.Value := '2';
     DMObraContrato.QObraContrato_Cad.Post;
   End;  
  If DMOracle.DBCemapa.inTransaction then
    DMOracle.DBCemapa.Commit;
  DMObraContrato.QContaReceberCab.Close;
  DMObraContrato.QContaReceberMov.Close;
  DMObraContrato.QObraContrato_Cad.Close;
  DMObraContrato.QObraContrato_Cad.Open;
end;

procedure TFObraContratoConf.BtApagaParcelaClick(Sender: TObject);
begin
  LBContaReceber.Items.Delete(LBContaReceber.ItemIndex);
end;

procedure TFObraContratoConf.FormActivate(Sender: TObject);
begin
  LBContaReceber.Items.Clear;
  MeDepartamento.Text := IntToStr(DMUsuario.CodDepartamentoUsuario);
  MeFinalidade.Text := IntToStr(DMUsuario.CodFinalidadeUsuario);
  EdDepartamento.Text := '';
  EdFinalidade.Text   := '';
  MeNota.Text := '';
  MeEmissao.Text := DateToStr(Date);
  MeSerie.Visible := False;
  Label3.Visible := False;
  MeNota.Visible := False;
  Label1.Visible := False;
  MEValorEntrada.Text := '';
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'CONKRETA' Then
  Begin
    Label10.Enabled := False;
    Label10.Visible := False;
    MEValorEntrada.Enabled := False;
    MEValorEntrada.Visible := False;
  end;
end;

procedure TFObraContratoConf.SBPrazoClick(Sender: TObject);
begin
  if FPrazoVencimentoCons = nil then
    FPrazoVencimentoCons := TFPrazoVencimentoCons.Create(Application);
  if FPrazoVencimentoCons.showModal = mrOk then
  begin
    MePrazo.Text := DMPrazoVencimento.QPrazoVencimento_ConsCod_Prazo_Vencimento.Text;
    MePrazoExit(Self);
  end;
end;

procedure TFObraContratoConf.MePrazoExit(Sender: TObject);
begin
  if Trim(MePrazo.Text) <> '' then
  begin
    geraParcelas;
    MEDiasCP.SetFocus; 
  end;
end;

procedure TFObraContratoConf.geraParcelas;
var wLinha, wAux, wParc: string;
  wParcela, wSoma, wDiferenca: Real;
  wCont: Integer;
  wComissao: Extended;
const wBranco: string = '                            ';
begin
  if Trim(MePrazo.Text) <> '' then
  begin
    wParc := DMOracle.BuscaNome('SELECT NUM_PARCELAS FROM TB_PRAZO_VENCIMENTO', 'COD_PRAZO_VENCIMENTO = ' + Trim(MePrazo.Text));
    if wParc = '' then
      raise Exception.Create('Código de parcelas inexistente');
    wAux := DMOracle.BuscaNome('SELECT VAL_MINIMO_VENDA FROM TB_PRAZO_VENCIMENTO', 'COD_PRAZO_VENCIMENTO = ' + Trim(MePrazo.Text));
    
    DMPrazoVencimento.QPrazoVencimentoDias.Close;
    DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('COD_PRAZO_VENCIMENTO', Trim(MePrazo.Text));
    DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('NUM_DIAS', Null);
    DMPrazoVencimento.QPrazoVencimentoDias.Open;
    LBContaReceber.Items.Clear;

    wParcela := Trunc(StrToFloat(EdTotal.Text) / StrToFloat(wParc) * 100) / 100;
    wCont := 0;
    wSoma := 0;
    while not (DMPrazoVencimento.QPrazoVencimentoDias.Eof) do
    begin
      Inc(wCont);
      wSoma := wSoma + wParcela;
      if wCont = StrToInt(wParc) then
      begin
        wDiferenca := StrToFloat(EdTotal.Text) - wSoma;
        wParcela := wParcela + wDiferenca;
      end;
      wLinha := DateToStr(Date + DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value);
      wAux := FormatFloat('###,###,##0.00', wParcela);
      wAux := Copy(wBranco, 1, 15 - Length(waux)) + wAux;
      wLinha := wLinha + wAux;
      LBContaReceber.Items.Add(wLinha);
      DMPrazoVencimento.QPrazoVencimentoDias.Next;
    end;
  end;
  MEDataCP.Text := '';
  MEValorCP.Text := '';
  MePrazo.Text := '';
end;
procedure TFObraContratoConf.MEValorEntradaExit(Sender: TObject);
begin
  if Trim(MEValorEntrada.Text) <> '' then
    EdTotal.Text := FloatToStr(StrToFloat(EdTotal.Text) - StrToFloat(MEValorEntrada.Text))
  else
    EdTotal.Text := FloatToStr(DMObraContrato.QObraContrato_CadVl_Contrato.Value);
end;

end.
