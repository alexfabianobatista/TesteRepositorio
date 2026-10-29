unit UBancoConciliaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, variants, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFBancoConciliaCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    BtHistorico: TSpeedButton;
    BtContaCorrente: TSpeedButton;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    ListadeChequesConciliao1: TMenuItem;
    Label6: TLabel;
    MeDtCompensacao: TMaskEdit;
    procedure FormActivate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure BtHistoricoClick(Sender: TObject);
    procedure BtContaCorrenteClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure ListadeChequesConciliao1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBancoConciliaCad: TFBancoConciliaCad;

implementation

uses UBancoAgencia_cl, UHistoricoCons, UContaCorrenteCons, UHistorico_cl,
  UBancoConciliaCons, UBancoConciliaParam, URBancoConcilia_Cheques,
  UOracle_cl, UBancoAgenciaRel_cl;

{$R *.DFM}

procedure TFBancoConciliaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMBancoAgencia.QBancoConciliaCad.Open;
  MeDtCompensacao.Text := DateToStr(Date);
end;

procedure TFBancoConciliaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [dsInsert,dsEdit] then
    begin
      BtContaCorrente.Enabled:=True;
      BtHistorico.Enabled:=True;
    end
  else
    begin
      BtContaCorrente.Enabled:=False;
      BtHistorico.Enabled:=False;
    end
end;

procedure TFBancoConciliaCad.BtHistoricoClick(Sender: TObject);
begin
  inherited;
  if FHistoricoCons  = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=mrOk Then
    DMBancoAgencia.QBancoConciliaCadCOD_HISTORICO.Value:=DMHistorico.QHistoricoConsCod_Historico.Value;
end;

procedure TFBancoConciliaCad.BtContaCorrenteClick(Sender: TObject);
begin
  inherited;
  FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal=mrOk Then
    DMBancoAgencia.QBancoConciliaCadCOD_CONTA_CORRENTE.Value:=DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value;
end;

procedure TFBancoConciliaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FBancoConciliaCons = Nil then
     FBancoConciliaCons:=TFBancoConciliaCons.Create(Application);
  if FBancoConciliaCons.ShowModal=mrOk then
   begin
     with DMBancoAgencia do
     begin
       QBancoConciliaCad.Close;
       QBancoConciliaCad.SetVariable('PK',QBancoConciliaConsCod_Bco_Concilia.Value);
       QBancoConciliaCad.Open;
     end;
   end;
end;

procedure TFBancoConciliaCad.ListadeChequesConciliao1Click(
  Sender: TObject);
var
  winicial,wfinal:String;
begin
  inherited;
  if FBancoConciliaParam = Nil then
    FBancoConciliaParam := TFBancoConciliaParam.Create(Application);
  FBancoConciliaParam.PGRelatorio.Pages[0].TabVisible:=True;
  if FBancoConciliaParam.ShowModal = mrOK then
    begin
      with DMBancoAgenciaRel do
        begin
          QRBancoConcilia_Cheques.Close;
          if Trim(FBancoConciliaParam.ME0CodBanco.Text) <> '' then
            QRBancoConcilia_Cheques.SetVariable('COD_BANCO',StrToInt(Trim(FBancoConciliaParam.ME0CodBanco.Text)))
          else
            QRBancoConcilia_Cheques.SetVariable('COD_BANCO',Null);

          if Trim(FBancoConciliaParam.ME0CodContaCorrente.Text) <> '' then
            QRBancoConcilia_Cheques.SetVariable('COD_CONTA_CORRENTE',StrToInt(Trim(FBancoConciliaParam.ME0CodContaCorrente.Text)))
          else
            QRBancoConcilia_Cheques.SetVariable('COD_CONTA_CORRENTE',Null);

          if Trim(FBancoConciliaParam.ME0DtInicial.text) <> '' then
            begin
              QRBancoConcilia_Cheques.SetVariable('DT_INICIAL',StrToDate(FBancoConciliaParam.ME0DtInicial.text));
              winicial:=DateToStr(StrToDate(FBancoConciliaParam.ME0DtInicial.text));
            end
          else
            begin
              QRBancoConcilia_Cheques.SetVariable('DT_INICIAL',Null);
              winicial:='00/00/0000';
            end;
          if Trim(FBancoConciliaParam.ME0DtFinal.text) <> '' then
            begin
              QRBancoConcilia_Cheques.SetVariable('DT_FINAL',StrToDate(FBancoConciliaParam.ME0DtFinal.text));
              wfinal:=DateToStr(StrToDate(FBancoConciliaParam.ME0DtFinal.text));
            end
          else
            begin
              QRBancoConcilia_Cheques.SetVariable('DT_FINAL',Null);
              wFinal:='99/99/9999';
            end;

          QRBancoConcilia_Cheques.Open;

          if FRBancoConcilia_Cheques=Nil then
            FRBancoConcilia_Cheques:=TFRBancoConcilia_Cheques.Create(Application);
          FRBancoConcilia_Cheques.QRLPeriodo.Caption:='PERIODO DE: '+wInicial+' ATE: '+wFinal;
          if FBancoConciliaParam.RGPreview.ItemIndex=0 then
            FRBancoConcilia_Cheques.QRPrimario.Preview
          else
            FRBancoConcilia_Cheques.QRPrimario.Print;
          QRBancoConcilia_Cheques.Close;
          FRBancoConcilia_Cheques.Release;
          FRBancoConcilia_Cheques:=Nil;
        end;
    end;
    FBancoConciliaParam.Release;
    FBancoConciliaParam:=Nil;
end;

procedure TFBancoConciliaCad.SBHelpClick(Sender: TObject);
begin
  inherited;
   Application.HelpContext (12);
end;

procedure TFBancoConciliaCad.SBConfirmarClick(Sender: TObject);
begin
//  inherited;
   DMBancoAgencia.QBancoConciliaCad.Post;
   DMOracle.DBCemapa.Commit;
end;

procedure TFBancoConciliaCad.SBCancelarClick(Sender: TObject);
begin
  DMOracle.DBCemapa.RollBack;
  inherited;

end;

procedure TFBancoConciliaCad.SBExcluirClick(Sender: TObject);
Var wComando,wBco_Movimento : String;
begin
  wBco_Movimento := DMBancoAgencia.QBancoConciliaCadCod_Bco_Movimento.Text;
  inherited;
  If wBco_Movimento <> '' Then
   Begin
     DMOracle.QExecSQL.Close;
     DMOracle.QExecSQL.SQL.Clear;
     wComando := 'UPDATE TB_BCO_MOVIMENTO SET DT_COMPENSACAO = ' + QuoteDStr(MeDtCompensacao.Text);
     wComando := wComando + ' WHERE COD_BCO_MOVIMENTO = ' + wBco_Movimento;
     DMOracle.QExecSQL.SQL.Add(wComando);
     DMOracle.QExecSQL.ExecSQL;
     DMOracle.QExecSQL.Close;
   End;
  If DMOracle.DBCemapa.InTransaction then //Se o estiver com a Transação em Aberto
     DMOracle.DBCemapa.Commit;
end;

procedure TFBancoConciliaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMBancoAgencia.QBancoConciliaCad.Close;
  Action := caFree;
  FBancoConciliaCad := Nil;
end;

end.
