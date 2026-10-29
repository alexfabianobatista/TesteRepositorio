unit UContabilizaBancos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Mask;

type
  TFContabilizaBancos = class(TForm)
    GroupBox9: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    MEDataI: TMaskEdit;
    MEDataF: TMaskEdit;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    Pb: TProgressBar;
    procedure BtOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContabilizaBancos: TFContabilizaBancos;

implementation

uses UContabiliza_cl, UOracle_cl, UPlanilha_cl;

{$R *.DFM}

procedure TFContabilizaBancos.BtOkClick(Sender: TObject);
Var wCont,wFilial : Integer;
    wCodDoc,wCodCompl,wCodHistorico,wVlrLcto : Real;
    wNumDoc,wContaCred,wContaDeb : String;
    wDtLcto : tDateTime;
begin
  With DMContabiliza Do
  Begin
    QContabiliza_Bc.Close;
    QContabiliza_Bc.SetVariable('DATA_I',StrToDate(Trim(MeDataI.Text)));
    QContabiliza_Bc.SetVariable('DATA_F',StrToDate(Trim(MeDataF.Text)));
    QContabiliza_Bc.Open;
    Pb.Position := QContabiliza_Bc.RecordCount;
    wCont := 0;
    DMOracle.DBCemapa.StartTransaction;
    Try
      While Not QContabiliza_Bc.Eof Do
      Begin
        wCodDoc:=QContabiliza_BcCOD_BCO_MOVIMENTO.Value;
        If QContabiliza_BcDESC_COMPLEMENTO1.Value <> '' Then
           wNumDoc:=IntToStr(QContabiliza_BcNUM_CHEQUE.Value) + '-' + QContabiliza_BcDESC_COMPLEMENTO1.Value
        Else
           wNumDoc:=IntToStr(QContabiliza_BcNUM_CHEQUE.Value) + '-' + QContabiliza_BcDESC_OBSERVACAO.Value;
        wFilial:=QContabiliza_BcCOD_FILIAL.Value;
        If QContabiliza_BcInd_operacao.Value = '-' Then
         Begin
           wContaDeb:=QContabiliza_BcCOD_CONTABIL_DEB.Value;
           wContaCred:='';
         End
        Else
         Begin
           wContaCred:=QContabiliza_BcCOD_CONTABIL_CRED.Value;
           wContaDeb:='';
         End;

        if wContaCred = '' Then
           wContaCred:=QContabiliza_BcCOD_CONTABIL_CONTRAPARTIDA.Value;

        if wContaDeb = '' Then
           wContaDeb:=QContabiliza_BcCOD_CONTABIL_CONTRAPARTIDA.Value;

        wCodCompl:=QContabiliza_BcCod_Cadastro.Value;
        wCodHistorico:=QContabiliza_BcCOD_HISTORICO_CONTABIL.Value;
        wVlrLcto:=QContabiliza_BcVal_Movimento.Value;
        wDtLcto:=QContabiliza_BcDt_Movimento.Value;
        DMPlanilha.GravaLanc('BC',wCodDOc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrLcto,wDtLcto,wContaDeb);
        DMPlanilha.GravaLanc('BC',wCodDOc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrLcto,wDtLcto,wContaCred);


        wCont := wCont + 1;
        Pb.Position := wCont;
        QContabiliza_Bc.Next;
      End;
      DMOracle.DBCemapa.Commit;
      QContabiliza_Bc.Close;
      Pb.Position := 0;
    Except
      DMOracle.DBCemapa.RollBack;
      Raise;
    End;
  End;
end;

procedure TFContabilizaBancos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  FContabilizaBancos := Nil;
end;

end.
