unit UContabiliza_CP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ComCtrls, variants;

type
  TFContabiliza_CP = class(TForm)
    MECodFilial: TMaskEdit;
    Label8: TLabel;
    SpeedButton4: TSpeedButton;
    EdFilial: TMaskEdit;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label10: TLabel;
    MEDataI: TMaskEdit;
    MEDataF: TMaskEdit;
    PB: TProgressBar;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    procedure MECodFilialChange(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContabiliza_CP: TFContabiliza_CP;

implementation

uses UOracle_cl, UFilialCons, UContabiliza_cl, UPlanilha_cl, UFilial_cl,
  UUsuario_cl;

{$R *.DFM}

procedure TFContabiliza_CP.MECodFilialChange(Sender: TObject);
begin
  if Trim(MECodFilial.Text)<>'' then
     EdFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial.Text)
  else
     EdFilial.Text := 'Todas';
end;

procedure TFContabiliza_CP.SpeedButton4Click(Sender: TObject);
begin
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    MECodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);

end;

procedure TFContabiliza_CP.BtOkClick(Sender: TObject);
Var wFilial,wCont : Integer;
    wDtLancto:TDateTime;
    wCodDoc,wCodCompl,wVlrLancto : Real;
    wNumDoc,wContaDeb,wContaCred,wCodBanco,wContaCorrente,wHistorico_Contabil : String;
begin
  If (Trim(MeDataI.Text) = '') OR (Trim(MeDataF.Text) = '') Then
    raise Exception.Create('É necessário Informar um período');
  DmUsuario.Checar_Filial_Usuario(MECodFilial.Text,'CONTAS A PAGAR');
  With DMContabiliza Do
  Begin
    QContabiliza_CP.Close;
    If Trim(MeCodFilial.Text) <> '' Then
       //QContabiliza_CP.ParamByName('COD_FILIAL').AsFloat := StrToFloat(Trim(MeCodfilial.Text))
       QContabiliza_CP.SetVariable('COD_FILIAL', Trim(MeCodfilial.Text))
    Else
       //QContabiliza_CP.ParamByName('COD_FILIAL').Clear;
       QContabiliza_CP.SetVariable('COD_FILIAL', null);
    //QContabiliza_CP.ParamByName('DATA_I').AsDate :=StrToDate(Trim(MeDataI.Text));
    //QContabiliza_CP.ParamByName('DATA_F').AsDate :=StrToDate(Trim(MeDataF.Text));
    QContabiliza_CP.SetVariable('DATA_I', Trim(MeDataI.Text) );
    QContabiliza_CP.SetVariable('DATA_F', Trim(MeDataF.Text) );
    QContabiliza_CP.Open;
    PB.Position := QContabiliza_CP.RecordCount;
    wCont := 0;
    DMOracle.DBCemapa.StartTransaction;
    Try
      While Not QContabiliza_CP.Eof Do
      Begin
        wCodDoc:=QContabiliza_CPCod_Conta_Pagar_Cab.Value;
        wNumDoc:=FloatToStr(QContabiliza_CPNum_Titulo.Value)+'-'+Trim(QContabiliza_CPNome.Value);
        wFilial:=QContabiliza_CPCod_Filial.Value;
        wCodCompl:=QContabiliza_CPCod_Cadastro.Value;
        wVlrLancto:=QContabiliza_CPVal_Movimento.Value;
        wDtLancto:=QContabiliza_CPDT_Movimento.Value;
        wHistorico_Contabil:=FloatToStr(QContabiliza_CPCOD_HISTORICO_CONTABIL.Value);
        If QContabiliza_CPInd_Tipo_Movimento.Value = 'PGTO. PRINCIPAL' Then
        Begin
          wContaDeb:=QContabiliza_CPCOD_CONTABIL_VL_BAIXA_DEB.Value;
          If QContabiliza_CPCod_Bco_Movimento.Value > 0 then // Pagto com Cheque
            Begin
              wContaCorrente:=DMOracle.BuscaNome('SELECT COD_CONTA_CORRENTE FROM TB_BCO_MOVIMENTO','COD_BCO_MOVIMENTO = '+QContabiliza_CPCod_Bco_Movimento.Text);
              wCodBanco:=DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+wContaCorrente);
              wContaCred:=DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_PRIN_BCO_CRED FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+wCodBanco);
            End
          else
              wContaCred:=QContabiliza_CPCOD_CONTABIL_VL_BAIXA_CRED.Value;
          If (wContaCred <>  '') And (wContaDeb <> '') Then
          Begin
            DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaDeb);
            DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaCred);
          End;
        End;
        If QContabiliza_CPInd_Tipo_Movimento.Value = 'DESCONTO' Then
        Begin
          wContaCred:=QContabiliza_CPCOD_CONTABIL_VL_DESC_CRED.Value;
          wContaDeb:=QContabiliza_CPCOD_CONTABIL_VL_DESC_DEB.Value;
          If (wContaCred <> '') And (wContaDeb <> '') Then
          Begin
            DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaDeb);
            DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaCred);
          End;
        End;
        If QContabiliza_CPInd_Tipo_Movimento.Value = 'PGTO. JUROS' Then
        Begin
          wContaDeb:=QContabiliza_CPCOD_CONTABIL_VL_JURO_DEB.Value;
          wContaCred:=QContabiliza_CPCOD_CONTABIL_VL_JURO_CRED.Value;
          If (wContaCred <> '') And  (wContaDeb <> '') Then
          Begin
            DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaDeb);
            DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaCred);
          End;
        End;
        QContabiliza_CP.Next;
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
end;

end.
