unit UContabilizaCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ComCtrls, variants;

type
  TFContabilizaCaixa = class(TForm)
    Label31: TLabel;
    MECodFilial: TMaskEdit;
    Bt7CodFilial: TSpeedButton;
    EdFilial: TMaskEdit;
    GroupBox6: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    MEDataI: TMaskEdit;
    MEDataF: TMaskEdit;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    Pb: TProgressBar;
    procedure MECodFilialChange(Sender: TObject);
    procedure Bt7CodFilialClick(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContabilizaCaixa: TFContabilizaCaixa;

implementation

uses UOracle_cl, UFilialCons, UContabiliza_cl, UParamSistema_cl, UFilial_cl,
  UPlanilha_cl, UUsuario_cl;

{$R *.DFM}

procedure TFContabilizaCaixa.MECodFilialChange(Sender: TObject);
begin
  if Trim(MECodFilial.text)<>'' then
     EdFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL ='+MECodFilial.Text)
  else
     EdFilial.Text := 'Todas';

end;

procedure TFContabilizaCaixa.Bt7CodFilialClick(Sender: TObject);
begin
  if FFilialCons = Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.Showmodal=mrOk then
    MECodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);

end;

procedure TFContabilizaCaixa.BtOkClick(Sender: TObject);
Var wCont,wFilial : Integer;
    wCodDoc,wCodCompl,wCodHistorico,wVlrLancto : Real;
    wNumDoc,wContaCred,wContaDeb : String;
    wDtLancto : tDateTime;
begin
  DmUsuario.Checar_Filial_Usuario(MECodFilial.Text,'CAIXA'); //SEGURANÇA FILIAL
  With DMContabiliza do
  Begin
    QContabiliza_Cx.Close;
    If Trim(MeCodFilial.Text) <> '' Then
       QContabiliza_Cx.SetVariable('COD_FILIAL',StrToInt(Trim(MeCodFilial.Text)))
    Else
       QContabiliza_Cx.SetVariable('COD_FILIAL',Null);
    QContabiliza_Cx.SetVariable('DATA_I',StrToDate(Trim(MeDataI.Text)));
    QContabiliza_Cx.SetVariable('DATA_F',StrToDate(Trim(MeDataF.Text)));
    QContabiliza_Cx.Open;
    Pb.Position := QContabiliza_Cx.RecordCount;
    wCont := 0;
    DMOracle.DBCemapa.StartTransaction;
    Try
      While Not QContabiliza_Cx.Eof Do
      Begin
        wCodDoc:=QContabiliza_CxCod_Caixa_Mov.Value;
        If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
          wNumDoc:=FloatToStr(QContabiliza_CxNum_Documento.Value)
        else
          wNumDoc:=FloatToStr(QContabiliza_CxNum_Documento.Value)+'-'+Trim(QContabiliza_CxDesc_Complemento.Value);
        wFilial:=QContabiliza_CxCod_Filial.Value;
        wContaCred:=QContabiliza_CxCod_Contabil_Cred.Value;
        wContaDeb:=QContabiliza_CxCod_Contabil_Deb.Value;
        wCodCompl:=QContabiliza_CxCod_Cadastro.Value;
        wCodHistorico:=QContabiliza_CxCod_Historico_Contabil.Value;
        wVlrLancto:=QContabiliza_CxVal_Movimento.Value;
        wDtLancto:=QContabiliza_CxDt_Movimento.Value;
        DMPlanilha.GravaLanc('CX',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
        DMPlanilha.GravaLanc('CX',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
        QContabiliza_Cx.Next;
        wCont := wCont + 1;
        Pb.Position := wCont;
      End;
      DMOracle.DBCemapa.Commit;
      Pb.Position := 0;
    Except
      DMOracle.DBCemapa.RollBack;
      Raise;
    End;
    QContabiliza_Cx.Close;
  End;
end;

procedure TFContabilizaCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
  FContabilizaCaixa := Nil;
end;

end.
