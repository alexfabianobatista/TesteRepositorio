unit UContabiliza_CR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Mask, Variants;

type
  TFContabiliza_CR = class(TForm)
    Label89: TLabel;
    MeCodFilial: TMaskEdit;
    SBFilialCons: TSpeedButton;
    EdFilial: TMaskEdit;
    GroupBox7: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    MeDataI: TMaskEdit;
    MeDataF: TMaskEdit;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    Pb: TProgressBar;
    procedure BtOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MeCodFilialChange(Sender: TObject);
    procedure SBFilialConsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContabiliza_CR: TFContabiliza_CR;

implementation

uses UContabiliza_cl, UOracle_cl, UPlanilha_cl, UUsuario_cl, UFilialCons,
  UFilial_cl;

{$R *.DFM}

procedure TFContabiliza_CR.BtOkClick(Sender: TObject);
Var wCont, wFilial_Contabil, wFilial : Integer;
    wCodDoc, wCodCompl,wVlrLancto,wCodHistorico : Real;
    wNumDoc, wContaCred, wContaDeb,wContaCorrente,wCodBanco : String;
    wDtLancto : TDateTime;
begin
  DmUsuario.Checar_Filial_Usuario(MeCodFilial.Text,'CONTAS A RECEBER');
  If ( Trim(MeDataI.Text) = '' ) OR ( Trim(MeDataF.Text) = '' ) Then
    raise Exception.Create('É necessário informar um Período');
  With DMContabiliza do
  Begin
    QContabiliza_Cr.Close;
    If Trim(MeCodFilial.Text) <> '' Then
       QContabiliza_Cr.SetVariable('COD_FILIAL', Trim(MeCodFilial.Text))
    Else
       QContabiliza_Cr.SetVariable('COD_FILIAL', null);
    QContabiliza_Cr.SetVariable('DATA_I', Trim(MeDataI.Text));
    QContabiliza_Cr.SetVariable('DATA_F', Trim(MeDataF.Text));
    QContabiliza_Cr.Open;
    Pb.Position := QContabiliza_Cr.RecordCount;
    wCont := 0;
    DMOracle.DBCemapa.StartTransaction;
    Try
      While Not QContabiliza_Cr.Eof do
      Begin
        If QContabiliza_CrInd_Tipo_Movimento.Value = 'RECEBTO. JUROS' then
        Begin
          wCodDoc:=QContabiliza_CrCod_Conta_Receber_Cab.Value;
          wNumDoc:=FloatToStr(QContabiliza_CrNum_Titulo.Value)+'-'+Trim(QContabiliza_CrNome.Value);
          wFilial:=QContabiliza_CrCod_Filial.Value;
          wFilial_Contabil:=QContabiliza_CrCod_Filial.Value;
          wCodHistorico:=QContabiliza_CrCOD_HISTORICO_CONTABIL.Value;
          wContaCred:=QContabiliza_CrCOD_CONTABIL_VL_JURO_CRED.Value;
          wCodCompl:=QContabiliza_CrCod_Cadastro.Value;
          wVlrLancto:=QContabiliza_CrVal_Movimento.Value;
          wDtLancto:=QContabiliza_CrDt_Movimento.Value;
          if (QContabiliza_CrCod_Bco_Movimento.Value > 0) then  // Bancos
             Begin
               wContaCorrente:=DMOracle.BuscaNome('SELECT COD_CONTA_CORRENTE FROM TB_BCO_MOVIMENTO','COD_BCO_MOVIMENTO = '+QContabiliza_CRCod_Bco_Movimento.Text);
               wCodBanco:=DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+wContaCorrente);
               wContaDeb:=DMOracle.BuscaNome('SELECT Cod_Contabil_Vl_Juro_Bco_Deb FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+wCodBanco);
               If wFilial <> 1  Then
                  wFilial_Contabil  := 1;
             End
          Else
             wContaDeb:=QContabiliza_CrCOD_CONTABIL_VL_JURO_DEB.Value;
          If (wContaCred <> '') And
             (wContaDeb  <> '') Then
          Begin
            DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
            DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial_Contabil,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
          End;
        End;
        If QContabiliza_CrInd_Tipo_Movimento.Value = 'RECEBTO. PRINCIPAL' then
        Begin
          wCodDoc:=QContabiliza_CrCod_Conta_Receber_Cab.Value;
          wNumDoc:=FloatToStr(QContabiliza_CrNum_Titulo.Value)+'-'+Trim(QContabiliza_CrNome.Value);
          wFilial:=QContabiliza_CrCod_Filial.Value;
          wFilial_Contabil:=QContabiliza_CrCod_Filial.Value;
          wCodHistorico:=QContabiliza_CrCOD_HISTORICO_CONTABIL.Value;
          wContaCred:=QContabiliza_CrCOD_CONTABIL_VL_BAIXA_CRED.Value;
          wCodCompl:=QContabiliza_CrCod_Cadastro.Value;
          wVlrLancto:=QContabiliza_CrVal_Movimento.Value;
          wDtLancto:=QContabiliza_CrDt_Movimento.Value;
          If QContabiliza_CrCod_Bco_Movimento.Value > 0 then  // Bancos
             Begin
               wContaCorrente:=DMOracle.BuscaNome('SELECT COD_CONTA_CORRENTE FROM TB_BCO_MOVIMENTO','COD_BCO_MOVIMENTO = '+QContabiliza_CRCod_Bco_Movimento.Text);
               wCodBanco:=DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+wContaCorrente);
               wContaDeb:=DMOracle.BuscaNome('SELECT Cod_Contabil_Vl_Prin_Bco_Deb FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+wCodBanco);
               If wFilial <> 1  Then
                  wFilial_Contabil  := 1;
             End
          Else
              wContaDeb:=QContabiliza_CrCOD_CONTABIL_VL_BAIXA_DEB.Value;
          If (wContaCred <> '') And
              (wContaDeb  <> '') Then
          Begin
            DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
            DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial_Contabil,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
          End;
        End;
        If QContabiliza_CrInd_Tipo_Movimento.Value = 'DESC. CONCEDIDO' then
        Begin
          wCodDoc:=QContabiliza_CrCod_Conta_Receber_Cab.Value;
          wNumDoc:=FloatToStr(QContabiliza_CrNum_Titulo.Value)+'-'+Trim(QContabiliza_CrNome.Value);
          wFilial:=QContabiliza_CrCod_Filial.Value;
          wFilial_Contabil:=QContabiliza_CrCod_Filial.Value;
          wCodHistorico:=QContabiliza_CrCOD_HISTORICO_CONTABIL.Value;
          wContaCred:=QContabiliza_CrCOD_CONTABIL_VL_BAIXA_CRED.Value;
          wCodCompl:=QContabiliza_CrCod_Cadastro.Value;
          wVlrLancto:=QContabiliza_CrVal_Movimento.Value;
          wDtLancto:=QContabiliza_CrDt_Movimento.Value;
          wContaDeb:=QContabiliza_CrCOD_CONTABIL_VL_DESC_DEB.Value;
          If (QContabiliza_CrCod_Bco_Movimento.Value > 0) then  // Baixa por Bancos
             Begin
               wContaCorrente:=DMOracle.BuscaNome('SELECT COD_CONTA_CORRENTE FROM TB_BCO_MOVIMENTO','COD_BCO_MOVIMENTO = '+QContabiliza_CRCod_Bco_Movimento.Text);
               wCodBanco:=DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+wContaCorrente);
               wContaCred:=DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_DESC_CRED FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+wCodBanco);
               If wFilial <> 1  Then
                  wFilial_Contabil  := 1;
             End
          else
             wContaCred:=QContabiliza_CrCOD_CONTABIL_VL_DESC_CRED.Value;
          If (wContaCred <> '') And
              (wContaDeb  <> '') Then
          Begin
            DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
            DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial_Contabil,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
          End;
          // contabiliza o desconto como principal para acertar o valor na contabilidade
          wContaCred:=QContabiliza_CrCOD_CONTABIL_VL_BAIXA_CRED.Value;
          If (QContabiliza_CrCod_Bco_Movimento.Value > 0) then  // Baixa por Bancos
             Begin
               wContaCorrente:=DMOracle.BuscaNome('SELECT COD_CONTA_CORRENTE FROM TB_BCO_MOVIMENTO','COD_BCO_MOVIMENTO = '+QContabiliza_CRCod_Bco_Movimento.Text);
               wCodBanco:=DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+wContaCorrente);
               wContaDeb:=DMOracle.BuscaNome('SELECT Cod_Contabil_Vl_Prin_Bco_Deb FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+wCodBanco);
               If wFilial <> 1  Then
                  wFilial_Contabil  := 1;
             End
          else
              wContaDeb:=QContabiliza_CrCOD_CONTABIL_VL_BAIXA_DEB.Value;
          If (wContaCred <> '') And
             (wContaDeb  <> '') Then
          Begin
            DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
            DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial_Contabil,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
          End;
        End;
        QContabiliza_Cr.Next;
        wCont := wCont + 1;
        Pb.Position := wCont;
      End;
      DMOracle.DBCemapa.Commit;
      Pb.Position := 0;
    Except
      DMOracle.DBCemapa.RollBack;
      Raise;
    End;
  End;
End;

procedure TFContabiliza_CR.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMContabiliza.QContabiliza_Cr.Close;
   Action := CaFree;
   FContabiliza_CR := Nil;
end;

procedure TFContabiliza_CR.MeCodFilialChange(Sender: TObject);
begin
  If Trim(MECodFilial.Text) <> '' Then
    EdFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(MECodFilial.Text));
end;

procedure TFContabiliza_CR.SBFilialConsClick(Sender: TObject);
begin
  If FFilialCons = nil Then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.Showmodal = mrOk Then
    MECodFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
end;

end.
