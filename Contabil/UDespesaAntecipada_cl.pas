unit UDespesaAntecipada_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste, variants;

type
  TDMDespesaAntecipada = class(TDataModule)
    QDespesaAntecipada: TOracleDataSet1;
    QDespesaAntecipadaCOD_DESPESA_ANTECIPADA: TIntegerField;
    QDespesaAntecipadaDESC_DESPESA_ANTECIPADA: TStringField;
    QDespesaAntecipadaDT_LANCAMENTO: TDateTimeField;
    QDespesaAntecipadaCOD_CADASTRO: TIntegerField;
    QDespesaAntecipadaVAL_DESPESA: TFloatField;
    QDespesaAntecipadaNUM_DOCUMENTO: TIntegerField;
    QDespesaAntecipadaQT_PARCELAS: TIntegerField;
    QDespesaAntecipadaCOD_CONTABIL_CRED: TStringField;
    QDespesaAntecipadaCOD_CONTABIL_DEB: TStringField;
    QDespesaAntecipadaCOD_HISTORICO_CONTABIL: TIntegerField;
    QDespesaAntecipadaOBSERVACAO: TStringField;
    QDespesaAntecipadadesc_historico_contabil: TStringField;
    QDespesaAntecipadanome: TStringField;
    QDespesaAntecipadadesc_contabil_cred: TStringField;
    QDespesaAntecipadadesc_contabil_deb: TStringField;
    QDespesaAntecipadaval_rateio_mensal: TFloatField;
    QDespesaAntecipadaCOD_USUARIO: TIntegerField;
    QDespesaAntecipParc: TOracleDataSet1;
    QDespesaAntecipParcCOD_DESPESA_ANTECIP_PARC: TIntegerField;
    QDespesaAntecipParcCOD_DESPESA_ANTECIPADA: TIntegerField;
    QDespesaAntecipParcVAL_PARCELA: TFloatField;
    QDespesaAntecipParcNUM_MES: TStringField;
    QDespesaAntecipParcDT_CONTABILIZACAO: TDateTimeField;
    QDespesaAntecipParcIND_CONTABILIZADO: TStringField;
    QDespesaAntecipParcCOD_USUARIO_CONT: TIntegerField;
    DSParcela: TDataSource;
    QDespesaAntecipadaCOD_FILIAL: TIntegerField;
    QDespesaAntecipadadesc_filial: TStringField;
    QDespesaAntecipadaDESC_COMPLEMENTO: TStringField;
    QDespesaAntecipadaCOD_CONTABIL_PARC_CRED: TStringField;
    QDespesaAntecipadaCOD_CONTABIL_PARC_DEB: TStringField;
    QDespesaAntecipadadesc_contabil_parc_deb: TStringField;
    QDespesaAntecipadadesc_contabil_parc_cred: TStringField;
    QContabilizar: TOracleDataSet1;
    QContabilizarCOD_DESPESA_ANTECIPADA: TIntegerField;
    QContabilizarCOD_DESPESA_ANTECIP_PARC: TIntegerField;
    QContabilizarVAL_PARCELA: TFloatField;
    QContabilizarNUM_MES: TStringField;
    QContabilizarCOD_FILIAL: TIntegerField;
    QContabilizarCOD_HISTORICO_CONTABIL: TIntegerField;
    QContabilizarCOD_CONTABIL_PARC_DEB: TStringField;
    QContabilizarCOD_CONTABIL_PARC_CRED: TStringField;
    QContabilizarDESC_COMPLEMENTO: TStringField;
    QDespesaAntecipadaCons: TOracleDataSet1;
    QDespesaAntecipadaConsCOD_DESPESA_ANTECIPADA: TIntegerField;
    QDespesaAntecipadaConsDESC_DESPESA_ANTECIPADA: TStringField;
    QDespesaAntecipadaConsDT_LANCAMENTO: TDateTimeField;
    QDespesaAntecipadaConsVAL_DESPESA: TFloatField;
    QDespesaAntecipadaConsQT_PARCELAS: TIntegerField;
    QDespesaAntecipadaConsCOD_FILIAL: TIntegerField;
    QDespesaAntecipadaConsCADASTRO: TStringField;
    QRDespesaAntecipada: TOracleDataSet1;
    QRDespesaAntecipadaCOD_DESPESA_ANTECIPADA: TIntegerField;
    QRDespesaAntecipadaDESC_DESPESA_ANTECIPADA: TStringField;
    QRDespesaAntecipadaDT_LANCAMENTO: TDateTimeField;
    QRDespesaAntecipadaCADASTRO: TStringField;
    QRDespesaAntecipadaVAL_DESPESA: TFloatField;
    QRDespesaAntecipadaQT_PARCELAS: TIntegerField;
    QRDespesaAntecipadaFILIAL: TStringField;
    QRDespesaAntecipadaPARC_CONTAB: TFloatField;
    QRDespesaAntecipadaVAL_CONTAB: TFloatField;
    QDespesaAntecipadaIND_SITUACAO: TStringField;
    procedure QDespesaAntecipadaAfterInsert(DataSet: TDataSet);
    procedure QDespesaAntecipadaCalcFields(DataSet: TDataSet);
    procedure QDespesaAntecipadaBeforePost(DataSet: TDataSet);
    procedure QDespesaAntecipadaAfterPost(DataSet: TDataSet);
    procedure QDespesaAntecipadaAfterScroll(DataSet: TDataSet);
    procedure QDespesaAntecipParcAfterInsert(DataSet: TDataSet);
    procedure QDespesaAntecipadaAfterCancel(DataSet: TDataSet);
    procedure QDespesaAntecipadaBeforeClose(DataSet: TDataSet);
    procedure QDespesaAntecipadaBeforeInsert(DataSet: TDataSet);
    procedure QDespesaAntecipadaPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure QDespesaAntecipParcBeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
    pInserindo: boolean;
  public
    { Public declarations }
    function DiasMes(wMes: Integer):Integer;
    function MesAno(wMes,wAno:Integer):String;
  end;

var
  DMDespesaAntecipada: TDMDespesaAntecipada;

implementation

uses UOracle_cl, UUsuario_cl, UBiblioteca;

{$R *.DFM}

//Retorna o número de dias do mes
function TDMDespesaAntecipada.DiasMes(wMes:Integer):Integer;
var wDias: Integer;
begin
  wMes := wMes mod 12;
  if wMes = 2 then
    wDias := 28;
  if wMes in [4,6,9,11] then
    wDias := 30;
  if wMes in [1,3,5,7,8,10,12,0] then
    wDias := 31;
  Result := wDias;
end;
//Retorna o mes no formato mm/aaaa
function TDMDespesaAntecipada.MesAno(wMes,wAno:Integer):String;
var
  wFlag: Boolean;
  wAux: String;
begin
  wFlag := (wMes mod 12) = 0;
  wAno := wAno + (wMes div 12);
  wMes := wMes mod 12;
  if wFlag then
  begin
    wAno := wAno - 1;
    wMes := 12;
  end;
  if wMes < 10 then
    wAux := '0';
  wAux := wAux + IntToStr(wMes)+'/'+IntToStr(wAno);
  Result := wAux;
end;

procedure TDMDespesaAntecipada.QDespesaAntecipadaAfterInsert(
  DataSet: TDataSet);
begin
  QDespesaAntecipadaDT_LANCAMENTO.Value := DMOracle.DataServ;
end;

procedure TDMDespesaAntecipada.QDespesaAntecipadaCalcFields(
  DataSet: TDataSet);
begin
  QDespesaAntecipadanome.Value :=  DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+IntToStr(QDespesaAntecipadaCOD_CADASTRO.Value));
  QDespesaAntecipadadesc_filial.Value :=  DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+IntToStr(QDespesaAntecipadaCOD_FILIAL.Value));
  QDespesaAntecipadadesc_historico_contabil.Value :=  DMOracle.BuscaNome('SELECT DESC_HISTORICO_CONTABIL FROM TB_HISTORICO_CONTABIL','COD_HISTORICO_CONTABIL = '+IntToStr(QDespesaAntecipadaCOD_HISTORICO_CONTABIL.Value));
  QDespesaAntecipadadesc_contabil_cred.value := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QDespesaAntecipadaCod_Contabil_Cred.Value+chr(39));
  QDespesaAntecipadadesc_contabil_deb.value := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QDespesaAntecipadaCod_Contabil_deb.Value+chr(39));
  QDespesaAntecipadadesc_contabil_parc_cred.value := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QDespesaAntecipadaCod_Contabil_Parc_Cred.Value+chr(39));
  QDespesaAntecipadadesc_contabil_parc_deb.value := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+QDespesaAntecipadaCod_Contabil_Parc_deb.Value+chr(39));
  if (Trim(QDespesaAntecipadaVAL_DESPESA.Text) <> '') and
     (Trim(QDespesaAntecipadaQT_PARCELAS.Text) <> '') and
     (QDespesaAntecipadaQT_PARCELAS.Value > 0)        then
    QDespesaAntecipadaval_rateio_mensal.Value := QDespesaAntecipadaVAL_DESPESA.Value / QDespesaAntecipadaQT_PARCELAS.Value
  else
    QDespesaAntecipadaval_rateio_mensal.Value := 0.0;
end;

procedure TDMDespesaAntecipada.QDespesaAntecipadaBeforePost(
  DataSet: TDataSet);
begin
  QDespesaAntecipadaCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMDespesaAntecipada.QDespesaAntecipadaAfterPost(DataSet: TDataSet);
var
  wI,wDias: Integer;
  wValParc, wValDia: Real;
  wDia1,wDia,wMes,wAno: Word;
  wData:TDate;
  wAux: String;
begin
  if pInserindo then
  begin
    DecodeDate(QDespesaAntecipadaDT_LANCAMENTO.Value,wAno,wMes,wDia);
    wDias := 0;
    for wI := 1 to QDespesaAntecipadaQT_PARCELAS.Value - 1 do
      wDias := wDias + DiasMes(wMes+wI);
    wDias := wDias + wDia + (DiasMes(wMes)-wDia);
    wValParc := 0.0;
    wValDia := QDespesaAntecipadaVAL_DESPESA.Value/wDias;
    if wDia = 1 then
      wDia1 := 1
    else
      wDia1 := 0;
    for wI := 0 to QDespesaAntecipadaQT_PARCELAS.Value-wDia1 do
    begin
      QDespesaAntecipParc.Insert;
      if wI = 0 then //mes inicial
        QDespesaAntecipParcVAL_PARCELA.Value := (DiasMes(wMes)-wDia+1) * wValDia
      else if wI = (QDespesaAntecipadaQT_PARCELAS.Value) then //mes final
      begin
        if wValParc <> QDespesaAntecipadaVAL_DESPESA.Value then
          QDespesaAntecipParcVAL_PARCELA.Value := QDespesaAntecipadaVAL_DESPESA.Value - wValParc
        else
        begin
          QDEspesaAntecipParc.Cancel;
          Break;
        end;
      end
      else //mes inteiro
        QDespesaAntecipParcVAL_PARCELA.Value := DiasMes(wMes+wI) * wValDia;
      QDespesaAntecipParcNUM_MES.Text := MesAno(wMes+wI,wAno);
      QDespesaAntecipParcVAL_PARCELA.Text := FormatFloat('0.00', QDespesaAntecipParcVAL_PARCELA.Value);
      QDEspesaAntecipParc.Post;
      wValParc := wValParc + QDespesaAntecipParcVAL_PARCELA.Value;
    end;
  end;
  QDespesaAntecipadaAfterScroll(DataSet);
end;

procedure TDMDespesaAntecipada.QDespesaAntecipadaAfterScroll(
  DataSet: TDataSet);
begin
  QDespesaAntecipParc.Close;
  QDespesaAntecipParc.SetVariable('PK',NULL);
  QDespesaAntecipParc.SetVariable('DESPESA',QDespesaAntecipadaCOD_DESPESA_ANTECIPADA.Value);
  QDespesaAntecipParc.Open;
end;

procedure TDMDespesaAntecipada.QDespesaAntecipParcAfterInsert(
  DataSet: TDataSet);
begin
  QDespesaAntecipParcCOD_DESPESA_ANTECIPADA.Value := QDespesaAntecipadaCOD_DESPESA_ANTECIPADA.Value;
end;

procedure TDMDespesaAntecipada.QDespesaAntecipadaAfterCancel(
  DataSet: TDataSet);
begin
  pInserindo := False;
end;

procedure TDMDespesaAntecipada.QDespesaAntecipadaBeforeClose(
  DataSet: TDataSet);
begin
  QDespesaAntecipParc.Close;
end;

procedure TDMDespesaAntecipada.QDespesaAntecipadaBeforeInsert(
  DataSet: TDataSet);
begin
  pInserindo := True;
end;

procedure TDMDespesaAntecipada.QDespesaAntecipadaPostError(
  DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  pInserindo := False;
end;

procedure TDMDespesaAntecipada.QDespesaAntecipParcBeforeEdit(
  DataSet: TDataSet);
begin
  If QDespesaAntecipParcIND_CONTABILIZADO.Value = 'SIM' Then
     Raise Exception.Create('Não é permitido alterar itens já contabilizados');
end;

end.
